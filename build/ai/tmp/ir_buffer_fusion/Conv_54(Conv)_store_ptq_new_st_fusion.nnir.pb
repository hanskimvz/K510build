	nncase ir1.7.1:�
�
%Conv_20(Conv)_store/ptq_new_st/fusion
"Conv_54(Conv)_load_data/const_loadConv_54(Conv)_load_dataConv_54(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
�
+Conv_54(Conv)_load_weights/weights_constant
'Conv_54(Conv)_load_weights/load_weightsConv_54(Conv)_load_weightsConv_54(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
q
output/folded_10Conv_54(Conv)_load_actConv_54(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�
(Conv_54(Conv)_load_data/const_load/const"Conv_54(Conv)_load_data/const_load"Conv_54(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
�
3Conv_54(Conv)_load_weights/weights_constant/ptq_deq'Conv_54(Conv)_load_weights/load_weights'Conv_54(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
�
/Conv_54(Conv)_store/ptq_new_st/const_load/const)Conv_54(Conv)_store/ptq_new_st/const_load)Conv_54(Conv)_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_54(Conv)/psumConv_54(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
�
Conv_54(Conv)_load_data
Conv_54(Conv)_load_weights
Conv_54(Conv)/psum
Conv_54(Conv)_load_actConv_54(Conv)Conv_54(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
�
Conv_54(Conv)
)Conv_54(Conv)_store/ptq_new_st/const_load Conv_54(Conv)_store/ptq_new_st_0Conv_54(Conv)_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue%Conv_54(Conv)_store/ptq_new_st/fusionZ?
%Conv_20(Conv)_store/ptq_new_st/fusion


@
(
(ZE
+Conv_54(Conv)_load_weights/weights_constant

@
@

Z*
output/folded_10



@
ZB
(Conv_54(Conv)_load_data/const_load/const



@
ZM
3Conv_54(Conv)_load_weights/weights_constant/ptq_deq



@
ZI
/Conv_54(Conv)_store/ptq_new_st/const_load/const



@
b:
 Conv_54(Conv)_store/ptq_new_st_0


@
(
(j1
Conv_54(Conv)_load_data


@
(
(j4
Conv_54(Conv)_load_weights

@
@

j0
Conv_54(Conv)_load_act



@
j<
"Conv_54(Conv)_load_data/const_load



@
jA
'Conv_54(Conv)_load_weights/load_weights



@
jC
)Conv_54(Conv)_store/ptq_new_st/const_load



@
j,
Conv_54(Conv)/psum


@
(
(j'
Conv_54(Conv)


@
(
(j:
 Conv_54(Conv)_store/ptq_new_st_0


@
(
(