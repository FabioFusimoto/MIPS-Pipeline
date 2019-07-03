-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hierarquiaDeMemoria
-- Author      : Fernanda Parodi
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\compile\testeRAM.vhd
-- Generated   : Tue Jul  2 22:29:23 2019
-- From        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\src\testeRAM.bde
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

entity testeRAM is 
end testeRAM;

architecture testeRAM of testeRAM is

---- Component declarations -----

component Ram
  generic(
       BE : INTEGER := 8;
       BP : INTEGER := 16;
       NA : STRING := "C:\My_Designs\projeto1\projeto06281\mram.txt"
-- synthesis translate_off
       ;
       Tz : TIME := 2 ns;
       Twrite : TIME := 5 ns;
       Tsetup : TIME := 2 ns;
       Tread : TIME := 5 ns
-- synthesis translate_on
  );
  port (
       Clock : in STD_LOGIC;
       enable : in STD_LOGIC;
       ender : in STD_LOGIC_VECTOR(BE-1 downto 0);
       r : in STD_LOGIC;
       w : in STD_LOGIC;
       dadoOut : out STD_LOGIC_VECTOR(31 downto 0);
       pronto : out STD_LOGIC
  );
end component;
component TB_RAM
  port (
       dadoOut : in STD_LOGIC_VECTOR(31 downto 0);
       pronto : in STD_LOGIC;
       Clock : out STD_LOGIC;
       enable : out STD_LOGIC;
       enderecoIn : out STD_LOGIC_VECTOR(15 downto 0);
       r : out STD_LOGIC;
       w : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal Clock : STD_LOGIC;
signal enable : STD_LOGIC;
signal pronto : STD_LOGIC;
signal r : STD_LOGIC;
signal w : STD_LOGIC;
signal dadoOut : STD_LOGIC_VECTOR(31 downto 0);
signal enderecoIn : STD_LOGIC_VECTOR(15 downto 0);

begin

----  Component instantiations  ----

U1 : TB_RAM
  port map(
       Clock => Clock,
       dadoOut => dadoOut,
       enable => enable,
       enderecoIn => enderecoIn,
       pronto => pronto,
       r => r,
       w => w
  );

U2 : Ram
  port map(
       Clock => Clock,
       dadoOut => dadoOut,
       enable => enable,
       ender => enderecoIn(15 downto 0),
       pronto => pronto,
       r => r,
       w => w
  );


end testeRAM;
