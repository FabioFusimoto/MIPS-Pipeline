-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : hierarquiaDeMemoria
-- Author      : Fernanda Parodi
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\compile\CacheIeRAM.vhd
-- Generated   : Tue Jul  2 23:55:29 2019
-- From        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\src\CacheIeRAM.bde
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

entity CacheIeRAM is
  port(
       Clock : in STD_LOGIC;
       enable : in STD_LOGIC;
       w : in STD_LOGIC;
       endereco_in : in STD_LOGIC_VECTOR(15 downto 0);
       data_out : out STD_LOGIC_VECTOR(31 downto 0)
  );
end CacheIeRAM;

architecture CacheIeRAM of CacheIeRAM is

function aldec_usn2slv16 (val:unsigned) return std_logic_vector is
begin
return conv_std_logic_vector(val,16);
end aldec_usn2slv16;

---- Component declarations -----

component CacheI
  generic(
       TAM_END : INTEGER := 16;
       TAM_DADO : INTEGER := 32;
       tam_linha : INTEGER := 1+2+16*32;
       num_blocos : INTEGER := 256
  );
  port (
       clk : in STD_LOGIC;
       data_in : in STD_LOGIC_VECTOR(TAM_DADO-1 downto 0);
       doneM : in STD_LOGIC;
       endereco_in : in UNSIGNED(TAM_END-1 downto 0);
       R : out STD_LOGIC;
       data_out : out STD_LOGIC_VECTOR(TAM_DADO-1 downto 0);
       endereco_outM : out UNSIGNED(TAM_END-1 downto 0)
  );
end component;
component Ram
  generic(
       BE : INTEGER := 16;
       BP : INTEGER := 8;
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

---- Signal declarations used on the diagram ----

signal DONE : STD_LOGIC;
signal R : STD_LOGIC;
signal data_in : STD_LOGIC_VECTOR(31 downto 0);
signal endereco_out : STD_LOGIC_VECTOR(15 downto 0);

begin

----  Component instantiations  ----

U2 : Ram
  port map(
       Clock => Clock,
       dadoOut => data_in,
       enable => enable,
       ender => endereco_out(15 downto 0),
       pronto => DONE,
       r => R,
       w => w
  );

U3 : CacheI
  port map(
       R => R,
       aldec_usn2slv16(endereco_outM) => endereco_out( 15 downto 0 ),
       clk => Clock,
       data_in => data_in(31 downto 0),
       data_out => data_out(31 downto 0),
       doneM => DONE,
       endereco_in => unsigned(endereco_in( 15 downto 0 ))
  );


end CacheIeRAM;
