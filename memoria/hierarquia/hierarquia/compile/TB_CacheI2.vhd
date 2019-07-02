-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : hierarquia
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Julia\Documents\GitHub\MIPS-Pipeline\memoria\hierarquia\hierarquia\compile\TB_CacheI2.vhd
-- Generated   : Tue Jul  2 02:00:34 2019
-- From        : C:\Users\Julia\Documents\GitHub\MIPS-Pipeline\memoria\hierarquia\hierarquia\src\TB_CacheI2.bde
-- By          : Bde2Vhdl ver. 2.6
--
-------------------------------------------------------------------------------
--
-- Description : 
--
-------------------------------------------------------------------------------
-- Design unit header --
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_signed.all;
use IEEE.std_logic_unsigned.all;

entity TB_CacheI2 is
  port(
       data_out : in STD_LOGIC_VECTOR(15 downto 0);
       Clock : out STD_LOGIC;
       Enable : out STD_LOGIC;
       reset : out STD_LOGIC;
       w : out STD_LOGIC;
       enderecoIn : out STD_LOGIC_VECTOR(7 downto 0)
  );
end TB_CacheI2;

architecture TB_CacheI2 of TB_CacheI2 is

begin

---- Processes ----

Estimulos :
process
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
-- declarations
begin
-- statements	
	Enable <= '1';
	Reset <= '0';
	w <= '0';
	enderecoIn <= "00000000";
    wait for 10 ns;

end process Estimulos;


clockP: process		 
 		constant PERIOD: time := 10 ns;
	 	variable clktmp: std_logic := '0';
	 begin
		 clktmp := not clktmp;
		 Clock <= clktmp;
		 wait for PERIOD / 2;
	end process;

end TB_CacheI2;
