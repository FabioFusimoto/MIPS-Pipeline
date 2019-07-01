-------------------------------------------------------------------------------
--
-- Title       : calc_desvio
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\calc_desvio.vhd
-- Generated   : Sun Jun 30 07:59:41 2019
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
--{entity {calc_desvio} architecture {calc_desvio}}

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity calc_desvio is
	 port(
		 PC_mais_4 : in STD_LOGIC_VECTOR(31 downto 0);
		 offset : in STD_LOGIC_VECTOR(31 downto 0);
		 end_desvio : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end calc_desvio;

--}} End of automatically maintained section

architecture calc_desvio of calc_desvio is
begin
	-- enter your statements here --
	process (PC_mais_4, offset)
	begin										
		end_desvio <= signed(offset) + signed(PC_mais_4);
	end process;
end calc_desvio;
