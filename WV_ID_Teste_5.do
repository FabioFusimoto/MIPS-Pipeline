onerror { resume }
transcript off
add wave -noreg -logic {/TB_ID/CLK}
add wave -named_row "Unidade de hazard" -color 255,4,255
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U1/Rs}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U1/Rt}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U1/ID_EX_Rt}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U1/ID_EX_LeMem}
add wave -noreg -logic {/TB_ID/dut/U1/hazard_signal}
add wave -noreg -logic {/TB_ID/Overflow}
add wave -named_row "Estágio EX" -color 255,4,255
add wave -noreg -logic {/TB_ID/dut/U6/RegDst}
add wave -noreg -logic {/TB_ID/dut/U6/OrigUla}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U6/OpUla}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U6/cont_EX}
add wave -named_row "Estágio MEM" -color 255,4,255
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U6/Desvio}
add wave -noreg -logic {/TB_ID/dut/U6/Salto}
add wave -noreg -logic {/TB_ID/dut/U6/LeMem}
add wave -noreg -logic {/TB_ID/dut/U6/EscreveMem}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U6/cont_MEM}
add wave -named_row "Estágio WB" -color 255,4,255
add wave -noreg -logic {/TB_ID/dut/U6/EscreveReg}
add wave -noreg -logic {/TB_ID/dut/U6/MemParaReg}
add wave -noreg -logic {/TB_ID/dut/U6/Link}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U6/cont_WB}
cursor "Cursor 1" 56ns  
transcript on
