library ieee;
use ieee.std_logic_1164.all;

entity TB_ID is
end TB_ID;

architecture TB of TB_ID is

component Estagio_ID is
  port(
       CLK : in STD_LOGIC;
       EscreveReg : in STD_LOGIC;
       ID_EX_en : in STD_LOGIC;
       Overflow : in STD_LOGIC;
       Reset : in STD_LOGIC := '0';
       ID_EX_LeMem : in STD_LOGIC_VECTOR(5 downto 0);
       ID_EX_Rt : in STD_LOGIC_VECTOR(4 downto 0);
       IF_ID_in : in STD_LOGIC_VECTOR(63 downto 0);
       dados_reg : in STD_LOGIC_VECTOR(31 downto 0);
       num_reg : in STD_LOGIC_VECTOR(4 downto 0);
       EX_Flush : out STD_LOGIC;
       EX_MEM_en_O : out STD_LOGIC;
       IF_Flush : out STD_LOGIC;
       hazard_dados : out STD_LOGIC;
       C_EX_O : out STD_LOGIC_VECTOR(3 downto 0);
       C_MEM_O : out STD_LOGIC_VECTOR(4 downto 0);
       C_WB_O : out STD_LOGIC_VECTOR(2 downto 0);
       PC_4_O : out STD_LOGIC_VECTOR(31 downto 0);
       Rd_O : out STD_LOGIC_VECTOR(4 downto 0);
       Rs_O : out STD_LOGIC_VECTOR(4 downto 0);
       Rt_O : out STD_LOGIC_VECTOR(4 downto 0);
       end_desvio_o : out STD_LOGIC_VECTOR(31 downto 0);
       end_salto_O : out STD_LOGIC_VECTOR(25 downto 0);
       r1_O : out STD_LOGIC_VECTOR(31 downto 0);
       r2_O : out STD_LOGIC_VECTOR(31 downto 0);
	   imediato : out STD_LOGIC_VECTOR(31 downto 0) 
  );
end component;

-- sinais
signal CLK : STD_LOGIC;
signal EscreveReg : STD_LOGIC;
signal ID_EX_en : STD_LOGIC;
signal Overflow : STD_LOGIC;
signal Reset : STD_LOGIC := '0';
signal ID_EX_LeMem : STD_LOGIC_VECTOR(5 downto 0);
signal ID_EX_Rt : STD_LOGIC_VECTOR(4 downto 0);
signal IF_ID_in : STD_LOGIC_VECTOR(63 downto 0);
signal dados_reg : STD_LOGIC_VECTOR(31 downto 0);
signal num_reg : STD_LOGIC_VECTOR(4 downto 0);
signal EX_Flush : STD_LOGIC;
signal EX_MEM_en_O : STD_LOGIC;
signal IF_Flush : STD_LOGIC;
signal hazard_dados : STD_LOGIC;
signal C_EX_O : STD_LOGIC_VECTOR(3 downto 0);
signal C_MEM_O : STD_LOGIC_VECTOR(4 downto 0);
signal C_WB_O : STD_LOGIC_VECTOR(2 downto 0);
signal PC_4_O : STD_LOGIC_VECTOR(31 downto 0);
signal Rd_O : STD_LOGIC_VECTOR(4 downto 0);
signal Rs_O : STD_LOGIC_VECTOR(4 downto 0);
signal Rt_O : STD_LOGIC_VECTOR(4 downto 0);
signal end_desvio_o : STD_LOGIC_VECTOR(31 downto 0);
signal end_salto_O : STD_LOGIC_VECTOR(25 downto 0);
signal r1_O : STD_LOGIC_VECTOR(31 downto 0);
signal r2_O : STD_LOGIC_VECTOR(31 downto 0);
signal imediato : STD_LOGIC_VECTOR(31 downto 0);

begin
	dut : Estagio_ID
	port map(
		CLK => CLK,
		EscreveReg => EscreveReg,
		ID_EX_en => ID_EX_en,
		Overflow => Overflow,
		Reset => Reset,
		ID_EX_LeMem => ID_EX_LeMem,
		ID_EX_Rt => ID_EX_Rt,
		IF_ID_in => IF_ID_in,
		dados_reg => dados_reg,
		num_reg => num_reg,
		EX_Flush => EX_Flush,
		EX_MEM_en_O => EX_MEM_en_O,
		IF_Flush => IF_Flush,
		hazard_dados => hazard_dados,
		C_EX_O => C_EX_O,
		C_MEM_O => C_MEM_O,
		C_WB_O => C_WB_O,
		PC_4_O => PC_4_O,
		Rd_O => Rd_O,
		Rs_O => Rs_O,
		Rt_O => Rt_O,
		end_desvio_o => end_desvio_o,
		end_salto_O => end_salto_O,
		r1_O => r1_O,
		r2_O => r2_O,
		imediato => imediato
	);
	
	simulation : process
	begin
		-- Teste 1
		-- Inicialização mediante um reset
		CLK <= '0';
		EscreveReg <= '0';
		ID_EX_en <= '1';
		Overflow <= '0';
		Reset <= '1';		  
		ID_EX_LeMem <= "000000"; --opcode não é de leitura de memória
		ID_EX_Rt <= "00001"; -- acessando o registrador 1
