-------------------------------------------------------------------------------
--
-- Title       : mux_PC
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\mux_PC.vhd
-- Generated   : Fri Jun 28 10:33:16 2019
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
--{entity {mux_PC} architecture {mux_PC}}

library IEEE;
use IEEE.std_logic_1164.all;

entity mux_PC is
	 port(
		 PC_mais_4 : in STD_LOGIC_VECTOR(31 downto 0);
		 selecao_PC : in STD_LOGIC_VECTOR(1 downto 0);
		 PC_jump : in STD_LOGIC_VECTOR(31 downto 0);
		 PC_interrupcao : in STD_LOGIC_VECTOR(31 downto 0);
		 PC_excecao : in STD_LOGIC_VECTOR(31 downto 0);
		 PC_value : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end mux_PC;

--}} End of automatically maintained section

architecture mux_PC of mux_PC is					  
begin
	-- enter your statements here --
	with selecao_PC select 
	PC_value <= PC_mais_4 when "00",
			 PC_jump when "01",
			 PC_interrupcao when "10",
			 PC_excecao when others;

end mux_PC;
