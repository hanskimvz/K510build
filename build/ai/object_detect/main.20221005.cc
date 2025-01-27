/* Copyright (c) 2022, Canaan Bright Sight Co., Ltd
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 * 1. Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND
 * CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
 * BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

// encode app
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
// #include <fcntl.h>
// #include <sys/ioctl.h>
// #include <sys/mman.h>
#include <assert.h>
#include <errno.h>
#include <time.h>
// #include <pthread.h>
#include <ctype.h>
#include <malloc.h>
// #include <unistd.h>
// #include <signal.h>
// #include <string.h>
#include <stdlib.h>
#include <poll.h>
// #include <linux/videodev2.h>
#include <semaphore.h>
// #include <vector>
using namespace std;
#include "cJSON.h"

// #include "types.h"
// #include "enc_interface.h"
// #include "isp_video.h"
// #include "VideoStreamer.hh"
// #include "video_app.h"
// #include "IRtspServer.h"
// #include "alsa/asoundlib.h"
// #include "G711Codec.h"
// end encode app

#include <nncase/runtime/host_runtime_tensor.h>
#include <nncase/runtime/interpreter.h>
#include <nncase/runtime/runtime_tensor.h>

#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/core/utils/logger.hpp>

#include "string.h"
#include <signal.h>
/*  进程优先级  */
#include <unistd.h>
#include <sched.h>
#include <pthread.h>
#include <thread>
#include <mutex>
/* 申请物理内存 */
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/mman.h>

#include <atomic>
#include <vector>

#include "k510_drm.h"
#include "media_ctl.h"
#include <linux/videodev2.h>
#include "v4l2.h"


#include "object_detect.h"
#include "cv2_utils.h"
#include "buf_mgt.h"
#include <rapidjson/document.h>
#include <rapidjson/pointer.h>
#include <rapidjson/filereadstream.h>
#include <rapidjson/filewritestream.h>
#include <rapidjson/writer.h>
using namespace rapidjson;

// #define SELECT_TIMEOUT		2000

struct video_info dev_info[2];
std::mutex mtx;
// uint8_t drm_bufs_index = 0;
// uint8_t drm_bufs_argb_index = 0;
// struct drm_buffer *fbuf_yuv;
int obj_cnt;
// std::vector<cv::Point> points_to_clear[DRM_BUFFERS_COUNT];
// std::vector<std::string> strs_to_clear[DRM_BUFFERS_COUNT];

// #define AUTO_ADAPT_CONFIG_FILE "auto.conf"
// static uint32_t screen_width, screen_height;
static uint32_t gnne_input_width, gnne_input_height;
static uint32_t gnne_valid_width, gnne_valid_height;
// static char *video_cfg_file;
// static buf_mgt_t buf_mgt;


#define KMODEL_PATH "/app/ai/kmodel/kmodel_release/object_detect/yolov5s_320/yolov5s_320_sigmoid_bf16_with_preprocess_output_nhwc.kmodel"

#include <sys/shm.h>
#define SH_MEMSIZE 4096


typedef struct{
    int ts;
    int cat;
    int score;
    int x0;
    int y0;
    int x1;
    int y1;
} od_result;


std::atomic<bool> quit(true);

void fun_sig(int sig)
{
    if(sig == SIGINT)
    {
        quit.store(false);
    }
}

