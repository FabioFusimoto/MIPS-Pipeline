onerror { resume }
transcript off
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U3/opcode}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U3/func}
add wave -noreg -logic {/TB_ID/dut/U3/RegDst}
add wave -noreg -logic {/TB_ID/dut/U3/OrigUla}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U3/OpUla}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U3/Desvio}
add wave -noreg -logic {/TB_ID/dut/U3/Salto}
add wave -noreg -logic {/TB_ID/dut/U3/LeMem}
add wave -noreg -logic {/TB_ID/dut/U3/EscreveMem}
add wave -noreg -logic {/TB_ID/dut/U3/EscreveReg}
add wave -noreg -logic {/TB_ID/dut/U3/MemParaReg}
cursor "Cursor 1" 15ns  
transcript on
