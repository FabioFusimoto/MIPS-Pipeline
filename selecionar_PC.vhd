-------------------------------------------------------------------------------
--
-- Title       : selecionar_PC
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\selecionar_PC.vhd
-- Generated   : Fri Jun 28 10:11:10 2019
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
--{entity {selecionar_PC} architecture {selecionar_PC}}

library IEEE;
use IEEE.std_logic_1164.all;

entity selecionar_PC is
	 port(
		 Excecao : in STD_LOGIC;
		 Inter : in STD_LOGIC;
		 ac_inter : in STD_LOGIC;
		 jump : in STD_LOGIC;
		 selecao_PC : out STD_LOGIC_VECTOR(1 downto 0)
	     );
end selecionar_PC;

--}} End of automatically maintained section

architecture selecionar_PC of selecionar_PC is
begin 
	-- enter your statements here --
	process(Excecao, Inter, ac_inter, jump)
	begin
		if(Excecao = '1') then
			selecao_PC <= "11";		
		elsif (Inter = '1' and ac_inter = '1') then
			selecao_PC <= "10";
		elsif (jump = '1') then
			selecao_PC <= "01";
		else
			selecao_PC <= "00";
		end if;	 
	end process;
			
end selecionar_PC;
