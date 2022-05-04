module EX_MEM 
#(	parameter DATA_WIDTH = 32,
	parameter MEMORY_DEPTH = 256

)
(
	input clk,
	input [3:0]  ALU_Operation_i,
	input 	     Zero_i,
	input [31:0] ALU_Result_i,

	output reg [3:0]  ALU_Operation_o,
	output reg        Zero_o,
	output reg [31:0] ALU_Result_o
	
);

always@(posedge clk)
begin
	ALU_Operation_o = ALU_Operation_i;
	Zero_o = Zero_i;
	ALU_Result_o = ALU_Result_i;
end

endmodule