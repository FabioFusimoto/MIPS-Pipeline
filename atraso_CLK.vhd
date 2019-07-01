-------------------------------------------------------------------------------
--
-- Title       : atraso_CLK
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\atraso_CLK.vhd
-- Generated   : Fri Jun 28 19:09:23 2019
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
--{entity {atraso_CLK} architecture {atraso_CLK}}

library IEEE;
use IEEE.std_logic_1164.all;

entity atraso_CLK is
	 port(
		 CLK_IN : in STD_LOGIC;
		 CLK_C : out STD_LOGIC;
		 CLK_IF_ID : out STD_LOGIC
	     );
end atraso_CLK;

--}} End of automatically maintained section
architecture arch of atraso_CLK is
begin
	-- enter your statements here --
	process(CLK_IN)
	begin
		if(rising_edge(CLK_IN)) then
			CLK_C <= '1' after 1 ns;
   		elsif(falling_edge(CLK_IN)) then
			CLK_C <= '0' after 1 ns;
   		end if;
	end process;
	process(CLK_IN)
	begin
		if(rising_edge(CLK_IN)) then
			CLK_IF_ID <= '1' after 2 ns;
   		elsif(falling_edge(CLK_IN)) then
			CLK_IF_ID <= '0' after 2 ns;
   		end if;
	end process;
end arch;
