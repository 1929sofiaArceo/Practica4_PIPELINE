onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /RISC_V_Single_Cycle_TB/clk_tb
add wave -noupdate /RISC_V_Single_Cycle_TB/reset_tb
add wave -noupdate -expand -group ALU -radix binary /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/ALU_Operation_i
add wave -noupdate -expand -group ALU /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/A_i
add wave -noupdate -expand -group ALU /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/B_i
add wave -noupdate -expand -group ALU /RISC_V_Single_Cycle_TB/DUV/ALU_UNIT/Zero_o
add wave -noupdate -expand -group {Tower 1} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[2]}
add wave -noupdate -expand -group {Tower 1} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[1]}
add wave -noupdate -expand -group {Tower 1} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[0]}
add wave -noupdate -expand -group {Tower 2} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[5]}
add wave -noupdate -expand -group {Tower 2} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[4]}
add wave -noupdate -expand -group {Tower 2} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[3]}
add wave -noupdate -expand -group {Tower 3} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[8]}
add wave -noupdate -expand -group {Tower 3} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[7]}
add wave -noupdate -expand -group {Tower 3} -radix decimal {/RISC_V_Single_Cycle_TB/DUV/DATA_MEMORY_UNIT/ram[6]}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1949 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 167
configure wave -valuecolwidth 67
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
WaveRestoreZoom {0 ps} {2044 ps}
