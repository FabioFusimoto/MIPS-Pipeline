-------------------------------------------------------------------------------
--
-- Title       : Gerador_Clock
-- Design      : EX01_Entrega
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : c:\My_Designs\EX01_Entrega\EX01_Entrega\src\Gerador_Clock.vhd
-- Generated   : Wed Feb 27 08:07:27 2019
-- From        : interface description file
-- By          : Itf2Vhdl ver. 1.22
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------

--{{ Section below this comment is automatically maintained
--   and may be overwritten
--{entity {Gerador_Clock} architecture {Gerador_Clock}}

library IEEE;
use IEEE.std_logic_1164.all;

entity Gerador_Clock is
	 port(
		 CLK : out STD_LOGIC
	     );
end Gerador_Clock;

--}} End of automatically maintained section

architecture Gerador_Clock of Gerador_Clock is
	signal clock : STD_ULOGIC := '1';
	constant num_cycles : INTEGER := 16000;
begin
	
	clk_process : process
	begin
		for i in 1 to num_cycles loop
			clock <= not clock;
			wait for 2 ns;
			clock <= not clock;
			wait for 2 ns;
		end loop;
	end process;
	
	CLK <= clock;
	
end Gerador_Clock;