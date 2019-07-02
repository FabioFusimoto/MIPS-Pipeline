library ieee;
use ieee.std_logic_1164.all;

entity TB_CACHEI is
end TB_CACHEI;

architecture TB of TB_CACHEI is

	component Fub1 is
	  port(
	  Clock : in std_logic;
	  Enable : in std_logic;
	  w : in std_logic;
	  reset : in std_logic;
	  enderecoIn : in std_logic_vector(31 downto 0) 
	  );
	end component;
	
	-- sinais --
	signal Clock : std_logic;
	signal Enable : std_logic;
	signal w : std_logic;
	signal reset : std_logic;
	signal enderecoIn : STD_LOGIC_VECTOR(31 downto 0);

begin  
	dut : Fub1
	port map(
		Clock => Clock,
		Enable => Enable,
		w => w,
		reset => reset,
		enderecoIn => enderecoIn);
	
	simulation : process
	begin
		Clock <= '0';
		Enable <= '1';
		w <= '0';
		reset <= '0';
		enderecoIn <= "00000000000000000000000000000000";
		
		wait for 2 ns;
		Clock <= '1';
		wait for 5 ns;
		
		Clock <= '0';
		wait for 5 ns;
			 
		wait;
	end process;
end	TB;