--                  [opcode]     [Rs]	  [Rt]       [Rd]     [shamt]   [func]              [PC + 4]     	
		IF_ID_in <= "000000" & "10100" & "11111" & "00000" & "00000" & "000000" & "00000000000000000000000000000100";
		dados_reg <= (others => '0');
		num_reg <= "00001"; -- escrevendo no registrador 1
		EX_Flush <= '0';
		
		wait for 5 ns;
		
--		-- Teste 2 (Escrita de um registrador)
--		Reset <= '0';
--		EscreveReg <= '1';
--		num_reg <= "10100"; -- registrador $20
--		dados_reg <= "00000000111111110000000011111111";
--		wait for 5 ns;
--		CLK <= '1';
--		wait for 2 ns;
--		EscreveReg <= '0';
--		wait for 3 ns;
--		CLK <= '0';		
--		
--		wait for 3 ns;
----                  [opcode]     [Rs]	  [Rt]       [Rd]     [shamt]   [func]              [PC + 4]     	
--		IF_ID_in <= "000000" & "10100" & "11111" & "00000" & "00000" & "000000" & "00000000000000000000000000000100";
--		wait for 2 ns;
--		CLK <= '1';
--		wait for 5 ns;
--		CLK <= '0';		
--		wait for 5 ns;
--		wait ; 
		
--		-- Teste 3 (Sinais de controle)
----                  [opcode]     [Rs]	  [Rt]       [Rd]     [shamt]   [func]              [PC + 4] 
--		IF_ID_in <= "000011" & "10100" & "11111" & "00000" & "00000" & "000000" & "00000000000000000000000000000100";
--		wait for 5 ns;
--		wait;

--		-- Teste 4 (Unidade de detecção de hazard)
		
----                  [opcode]     [Rs]	  [Rt]       [Rd]     [shamt]   [func]              [PC + 4]     	
----		IF_ID_in <= "000000" & "10100" & "11111" & "00000" & "00000" & "000000" & "00000000000000000000000000000100";
--		ID_EX_Rt <= "11111";	
--		ID_EX_LeMem <= "100011";
--		wait for 5 ns;
--		wait;

----                  [opcode]   [-------- Endereço de desvio -------]              [PC + 4]
--		IF_ID_in <= "000011" & "00001" & "00001" & "0000000000000000" & "00000000000000000000000000000100";
--		ID_EX_Rt <= "00001";	
--		ID_EX_LeMem <= "100011";
--		wait for 5 ns;
--		wait;
		
		-- Teste 5 (Propagação de sinais de controle)
--                  [opcode]     [Rs]      [Rt]      [Rd]    [shamt]    [func]               [PC + 4] 
--		IF_ID_in <= "000000" & "00010" & "00011" & "00001" & "00000" & "100000" & "00000000000000000000000000000100"; -- jal 3*4
--		CLK <= '1';
--		wait for 5 ns;
--		CLK <= '0';
--		wait for 5 ns;
--		CLK <= '1';
--		ID_EX_Rt <= "00010";
--		ID_EX_LeMem <= "100011";
--		wait for 5 ns;
--		CLK <= '0';
--		wait for 5 ns;
--		CLK <= '1';
--		wait for 5 ns;
--		ID_EX_Rt <= "00000";
--		ID_EX_LeMem <= "000000";
--		Overflow <= '1';
--		CLK <= '0';
--		wait for 5 ns;
--		CLK <= '1';
--		wait for 5 ns;
--		Overflow <= '0';
--		CLK <= '0';
--		wait for 5 ns;
--		CLK <= '1';
--		wait for 5 ns;
--		CLK <= '0';
--		wait;
	
		-- Teste 6 (Unidade de cálculo de endereço de desvio)
--                  [opcode]     [Rs]	  [Rt]           [offset]       [---------PC + 4----------------]     	
		IF_ID_in <= "000100" & "00001" & "00010" & "1010101111001101" & "00000000000000000001001000110100";							 
		CLK <= '1';
		wait for 5 ns;
		CLK <= '0';
		wait for 5 ns;
		wait;
	
	end process;
	
end TB;