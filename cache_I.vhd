-------------------------------------------------------------------------------
--
-- Title       : cache_I
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\cache_I.vhd
-- Generated   : Fri Jun 28 11:44:20 2019
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
--{entity {cache_I} architecture {cache_I}}

library IEEE;
use IEEE.std_logic_1164.all;

entity cache_I is
	 port(
		 PC_Out : in STD_LOGIC_VECTOR(31 downto 0);
		 data_I : in STD_LOGIC_VECTOR(31 downto 0);
		 Done : in STD_LOGIC;
		 instrucao : out STD_LOGIC_VECTOR(31 downto 0);
		 R : out STD_LOGIC
	     );
end cache_I;

--}} End of automatically maintained section

architecture cache_I of cache_I is
	signal prox_instrucao: std_logic_vector(31 downto 0);
	signal seletor : std_logic_vector(7 downto 0);
begin	 
	 -- enter your statements here --
	 instrucao <= prox_instrucao;
	 seletor <= PC_out(7 downto 0);
	 R <= '0'; -- vamos forçar R = '0' por enquanto --

	 process(seletor)
	 begin		 
		 -- vamos criar uma memória fake -> ver arquivo memoria_fake.txt --
		 case seletor is
			 when "00000000" =>	 -- addi $3,$0,0 --
			 	prox_instrucao <= "00100000000000110000000000000000";
			 when "00000100" =>	 -- sw   $3,256($0) --
			 	prox_instrucao <= "10101100000000110000000100000000";
			 when "00001000" =>	-- lw   $2,260($0) --
			 	prox_instrucao <= "10001100000000100000000100000100";
			 when "00001100" =>	-- slt  $1,$3,$2 --
			 	prox_instrucao <= "00000000011000100000100000101010";
			 when "00010000" =>	-- beq  $1,$0,104 --
			 	prox_instrucao <= "00010000000000010000000001101000";
			 when "00010100" =>	-- addi $2,$3,-1 --
			 	prox_instrucao <= "00100000011000101111111111111111";
			 when "00011000" =>	-- slti $1,$2,0 --
			 	prox_instrucao <= "00101000010000010000000000000000";
			 when "00011100" =>	-- bne  $1,$0,88 --
			 	prox_instrucao <= "00010100000000010000000001011000";
		     when others =>
			 	prox_instrucao <= "00000000000000000000000000000000";
		 end case;
	end process;
end cache_I;
