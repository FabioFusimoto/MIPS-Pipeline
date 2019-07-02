-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hierarquiaDeMemoria
-- Author      : Fernanda Parodi
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\compile\TB_CacheI.vhd
-- Generated   : Tue Jul  2 19:02:30 2019
-- From        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\src\TB_CacheI.bde
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

entity TB_CacheI is
  port(
       data_out : in STD_LOGIC_VECTOR(15 downto 0);
       Clock : out STD_LOGIC;
       enable : out STD_LOGIC;
       w : out STD_LOGIC;
       endereco_in : out STD_LOGIC_VECTOR(7 downto 0)
  );
end TB_CacheI;

architecture TB_CacheI of TB_CacheI is

begin

---- Processes ----

Estimulos :
process (data_out)
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
-- declarations
begin
-- statements	
	enable <= '1';
	w <= '0';	  
	endereco_in <= x"00"; 

	
end process Estimulos;

clk :
	 process
		constant PERIOD: time := 10 ns;
	 	variable clktmp: std_logic := '0';
	 begin
		 clktmp := not clktmp;
		 Clock <= clktmp;
		 wait for PERIOD / 2;
end process clk;


end TB_CacheI;
