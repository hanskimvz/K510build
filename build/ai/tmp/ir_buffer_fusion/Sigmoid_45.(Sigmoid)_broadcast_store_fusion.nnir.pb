	nncase ir1.7.1:�
y
Concat_40(Concat)_NCHWConv_41(Conv)_load_dataConv_41(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
�
Conv_41(Conv)/_convert_1Conv_41(Conv)_load_weightsConv_41(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_41(Conv)/psumConv_41(Conv)/psum"
module_typeJstackvm*
actionJtrue
r
Conv_41(Conv)/actConv_41(Conv)_load_actConv_41(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�

module_typeJk510*
actionJtrue
�
Conv_44(Conv)/_convert_1Conv_44(Conv)_load_weightsConv_44(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_44(Conv)/psumConv_44(Conv)/psum"
module_typeJstackvm*
actionJtrue
r
Conv_44(Conv)/actConv_44(Conv)_load_actConv_44(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
�

module_typeJk510*
actionJtrue
�
Sigmoid_45.(Sigmoid)/broadcast&Sigmoid_45.(Sigmoid)/broadcast_store_0$Sigmoid_45.(Sigmoid)/broadcast_store"	GNNEStore*
module_typeJk510*
actionJtrue
�
Conv_41(Conv)_load_data
Conv_41(Conv)_load_weights
Conv_41(Conv)/psum
Conv_41(Conv)_load_act
GNNEConv2D*
module_typeJk510*
actionJtrue
�
Sigmoid_42.(Sigmoid)/broadcast
Conv_44(Conv)_load_weights
Conv_44(Conv)/psum
Conv_44(Conv)_load_act
GNNEConv2D*
module_typeJk510*
actionJtrue+Sigmoid_45.(Sigmoid)/broadcast_store/fusionZ2
Concat_40(Concat)_NCHW



�
�Z2
Conv_41(Conv)/_convert_1

 


Z+
Conv_41(Conv)/act



 
Z2
Conv_44(Conv)/_convert_1

@
 

Z+
Conv_44(Conv)/act



@
b@
&Sigmoid_45.(Sigmoid)/broadcast_store_0


@
P
Pj3
Conv_41(Conv)_load_data



�
�j4
Conv_41(Conv)_load_weights

 


j.
Conv_41(Conv)/psum


 
�
�j0
Conv_41(Conv)_load_act



 
j:
Sigmoid_42.(Sigmoid)/broadcast


 
�
�j4
Conv_44(Conv)_load_weights

@
 

j,
Conv_44(Conv)/psum


@
P
Pj0
Conv_44(Conv)_load_act



@
j8
Sigmoid_45.(Sigmoid)/broadcast


@
P
Pj@
&Sigmoid_45.(Sigmoid)/broadcast_store_0


@
P
Pj)



 
�
�j'



@
P
P