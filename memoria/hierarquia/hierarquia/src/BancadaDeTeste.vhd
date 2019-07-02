-------------------------------------------------------------------------------
--
-- Title       : BancadaDeTeste
-- Design      : hierarquia
-- Author      : julia.fernandes.moraes@usp.br
-- Company     : usp
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Julia\Documents\GitHub\MIPS-Pipeline\memoria\hierarquia\hierarquia\src\BancadaDeTeste.vhd
-- Generated   : Mon Jul  1 19:59:28 2019
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
--{entity {BancadaDeTeste} architecture {BancadaDeTeste}}

library IEEE;
use IEEE.std_logic_1164.all;

entity BancadaDeTeste is
	 port(
		 Clock : out STD_LOGIC;
		 w : out STD_LOGIC;
		 Enable : out STD_LOGIC;
		 r : out STD_LOGIC;
		 reset : out STD_LOGIC;
		 enderecoIn : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end BancadaDeTeste;

--}} End of automatically maintained section

architecture BancadaDeTeste of BancadaDeTeste is
begin		  
	
	
Estimulos :
process
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
-- declarations
begin
-- statements	
	enderecoIn <= "00000000000000000000000000000000";
	w <= '0';	  
	Enable <= '1';
	r <= '1';
    wait for 10 ns;

end process Estimulos;


clockt: process		 
 		constant PERIOD: time := 10 ns;
	 	variable clktmp: std_logic := '0';
	 begin
		 clktmp := not clktmp;
		 Clock <= clktmp;
		 wait for PERIOD / 2;
	end process;
	
end BancadaDeTeste;
