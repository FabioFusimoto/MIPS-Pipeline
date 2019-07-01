-------------------------------------------------------------------------------
--
-- Title       : No Title
-- Design      : projeto06281
-- Author      : julia.fernandes.moraes@usp.br
-- Company     : usp
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\projeto06281\compile\Fub2.vhd
-- Generated   : Mon Jul  1 13:53:30 2019
-- From        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\projeto06281\src\Fub2.bde
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

entity blocs is 
end blocs;

architecture blocs of blocs is

---- Component declarations -----

component cacheI
  generic(
       TAM_END : INTEGER := 14;
       TAM_DADO : INTEGER := 32;
       tam_linha : INTEGER := 1+2+16*32;
       num_blocos : INTEGER := 256
  );
  port (
       data : in STD_LOGIC_VECTOR(TAM_DADO-1 downto 0);
       doneM : in STD_LOGIC;
       endereco_in : in UNSIGNED(TAM_END-1 downto 0);
       reset : in STD_LOGIC;
       R : out STD_LOGIC;
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
       rw : in STD_LOGIC;
       pronto : out STD_LOGIC;
       dado : inout STD_LOGIC_VECTOR(BP-1 downto 0)
  );
end component;

----     Constants     -----
constant DANGLING_INPUT_CONSTANT : STD_LOGIC := 'Z';

---- Signal declarations used on the diagram ----

signal q041 : STD_LOGIC;
signal BUS30 : STD_LOGIC_VECTOR(7 downto 0);

---- Declaration for Dangling input ----
signal Dangling_Input_Signal : STD_LOGIC;

begin

----  Component instantiations  ----

U1 : Ram
  port map(
       Clock => Dangling_Input_Signal,
       dado => BUS30(7 downto 0),
       enable => Dangling_Input_Signal,
       pronto => q041,
       rw => Dangling_Input_Signal
  );

U2 : cacheI
  port map(
       data => BUS30(7 downto 0),
       doneM => q041,
       reset => Dangling_Input_Signal
  );


---- Dangling input signal assignment ----

Dangling_Input_Signal <= DANGLING_INPUT_CONSTANT;

end blocs;
