/******************************************************************
* Description
*	This is a  an adder that can be parameterized in its bit-width.
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module Conditional_Adder
#
(
	parameter NBits=32
)
(
	output [NBits-1:0] Result,
	input Selector,
	input [NBits-1:0] Data0,
	input [NBits-1:0] Data1,
	input [NBits-1:0] Default
	
	
);

assign Result = (Selector) ? Data0 + Data1 - 4: Default;


endmodule