void ai_worker(ai_worker_args ai_args)
{
    int shmid;
    key_t key = 0xF1206;
    void *memory_segment = NULL;
    // od_result rs[32];

    char rs[SH_MEMSIZE];
    int wp =0;
    // rs=(char*)malloc(SH_MEMSIZE+1);;

    if((shmid=shmget(key, SH_MEMSIZE, IPC_CREAT|0666))==-1){
        printf("shmget failed\n");
        exit(0);
    }
    if((memory_segment=shmat(shmid,NULL,0))==(void*)-1){
        printf("shmat failed\n");
        exit(0);
    }
    


    // gnne_input_width = 320;
    // gnne_input_height = 320;
    // gnne_valid_width = 320;
    // gnne_valid_height = 240;

    // parse ai worker agrs
    char* kmodel_path = ai_args.kmodel_path;  // object detection kmodel path
    
    int net_len = gnne_input_width;  // object detection kmodel input size is net_len * net_len
    int valid_width = gnne_valid_width;  // isp ds2 input width, should be the same with definition in video config
    int valid_height = gnne_valid_height;  // isp ds2 input height, should be the same with definition in video config

    float obj_thresh = ai_args.obj_thresh;  // object detection thresh
    float nms_thresh = ai_args.nms_thresh;  // object detection nms thresh
    int is_rgb = ai_args.is_rgb;  // isp ds2 input format, RGB or BGR, RGB now
    int enable_profile = ai_args.enable_profile;  // wether enable time counting
    // std::string dump_img_dir = ai_args.dump_img_dir;  // where to dump image 
    int offset_channel = net_len * net_len;  // ds2 channel offset
    // int enable_dump_image = (dump_img_dir != "None");
    
    

    std::cout << "object detect"<< std::endl;
    
    objectDetect od(obj_thresh, nms_thresh, net_len, {valid_width, valid_height});
    std::cout << "load kmodel"<< kmodel_path <<std::endl;
    od.load_model(kmodel_path);  // load kmodel
    

    
    std::cout << "prepare_memory"<< std::endl;
	od.prepare_memory();  // memory allocation
    std::cout << "prepared memory "<< std::endl;
    
    /****fixed operation for video operation****/
    mtx.lock();
    cv::VideoCapture capture;
	// capture.open(9);
    capture.open(5);
    // video setting
    capture.set(cv::CAP_PROP_CONVERT_RGB, 0);
    capture.set(cv::CAP_PROP_FRAME_WIDTH, net_len);
    capture.set(cv::CAP_PROP_FRAME_HEIGHT, net_len);
    // RRRRRR....GGGGGGG....BBBBBB, CHW
    capture.set(cv::CAP_PROP_FOURCC, V4L2_PIX_FMT_RGB24);
    mtx.unlock();


    int frame_cnt = 0;

    enable_profile = 0;

    // define cv::Mat for ai input
    // padding offset is (net_len - valid_width) / 2
    cv::Mat rgb24_img_for_ai(net_len, net_len, CV_8UC3, od.virtual_addr_input[0] + (net_len - valid_width) / 2);
    std::cout << "starting loop "<< std::endl;
    while(quit.load()) 
    // for (int i=0; i<30; i++)
    {
        bool ret = false;
        ScopedTiming st("total", 1);
        mtx.lock();
        ret = capture.read(rgb24_img_for_ai);
        mtx.unlock();
        // std::cout << ret << std::endl;
        if(ret == false) {
            printf("fail read.ret\n");
            quit.store(false);
            continue; // 
        }
        //padding
        uint8_t *r_addr, *g_addr, *b_addr;
        g_addr = (uint8_t *)od.virtual_addr_input[0] + offset_channel;
        r_addr = is_rgb ? g_addr - offset_channel : g_addr + offset_channel;
        b_addr = is_rgb ? g_addr + offset_channel : g_addr - offset_channel;
        if (gnne_valid_width < gnne_input_width) {
            uint32_t padding_r = (gnne_input_width - gnne_valid_width);
            uint32_t padding_l = padding_r / 2;
            padding_r -= padding_l;
            for (int row = 0; row < gnne_valid_height; row++) {
                uint32_t offset_l = row * gnne_input_width;
                uint32_t offset_r = offset_l + gnne_valid_width + padding_l;
                memset(r_addr + offset_l, PADDING_R, padding_l);
                memset(g_addr + offset_l, PADDING_G, padding_l);
                memset(b_addr + offset_l, PADDING_B, padding_l);
                memset(r_addr + offset_r, PADDING_R, padding_r);
                memset(g_addr + offset_r, PADDING_G, padding_r);
                memset(b_addr + offset_r, PADDING_B, padding_r);
            }
        }
        if (gnne_valid_height < gnne_input_height) {
            uint32_t padding = (gnne_input_height - gnne_valid_height) * gnne_input_width;
            uint32_t offset = gnne_valid_height * gnne_input_width;
            memset(r_addr + offset, PADDING_R, padding);
            memset(g_addr + offset, PADDING_G, padding);
            memset(b_addr + offset, PADDING_B, padding);
        }
        // if(enable_dump_image)
        // {
        //     cv::Mat padding_img_R = cv::Mat(net_len, net_len, CV_8UC1, od.virtual_addr_input[0]);
        //     cv::Mat padding_img_G = cv::Mat(net_len, net_len, CV_8UC1, od.virtual_addr_input[0] + offset_channel);
        //     cv::Mat padding_img_B = cv::Mat(net_len, net_len, CV_8UC1, od.virtual_addr_input[0] + offset_channel * 2);
        //     std::vector<cv::Mat>padding_imgparts(3);
        //     padding_imgparts.clear();
        //     padding_imgparts.push_back(padding_img_B);
        //     padding_imgparts.push_back(padding_img_G);
        //     padding_imgparts.push_back(padding_img_R);
        //     cv::Mat padding_img;
        //     cv::merge(padding_imgparts, padding_img);
        //     std::string padding_img_out_path = dump_img_dir + "/padding_img_" + std::to_string(frame_cnt) + ".jpg";
        //     cv::imwrite(padding_img_out_path, padding_img);
        // }
        
        od.set_input(0);
        od.set_output();

        {
            ScopedTiming st("od run", enable_profile);
            od.run();
        }

        {
            ScopedTiming st("od get output", enable_profile);
            od.get_output();
        }
        std::vector<BoxInfo> result;
        {
            ScopedTiming st("post process", enable_profile);
            od.post_process(result);
        }

        /****fixed operation for display clear****/
        cv::Mat img_argb;
        uint64_t index;
        // if(0)
        // {
        //     buf_mgt_writer_get(&buf_mgt, (void **)&index);
        //     ScopedTiming st("display clear", enable_profile);
        //     struct drm_buffer *fbuf_argb = &drm_dev.drm_bufs_argb[index];
        //     img_argb = cv::Mat(screen_height, screen_width, CV_8UC4, (uint8_t *)fbuf_argb->map);

        //     for (uint32_t cc = 0; cc < points_to_clear[index].size(); cc++)
        //     {          
        //         cv::putText(img_argb, strs_to_clear[index][cc], points_to_clear[index][cc], cv::FONT_HERSHEY_COMPLEX, 1.5, cv::Scalar(0, 0, 0, 0), 1, 8, 0);
        //     }
        // }

        printf("\n");
        obj_cnt = 0;
        memset(rs, 0, SH_MEMSIZE);
        // wp = 0;
        for (auto r : result) {
            wp = obj_cnt*10;
            // int x1 = r.x2 * screen_width / valid_width;
            // int x0 = r.x1 * screen_width / valid_width;
            // int y0 = r.y1 * screen_height / valid_height;
            // int y1 = r.y2 * screen_height / valid_height;
            // x1 = std::max(0, std::min(x1, (int)screen_width));
            // x0 = std::max(0, std::min(x0, (int)screen_width));
            // y0 = std::max(0, std::min(y0, (int)screen_height));
            // y1 = std::max(0, std::min(y1, (int)screen_height));

            // std::string text = "class:" + od.labels[r.label] + ", conf:" + std::to_string(round(r.score * 100) / 100.0).substr(0,4);
            
            // printf("%d,%d,%d,%d ", x0, y0, x1, y1);
            // std::cout << text << std::endl;
            
            std::string text = "  class:" + od.labels[r.label];
            std::cout << text;
            printf(", score:%.2f, cord:%3.0f,%3.0f,%3.0f,%3.0f", r.score , r.x1, r.y1, r.x2, r.y2);
            // rs[obj_cnt].cat = r.label;
            // rs[obj_cnt].score = r.score;
            // rs[obj_cnt].x0 = r.x1;
            // rs[obj_cnt].x1 = r.x2;
            // rs[obj_cnt].y0 = r.y1;
            // rs[obj_cnt].y1 = r.y2;
            rs[wp + 0]  = (char)((int)r.label & 0xFF);
            rs[wp + 1]  = (char)((int)(r.score*100) & 0xFF);
            rs[wp + 2]  = (char)((int)r.x1 & 0xFF);
            rs[wp + 3]  = (char)(((int)r.x1 <<8) & 0xFF);
            rs[wp + 4]  = (char)((int)r.x2 & 0xFF);
            rs[wp + 5]  = (char)(((int)r.x2 <<8) & 0xFF);
            rs[wp + 6]  = (char)((int)r.y1 & 0xFF);
            rs[wp + 7]  = (char)(((int)r.y1 <<8) & 0xFF);
            rs[wp + 8]  = (char)((int)r.y2 &0xFF);
            rs[wp + 9]  = (char)(((int)r.y2 <<8) & 0xFF);

            obj_cnt ++;
        }
        printf("  %d, %d", wp, obj_cnt);
        rs[obj_cnt*10] = 0xFF;
        memcpy((char *)memory_segment, rs,  sizeof(rs));

        // printf("%100s"," ");
        // if (0)
        // {
        //     ScopedTiming st("draw osd", enable_profile);
        //     obj_cnt = 0;
        //     points_to_clear[index].clear();
        //     strs_to_clear[index].clear();
        //     for (auto r : result)
        //     {
        //         if (obj_cnt < 32)
        //         {
        //             struct vo_draw_frame frame;
        //             frame.crtc_id = drm_dev.crtc_id;
        //             frame.draw_en = 1;
        //             frame.frame_num = obj_cnt;
        //             int x1 = r.x2 * screen_width / valid_width;
        //             int x0 = r.x1 * screen_width / valid_width;
        //             int y0 = r.y1 * screen_height / valid_height;
        //             int y1 = r.y2 * screen_height / valid_height;
        //             x1 = std::max(0, std::min(x1, (int)screen_width));
        //             x0 = std::max(0, std::min(x0, (int)screen_width));
        //             y0 = std::max(0, std::min(y0, (int)screen_height));
        //             y1 = std::max(0, std::min(y1, (int)screen_height));
        //             frame.line_x_start = x0;
        //             frame.line_x_end = x1;
                    // frame.line_y_start = y0;
                    // frame.line_y_end = y1;

                    draw_frame(&frame);
                
                    // cv::Point origin;
                    // origin.x = (int)(r.x1 * screen_width / valid_width);
        //             origin.y = (int)(r.y1 * screen_height / valid_height + 10);
        //             std::string text = od.labels[r.label] + ":" + std::to_string(round(r.score * 100) / 100.0).substr(0,4);
        //             cv::putText(img_argb, text, origin, cv::FONT_HERSHEY_COMPLEX, 1.5, cv::Scalar(0, 0, 255, 255), 1, 8, 0);
        //             points_to_clear[index].push_back(origin);
        //             strs_to_clear[index].push_back(text);
        //         }
        //         obj_cnt += 1;
        //     }
        //     for (uint32_t i = obj_cnt; i < 32; i++) {
        //         struct vo_draw_frame frame;
        //         frame.crtc_id = drm_dev.crtc_id;
        //         frame.draw_en = 0;
        //         frame.frame_num = i;
        //         draw_frame(&frame);
        //     }
        // }
        frame_cnt += 1;
        // buf_mgt_writer_put(&buf_mgt, (void *)index);
    }
    
    /****fixed operation for capture release and display clear****/
    printf("\n%s ==========release \n", __func__);
    if(shmctl(shmid, IPC_RMID, 0) == -1) {
        perror("Shmctl failed");
    }
    else {
        printf("Shared memory end");
    }

    mtx.lock();
    capture.release();
    mtx.unlock();
    // for(uint32_t i = 0; i < 32; i++)
    // {
    //     struct vo_draw_frame frame;
    //     frame.crtc_id = drm_dev.crtc_id;
    //     frame.draw_en = 0;
    //     frame.frame_num = i;
    //     draw_frame(&frame);
    // }
}

