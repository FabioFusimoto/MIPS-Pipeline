-------------------------------------------------------------------------------
--
-- Title       : PC
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\PC.vhd
-- Generated   : Fri Jun 28 10:51:08 2019
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
--{entity {PC} architecture {PC}}

library IEEE;
use IEEE.std_logic_1164.all;

entity PC is
	 port(
		 PC_proximo : in STD_LOGIC_VECTOR(31 downto 0);
		 PC_en : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 PC_atual : in STD_LOGIC_VECTOR(31 downto 0);
		 reset : in std_logic;
		 PC_Out : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end PC;

--}} End of automatically maintained section

architecture PC of PC is
begin
	 -- enter your statements here --
	 process (CLK, PC_en)
	 begin
		 if(reset = '1') then
			 PC_out <= (others => '0');
		 elsif(CLK'event and (CLK = '1')) then
		 	if(PC_en = '1') then
				PC_Out <= PC_proximo;
			else
				PC_Out <= PC_atual;
			end if;
		 end if;
		end process;			 
	 
end PC;
