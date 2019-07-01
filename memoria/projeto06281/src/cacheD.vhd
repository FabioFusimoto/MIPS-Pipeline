library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;

entity cacheD is
	generic(
	tam_end : integer := 16;	  	 
	num_conjuntos : integer := 128;
	tam_linha: integer := 1 + 1 + 1 + 3 + 16*32;
	tam_dado: integer := 32; -- qtde de bit que trazemos da memoria por vez
	);
	
	port(		 
	reset : in std_logic;	 
	dataM : in std_logic_vector(tam_dado - 1 down to 0);
	endereco_in : in unsigned(tam_end - 1 down to 0);
	dataW : in std_logic_vector(tam_dado - 1 down to 0);
	rw : in std_logic;	  
	doneB : in std_logic;
	doneM : in std_logic;
	
	dataO : out std_logic_vector(tam_dado - 1 down to 0); --qual eh o tamanho do dado de saida? podemos deixar uma palavra talvez
	endereco_outM : out unsigned(tam_end - 1 down to 0);
	R : out std_logic;
	W : out std_logic;
	
	dataB : out std_logic_vector(tam_dado - 1 down to 0); --qual eh o tamanho do dado de saida? podemos deixar uma palavra talvez
	endereco_outB : out unsigned(tam_end - 1 down to 0);
	
	);
end cacheD;