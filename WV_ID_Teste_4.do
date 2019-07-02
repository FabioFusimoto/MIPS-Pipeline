onerror { resume }
transcript off
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U1/Rs}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U1/Rt}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U1/ID_EX_Rt}
add wave -noreg -hexadecimal -literal {/TB_ID/dut/U1/ID_EX_LeMem}
add wave -noreg -logic {/TB_ID/dut/U1/hazard_signal}
cursor "Cursor 1" 10ns  
transcript on
