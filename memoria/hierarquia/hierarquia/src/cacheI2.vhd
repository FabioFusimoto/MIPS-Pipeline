library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity cacheI2 is
	generic(
		TAM_END : integer := 8;
		TAM_DADO : integer := 32;
		tam_linha : integer := 1 + 2 + 16*32;	   
		num_blocos : integer := 256
	);
	
	port(		 
		reset : in std_logic;	 
		endereco_in : in unsigned(TAM_END - 1 downto 0);
		data_in : in std_logic_vector(TAM_DADO - 1 downto 0);
		doneM : in std_logic;
		
		endereco_outM : out unsigned(TAM_END - 1 downto 0);	
		data_out: out std_logic_vector(TAM_DADO - 1 downto 0); 
		R : out std_logic
	);
end cacheI2;

architecture comportamental of cacheI2 is	 
--type conj_cache is array (TAM_CONJ_CACHE - 1 downto 0) of std_logic_vector(LINHA_CACHE - 1 downto 0);  
 
begin  
	R <= '1';
	process(reset, endereco_in, data_in, doneM) is 
	begin	
		--if(reset = '1') then
		--end if;
	data_out <= data_in;  
	endereco_outM <= endereco_in;
	end process;
end comportamental;