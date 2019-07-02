onerror { resume }
transcript off
add wave -noreg -logic {/TB_ID/CLK}
add wave -noreg -hexadecimal -literal {/TB_ID/IF_ID_in}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U5/PC_mais_4}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U5/offset}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U5/end_desvio}
cursor "Cursor 1" 20ns  
transcript on
