# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/cmake

# The command to remove a file.
RM = /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai

# Include any dependencies generated for this target.
include head_pose_estimation/CMakeFiles/head_pose_estimation.dir/depend.make

# Include the progress variables for this target.
include head_pose_estimation/CMakeFiles/head_pose_estimation.dir/progress.make

# Include the compile flags for this target's objects.
include head_pose_estimation/CMakeFiles/head_pose_estimation.dir/flags.make

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/main.cc.o: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/flags.make
head_pose_estimation/CMakeFiles/head_pose_estimation.dir/main.cc.o: head_pose_estimation/main.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object head_pose_estimation/CMakeFiles/head_pose_estimation.dir/main.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/head_pose_estimation.dir/main.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/main.cc

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/main.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/head_pose_estimation.dir/main.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/main.cc > CMakeFiles/head_pose_estimation.dir/main.cc.i

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/main.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/head_pose_estimation.dir/main.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/main.cc -o CMakeFiles/head_pose_estimation.dir/main.cc.s

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.o: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/flags.make
head_pose_estimation/CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.o: head_pose_estimation/cv2_utils.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object head_pose_estimation/CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/cv2_utils.cc

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/cv2_utils.cc > CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.i

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/cv2_utils.cc -o CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.s

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_320.cc.o: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/flags.make
head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_320.cc.o: head_pose_estimation/anchors_320.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_320.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/head_pose_estimation.dir/anchors_320.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/anchors_320.cc

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_320.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/head_pose_estimation.dir/anchors_320.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/anchors_320.cc > CMakeFiles/head_pose_estimation.dir/anchors_320.cc.i

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_320.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/head_pose_estimation.dir/anchors_320.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/anchors_320.cc -o CMakeFiles/head_pose_estimation.dir/anchors_320.cc.s

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_640.cc.o: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/flags.make
head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_640.cc.o: head_pose_estimation/anchors_640.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_640.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/head_pose_estimation.dir/anchors_640.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/anchors_640.cc

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_640.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/head_pose_estimation.dir/anchors_640.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/anchors_640.cc > CMakeFiles/head_pose_estimation.dir/anchors_640.cc.i

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_640.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/head_pose_estimation.dir/anchors_640.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/anchors_640.cc -o CMakeFiles/head_pose_estimation.dir/anchors_640.cc.s

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/retinaface.cc.o: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/flags.make
head_pose_estimation/CMakeFiles/head_pose_estimation.dir/retinaface.cc.o: head_pose_estimation/retinaface.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object head_pose_estimation/CMakeFiles/head_pose_estimation.dir/retinaface.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/head_pose_estimation.dir/retinaface.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/retinaface.cc

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/retinaface.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/head_pose_estimation.dir/retinaface.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/retinaface.cc > CMakeFiles/head_pose_estimation.dir/retinaface.cc.i

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/retinaface.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/head_pose_estimation.dir/retinaface.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/retinaface.cc -o CMakeFiles/head_pose_estimation.dir/retinaface.cc.s

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/hpe.cc.o: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/flags.make
head_pose_estimation/CMakeFiles/head_pose_estimation.dir/hpe.cc.o: head_pose_estimation/hpe.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object head_pose_estimation/CMakeFiles/head_pose_estimation.dir/hpe.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/head_pose_estimation.dir/hpe.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/hpe.cc

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/hpe.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/head_pose_estimation.dir/hpe.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/hpe.cc > CMakeFiles/head_pose_estimation.dir/hpe.cc.i

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/hpe.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/head_pose_estimation.dir/hpe.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/hpe.cc -o CMakeFiles/head_pose_estimation.dir/hpe.cc.s

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.o: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/flags.make
head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.o: common/k510_drm.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.o   -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/k510_drm.c

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.i: cmake_force
	@echo "Preprocessing C source to CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/k510_drm.c > CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.i

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.s: cmake_force
	@echo "Compiling C source to assembly CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/k510_drm.c -o CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.s

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.o: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/flags.make
head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.o: common/v4l2.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.o   -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/v4l2.c

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.i: cmake_force
	@echo "Preprocessing C source to CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/v4l2.c > CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.i

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.s: cmake_force
	@echo "Compiling C source to assembly CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-gcc --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/v4l2.c -o CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.s

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.o: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/flags.make
head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.o: common/buf_mgt.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.o"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.o -c /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/buf_mgt.cc

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.i: cmake_force
	@echo "Preprocessing CXX source to CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.i"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/buf_mgt.cc > CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.i

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.s: cmake_force
	@echo "Compiling CXX source to assembly CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.s"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/bin/riscv64-linux-g++ --sysroot=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/host/riscv64-buildroot-linux-gnu/sysroot $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/common/buf_mgt.cc -o CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.s

# Object files for target head_pose_estimation
head_pose_estimation_OBJECTS = \
"CMakeFiles/head_pose_estimation.dir/main.cc.o" \
"CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.o" \
"CMakeFiles/head_pose_estimation.dir/anchors_320.cc.o" \
"CMakeFiles/head_pose_estimation.dir/anchors_640.cc.o" \
"CMakeFiles/head_pose_estimation.dir/retinaface.cc.o" \
"CMakeFiles/head_pose_estimation.dir/hpe.cc.o" \
"CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.o" \
"CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.o" \
"CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.o"

# External object files for target head_pose_estimation
head_pose_estimation_EXTERNAL_OBJECTS =

head_pose_estimation/head_pose_estimation: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/main.cc.o
head_pose_estimation/head_pose_estimation: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/cv2_utils.cc.o
head_pose_estimation/head_pose_estimation: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_320.cc.o
head_pose_estimation/head_pose_estimation: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/anchors_640.cc.o
head_pose_estimation/head_pose_estimation: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/retinaface.cc.o
head_pose_estimation/head_pose_estimation: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/hpe.cc.o
head_pose_estimation/head_pose_estimation: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/k510_drm.c.o
head_pose_estimation/head_pose_estimation: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/v4l2.c.o
head_pose_estimation/head_pose_estimation: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/__/common/buf_mgt.cc.o
head_pose_estimation/head_pose_estimation: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/build.make
head_pose_estimation/head_pose_estimation: head_pose_estimation/CMakeFiles/head_pose_estimation.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --progress-dir=/opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Linking CXX executable head_pose_estimation"
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/head_pose_estimation.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
head_pose_estimation/CMakeFiles/head_pose_estimation.dir/build: head_pose_estimation/head_pose_estimation

.PHONY : head_pose_estimation/CMakeFiles/head_pose_estimation.dir/build

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/clean:
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation && $(CMAKE_COMMAND) -P CMakeFiles/head_pose_estimation.dir/cmake_clean.cmake
.PHONY : head_pose_estimation/CMakeFiles/head_pose_estimation.dir/clean

head_pose_estimation/CMakeFiles/head_pose_estimation.dir/depend:
	cd /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation /opt/k510_buildroot/k510_crb_lp3_v1_2_defconfig/build/ai/head_pose_estimation/CMakeFiles/head_pose_estimation.dir/DependInfo.cmake
.PHONY : head_pose_estimation/CMakeFiles/head_pose_estimation.dir/depend