#if 0
static int video_stop(struct v4l2_device *vdev)
{
	int ret;

	ret = v4l2_stream_off(vdev);
	if (ret < 0) {
		printf("error: failed to stop video stream: %s (%d)\n",
			strerror(-ret), ret);
		return ret;
	}

	return 0;
}

static void video_cleanup(struct v4l2_device *vdev)
{
	if (vdev) {
		v4l2_free_buffers(vdev);
		v4l2_close(vdev);
	}
}
#endif

#if 0
static int process_ds0_image(struct v4l2_device *vdev,unsigned int width,unsigned int height)
{
	struct v4l2_video_buffer buffer;
	int ret;
    static struct v4l2_video_buffer old_buffer;
    static int screen_init_flag = 0;

    mtx.lock();
	ret = v4l2_dequeue_buffer(vdev, &buffer);
	if (ret < 0) {
		printf("error: unable to dequeue buffer: %s (%d)\n",
			strerror(-ret), ret);
        mtx.unlock();
		return ret;
	}
    mtx.unlock();
	if (buffer.error) {
		printf("warning: error in dequeued buffer, skipping\n");
		return 0;
	}

    fbuf_yuv = &drm_dev.drm_bufs[buffer.index];

    if (screen_init_flag) {
        if (drm_dev.req)
            drm_wait_vsync();
        uint64_t index;
        if (buf_mgt_display_get(&buf_mgt, (void **)&index) != 0)
            index = 0;
        struct drm_buffer *fbuf_argb = &drm_dev.drm_bufs_argb[index];
        if (drm_dmabuf_set_plane(fbuf_yuv, fbuf_argb)) {
            std::cerr << "Flush fail \n";
            return 1;
        }
    }

    if(screen_init_flag) {
        fbuf_yuv = &drm_dev.drm_bufs[old_buffer.index];
        old_buffer.mem = fbuf_yuv->map;
        old_buffer.size = fbuf_yuv->size;
        mtx.lock();
        ret = v4l2_queue_buffer(vdev, &old_buffer);
        if (ret < 0) {
            printf("error: unable to requeue buffer: %s (%d)\n",
                strerror(-ret), ret);
            mtx.unlock();
            return ret;
        }
        mtx.unlock();
    }
    else {
        screen_init_flag = 1;
    }

    old_buffer = buffer;

	return 0;
}
#endif


