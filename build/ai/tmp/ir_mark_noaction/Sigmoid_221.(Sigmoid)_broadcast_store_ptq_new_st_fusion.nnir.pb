	nncase ir1.7.1:�
�
Concat_219(Concat)
!Conv_220(Conv)_load_data_deq_loadConv_220(Conv)_load_dataConv_220(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
�
,Conv_220(Conv)_load_weights/weights_constant
(Conv_220(Conv)_load_weights/load_weightsConv_220(Conv)_load_weightsConv_220(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_220(Conv)/psumConv_220(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_220(Conv)/actConv_220(Conv)_load_actConv_220(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�
"Conv_220(Conv)_load_data_deq_const!Conv_220(Conv)_load_data_deq_load!Conv_220(Conv)_load_data_deq_load"GNNELoad*
module_typeJk510*
actionJtrue
�
4Conv_220(Conv)_load_weights/weights_constant/ptq_deq(Conv_220(Conv)_load_weights/load_weights(Conv_220(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
�
ASigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_220(Conv)Sigmoid_221.(Sigmoid)/broadcastSigmoid_221.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
�
Sigmoid_221.(Sigmoid)/broadcast
;Sigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
�
Conv_220(Conv)_load_data
Conv_220(Conv)_load_weights
Conv_220(Conv)/psum
Conv_220(Conv)_load_actConv_220(Conv)Conv_220(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ-
Concat_219(Concat)


�

ZH
,Conv_220(Conv)_load_weights/weights_constant

�
�

Z-
Conv_220(Conv)/act



�
Z=
"Conv_220(Conv)_load_data_deq_const



�
ZO
4Conv_220(Conv)_load_weights/weights_constant/ptq_deq



�
Z\
ASigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



�
bM
2Sigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st_0


�

j3
Conv_220(Conv)_load_data


�

j7
Conv_220(Conv)_load_weights

�
�

j.
Conv_220(Conv)/psum


�

j2
Conv_220(Conv)_load_act



�
j<
!Conv_220(Conv)_load_data_deq_load



�
jC
(Conv_220(Conv)_load_weights/load_weights



�
jV
;Sigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st/const_load



�
j:
Sigmoid_221.(Sigmoid)/broadcast


�

jM
2Sigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st_0


�

j)
Conv_220(Conv)


�

