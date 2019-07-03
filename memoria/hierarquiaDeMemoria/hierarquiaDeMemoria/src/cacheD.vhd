library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity CacheD is
	generic(
		TAM_END : integer := 8;	  -- mudar para 16
		TAM_DADO : integer := 16; -- mudar para 32
		tam_linha : integer := 1 + 1 + 4*16;	--mudar para 1 + 2 + 16*32   
		num_blocos : integer := 16 --mudar para 256
	);
	
	port(		 
		endereco_in : in unsigned(TAM_END - 1 downto 0);
		data_in : in std_logic_vector(TAM_DADO - 1 downto 0);
		doneM : in std_logic;  
		clk		: in	std_logic;
		
		endereco_outM : out unsigned(TAM_END - 1 downto 0);	
		data_out: out std_logic_vector(TAM_DADO - 1 downto 0); 
		R : out std_logic
	);
end CacheD;

architecture comportamental of CacheD is	 															  


--type conj_cache is array (TAM_CONJ_CACHE - 1 downto 0) of std_logic_vector(LINHA_CACHE - 1 downto 0);  
type 	cache_instrucoes  is array (0 to num_blocos - 1) of std_logic_vector(tam_linha - 1 downto 0);
signal  cacheD : cache_instrucoes := ( others  => (others => '0')) ;


begin  
	
	process(endereco_in, data_in, doneM) is
 
	begin
	--	if clk'event and clk = '0' then
			endereco_outM <= endereco_in;
			R <= '1';
			if doneM = '1' then
				data_out <= data_in;
				R <= '0';
			end if;
	--	end if;					 
	end process;
end comportamental;