#if 0
void display_worker(int enable_profile)
{
    int ret;
    struct v4l2_device *vdev;
    struct v4l2_pix_format format;
    fd_set fds;
    struct v4l2_video_buffer buffer;
	unsigned int i;

    mtx.lock();
    vdev = v4l2_open(dev_info[0].video_name[1]);
    if (vdev == NULL) {
		printf("error: unable to open video capture device %s\n",
			dev_info[0].video_name[1]);
        mtx.unlock();
		goto display_cleanup;
	}

	memset(&format, 0, sizeof format);
	format.pixelformat = dev_info[0].video_out_format[1] ? V4L2_PIX_FMT_NV12 : V4L2_PIX_FMT_NV16;
	format.width = dev_info[0].video_width[1];
	format.height = dev_info[0].video_height[1];

	ret = v4l2_set_format(vdev, &format);
	if (ret < 0)
	{
		printf("%s:v4l2_set_format error\n",__func__);
        mtx.unlock();
		goto display_cleanup;
	}

	ret = v4l2_alloc_buffers(vdev, V4L2_MEMORY_USERPTR, DRM_BUFFERS_COUNT);
	if (ret < 0)
	{
		printf("%s:v4l2_alloc_buffers error\n",__func__);
        mtx.unlock();
		goto display_cleanup;
	}

	FD_ZERO(&fds);
	FD_SET(vdev->fd, &fds);

	for (i = 0; i < vdev->nbufs; ++i) {
		buffer.index = i;
        fbuf_yuv = &drm_dev.drm_bufs[buffer.index];
        buffer.mem = fbuf_yuv->map;
        buffer.size = fbuf_yuv->size;

		ret = v4l2_queue_buffer(vdev, &buffer);
		if (ret < 0) {
			printf("error: unable to queue buffer %u\n", i);
            mtx.unlock();
			goto display_cleanup;
		}	
	}

	ret = v4l2_stream_on(vdev);
	if (ret < 0) {
		printf("%s error: failed to start video stream: %s (%d)\n", __func__,
			strerror(-ret), ret);
        mtx.unlock();
		goto display_cleanup;
	}
    mtx.unlock();

    while(quit.load()) {
		struct timeval timeout;
		fd_set rfds;

		timeout.tv_sec = SELECT_TIMEOUT / 1000;
		timeout.tv_usec = (SELECT_TIMEOUT % 1000) * 1000;
		rfds = fds;

		ret = select(vdev->fd + 1, &rfds, NULL, NULL, &timeout);
		if (ret < 0) {
			if (errno == EINTR)
				continue;

			printf("error: select failed with %d\n", errno);
			goto display_cleanup;
		}
		if (ret == 0) {
			printf("error: select timeout\n");
			goto display_cleanup;
		}
        process_ds0_image(vdev, format.width, format.height);
    }

display_cleanup:
    mtx.lock();
    video_stop(vdev);
	video_cleanup(vdev);
    mtx.unlock();
}
#endif

