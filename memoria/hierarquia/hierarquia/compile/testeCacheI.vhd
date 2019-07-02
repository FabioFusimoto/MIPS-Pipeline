-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hierarquia
-- Author      : julia.fernandes.moraes@usp.br
-- Company     : usp
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Julia\Documents\GitHub\MIPS-Pipeline\memoria\hierarquia\hierarquia\compile\testeCacheI.vhd
-- Generated   : Tue Jul  2 02:03:59 2019
-- From        : C:\Users\Julia\Documents\GitHub\MIPS-Pipeline\memoria\hierarquia\hierarquia\src\testeCacheI.bde
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

entity testeCacheI is 
end testeCacheI;

architecture testeCacheI of testeCacheI is

---- Component declarations -----

component Fub1
  port (
       Clock : in STD_LOGIC;
       Enable : in STD_LOGIC;
       enderecoIn : in STD_LOGIC_VECTOR(7 downto 0);
       reset : in STD_LOGIC;
       w : in STD_LOGIC;
       data_out : out STD_LOGIC_VECTOR(15 downto 0)
  );
end component;
component TB_CacheI2
  port (
       data_out : in STD_LOGIC_VECTOR(15 downto 0);
       Clock : out STD_LOGIC;
       Enable : out STD_LOGIC;
       enderecoIn : out STD_LOGIC_VECTOR(7 downto 0);
       reset : out STD_LOGIC;
       w : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal Clock : STD_LOGIC;
signal Enable : STD_LOGIC;
signal reset : STD_LOGIC;
signal w : STD_LOGIC;
signal data_out : STD_LOGIC_VECTOR(15 downto 0);
signal enderecoIn : STD_LOGIC_VECTOR(7 downto 0);

begin

----  Component instantiations  ----

U1 : TB_CacheI2
  port map(
       Clock => Clock,
       Enable => Enable,
       data_out => data_out,
       enderecoIn => enderecoIn,
       reset => reset,
       w => w
  );

U2 : Fub1
  port map(
       Clock => Clock,
       Enable => Enable,
       data_out => data_out,
       enderecoIn => enderecoIn,
       reset => reset,
       w => w
  );


end testeCacheI;
