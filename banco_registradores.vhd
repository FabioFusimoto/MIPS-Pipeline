-------------------------------------------------------------------------------
--
-- Title       : banco_registradores
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\banco_registradores.vhd
-- Generated   : Sun Jun 30 11:40:26 2019
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
--{entity {banco_registradores} architecture {banco_registradores}}

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.math_real.all;

entity banco_registradores is
	 port(
		 Read_1 : in STD_LOGIC_VECTOR(4 downto 0);
		 Read_2 : in STD_LOGIC_VECTOR(4 downto 0);
		 registrador_escrita : in STD_LOGIC_VECTOR(4 downto 0);
		 dado_escrita : in STD_LOGIC_VECTOR(31 downto 0);
		 RegWrite : in STD_LOGIC;
		 CLK : in STD_LOGIC;
		 Reset : in STD_LOGIC;
		 Dado_1 : out STD_LOGIC_VECTOR(31 downto 0);
		 Dado_2 : out STD_LOGIC_VECTOR(31 downto 0)
	     );
end banco_registradores;

--}} End of automatically maintained section

architecture banco_registradores of banco_registradores is
	type reg is array(31 downto 0) of std_logic_vector(31 downto 0); -- banco de registradores 'falso'
	signal RegFile : reg := (others => x"00000000"); -- x"-----" indica notação hexa
begin
	-- enter your statements here --
	process(Read_1, Read_2, RegWrite, registrador_escrita, dado_escrita, Reset)
	begin
		if Reset <= '1' then
			RegFile(0) <= (others => '0');
			RegFile(1) <= (others => '0');
			RegFile(2) <= (others => '0');
			RegFile(3) <= (others => '0');
			RegFile(4) <= (others => '0');
			RegFile(5) <= (others => '0');
			RegFile(6) <= (others => '0');
			RegFile(7) <= (others => '0');
			RegFile(8) <= (others => '0');
			RegFile(9) <= (others => '0');
			RegFile(10) <= (others => '0');
			RegFile(11) <= (others => '0');
			RegFile(12) <= (others => '0');
			RegFile(13) <= (others => '0');
			RegFile(14) <= (others => '0');
			RegFile(15) <= (others => '0');
			RegFile(16) <= (others => '0');
			RegFile(17) <= (others => '0');
			RegFile(18) <= (others => '0');
			RegFile(19) <= (others => '0');
			RegFile(20) <= (others => '0');
			RegFile(21) <= (others => '0');
			RegFile(22) <= (others => '0');
			RegFile(23) <= (others => '0');
			RegFile(24) <= (others => '0');
			RegFile(25) <= (others => '0');
			RegFile(26) <= (others => '0');
			RegFile(27) <= (others => '0');
			RegFile(28) <= "00000000000000000000001000000000"; -- 28 é o registrador $gp
			RegFile(29) <= (others => '1'); -- 29 é o registrador $sp
			RegFile(30) <= "01111111111111111111111111111111"; -- 30 é o registrador $fp
			RegFile(31) <= (others => '0'); -- 31 é o registrador $ra
		elsif RegWrite = '0' then -- leitura
			Dado_1 <= RegFile(to_integer(unsigned(Read_1)));
			Dado_2 <= RegFile(to_integer(unsigned(Read_2)));
		else -- modo de leitura
			if(rising_edge(CLK)) then
			RegFile(to_integer(unsigned(registrador_escrita))) <= dado_escrita;	
			end if;
		end if;
	end process;
end banco_registradores;
