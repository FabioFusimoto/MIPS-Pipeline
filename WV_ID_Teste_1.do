onerror { resume }
transcript off
add wave -noreg -logic {/TB_ID/Reset}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U2/Dado_1}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U2/Dado_2}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U2/RegFile}
cursor "Cursor 1" 2532ps  
bookmark add 14.966ns
transcript on
