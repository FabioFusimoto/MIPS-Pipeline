onerror { resume }
transcript off
add wave -noreg -logic {/TB_IF/dut/U1/CLK}
add wave -noreg -logic {/TB_IF/jump}
add wave -noreg -logic {/TB_IF/Excecao}
add wave -noreg -logic {/TB_IF/miss_cache_D}
add wave -noreg -logic {/TB_IF/hazard_dados}
add wave -noreg -logic {/TB_IF/dut/IF_Flush}
add wave -named_row "IF_ID"
add wave -noreg -hexadecimal -literal {/TB_IF/IF_ID_out}
add wave -named_row "PC"
add wave -noreg -logic {/TB_IF/dut/U5/PC_en}
add wave -noreg -hexadecimal -literal {/TB_IF/dut/U1/PC_Out}
add wave -named_row "Cache I"
add wave -noreg -hexadecimal -literal {/TB_IF/dut/U6/instrucao}
add wave -noreg -hexadecimal -literal {/TB_IF/dut/U3/PC_mais_4}
cursor "Cursor 1" 72ns  
transcript on
