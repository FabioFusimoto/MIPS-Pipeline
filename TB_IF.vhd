library ieee;
use ieee.std_logic_1164.all;

entity TB_IF is
end TB_IF;

architecture TB of TB_IF is

	component Estagio_IF is
	  port(
	  	   CLK : in STD_LOGIC;
	  	   Reset : in STD_LOGIC;
	       Done_in : in STD_LOGIC;
	       Excecao : in STD_LOGIC;
	       IF_Flush : in STD_LOGIC := '0';
	       Inter : in STD_LOGIC;
	       ac_inter : in STD_LOGIC;
	       hazard_dados : in STD_LOGIC;
	       jump : in STD_LOGIC;
	       miss_cache_D : in STD_LOGIC;
	       Cte_4_Input : in STD_LOGIC_VECTOR(31 downto 0) := "00000000000000000000000000000100";
	       PC_excecao : in STD_LOGIC_VECTOR(31 downto 0);
	       PC_interrupcao : in STD_LOGIC_VECTOR(31 downto 0);
	       PC_jump : in STD_LOGIC_VECTOR(31 downto 0);
	       data_I : in STD_LOGIC_VECTOR(31 downto 0);
	       ID_EX_en : out STD_LOGIC;
	       R_I_out : out STD_LOGIC;
	       IF_ID_out : out STD_LOGIC_VECTOR(63 downto 0);
	       end_cache_I : out STD_LOGIC_VECTOR(31 downto 0)
	  );
	end component;
	
	-- sinais --
	signal CLK : std_logic;
	signal Reset : STD_LOGIC;
	signal Done_in : std_logic;
	signal Excecao : std_logic;
	signal IF_Flush: std_logic;
	signal Inter: std_logic;
	signal ac_inter: std_logic;
	signal hazard_dados: std_logic;
	signal jump: std_logic;
	signal miss_cache_D: std_logic;
	signal Cte_4_Input: std_logic_vector(31 downto 0);
	signal PC_excecao: std_logic_vector(31 downto 0);
	signal PC_interrupcao: std_logic_vector(31 downto 0);
	signal PC_jump: std_logic_vector(31 downto 0);
	signal data_I: std_logic_vector(31 downto 0);
	signal ID_EX_en : STD_LOGIC;
	signal R_I_out : STD_LOGIC;
	signal IF_ID_out : STD_LOGIC_VECTOR(63 downto 0);
	signal end_cache_I : STD_LOGIC_VECTOR(31 downto 0);

begin  
	dut : Estagio_IF
	port map(
		CLK => CLK,
		Reset => Reset,
		Done_in => Done_in,
		Excecao => Excecao,
		IF_Flush => IF_Flush,
		Inter => Inter,
		ac_inter => ac_inter,
		hazard_dados => hazard_dados,
		jump => jump,
		miss_cache_D => miss_cache_D,
		Cte_4_Input => Cte_4_Input,	 
		PC_excecao => PC_excecao,
		PC_interrupcao => PC_interrupcao,
		PC_jump => PC_jump,
		data_I => data_I,
		ID_EX_en => ID_EX_en,
		R_I_out => R_I_out,
		IF_ID_out => IF_ID_out,
		end_cache_I => end_cache_I);
	
	simulation : process
	begin
		-- Primeira operação --
		-- Desviar para o endereço 4 através de uma operação de jump
		
		Reset <= '1';
		wait for 2 ns;
		Reset<= '0';
		
		CLK <= '0';
		Done_in <= '1';
		Excecao <= '0';
		IF_Flush <= '0';
		Inter <= '0';
		ac_inter <= '1';
		hazard_dados <= '0';
		jump <= '1';
		miss_cache_D <= '0';
		Cte_4_Input <= "00000000000000000000000000000100";
		PC_excecao <= "00000000000000000000000000001000"; -- vamos supor que o endereço da exceção seja 1000 (8)
		PC_interrupcao <= "00000000000000000000000000000100"; -- vamos supor que o endereço da interrupcao seja 0100 (4)		 
		PC_jump <= "00000000000000000000000000001100"; -- vamos supor que o endereço de salto seja 1100 (C)
		data_I <= "00000000000000000000000000000000"; -- não importa muito esse valor agora
		
		wait for 2 ns;
		-- ciclo 1 --
		CLK <= '1';
		wait for 5 ns;
		
		CLK <= '0';
		wait for 5 ns;
		
		-- ciclo 2 --
		CLK <= '1';
		wait for 5 ns;
		
		CLK <= '0';
		wait for 2 ns;
		Excecao <= '1';
		wait for 3 ns;				
		
		-- ciclo 3 -- 
		CLK <= '1';
		wait for 5 ns;
		
		CLK <= '0';
		jump <= '0';
		Excecao <= '0';
		wait for 5 ns;
		
		-- ciclo 4 --
		CLK <= '1';
		wait for 5 ns;
		
		CLK <= '0';
		wait for 3 ns;
		miss_cache_D <= '1';
		wait for 2 ns;
		
		-- ciclo 5 -- 
		CLK <= '1';
		wait for 5 ns;
		miss_cache_D <= '0';
		hazard_dados <= '1';
		
		CLK <= '0';
		wait for 5 ns;
		
		-- ciclo 6 --
		CLK <= '1';
		wait for 2 ns;
		hazard_dados <= '0';
		wait for 3 ns;
		
		CLK <= '0';
		Inter <= '1';
		wait for 5 ns;
		
		-- ciclo 7 --
		CLK <= '1';
		wait for 5 ns;
		
		CLK <= '0';
		Inter <= '0';
		ac_inter <= '0';
		wait for 3 ns;
		Inter <= '1';
		wait for 2 ns;
		
		-- ciclo 8 --
		CLK	<= '1';
		wait for 5 ns;
		
		CLK <= '0';
		Inter <= '0';
		IF_Flush <= '1';
		wait for 5 ns;		
		
		-- ciclo 9 --
		CLK <= '1';
		wait for 5 ns;
		IF_Flush <= '0';
		
		CLK <= '0';
		wait for 5 ns;
		
		
		
		wait;
	end process;
end	TB;