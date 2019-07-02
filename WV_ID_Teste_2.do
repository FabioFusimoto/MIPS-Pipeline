onerror { resume }
transcript off
add wave -noreg -logic {/TB_ID/Reset}
add wave -noreg -logic {/TB_ID/CLK}
add wave -named_row "Registradores"
add wave -noreg -logic {/TB_ID/dut/U2/RegWrite}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U2/opcode}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U2/registrador_escrita}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U2/dado_escrita}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U2/Read_1}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U2/Read_2}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U2/Dado_1}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U2/Dado_2}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U2/RegFile}
cursor "Cursor 1" 10ns  
bookmark add 14.966ns
transcript on
