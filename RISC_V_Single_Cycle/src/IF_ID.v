module IF_ID 
#(	parameter DATA_WIDTH = 32,
	parameter MEMORY_DEPTH = 256

)
(
	input clk,
	input [31:0]  PC_i,
	input [31:0]  instruction_bus_i,

	output reg [DATA_WIDTH-1:0]  Read_Data_o,
	output reg [4:0] 	Write_Register_o,
	output reg [4:0] 	Read_Register_1_o,
	output reg [4:0] 	Read_Register_2_o,
	output reg [6:0]	OP_o, //CHECK
	output reg [31:0]	PC_o
);

always@(posedge clk)
begin
	Read_Data_o = instruction_bus_i;
	Write_Register_o = instruction_bus_i[11:7];
	Read_Register_1_o = instruction_bus_i[19:15];
	Read_Register_2_o = instruction_bus_i[24:20];
	OP_o = instruction_bus_i[6:0];
	PC_o = PC_i;
end

endmodule