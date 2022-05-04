/******************************************************************
* Description
*	This is the top-level of a RISC-V Microprocessor that can execute the next set of instructions:
*		add
*		addi
* This processor is written Verilog-HDL. It is synthesizabled into hardware.
* Parameter MEMORY_DEPTH configures the program memory to allocate the program to
* be executed. If the size of the program changes, thus, MEMORY_DEPTH must change.
* This processor was made for computer organization class at ITESO.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	16/08/2021
******************************************************************/

module RISC_V_Single_Cycle
#(
	parameter PROGRAM_MEMORY_DEPTH = 512,
	parameter DATA_MEMORY_DEPTH = 128
)
	
(
	// Inputs
	input clk,
	input reset,
	output [31:0] alu_result_o

);

//******************************************************************/
//******************************************************************/

//******************************************************************/
//******************************************************************/
/* Signals to connect modules*/

/**Control**/
wire alu_src_w;
wire reg_write_w;
wire mem_to_reg_w;
wire mem_write_w;
wire mem_read_w;
wire branch_w;
wire [2:0] alu_op_w;

/** Program Counter**/
wire [31:0] pc_plus_4_w;
wire [31:0] pc_w;


/**Register File**/
wire [31:0] read_data_1_w;
wire [31:0] read_data_2_w;

/**Inmmediate Unit**/
wire [31:0] inmmediate_data_w;

/**ALU**/
wire [31:0] alu_result_w;
wire zero_w;
assign alu_result_o = alu_result_w;

/**Multiplexer MUX_DATA_OR_IMM_FOR_ALU**/
wire [31:0] read_data_2_or_imm_w;

/**ALU Control**/
wire [3:0] alu_operation_w;

/**Instruction Bus**/	
wire [31:0] instruction_bus_w;

/**MUX DATA WRITE**/
wire [31:0] read_data_w;
wire [31:0] mux_output;

//**BRANCH MUX UNIT**//
wire PCSrc_w;
wire [31:0] input_1_mux_branch;
assign input_1_mux_branch = pc_w + inmmediate_data_w;
wire [31:0] next_instruction;

//**JAL MUX**//
wire [31:0] write_data_w;
wire is_jal_w;
assign is_jal_w = ((instruction_bus_w[6:0] == 7'h6F) || (instruction_bus_w[6:0] == 7'h67)) ? 1'b1: 1'b0;
wire [31:0] pc_value_w;
wire is_jalr_w = (instruction_bus_w[6:0] == 7'h67) ? 1'b1: 1'b0;
wire is_jal_i = (instruction_bus_w[6:0] == 7'h6F) ? 1'b1: 1'b0;
wire [31:0] pc_value_jal_w;
wire [31:0] pc_value_jalr_w;
wire [31:0] pc_value_jalr_w_plus_4;


//*IF/ID WIRES*//
wire  [31:0]  	Read_Data_i_ID;
wire 				Reg_Write_i_ID;
wire  [4:0] 	Write_Register_i_ID;
wire  [4:0] 	Read_Register_1_i_ID;
wire  [4:0] 	Read_Register_2_i_ID;
wire  [6:0]		OP_i_ID;
wire  [31:0] 	PC_i_ID;

//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/

PC_Register
PROGRAM_COUNTER
(
	.clk(clk),
	.reset(reset),
	.Next_PC(pc_value_w),
	.PC_Value(pc_w)
);

Program_Memory
#(
	.MEMORY_DEPTH(PROGRAM_MEMORY_DEPTH)
)
PROGRAM_MEMORY
(
	.Address_i(pc_w),
	.Instruction_o(instruction_bus_w)
);


Adder_32_Bits
PC_PLUS_4
(
	.Data0(pc_w),
	.Data1(4),
	
	.Result(pc_plus_4_w)
);


//******************************************************************/
//************************************S******************************/
//******************************************************************/
//******************************************************************/
//******************************************************************/


IF_ID
Fetch_Decode
(
	.clk(clk),
	.PC_i(pc_w),
	.instruction_bus_i(instruction_bus_w),
	.Read_Data_o(Read_Data_i_ID),
	.Write_Register_o(Write_Register_i_ID),
	.Read_Register_1_o(Read_Register_1_i_ID),
	.Read_Register_2_o(Read_Register_2_i_ID),
	.OP_o(OP_i_ID),
	.PC_o(PC_i_ID)
);

//*INSTRUCTION DECODE MODULES*//

Control
CONTROL_UNIT
(
	/****/
	.OP_i(OP_i_ID),
	/** outputus**/
	.ALU_Op_o(alu_op_w),
	.ALU_Src_o(alu_src_w),
	.Reg_Write_o(reg_write_w),
	.Mem_to_Reg_o(mem_to_reg_w),
	.Mem_Read_o(mem_read_w),
	.Mem_Write_o(mem_write_w),
	.Branch_o(branch_w)
);

Register_File
REGISTER_FILE_UNIT
(
	.clk(clk),
	.reset(reset),
	.Reg_Write_i(Reg_Write_i_ID),
	.Write_Register_i(Write_Register_i_ID),
	.Read_Register_1_i(Read_Register_1_i_ID),
	.Read_Register_2_i(Read_Register_2_i_ID),
	.Write_Data_i(mux_output),
	/** outputus**/
	.Read_Data_1_o(read_data_1_w),
	.Read_Data_2_o(read_data_2_w)

);


Immediate_Unit
IMM_UNIT
(  .op_i(OP_i_ID),
   .Instruction_bus_i(Read_Data_i_ID),
	/** outputus**/
   .Immediate_o(inmmediate_data_w)
);

//*ID/EX WIRES*//
wire  [2:0]ALU_Op_w_EX;
wire ALU_Src_w_EX;
wire Reg_Write_w_EX;
wire Mem_to_Reg_w_EX;
wire Mem_Read_w_EX;
wire Mem_Write_w_EX;
wire Branch_w_EX;
wire  [31:0]Read_Data_1_w_EX;
wire  [31:0]Read_Data_2_w_EX;
wire  [31:0]Immediate_w_EX;

ID_EX
Decode_Excecute
(
	.clk(clk),
	.ALU_Op_i(alu_op_w),
	.ALU_Src_i(alu_src_w),
	.Reg_Write_i(reg_write_w),
	.Mem_to_Reg_i(mem_to_reg_w),
	.Mem_Read_i(mem_read_w),
	.Mem_Write_i(mem_write_w),
	.Branch_i(branch_w),
	.Read_Data_1_i(read_data_1_w),
	.Read_Data_2_i(read_data_2_w),
	.Immediate_i(inmmediate_data_w),
	//*OUTPUTS*//
	.ALU_Op_o(ALU_Op_w_EX),
	.ALU_Src_o(ALU_Src_w_EX),
	.Reg_Write_o(Reg_Write_w_EX),
	.Mem_to_Reg_o(Mem_to_Reg_w_EX),
	.Mem_Read_o(Mem_Read_w_EX),
	.Mem_Write_o(Mem_Write_w_EX),
	.Branch_o(Branch_w_EX),
	.Read_Data_1_o(Read_Data_1_w_EX),
	.Read_Data_2_o(Read_Data_2_w_EX),
	.Immediate_o(Immediate_w_EX)
);

//*EXCECUTE STEP MODULES*//

Multiplexer_2_to_1
#(
	.NBits(32)
)
MUX_DATA_OR_IMM_FOR_ALU
(
	.Selector_i(ALU_Src_w_EX),
	.Mux_Data_0_i(Read_Data_2_w_EX),
	.Mux_Data_1_i(Immediate_w_EX),
	
	.Mux_Output_o(read_data_2_or_imm_w)

);


