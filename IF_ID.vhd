-------------------------------------------------------------------------------
--
-- Title       : IF_ID
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\IF_ID.vhd
-- Generated   : Fri Jun 28 12:37:40 2019
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
--{entity {IF_ID} architecture {IF_ID}}

library IEEE;
use IEEE.std_logic_1164.all;

entity IF_ID is
	 port(
		 PC_mais_4 : in STD_LOGIC_VECTOR(31 downto 0);
		 IF_Flush : in STD_LOGIC;
		 IF_ID_en : in STD_LOGIC;
		 instrucao : in STD_LOGIC_VECTOR(31 downto 0);
		 CLK : in STD_LOGIC;
		 IF_ID_atual : in STD_LOGIC_VECTOR(63 downto 0);
		 IF_ID_out : out STD_LOGIC_VECTOR(63 downto 0);
		 ID_EX_en : out STD_LOGIC
	     );
end IF_ID;

--}} End of automatically maintained section

architecture IF_ID of IF_ID is
	signal concat: std_logic_vector(63 downto 0);
begin
	-- enter your statements here --
	concat <= instrucao & PC_mais_4;
	ID_EX_en <= IF_ID_en;
	process(CLK, IF_Flush, IF_ID_En)
	begin
		if(CLK'event and CLK = '1') then
			if(IF_Flush = '1') then
				IF_ID_out <= "0000000000000000000000000000000000000000000000000000000000000000";
			elsif(IF_ID_en = '1') then
				IF_ID_out <= concat;
			else
				IF_ID_out <= IF_ID_atual;
			end if;
		end if;
	end process;

end IF_ID;
