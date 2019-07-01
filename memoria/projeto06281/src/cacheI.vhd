library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity cacheI is
	generic(
		TAM_END : integer := 14;
		TAM_DADO : integer := 32;
		tam_linha : integer := 1 + 2 + 16*32;	   
		num_blocos : integer := 256
		--tam_dado : integer := 32 -- qtde de bit que trazemos da memoria por vez
	);
	
	port(		 
		reset : in std_logic;	 
		endereco_in : in unsigned(TAM_END - 1 downto 0);
		data : in std_logic_vector(TAM_DADO - 1 downto 0);
		doneM : in std_logic;
		
		endereco_outM : out unsigned(TAM_END - 1 downto 0);
		R : out std_logic
	);
end cacheI;

--architecture comportamental of cacheI is	 
--type conj_cache is array (TAM_CONJ_CACHE - 1 downto 0) of std_logic_vector(LINHA_CACHE - 1 downto 0);  
 
--begin  

--	process(reset, endereco_in, data, doneM) is 
	--begin	
		--if(reset = '1') then
		--end if;
	--end process;
--end comportamental;