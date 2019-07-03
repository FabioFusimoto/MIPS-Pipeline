-------------------------------------------------------------------------------
--
-- Title       : CacheI
-- Design      : hierarquiaDeMemoria
-- Author      : Fernanda Parodi
-- Company     : USP
--
-------------------------------------------------------------------------------
--
-- File        : C:\Users\Fernanda\Documents\GitHub\MIPS-Pipeline\memoria\hierarquiaDeMemoria\hierarquiaDeMemoria\src\CacheI.vhd
-- Generated   : Tue Jul  2 23:37:44 2019
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
--{entity {CacheI} architecture {CacheI}}
library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity CacheI is
generic(
TAM_END : integer := 16;	 
TAM_DADO : integer := 32; 
tam_linha : integer := 1 + 2 + 16*32;   
num_blocos : integer := 256
);

port(	
endereco_in : in unsigned(TAM_END - 1 downto 0);
data_in : in std_logic_vector(TAM_DADO - 1 downto 0);
doneM : in std_logic;  
clk	: in std_logic;

blocoS : out std_logic_vector(tam_linha - 1 downto 0);
endereco_outM : out unsigned(TAM_END - 1 downto 0);	
data_out: out std_logic_vector(TAM_DADO - 1 downto 0); 
R : out std_logic
);
end CacheI;

architecture comportamental of CacheI is	 
 
type cache_instrucoes  is array (num_blocos - 1 downto 0) of std_logic_vector(tam_linha - 1 downto 0);
signal  cacheI : cache_instrucoes := ( others  => (others => '0')) ;	
signal end_bloco: unsigned(TAM_END - 1 downto 0);


begin  

process(endereco_in, data_in, doneM) is	
                       
variable block_offset : integer;
variable byte_offset : integer; 
variable bloco : std_logic_vector(tam_linha - 1 downto 0);


begin					

block_offset := 32 * conv_integer(endereco_in(5 downto 2));	
byte_offset := 8 * conv_integer(endereco_in(1 downto 0));
bloco := cacheI(conv_integer(endereco_in(13 downto 6)));	
blocoS <= bloco; 
if (unsigned(bloco(tam_linha - 2 downto tam_linha - 3)) = endereco_in(TAM_END - 1 downto TAM_END - 2)) and (bloco(tam_linha - 1) = '1') then	 
   -- hit e bit validade = 1 	
    --data_out <= "00000000000000000000000000000000";
	--data_out <= bloco(block_offset + byte_offset + 8 downto block_offset + byte_offset);
	R <= '0';  --nao acessa ram
        
    else -- miss (tags diferentes ou bit de validade igual a zero)
		data_out <= "11111111111111111111111111111111";
		end_bloco <= endereco_in(TAM_END - 1 downto TAM_END - 11)&"00000";	  -- todas as palavras de um bloco vem sempre juntas

-- acessa a memoria e escreve o bloco
for I in 0 to 15 loop
R <= '1';
endereco_outM <= end_bloco + I*4;
--if doneM = '1' then
bloco(I*32 + 31 downto I*32) := data_in;
--end if;
end loop;	

-- trocar o bit de validade por 1
bloco(tam_linha - 1) := '1'; 

-- escrever a tag
bloco(tam_linha - 2 downto tam_linha - 3) := std_logic_vector(endereco_in(TAM_END - 1 downto TAM_END - 2));

-- colocar o bloco no espaco do cache de index correspondente
cacheI(conv_integer(endereco_in(13 downto 6))) <= bloco;

-- no caso de miss, aguardamos novo acesso para enviar dados
            
end if;
                        


end process;  
  --
--	begin
--	--	if clk'event and clk = '0' then
--			endereco_outM <= endereco_in;
--			if doneM = '1' then
--				R <= '0'; 
--			end if;		   	
--	--	end if;					 
--	end process;
end comportamental;