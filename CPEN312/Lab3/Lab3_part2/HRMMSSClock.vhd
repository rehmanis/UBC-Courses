LIBRARY ieee;
USE IEEE.STD_LOGIC_1164.all;
USE IEEE.STD_LOGIC_ARITH.all;
USE IEEE.STD_LOGIC_UNSIGNED.all;

ENTITY HRMMSSClock IS
	port(
	
	KEY0, KEY1,KEY2,KEY3,SW9, CLK_50 :IN STD_LOGIC;
	SW :IN STD_LOGIC_VECTOR (7 downto 0);
	MSD_SS, LSD_SS :OUT STD_LOGIC_VECTOR (0 to 6);
	MSD_MM, LSD_MM :OUT STD_LOGIC_VECTOR (0 to 6);
	MSD_HH, LSD_HH :OUT STD_LOGIC_VECTOR (0 to 6)
	
	);
END HRMMSSClock;
ARCHITECTURE a of HRMMSSClock is

	SIGNAL ClkFlag: STD_LOGIC := '1';
	SIGNAL startUp: STD_LOGIC;
	SIGNAL Internal_Count: STD_LOGIC_VECTOR(28 downto 0);
	SIGNAL HighDigit_S, LowDigit_S: STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL HighDigit_M, LowDigit_M: STD_LOGIC_VECTOR(3 downto 0);
	SIGNAL HighDigit_H, LowDigit_H: STD_LOGIC_VECTOR(3 downto 0);

	COMPONENT BCDto7seg
		port
		(
			-- Input ports
			BCD	: in  STD_LOGIC_VECTOR (3 downto 0);
			-- Output ports
			DISPLAY	: out STD_LOGIC_VECTOR(0 to 6)
		);
	END COMPONENT ;

	
BEGIN

	PROCESS(CLK_50)
	BEGIN
	
	if (rising_edge(CLK_50)) then
		startUp <= '0';
		
		
	end if;
	
	END PROCESS;

	PROCESS(CLK_50)
	BEGIN
	
	-- if rising edge of the clock
		if(CLK_50'event and CLK_50='1') then
			if Internal_Count<25000000 then
				Internal_Count<=Internal_Count+1;
			else
				Internal_Count<=(others => '0');
				ClkFlag<=not ClkFlag;
			end if;
		end if;
		
	END PROCESS;
	
	PROCESS(ClkFlag, KEY0, KEY1, KEY2,KEY3, SW9, SW)
	BEGIN
	
-- reset the clock if KEY0 is pressed
		if(KEY0='0' OR startUp = '1') then 
		
			LowDigit_S<="0000";
			HighDigit_S<="0000";
			
			LowDigit_M<="0000";
			HighDigit_M<="0000";
			
			LowDigit_H<="0001";
			HighDigit_H<="0000";
		
-- if SW9 is OFF, allow user to set the clock using SW7-SW0 as desired
		elsif (SW9 = '0') then
			
			--set the seconds of the clock
			if (KEY1 = '0') then
				LowDigit_S <= SW(3 downto 0);
				HighDigit_S <= SW(7 downto 4);
				
			--set the minutes of the clock
			elsif (KEY2 = '0') then
				LowDigit_M <= SW(3 downto 0);
				HighDigit_M <= SW(7 downto 4);

			--set the hours of the clock
			elsif (KEY3 = '0') then
				LowDigit_H <= SW(3 downto 0);
				HighDigit_H <= SW(7 downto 4);

			end if;
			
-- Start the clock when SW9 is ON
			
		elsif	(SW9 = '1') then
				
			if(ClkFlag'event and ClkFlag='1') then
			
			-- if seconds LSD is 9
				if (LowDigit_S=9) then
				
				-- set the seconds LSD to 0
					LowDigit_S<="0000";
					
					-- if seconds LSD is 9 and MSD is 5 (seconds counter reads 59 sec )
					if (HighDigit_S=5) then
					
					--set the seconds MSD to 0
						HighDigit_S<="0000";
						
						
						-- if seconds counter reaches 59 and minutes counter reached 9
						if (LowDigit_M = 9) then
						
						-- set the minutes LSD to 0
							LowDigit_M<="0000";
						
						-- if seconds counter reaches 59 and minutes counter reaches 59
							if (HighDigit_M = 5) then
							
							--set minutes MSD to 0
								HighDigit_M <= "0000";
								
								-- if seconds counter and minutes counter are both at 59 and hour MSD is 1 (i.e 1H:59:59)
								if (HighDigit_H = 1) then
									
									--if the clock reads 12:59:59
									if (LowDigit_H = 2) then
										
										-- set hours to 01 i.e 1 o'clock
										LowDigit_H <= "0001";
										HighDigit_H <= "0000";
										
									-- else increment hours by 1 (eg. 11:59:59 -> 12:00:00)	
									else lowDigit_H <= LowDigit_H + '1';
										
									end if;
									
								-- else if hours counter's MSD reads 0
								else
								
									-- if hours LSD reads 9  
									if (LowDigit_H=9) then
									
									-- set the hours LSD to 0 and MSD 1
										LowDigit_H<="0000";
										HighDigit_H <= HighDigit_H + '1';
									
									-- else increment the hour by 1
									else
									
										LowDigit_H <= LowDigit_H + '1';
										
									end if;
								
								end if;
								
							-- else seconds counter reaches 59 and minutes counter LSD is 9 but MSD is not 5
							-- increment minutes counter MSD by 1. (eg clock was 01:49:59 -> 01:50:00)
							-- minutes counter LSD was set to 0 earlier
							else HighDigit_M<=HighDigit_M+'1';
							end if;
							
						-- else seconds counter reaches 59 and minutes conuter LSD is any number other than 9.
						-- incremant minutes counter LSD by 1
						else 
							LowDigit_M<=LowDigit_M+1;
						end if;	
						
					-- else seconds counter LSD is 9 but MSD is not 5
					-- increment seconds counter MSD by 1
					else HighDigit_S<=HighDigit_S+'1';
					
					end if;
					
				-- else seconds counter LSD is not 9
				-- increment seconds counter LSD by 1
				else
					LowDigit_S<=LowDigit_S+'1';
				end if;
			end if;
		end if;
	END PROCESS;
	
	-- display seconds, minutes, hours digits on the HEX display using BCDto7seg.vhd file added to the project
	secondOnes: BCDto7seg PORT MAP ( LowDigit_S, LSD_SS) ;
	secondTens: BCDto7seg PORT MAP ( HighDigit_S, MSD_SS) ;
	minuteOnes: BCDto7seg PORT MAP ( LowDigit_M, LSD_MM) ;
	minuteTens: BCDto7seg PORT MAP ( HighDigit_M, MSD_MM) ;
	HourOnes: BCDto7seg PORT MAP ( LowDigit_H, LSD_HH) ;
	HourTens: BCDto7seg PORT MAP ( HighDigit_H, MSD_HH) ;

	
end a;