#if 0
int video_resolution_adaptation(void)
{
    // open input file
    FILE *fp = fopen(video_cfg_file, "rb");
    if (fp == NULL) {
        printf("open %s file error\n", video_cfg_file);
        return -1;
    }
    printf("parsing\n");

    char buff[4096];
    FileReadStream frs(fp, buff, sizeof(buff));
    Document root;
    root.ParseStream(frs);
    fclose(fp);
    if (root.HasParseError()) {
        printf("parse file error\n");
        return -1;
    }
    // default disable all
    Pointer("/sensor0/~1dev~1video2/video2_used").Set(root, 0);
    Pointer("/sensor0/~1dev~1video3/video3_used").Set(root, 1);
    Pointer("/sensor0/~1dev~1video4/video4_used").Set(root, 0);
    Pointer("/sensor0/~1dev~1video5/video5_used").Set(root, 1);
    Pointer("/sensor1/~1dev~1video6/video6_used").Set(root, 0);
    Pointer("/sensor1/~1dev~1video7/video7_used").Set(root, 0);
    Pointer("/sensor1/~1dev~1video8/video8_used").Set(root, 0);
    Pointer("/sensor1/~1dev~1video9/video9_used").Set(root, 0);

    char *sensor0_cfg_file = NULL;
    uint32_t sensor0_total_width;
    uint32_t sensor0_total_height;
    uint32_t sensor0_active_width;
    uint32_t sensor0_active_height;
    uint32_t video3_width;
    uint32_t video3_height;
    uint32_t video5_width;
    uint32_t video5_height;

#define SENSOR_1920x1080_TIMING(x) \
    do {\
        sensor0_total_width = 3476;\
        sensor0_total_height = 1166;\
        sensor0_active_width = 1920;\
        sensor0_active_height = 1080;\
    } while(0)

#define SENSOR_1080x1920_TIMING(x) \
    do {\
        sensor0_total_width = 3453;\
        sensor0_total_height = 1979;\
        sensor0_active_width = 1088;\
        sensor0_active_height = 1920;\
    } while(0)

    if (screen_width == 1920 && screen_height == 1080) {
        sensor0_cfg_file = "imx219_0.conf";
        video3_width = screen_width;
        video3_height = screen_height;
        video5_width = 320;
        video5_height = 240;
    } else if (screen_width == 1080 && screen_height == 1920) {
        sensor0_cfg_file = "imx219_1080x1920_0.conf";
        video3_width = screen_width;
        video3_height = screen_height;
        video5_width = 240;
        video5_height = 320;
    } else if (screen_width == 1280 && screen_height == 720) {
        sensor0_cfg_file = "imx219_0.conf";
        video3_width = screen_width;
        video3_height = screen_height;
        video5_width = 320;
        video5_height = 240;
    } else {
        printf("err\n");
        return -1;
    }
    // update video config
    gnne_input_width = 320;
    gnne_input_height = 320;
    gnne_valid_width = video5_width;
    gnne_valid_height = video5_height;
    if (strcmp(sensor0_cfg_file, "imx219_0.conf") == 0)
        SENSOR_1920x1080_TIMING(0);
    else if (strcmp(sensor0_cfg_file, "imx219_1080x1920_0.conf") == 0)
        SENSOR_1080x1920_TIMING(0);
    else
        return -1;
    Pointer("/sensor0/sensor0_total_size/sensor0_total_width").Set(root, sensor0_total_width);
    Pointer("/sensor0/sensor0_total_size/sensor0_total_height").Set(root, sensor0_total_height);
    Pointer("/sensor0/sensor0_active_size/sensor0_active_width").Set(root, sensor0_active_width);
    Pointer("/sensor0/sensor0_active_size/sensor0_active_height").Set(root, sensor0_active_height);
    Pointer("/sensor0/~1dev~1video2/video2_width").Set(root, sensor0_active_width);
    Pointer("/sensor0/~1dev~1video2/video2_height").Set(root, sensor0_active_height);
    Pointer("/sensor0/~1dev~1video2/video2_out_format").Set(root, 1);
    Pointer("/sensor0/~1dev~1video3/video3_width").Set(root, video3_width);
    Pointer("/sensor0/~1dev~1video3/video3_height").Set(root, video3_height);
    Pointer("/sensor0/~1dev~1video3/video3_out_format").Set(root, 1);
    Pointer("/sensor0/~1dev~1video5/video5_width").Set(root, video5_width);
    Pointer("/sensor0/~1dev~1video5/video5_height").Set(root, gnne_input_height);
    Pointer("/sensor0/~1dev~1video5/video5_pitch").Set(root, gnne_input_width);
    Pointer("/sensor0/~1dev~1video5/video5_height_r").Set(root, video5_height);
    Pointer("/sensor0/~1dev~1video5/video5_out_format").Set(root, 0);
    // create output file
    video_cfg_file = AUTO_ADAPT_CONFIG_FILE;
    fp = fopen(video_cfg_file, "wb");
    if (fp == NULL) {
        printf("open %s file error\n", video_cfg_file);
        return -1;
    }
    // generate
    FileWriteStream fws(fp, buff, sizeof(buff));
    Writer<FileWriteStream> writer(fws);
    root.Accept(writer);
    fclose(fp);

    return 0;
}
#endif

