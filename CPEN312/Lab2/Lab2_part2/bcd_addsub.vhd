library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity bcd_addsub is
	port (
	-- INPUTS
		a,b 		: in std_logic_vector(3 downto 0);
		sub 		: in std_logic; -- 1 to subtract
		carry_in : in std_logic;
	-- OUTPUT	
		sum 		: out std_logic_vector(3 downto 0);
		carry 	: out std_logic
	);
	
end bcd_addsub;

architecture a of bcd_addsub is

	signal sum_temp : std_logic_vector(4 downto 0);
	signal sum_temp_adjs : std_logic_vector(4 downto 0);
	signal b_temp : std_logic_vector(4 downto 0);

begin

process (b, sub) is
begin
	if sub = '1' then
		case b is
			when "0000" => b_temp<="01001";
			when "0001" => b_temp<="01000";
			when "0010" => b_temp<="00111";
			when "0011" => b_temp<="00110";
			when "0100" => b_temp<="00101";
			when "0101" => b_temp<="00100";
			when "0110" => b_temp<="00011";
			when "0111" => b_temp<="00010";
			when "1000" => b_temp<="00001";
			when "1001" => b_temp<="00000";
			when others => b_temp<="00000";
		end case;
	else
	b_temp <= ('0' & b);
	end if;
	
end process;


process (a, b_temp, sum_temp, carry_in, sum_temp_adjs)
begin

	sum_temp <= ('0' & a) + b_temp + ("0000" & carry_in);
	sum_temp_adjs <= sum_temp + "00110";
	
	if (sum_temp > 9) then
	
	carry <= '1';
	sum <= sum_temp_adjs(3 downto 0);
	
	else
	carry <= '0';
	sum <= sum_temp(3 downto 0);
	
	end if;
	
	--if sub = '1' then
		--carry <= NOT carry;
	
	end process;
	
end a;