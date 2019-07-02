-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : hierarquiaDeMemoria
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\compile\CacheIeRAM.vhd
-- Generated   : Tue Jul  2 19:22:35 2019
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

-- Included from components --
use ieee.std_logic_arith.all;

entity CacheIeRAM is
  port(
       Clock : in STD_LOGIC;
       enable : in STD_LOGIC;
       w : in std_logic;
       endereco_in : in STD_LOGIC_VECTOR(7 downto 0);
       data_out : out STD_LOGIC_VECTOR(15 downto 0)
  );
end CacheIeRAM;

architecture CacheIeRAM of CacheIeRAM is

function aldec_usn2slv8 (val:unsigned) return std_logic_vector is
begin
return conv_std_logic_vector(val,8);
end aldec_usn2slv8;

---- Component declarations -----

component CacheI
  generic(
       TAM_END : INTEGER := 8;
       TAM_DADO : INTEGER := 16;
       tam_linha : INTEGER := 1+1+4*16;
       num_blocos : INTEGER := 16
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
       dadoOut : out STD_LOGIC_VECTOR(BP-1 downto 0);
       pronto : out STD_LOGIC
  );
end component;

---- Signal declarations used on the diagram ----

signal enable294 : STD_LOGIC;
signal enable36 : STD_LOGIC;
signal BUS150 : STD_LOGIC_VECTOR(7 downto 0);
signal BUS181 : STD_LOGIC_VECTOR(15 downto 0);

begin

----  Component instantiations  ----

U1 : CacheI
  port map(
       R => enable36,
       aldec_usn2slv8(endereco_outM) => BUS150( 7 downto 0 ),
       clk => Clock,
       data_in => BUS181(15 downto 0),
       data_out => data_out(15 downto 0),
       doneM => enable294,
       endereco_in => unsigned(endereco_in( 7 downto 0 ))
  );

U2 : Ram
  port map(
       Clock => Clock,
       dadoOut => BUS181(15 downto 0),
       enable => enable,
       ender => BUS150(7 downto 0),
       pronto => enable294,
       r => enable36,
       w => w
  );


end CacheIeRAM;