int main(int argc, char *argv[])
{
    // Encoder
   	// EncSettings Cfg;
	// int i;
	// int src_index=0;
	// EncInputFrame input;
	// EncOutputStream output;
	// int size;
	// unsigned int frame_size=0;
	// unsigned int output_frames=0;
	// unsigned int input_frames=0;
	// int stride;    

	// memset(pCtx, 0, sizeof(MainContext));
	// pCtx->start = 1;

    // Object detect
    std::cout << "case " << argv[0] << " build " << __DATE__ << " " << __TIME__ << std::endl;
    // if (argc < 11)
    // {
    //     std::cerr << "Object detect by YOLOV5 Usage: " << argv[0] << " <kmodel> <net_len> <valid_width> <valid_height> <obj_thresh> <nms_thresh> <video_conf> <is_rgb> <enable_profile> <dump_image_dir>" << std::endl;
    //     return -1;
    // }
    // parse args for ai worker
    ai_worker_args ai_args;
    // ai_args.kmodel_path = "/app/ai/kmodel/kmodel_release/object_detect/yolov5s_320/yolov5s_320_sigmoid_bf16_with_preprocess_output_nhwc.kmodel";
    ai_args.kmodel_path = (char*)malloc(strlen(KMODEL_PATH)+1);
    memcpy(ai_args.kmodel_path, KMODEL_PATH, strlen(KMODEL_PATH)+1);



    // ai_args.kmodel_path = argv[1];
    // ai_args.net_len = atoi(argv[2]);
    ai_args.net_len = 320;

    // ai_args.valid_width = atoi(argv[3]);
    ai_args.valid_width = 320;

    // ai_args.valid_height = atoi(argv[4]);
    ai_args.valid_height = 240;

    // ai_args.obj_thresh = atof(argv[5]);
    ai_args.obj_thresh = 0.5;

    // ai_args.nms_thresh = atof(argv[6]);
    ai_args.nms_thresh = 0.45;

    // video_cfg_file = "./video_object_detect_320.conf";

    // video_cfg_file = argv[7];

    // ai_args.is_rgb = atoi(argv[8]);
    ai_args.is_rgb = 1;

    // ai_args.enable_profile = atoi(argv[9]);
    ai_args.enable_profile = 0;
    // int enable_profile = atoi(argv[9]);
    // ai_args.dump_img_dir = argv[10];

    ai_args.dump_img_dir = "None";


 


    /****fixed operation for ctrl+c****/
    struct sigaction sa;
    memset( &sa, 0, sizeof(sa) );
    sa.sa_handler = fun_sig;
    sigfillset(&sa.sa_mask);
    sigaction(SIGINT, &sa, NULL);


    std::cout << "starting "<< std::endl;
    // screen_width = 1920;
    // screen_height = 1080;
    // get screen resolution
    // if (drm_get_resolution(NULL, &screen_width, &screen_height) < 0) {
    //     printf("get resolution error!\n");
    //     return -1;
    // }


    gnne_input_width = 320;
    gnne_input_height = 320;
    gnne_valid_width = 320;
    gnne_valid_height = 240;
    // printf("screen resolution: %dx%d\n", screen_width, screen_height);
    // if (video_resolution_adaptation() < 0) {
    //     printf("resolution not support!\n");
    //     return -1;
    // }
    // printf("resolution set\n");
    // for (uint32_t i = 0; i < DRM_BUFFERS_COUNT; i++)
    //     buf_mgt_reader_put(&buf_mgt, (void *)i);

    /****fixed operation for drm init****/
    // if(drm_init())
    //     return -1;


    /****fixed operation for mediactl init****/
    // if(mediactl_init(video_cfg_file, &dev_info[0]))
    //     return -1;


    // create thread for display
    // std::thread thread_ds0(display_worker, enable_profile);
    // create thread for ai worker
    std::thread thread_ds2(ai_worker, ai_args);

    // thread_ds0.join();
    thread_ds2.join();

    /****fixed operation for drm deinit****/
    // for(uint32_t i = 0; i < DRM_BUFFERS_COUNT; i++) 
    // {
    //     drm_destory_dumb(&drm_dev.drm_bufs[i]);
    // }
    // for(uint32_t i = 0; i < DRM_BUFFERS_COUNT; i++) 
    // {
    //     drm_destory_dumb(&drm_dev.drm_bufs_argb[i]);
    // }
    
	// mediactl_exit();
    return 0;
}
