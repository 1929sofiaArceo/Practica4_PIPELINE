/******************************************************************
* Description
*	This is the control unit for the ALU. It receves a signal called 
*	ALUOp from the control unit and signals called funct7 and funct3  from
*	the instruction bus.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/
module ALU_Control
(
	input funct7_i, 
	input [2:0] ALU_Op_i,
	input [2:0] funct3_i,
	

	output [3:0] ALU_Operation_o

);

localparam R_Type_ADD = 7'b0_000_000;
localparam I_Type_ADDI = 7'bx_001_000;
localparam R_Type_SUB = 7'b1_000_000;
localparam I_Type_ORI = 7'bx_001_110;
localparam U_Type_LUI = 7'bx_010_xxx;
localparam I_Type_SLLI = 7'b0_001_001;
localparam I_Type_SRLI = 7'b0_001_101;
localparam R_Type_AND = 7'b0_000_111;
localparam I_Type_ANDI = 7'bx_001_111;
localparam R_Type_OR = 7'b0_000_110;
localparam R_Type_SLL = 7'b0_000_001;
localparam R_Type_SRL = 7'b0_000_101;
localparam R_Type_XOR = 7'b0_000_100;
localparam I_Type_XORI = 7'bx_001_100;
localparam I_Type_LW = 7'bx_011_010;
localparam S_Type_SW = 7'bx_100_010;
localparam SB_Type_BEQ = 7'bx_101_000;
localparam SB_Type_BNE = 7'bx_101_001;
localparam SB_Type_BLT = 7'bx_101_100;
localparam SB_Type_BGE = 7'bx_101_101;

reg [3:0] alu_control_values;
wire [6:0] selector;

assign selector = {funct7_i, ALU_Op_i, funct3_i};

always@(selector)begin
	casex(selector)
		R_Type_ADD: alu_control_values = 4'b00_00;
		I_Type_ADDI: alu_control_values = 4'b00_00;
		R_Type_SUB: alu_control_values = 4'b00_01;
		I_Type_ORI: alu_control_values = 4'b00_10;
		U_Type_LUI: alu_control_values = 4'b00_11;
		I_Type_SLLI: alu_control_values = 4'b01_00;
		I_Type_SRLI: alu_control_values = 4'b01_01;
		R_Type_AND: alu_control_values = 4'b01_10;
		I_Type_ANDI: alu_control_values = 4'b01_10;
		R_Type_OR: alu_control_values = 4'b00_10;
		R_Type_SLL: alu_control_values = 4'b01_00;
		R_Type_SRL: alu_control_values = 4'b01_01;
		R_Type_XOR: alu_control_values = 4'b01_11;
		I_Type_XORI: alu_control_values = 4'b01_11;
		I_Type_LW: alu_control_values = 4'b00_00;
		S_Type_SW: alu_control_values = 4'b00_00;
		SB_Type_BEQ: alu_control_values = 4'b10_00;
		SB_Type_BNE: alu_control_values = 4'b10_01;
		SB_Type_BLT: alu_control_values = 4'b10_11;
		SB_Type_BGE: alu_control_values = 4'b11_00;
		
		

		default: alu_control_values = 4'b11_01;
	endcase
end


assign ALU_Operation_o = alu_control_values;


endmodule
