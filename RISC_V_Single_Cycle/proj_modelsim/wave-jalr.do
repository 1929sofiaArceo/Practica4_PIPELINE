onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /RISC_V_Single_Cycle_TB/clk_tb
add wave -noupdate /RISC_V_Single_Cycle_TB/reset_tb
add wave -noupdate -radix binary /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Operation_i
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/A_i
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/B_i
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/Zero_o
add wave -noupdate -radix decimal /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Result_o
add wave -noupdate -radix binary /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/OP_i
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Mem_to_Reg_o
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Mem_Write_o
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/ALU_Src_o
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/Reg_Write_o
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/CONTROL_UNIT/ALU_Op_o
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/funct7_i
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/ALU_Op_i
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/funct3_i
add wave -noupdate /RISC_V_Single_Cycle_TB/DUV/ALU_CONTROL_UNIT/ALU_Operation_o
add wave -noupdate -group {BRANCH MUL} /RISC_V_Single_Cycle_TB/DUV/BRANCH_MUL_UNIT/Selector_i
add wave -noupdate -group {BRANCH MUL} -radix decimal /RISC_V_Single_Cycle_TB/DUV/BRANCH_MUL_UNIT/Mux_Data_0_i
add wave -noupdate -group {BRANCH MUL} -radix decimal /RISC_V_Single_Cycle_TB/DUV/BRANCH_MUL_UNIT/Mux_Data_1_i
add wave -noupdate -group {BRANCH MUL} -radix decimal /RISC_V_Single_Cycle_TB/DUV/BRANCH_MUL_UNIT/Mux_Output_o
add wave -noupdate -group JAL_MUX /RISC_V_Single_Cycle_TB/DUV/JAL_MUX/Selector_i
add wave -noupdate -group JAL_MUX -radix decimal /RISC_V_Single_Cycle_TB/DUV/JAL_MUX/Mux_Data_0_i
add wave -noupdate -group JAL_MUX -radix decimal /RISC_V_Single_Cycle_TB/DUV/JAL_MUX/Mux_Data_1_i
add wave -noupdate -group JAL_MUX -radix decimal /RISC_V_Single_Cycle_TB/DUV/JAL_MUX/Mux_Output_o
add wave -noupdate -group Conditional_Adder /RISC_V_Single_Cycle_TB/DUV/PC_JAL_ADDER/Selector
add wave -noupdate -group Conditional_Adder -radix decimal /RISC_V_Single_Cycle_TB/DUV/PC_JAL_ADDER/Data0
add wave -noupdate -group Conditional_Adder -radix decimal /RISC_V_Single_Cycle_TB/DUV/PC_JAL_ADDER/Data1
add wave -noupdate -group Conditional_Adder -radix decimal /RISC_V_Single_Cycle_TB/DUV/PC_JAL_ADDER/Result
add wave -noupdate -group JAL_JALR /RISC_V_Single_Cycle_TB/DUV/JAL_JALR_MUX/Selector_i
add wave -noupdate -group JAL_JALR -radix decimal /RISC_V_Single_Cycle_TB/DUV/JAL_JALR_MUX/Mux_Data_0_i
add wave -noupdate -group JAL_JALR -radix decimal /RISC_V_Single_Cycle_TB/DUV/JAL_JALR_MUX/Mux_Data_1_i
add wave -noupdate -group JAL_JALR -radix decimal /RISC_V_Single_Cycle_TB/DUV/JAL_JALR_MUX/Mux_Output_o
add wave -noupdate -expand -group {PC jalr +4} -radix decimal /RISC_V_Single_Cycle_TB/DUV/PC_JALR_PLUS_4/Selector
add wave -noupdate -expand -group {PC jalr +4} -radix decimal /RISC_V_Single_Cycle_TB/DUV/PC_JALR_PLUS_4/Data0
add wave -noupdate -expand -group {PC jalr +4} -radix decimal /RISC_V_Single_Cycle_TB/DUV/PC_JALR_PLUS_4/Data1
add wave -noupdate -expand -group {PC jalr +4} -radix decimal /RISC_V_Single_Cycle_TB/DUV/PC_JALR_PLUS_4/Result
add wave -noupdate -expand -group {PC jalr +4} -radix decimal /RISC_V_Single_Cycle_TB/DUV/PC_JALR_PLUS_4/Default
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {6 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 404
configure wave -valuecolwidth 72
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {7 ps} {19 ps}
