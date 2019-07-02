-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hierarquia
-- Author      : Fernanda Parodi
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquia\hierarquia\compile\testeRAM.vhd
-- Generated   : Tue Jul  2 09:27:06 2019
-- From        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquia\hierarquia\src\testeRAM.bde
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
       pronto : out STD_LOGIC;
       dado : inout STD_LOGIC_VECTOR(BP-1 downto 0)
  );
end component;
component TB_RAM
  port (
       Pronto : in STD_LOGIC;
       dado : in STD_LOGIC_VECTOR(15 downto 0);
       Clock : out STD_LOGIC;
       Enable : out STD_LOGIC;
       enderecoIn : out STD_LOGIC_VECTOR(7 downto 0);
       r : out STD_LOGIC;
       w : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal Clock : STD_LOGIC;
signal Enable : STD_LOGIC;
signal pronto : STD_LOGIC;
signal r : STD_LOGIC;
signal w : STD_LOGIC;
signal dado : STD_LOGIC_VECTOR(15 downto 0);
signal enderecoIn : STD_LOGIC_VECTOR(7 downto 0);

begin

----  Component instantiations  ----

U1 : TB_RAM
  port map(
       Clock => Clock,
       Enable => Enable,
       Pronto => pronto,
       dado => dado,
       enderecoIn => enderecoIn,
       r => r,
       w => w
  );

U2 : Ram
  port map(
       Clock => Clock,
       dado => dado(15 downto 0),
       enable => Enable,
       ender => enderecoIn(7 downto 0),
       pronto => pronto,
       r => r,
       w => w
  );


end testeRAM;
