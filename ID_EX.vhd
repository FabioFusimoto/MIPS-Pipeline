-------------------------------------------------------------------------------
--
-- Title       : ID_EX
-- Design      : MIPS_Pipeline
-- Author      : Fabio Fusimoto Pires
-- Company     : Poli-USP
--
-------------------------------------------------------------------------------
--
-- File        : c:\Users\fabio\Documents\USP - Aulas\7° Semestre\PCS3412 - Organização e Arquitetura de Computadores\MIPS_Pipeline\MIPS_pipeline\MIPS_Pipeline\src\ID_EX.vhd
-- Generated   : Mon Jul  1 09:56:47 2019
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
--{entity {ID_EX} architecture {ID_EX}}

library IEEE;
use IEEE.std_logic_1164.all;

entity ID_EX is
	 port(
		 cont_EX : in STD_LOGIC_VECTOR(3 downto 0);
		 cont_WB : in STD_LOGIC_VECTOR(2 downto 0);
		 end_desvio : in STD_LOGIC_VECTOR(31 downto 0);
		 PC_mais_4 : in STD_LOGIC_VECTOR(31 downto 0);
		 valor_reg_1 : in STD_LOGIC_VECTOR(31 downto 0);
		 valor_reg_2 : in STD_LOGIC_VECTOR(31 downto 0);
		 Rt : in STD_LOGIC_VECTOR(4 downto 0);
		 Rd : in STD_LOGIC_VECTOR(4 downto 0);
		 ID_EX_en : in STD_LOGIC;
		 Rs : in STD_LOGIC_VECTOR(4 downto 0);
		 cont_MEM : in STD_LOGIC_VECTOR(4 downto 0);
		 end_salto : in STD_LOGIC_VECTOR(25 downto 0);
		 imediato : in STD_LOGIC_VECTOR(31 downto 0);
		 CLK : in STD_LOGIC;
		 C_EX_O : out STD_LOGIC_VECTOR(3 downto 0);
		 C_MEM_O : out STD_LOGIC_VECTOR(4 downto 0);
		 C_WB_O : out STD_LOGIC_VECTOR(2 downto 0);
		 EX_MEM_en : out STD_LOGIC;
		 PC_4_O : out STD_LOGIC_VECTOR(31 downto 0);
		 end_desvio_o : out STD_LOGIC_VECTOR(31 downto 0);
		 r1_O : out STD_LOGIC_VECTOR(31 downto 0);
		 r2_O : out STD_LOGIC_VECTOR(31 downto 0);
		 Rt_O : out STD_LOGIC_VECTOR(4 downto 0);
		 Rd_O : out STD_LOGIC_VECTOR(4 downto 0);
		 Rs_O : out STD_LOGIC_VECTOR(4 downto 0);
		 imediato_O : out STD_LOgic_vector(31 downto 0);
		 end_salto_O : out STD_LOGIC_VECTOR(25 downto 0)
	     );
end ID_EX;

--}} End of automatically maintained section

architecture ID_EX of ID_EX is
begin
	EX_MEM_en <= ID_EX_en;
	process(CLK, ID_EX_En)
	begin
		if(ID_EX_En = '1' and rising_edge(CLK)) then
			PC_4_O <= PC_mais_4;
			end_desvio_o <= end_desvio;
			end_salto_O <= end_salto;
			C_EX_O <= cont_EX;
			C_MEM_O <= cont_MEM;
			C_WB_O <= cont_WB;
			r1_O <= valor_reg_1;
			r2_O <= valor_reg_2;
			Rs_O <= Rs;
			Rt_O <= Rt;
			Rd_O <= Rd;
			imediato_O <= imediato;
		end if;
	end process;

end ID_EX;