ALU_Control
ALU_CONTROL_UNIT
(
	.funct7_i(Read_Data_i_ID[30]),
	.ALU_Op_i(ALU_Op_w_EX),
	.funct3_i(Read_Data_i_ID[14:12]),
	//*OUTPUT*//
	.ALU_Operation_o(alu_operation_w)

);



ALU
ALU_UNIT
(
	.ALU_Operation_i(alu_operation_w),
	.A_i(Read_Data_1_w_EX),
	.B_i(read_data_2_or_imm_w),
	//*OUTPUTS*//
	.ALU_Result_o(alu_result_w),
	.Zero_o(zero_w)
);


//*EX/MEM WIRES*//
wire Zero_w_MEM;
wire  [31:0] ALU_Result_w_MEM;
wire  [3:0] ALU_Operation_w_MEM;


EX_MEM
Excecute_Memory
(
	.clk(clk),
	.ALU_Operation_i(alu_operation_w),
	.Zero_i(zero_w),
	.ALU_Result_i(alu_result_w),
	
	.Zero_o(Zero_w_MEM),
	.ALU_Result_o(ALU_Result_w_MEM),
	.ALU_Operation_o(ALU_Operation_w_MEM)
);



//*MEMORY STEP MODULES*//

Data_Memory
DATA_MEMORY_UNIT
(
	.clk(clk),
	.Mem_Write_i(Mem_Write_w_EX),
	.Mem_Read_i(Mem_Read_w_EX),
	.Write_Data_i(Read_Data_2_w_EX),
	.Address_i(ALU_Result_w_MEM),
	.Read_Data_o(read_data_w)
);

//*WRITE BACK STEP MODULES*//

Multiplexer_2_to_1
MUL_UNIT
(
	.Selector_i(Mem_to_Reg_w_EX),
	.Mux_Data_0_i(ALU_Result_w_MEM),
	.Mux_Data_1_i(read_data_w),
	.Mux_Output_o(mux_output)
);

assign PCSrc_w =  Zero_w_MEM & Branch_w_EX;

Multiplexer_2_to_1
BRANCH_MUL_UNIT
(
	.Selector_i(PCSrc_w),
	.Mux_Data_0_i(pc_plus_4_w),
	.Mux_Data_1_i(input_1_mux_branch),
	.Mux_Output_o(next_instruction)
);

Multiplexer_2_to_1
JAL_MUX
(
	.Selector_i(is_jal_w),
	.Mux_Data_0_i(mux_output),
	.Mux_Data_1_i(next_instruction),
	.Mux_Output_o(write_data_w)
);
Conditional_Adder
PC_JAL_ADDER
(
	.Selector(is_jal_i),
	.Data0(pc_plus_4_w),
	.Data1(inmmediate_data_w),
	.Default(next_instruction),
	.Result(pc_value_jal_w)
);
Conditional_Adder
PC_JALR_ADDER
(
	.Selector(is_jalr_w),
	.Data0(read_data_1_w),
	.Data1(inmmediate_data_w),
	.Default(next_instruction),
	.Result(pc_value_jalr_w)
);
Conditional_Adder
PC_JALR_PLUS_4
(
	.Selector(is_jalr_w),
	.Data0(8),
	.Data1(pc_value_jalr_w),
	.Default(pc_value_jalr_w),
	.Result(pc_value_jalr_w_plus_4)
);

Multiplexer_2_to_1
JAL_JALR_MUX
(
	.Selector_i(is_jal_i),
	.Mux_Data_0_i(pc_value_jalr_w_plus_4),
	.Mux_Data_1_i(pc_value_jal_w),
	.Mux_Output_o(pc_value_w)
);
endmodule

