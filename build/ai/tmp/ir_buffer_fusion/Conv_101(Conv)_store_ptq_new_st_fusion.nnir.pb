	nncase ir1.7.1:�
�
%Conv_98(Conv)_store/ptq_new_st/fusion
#Conv_101(Conv)_load_data/const_loadConv_101(Conv)_load_dataConv_101(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
�
,Conv_101(Conv)_load_weights/weights_constant
(Conv_101(Conv)_load_weights/load_weightsConv_101(Conv)_load_weightsConv_101(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
s
output/folded_31Conv_101(Conv)_load_actConv_101(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�
)Conv_101(Conv)_load_data/const_load/const#Conv_101(Conv)_load_data/const_load#Conv_101(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
�
4Conv_101(Conv)_load_weights/weights_constant/ptq_deq(Conv_101(Conv)_load_weights/load_weights(Conv_101(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
�
0Conv_101(Conv)_store/ptq_new_st/const_load/const*Conv_101(Conv)_store/ptq_new_st/const_load*Conv_101(Conv)_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
aConv_101(Conv)/psumConv_101(Conv)/psum"
module_typeJstackvm*
actionJtrue
�
Conv_101(Conv)_load_data
Conv_101(Conv)_load_weights
Conv_101(Conv)/psum
Conv_101(Conv)_load_actConv_101(Conv)Conv_101(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
�
Conv_101(Conv)
*Conv_101(Conv)_store/ptq_new_st/const_load!Conv_101(Conv)_store/ptq_new_st_0Conv_101(Conv)_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue&Conv_101(Conv)_store/ptq_new_st/fusionZ?
%Conv_98(Conv)_store/ptq_new_st/fusion


@
(
(ZF
,Conv_101(Conv)_load_weights/weights_constant


@

Z*
output/folded_31




ZC
)Conv_101(Conv)_load_data/const_load/const



@
ZN
4Conv_101(Conv)_load_weights/weights_constant/ptq_deq




ZJ
0Conv_101(Conv)_store/ptq_new_st/const_load/const




b;
!Conv_101(Conv)_store/ptq_new_st_0



(
(j2
Conv_101(Conv)_load_data


@
(
(j5
Conv_101(Conv)_load_weights


@

j1
Conv_101(Conv)_load_act




j=
#Conv_101(Conv)_load_data/const_load



@
jB
(Conv_101(Conv)_load_weights/load_weights




jD
*Conv_101(Conv)_store/ptq_new_st/const_load




j-
Conv_101(Conv)/psum



(
(j(
Conv_101(Conv)



(
(j;
!Conv_101(Conv)_store/ptq_new_st_0



(
(