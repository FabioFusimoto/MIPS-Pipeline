-------------------------------------------------------------------------------
--
-- Title       : Somador
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\Somador.vhd
-- Generated   : Fri Jun 28 10:58:41 2019
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
--{entity {Somador} architecture {Somador}}

library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all; 
use ieee.std_logic_misc.all;

entity Somador is
	 port(
		 PC_Out : in STD_LOGIC_VECTOR(31 downto 0);
		 Cte_4 : in STD_LOGIC_VECTOR(31 downto 0);
		 PC_mais_4 : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end Somador;

--}} End of automatically maintained section

architecture Somador of Somador is
	signal res: std_logic_vector(31 downto 0);
begin
	-- enter your statements here --
	PC_mais_4 <= res;
	process(PC_Out, Cte_4)
	begin
		res <= std_logic_vector(signed(PC_out) + signed(Cte_4)); 
	end process;
	
end Somador;
