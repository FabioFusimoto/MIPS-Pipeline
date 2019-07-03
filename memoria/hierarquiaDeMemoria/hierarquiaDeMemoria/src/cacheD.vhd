-------------------------------------------------------------------------------
--
-- Title       : CacheD
-- Design      : hierarquiaDeMemoria
-- Author      : julia.fernandes.moraes@usp.br
-- Company     : usp
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Julia\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\src\CacheD.vhd
-- Generated   : Tue Jul  2 23:24:05 2019
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
--{entity {CacheD} architecture {CacheD}}

library IEEE;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_1164.all;

entity CacheD is
	 generic(
		TAM_END : INTEGER := 16;
		TAM_DADO : INTEGER := 32;
		tam_linha : INTEGER := 1+1+4*16;
		num_blocos : INTEGER := 128
	    );
	 port(
		 endereco_in : in UNSIGNED(TAM_END-1 downto 0);
		 data_M : in STD_LOGIC_VECTOR(TAM_DADO-1 downto 0);
		 data_W : in STD_LOGIC_VECTOR(TAM_DADO-1 downto 0);
		 rw : in STD_LOGIC;
		 doneM : in STD_LOGIC;
		 endereco_outM : out UNSIGNED(TAM_END-1 downto 0);
		 data_out : out STD_LOGIC_VECTOR(TAM_DADO-1 downto 0);
		 R : out STD_LOGIC;
		 W : out STD_LOGIC
	     );
end CacheD;

--}} End of automatically maintained section

architecture CacheD of CacheD is
begin

	 -- enter your statements here --

end CacheD;
