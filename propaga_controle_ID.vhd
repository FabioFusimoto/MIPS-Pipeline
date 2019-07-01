-------------------------------------------------------------------------------
--
-- Title       : propaga_controle_ID
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\propaga_controle_ID.vhd
-- Generated   : Sun Jun 30 08:12:12 2019
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
--{entity {propaga_controle_ID} architecture {propaga_controle_ID}}

library IEEE;
use IEEE.std_logic_1164.all;

entity propaga_controle_ID is
	 port(
		 OrigUla : in STD_LOGIC;
		 Salto : in STD_LOGIC;
		 LeMem : in STD_LOGIC;
		 EscreveMem : in STD_LOGIC;
		 EscreveReg : in STD_LOGIC;
		 MemParaReg : in STD_LOGIC;
		 RegDst : in STD_LOGIC;
		 OpUla : in STD_LOGIC_VECTOR(1 downto 0);
		 ID_Flush : in STD_LOGIC;
		 hazard_dados : in STD_LOGIC;
		 Link : in STD_LOGIC;
		 Desvio : in STD_LOGIC_VECTOR(1 downto 0);
		 cont_MEM : out STD_LOGIC_VECTOR(4 downto 0);
		 cont_WB : out STD_LOGIC_VECTOR(2 downto 0);
		 cont_EX : out STD_LOGIC_VECTOR(3 downto 0)
	     );
end propaga_controle_ID;

--}} End of automatically maintained section

architecture propaga_controle_ID of propaga_controle_ID is
	signal sel : std_logic;
begin
	-- enter your statements here --
	sel <= ID_Flush or hazard_dados;
	
	with sel select
	cont_EX <= RegDst & OrigUla & OpUla when '0',
			   "0000"					when others;
	with sel select
	cont_MEM <= Desvio & Salto & LeMem & EscreveMem when '0',
				"00000"								when others;
	with sel select
	cont_WB <= EscreveReg & MemParaReg & Link when '0',
			   "000"						  when others;
	
end propaga_controle_ID;
