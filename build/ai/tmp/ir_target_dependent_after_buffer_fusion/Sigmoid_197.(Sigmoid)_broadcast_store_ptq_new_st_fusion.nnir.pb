	nncase ir1.7.1:�
�
Concat_186(Concat)
!Conv_196(Conv)_load_data_deq_loadConv_196(Conv)_load_dataConv_196(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
�
,Conv_196(Conv)_load_weights/weights_constant
(Conv_196(Conv)_load_weights/load_weightsConv_196(Conv)_load_weightsConv_196(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_196(Conv)/psumConv_196(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_196(Conv)/actConv_196(Conv)_load_actConv_196(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�
"Conv_196(Conv)_load_data_deq_const!Conv_196(Conv)_load_data_deq_load!Conv_196(Conv)_load_data_deq_load"GNNELoad*
module_typeJk510*
actionJtrue
�
4Conv_196(Conv)_load_weights/weights_constant/ptq_deq(Conv_196(Conv)_load_weights/load_weights(Conv_196(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
�
ASigmoid_197.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_197.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_197.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_196(Conv)Sigmoid_197.(Sigmoid)/broadcastSigmoid_197.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
�
Sigmoid_197.(Sigmoid)/broadcast
;Sigmoid_197.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_197.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_197.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
�
Conv_196(Conv)_load_data
Conv_196(Conv)_load_weights
Conv_196(Conv)/psum
Conv_196(Conv)_load_actConv_196(Conv)Conv_196(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_197.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ-
Concat_186(Concat)


�
(
(ZG
,Conv_196(Conv)_load_weights/weights_constant

@
�

Z,
Conv_196(Conv)/act



@
Z=
"Conv_196(Conv)_load_data_deq_const



�
ZN
4Conv_196(Conv)_load_weights/weights_constant/ptq_deq



@
Z[
ASigmoid_197.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



@
bL
2Sigmoid_197.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j3
Conv_196(Conv)_load_data


�
(
(j6
Conv_196(Conv)_load_weights

@
�

j-
Conv_196(Conv)/psum


@
(
(j1
Conv_196(Conv)_load_act



@
j<
!Conv_196(Conv)_load_data_deq_load



�
jB
(Conv_196(Conv)_load_weights/load_weights



@
jU
;Sigmoid_197.(Sigmoid)/broadcast_store/ptq_new_st/const_load



@
j9
Sigmoid_197.(Sigmoid)/broadcast


@
(
(jL
2Sigmoid_197.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j(
Conv_196(Conv)


@
(
(