-------------------------------------------------------------------------------
--
-- Title       : ext_sinal
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\ext_sinal.vhd
-- Generated   : Sun Jun 30 07:56:39 2019
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
--{entity {ext_sinal} architecture {ext_sinal}}

library IEEE;
use IEEE.std_logic_1164.all;

entity ext_sinal is
	 port(
		 imediato : in STD_LOGIC_VECTOR(15 downto 0);
		 imediato_ext : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end ext_sinal;

--}} End of automatically maintained section

architecture ext_sinal of ext_sinal is
	signal extensao : std_logic_vector(15 downto 0);
begin
	-- enter your statements here --
	with imediato(15) select
	extensao <= "0000000000000000" when '0',
				"1111111111111111" when others;
   
	imediato_ext <= extensao & imediato;
end ext_sinal;
