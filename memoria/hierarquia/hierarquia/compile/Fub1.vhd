-------------------------------------------------------------------------------
--
-- Title       : 
-- Design      : hierarquia
-- Author      : 
-- Company     : 
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquia\hierarquia\compile\Fub1.vhd
-- Generated   : Tue Jul  2 09:07:25 2019
-- From        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquia\hierarquia\src\Fub1.bde
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

entity Fub1 is
  port(
       Clock : in STD_LOGIC;
       Enable : in STD_LOGIC;
       reset : in STD_LOGIC;
       w : in STD_LOGIC;
       enderecoIn : in STD_LOGIC_VECTOR(7 downto 0);
       data_out : out STD_LOGIC_VECTOR(15 downto 0)
  );
end Fub1;

architecture Fub1 of Fub1 is

function aldec_usn2slv32 (val:unsigned) return std_logic_vector is
begin
return conv_std_logic_vector(val,32);
end aldec_usn2slv32;

---- Component declarations -----

component cacheI2
  generic(
       TAM_END : INTEGER := 14;
       TAM_DADO : INTEGER := 32;
       tam_linha : INTEGER := 1+2+16*32;
       num_blocos : INTEGER := 256
  );
  port (
       data_in : in STD_LOGIC_VECTOR(TAM_DADO-1 downto 0);
       doneM : in STD_LOGIC;
       endereco_in : in UNSIGNED(TAM_END-1 downto 0);
       reset : in STD_LOGIC;
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
       pronto : out STD_LOGIC;
       dado : inout STD_LOGIC_VECTOR(BP-1 downto 0)
  );
end component;

---- Signal declarations used on the diagram ----

signal done : STD_LOGIC;
signal r : STD_LOGIC;
signal dado : STD_LOGIC_VECTOR(15 downto 0);
signal endereco : STD_LOGIC_VECTOR(31 downto 0);

begin

----  Component instantiations  ----

U11 : cacheI2
  port map(
       R => r,
       aldec_usn2slv32(endereco_outM) => endereco( 31 downto 0 ),
       data_in => dado(15 downto 0),
       data_out => data_out(15 downto 0),
       doneM => done,
       endereco_in => unsigned(enderecoIn( 7 downto 0 )),
       reset => reset
  );

U2 : Ram
  port map(
       Clock => Clock,
       dado => dado(15 downto 0),
       enable => Enable,
       ender => endereco(31 downto 0),
       pronto => done,
       r => r,
       w => w
  );


end Fub1;
