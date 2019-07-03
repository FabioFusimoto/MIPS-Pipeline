-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hierarquiaDeMemoria
-- Author      : Fernanda Parodi
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\compile\TB_RAM.vhd
-- Generated   : Tue Jul  2 22:30:20 2019
-- From        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\src\TB_RAM.bde
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

entity TB_RAM is
  port(
       pronto : in STD_LOGIC;
       dadoOut : in STD_LOGIC_VECTOR(31 downto 0);
       Clock : out STD_LOGIC;
       enable : out STD_LOGIC;
       r : out STD_LOGIC;
       w : out STD_LOGIC;
       enderecoIn : out STD_LOGIC_VECTOR(15 downto 0)
  );
end TB_RAM;

architecture TB_RAM of TB_RAM is

begin

---- Processes ----

Estimulos :
process (dadoOut, pronto)
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
-- declarations
begin
-- statements	
	enable <= '1';
	r <= '1';
	w <= '0';
	enderecoIn <= x"0000"; 
	--wait for 10 ns;
	
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



end TB_RAM;
