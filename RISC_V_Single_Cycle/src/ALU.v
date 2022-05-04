/******************************************************************
* Description
*	This is an 32-bit arithetic logic unit that can execute the next set of operations:
*		add

* This ALU is written by using behavioral description.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module ALU 
(
	input [3:0] ALU_Operation_i,
	input signed [31:0] A_i,
	input signed [31:0] B_i,
	output reg Zero_o,
	output reg [31:0] ALU_Result_o
);

localparam add = 4'b00_00;
localparam sub = 4'b00_01;
localparam ori = 4'b00_10;
localparam lui = 4'b00_11;
localparam slli = 4'b01_00;
localparam srli = 4'b01_01;
localparam and_r = 4'b01_10;
localparam xor_r = 4'b01_11;
localparam beq = 4'b10_00;
localparam bne = 4'b10_01;
localparam blt = 4'b10_11;
localparam bge = 4'b11_00;
   
   always @ (A_i or B_i or ALU_Operation_i)
     begin
	   ALU_Result_o = 1;
		//Zero_o = (ALU_Result_o == 0) ? 1'b1 : 1'b0;
	  
		case (ALU_Operation_i)
		add:	ALU_Result_o = A_i + B_i;
		sub: ALU_Result_o = A_i - B_i;
		ori: ALU_Result_o = A_i | B_i;
		lui: ALU_Result_o = B_i << 16;
		slli: ALU_Result_o = A_i << B_i;
		srli: ALU_Result_o = A_i >> B_i;
		and_r: ALU_Result_o = A_i & B_i;
		xor_r: ALU_Result_o = A_i ^ B_i;
		beq: Zero_o = (A_i == B_i) ? 1'b1 : 1'b0;
		bne: Zero_o = (A_i != B_i) ? 1'b1 : 1'b0;
		blt: Zero_o = (A_i < B_i) ? 1'b1: 1'b0;
		bge: Zero_o = (A_i >= B_i) ? 1'b1: 1'b0;
		
		
		default:
			ALU_Result_o = 0;
		endcase // case(control)
		
		
     end // always @ (A or B or control)
endmodule // ALU