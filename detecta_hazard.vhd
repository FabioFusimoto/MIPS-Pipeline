-------------------------------------------------------------------------------
--
-- Title       : detecta_hazard
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\detecta_hazard.vhd
-- Generated   : Sun Jun 30 08:01:51 2019
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
--{entity {detecta_hazard} architecture {detecta_hazard}}

library IEEE;
use IEEE.std_logic_1164.all;

entity detecta_hazard is
	 port(
		 Rs : in STD_LOGIC_VECTOR(4 downto 0);
		 Rt : in STD_LOGIC_VECTOR(4 downto 0);
		 ID_EX_Rt : in STD_LOGIC_VECTOR(4 downto 0);
		 ID_EX_LeMem : in STD_LOGIC_VECTOR(5 downto 0);
		 hazard_signal : out STD_LOGIC
	     );
end detecta_hazard;

--}} End of automatically maintained section

architecture detecta_hazard of detecta_hazard is
begin
	-- enter your statements here --
	process(Rs,Rt,ID_EX_Rt,ID_EX_LeMem)
	begin
		if(ID_EX_LeMem = "100011" and ((ID_EX_Rt = Rs) or (ID_EX_Rt = Rt))) then
			hazard_signal <= '1';
		else
			hazard_signal <= '0';
		end if;
	end process;
end detecta_hazard;
