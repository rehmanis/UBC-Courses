library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity binary_addsub is



	port
	(
		-- Input ports
		a,b		: in  std_logic_vector(7 downto 0);
		sub		: in  std_logic; -- 1 to subtract
		carry_in : in	std_logic;
		

		-- Output ports
		sum		: out std_logic_vector(7 downto 0);
		carry		: out std_logic
	);
end binary_addsub;


-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture a of binary_addsub is

	-- Declarations (optional)
		signal sum_temp : std_logic_vector(8 downto 0);
		signal b_temp : std_logic_vector(8 downto 0);
		
begin
		
		process (b, sub) is
		
		begin
		
			if sub = '1' then
				b_temp <= ('0' & NOT(b));
			else
				b_temp <= ('0' & b);
			
			end if;
			
		end process;


	-- Process Statement (optional)
		process (a, b_temp, sum_temp, carry_in)
		
		begin
		
			sum_temp <= ('0' & a) + b_temp + ("0000" & carry_in);
			carry <= sum_temp(8);
			sum <= sum_temp(7 downto 0);
		
			
		end process; 

	-- Concurrent Procedure Call (optional)

	-- Concurrent Signal Assignment (optional)

	-- Conditional Signal Assignment (optional)

	-- Selected Signal Assignment (optional)

	-- Component Instantiation Statement (optional)

	-- Generate Statement (optional)

end a;
