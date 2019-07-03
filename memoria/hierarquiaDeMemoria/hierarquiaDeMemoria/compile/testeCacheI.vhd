-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hierarquiaDeMemoria
-- Author      : Fernanda Parodi
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\compile\testeCacheI.vhd
-- Generated   : Tue Jul  2 23:42:32 2019
-- From        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\src\testeCacheI.bde
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

component CacheIeRAM
  port (
       Clock : in STD_LOGIC;
       enable : in STD_LOGIC;
       endereco_in : in STD_LOGIC_VECTOR(15 downto 0);
       w : in std_logic;
       data_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end component;
component TB_CacheI
  port (
       data_out : in STD_LOGIC_VECTOR(31 downto 0);
       Clock : out STD_LOGIC;
       enable : out STD_LOGIC;
       endereco_in : out STD_LOGIC_VECTOR(15 downto 0);
       w : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal Clock : STD_LOGIC;
signal enable : STD_LOGIC;
signal w : STD_LOGIC;
signal data_out : STD_LOGIC_VECTOR(31 downto 0);
signal endereco_in : STD_LOGIC_VECTOR(15 downto 0);

begin

----  Component instantiations  ----

U1 : TB_CacheI
  port map(
       Clock => Clock,
       data_out => data_out,
       enable => enable,
       endereco_in => endereco_in,
       w => w
  );

U2 : CacheIeRAM
  port map(
       Clock => Clock,
       data_out => data_out,
       enable => enable,
       endereco_in => endereco_in,
       w => w
  );


end testeCacheI;
