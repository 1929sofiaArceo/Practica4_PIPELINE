module ID_EX 
#(	parameter DATA_WIDTH = 32,
	parameter MEMORY_DEPTH = 256

)
(
	input clk,
	input [2:0]ALU_Op_i,
	input ALU_Src_i,
	input Reg_Write_i,
	input Mem_to_Reg_i,
	input Mem_Read_i,
	input Mem_Write_i,
	input Branch_i,
	input  [31:0]Read_Data_1_i,
	input  [31:0]Read_Data_2_i,
	input  [31:0]Immediate_i,
	//*OUTPUTS*//
	output reg [2:0]ALU_Op_o,
	output reg ALU_Src_o,
	output reg Reg_Write_o,
	output reg Mem_to_Reg_o,
	output reg Mem_Read_o,
	output reg Mem_Write_o,
	output reg Branch_o,
	output reg [31:0]Read_Data_1_o,
	output reg [31:0]Read_Data_2_o,
	output reg [31:0]Immediate_o
);

always@(posedge clk)
begin
	ALU_Op_o = ALU_Op_i;
	ALU_Src_o = ALU_Src_i;
	Reg_Write_o = Reg_Write_i;
	Mem_to_Reg_o = Mem_to_Reg_i;
	Mem_Read_o = Mem_Read_i;
	Mem_Write_o = Mem_Write_i;
	Branch_o = Branch_i;
	Read_Data_1_o = Read_Data_1_i;
	Read_Data_2_o = Read_Data_2_i;
	Immediate_o = Immediate_i;
	
end

endmodule