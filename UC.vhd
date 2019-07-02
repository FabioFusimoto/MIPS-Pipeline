-------------------------------------------------------------------------------
--
-- Title       : UC
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\UC.vhd
-- Generated   : Sun Jun 30 12:05:50 2019
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
--{entity {UC} architecture {UC}}

library IEEE;
use IEEE.std_logic_1164.all;

entity UC is
	 port(
	 	 opcode : in STD_LOGIC_VECTOR(5 downto 0);
	 	 func : in STD_LOGIC_VECTOR(5 downto 0);
		 Overflow : in STD_LOGIC;
		 RegDst : out STD_LOGIC;
		 OrigUla : out STD_LOGIC;
		 LeMem : out STD_LOGIC;
		 EscreveMem : out STD_LOGIC;
		 EscreveReg : out STD_LOGIC;
		 MemParaReg : out STD_LOGIC;
		 OpUla : out STD_LOGIC_VECTOR(1 downto 0);
		 IF_Flush : out STD_LOGIC;
		 ID_Flush : out STD_LOGIC;
		 EX_Flush : out STD_LOGIC;
		 Salto : out STD_LOGIC;
		 Link : out STD_LOGIC;
		 Desvio : out STD_LOGIC_VECTOR(1 downto 0)
	     );
end UC;

--}} End of automatically maintained section

architecture UC of UC is
signal tipoR : std_logic;
begin
	-- '0' indica que o segundo operando vem de um registrador
	-- '1' indica que o segundo operando vem de um imediato
	with opcode select
	OrigULA <= '0' when "000000", -- tipo R
	           '0' when "000100", -- beq
			   '0' when "000101", -- bne
			   '0' when "001010", -- slti
		 	   '1' when others;
	
	with opcode select						  
	RegDst <= '1' when "000000",
			  '0' when others;
	
	with opcode select
	LeMem <= '1' when "100011",
	         '0' when others;
	
	with opcode select
	EscreveMem <= '1' when "101011",
	              '0' when others;
	
	with opcode select
	Desvio <= "10" when "000100", -- beq
			  "11" when "000101", -- bne
			  "00" when others;
	
    with func select
	tipoR <= '0' when "001000", -- jr é a única instrução tipo R que não escreve num registrador			  
			 '1' when others;
	
	with opcode select
	EscreveReg <= tipoR when "000000",
				  '1' when "100011",
				  '1' when "001000",
				  '1' when "001010",
				  '1' when "000011",
				  '0' when others;
	
	with opcode select
	MemParaReg <= '1' when "100011",
	              '0' when others;
	
	with opcode select
	Link <= '1' when "000011",
	        '0' when others;
	
	IF_Flush <= Overflow;
	ID_Flush <= Overflow;
	EX_Flush <= Overflow;
	
	process(opcode, func)
	--    [-----j----]      [------jal----  ]                 [------jr-----]                 
	begin
	if(opcode = "000010" or opcode = "000011" or (opcode = "000000" and func = "001000")) then
		Salto <= '1';
	else
		Salto <= '0';
	end if;
					   
	if((opcode = "000000" and func = "100000")) then
		OpUla <= "00";
	elsif(opcode = "000000" and func = "100001") then
		OpUla <= "01";
	elsif((opcode = "000000" and func = "101010") or opcode = "001010" or opcode = "000100" or opcode = "000101") then
		OpUla <= "10";
	elsif(opcode = "000000" and func = "000000") then
		OpUla <= "11";
	else
		OpUla <= "00";
	end if;
	
	end process;
		
end UC;
