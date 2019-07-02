-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hierarquia
-- Author      : julia.fernandes.moraes@usp.br
-- Company     : usp
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Julia\Documents\GitHub\MIPS-Pipeline\memoria\hierarquia\hierarquia\compile\toplevel.vhd
-- Generated   : Mon Jul  1 21:18:06 2019
-- From        : C:\Users\Julia\Documents\GitHub\MIPS-Pipeline\memoria\hierarquia\hierarquia\src\toplevel.bde
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

entity toplevel is 
end toplevel;

architecture toplevel of toplevel is

---- Component declarations -----

component Fub1
  port (
       Clock : in STD_LOGIC;
       Enable : in STD_LOGIC;
       enderecoIn : in STD_LOGIC_VECTOR(31 downto 0);
       reset : in STD_LOGIC;
       w : in STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal Clock : STD_LOGIC;
signal Enable : STD_LOGIC;
signal reset : STD_LOGIC;
signal w : STD_LOGIC;
signal enderecoIn : STD_LOGIC_VECTOR(31 downto 0);

begin

---- Processes ----

Process_1 :
process
-- Section above this comment may be overwritten according to
-- "Update sensitivity list automatically" option status
-- declarations
begin
-- statements
end process Process_1;

----  Component instantiations  ----

U1 : Fub1
  port map(
       Clock => Clock,
       Enable => Enable,
       enderecoIn => enderecoIn,
       reset => reset,
       w => w
  );


end toplevel;
