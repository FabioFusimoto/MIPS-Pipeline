-------------------------------------------------------------------------------
--
-- Title       : ativar_registradores
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\ativar_registradores.vhd
-- Generated   : Fri Jun 28 11:14:57 2019
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
--{entity {ativar_registradores} architecture {ativar_registradores}}

library IEEE;
use IEEE.std_logic_1164.all;

entity ativar_registradores is
	 port(
		 miss_cache_D : in STD_LOGIC;
		 hazard_dados : in STD_LOGIC;
		 R : in STD_LOGIC;
		 Done : in STD_LOGIC;
		 IF_Flush : in STD_LOGIC;
		 PC_en : out STD_LOGIC;
		 IF_ID_en : out STD_LOGIC
	     );
end ativar_registradores;

--}} End of automatically maintained section

architecture ativar_registradores of ativar_registradores is
begin
	-- enter your statements here --
	process(miss_cache_D, hazard_dados, R, Done, IF_Flush)
	begin
		if(miss_cache_D = '1' or (R = '1' and Done = '0') or hazard_dados = '1' or IF_Flush = '1') then
			PC_en <= '0';
			IF_ID_en <= '0';
		else	  
			PC_en <= '1';
			IF_ID_en <= '1';
		end if;
	end process;
end ativar_registradores;
