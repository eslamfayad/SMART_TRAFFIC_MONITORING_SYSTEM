library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter is
  GENERIC(
      slaves  : INTEGER := 1;   --number of spi slaves
		F : INTEGER := 5;
      N : INTEGER := 26);    --No of samples
port (
		 reset   : IN  STD_LOGIC;
		 clk		: IN	STD_LOGIC;
		 count   : out STD_LOGIC_VECTOR(23 DOWNTO 0);
		 Amp     : IN STD_LOGIC;
		 dac_busy : IN STD_LOGIC;
		 dac_en	: out STD_LOGIC;
		clk_out	: OUT	STD_LOGIC
		);
end;

architecture behv of Counter is
   type samples is array(1 to N) of integer;
   --type samples is array (1 to 16) of std_logic_vector(15 downto 0);  --Array of 15 samples (of 16bit data to dac)
 --  constant sine : samples:= (0,1304,7542,17634,29836,42038,52130,58368,59672,55817,47470,36073,23599,12202,3855 ); -- variable sine
 
  constant sine : samples:= (29808,
36976,
43729,
49676,
54471,
57838,
59581,
59599,
57891,
54557,
49788,
43863,
37122,
29959,
22786,
16021,
10054,
5231,
1832,
54,
0,
1672,
4974,
9715,
15621,
22347);
   signal count_i    : integer range 0 to 480000 := 0 ;
	signal sine_count  : integer range 1 to 100 := 1 ;
	signal  clk_out_s 	:   STD_LOGIC:='0';
	--SIGNAL 	QN		: 	STD_LOGIC_VECTOR(25 DOWNTO 0);	
	SIGNAL count_s 	: 	STD_LOGIC_VECTOR(15 DOWNTO 0):= (others => '0');
	SIGNAL dac_en_s   :   STD_LOGIC :='0' ;
	SIGNAL dac_busy_s   :   STD_LOGIC := '0' ;
	SIGNAL count_DAC	: 	STD_LOGIC_VECTOR(15 DOWNTO 0):= (others => '0');
   
BEGIN
											
		PROCESS (clk,reset)				-- *** COUNTER
		BEGIN
		
		if reset = '0' then
							count_i <= 0;
							count_s <= (others => '0');
							clk_out_s<= '0';
							--QN 	  <= (others => '0');
		
		ELSIF (clk'event AND clk='1') THEN
		
				if count_i = 480000 then
			  count_i <= 0;
			  else count_i <= count_i+1;
			end if; 
			
			
			
			
			
			if count_s < 24  then 	 --1 Mhz clock out
			        count_s <= count_s + 1;
					  --clk_out_s <= NOT clk_out_s;
		         
				else   
				   clk_out_s <= NOT clk_out_s;
					count_s <= "0000000000000000";
						
		   end if;
			
			
			
			
			if sine_count < (N+1) then
			
				if dac_busy_s = '0' then
						sine_count <= sine_count+1;
						dac_en_s <= '1';
						count_DAC<= conv_STD_Logic_Vector((sine(sine_count)),16);
						
						--dac_en_s <= '0';
				else  
						dac_en_s <= '0';
				end if;
						
			else  sine_count <= 1;
				
			end if;
			
			
			
			--The Working Test Counter for Dac Uncomment to generate Sawtooth test signal
		
--			if count_DAC < 60000 then
--			
--				if dac_busy_s = '0' then
--						count_DAC <= count_DAC+1;
--						dac_en_s <= '1';
--						--dac_en_s <= '0';
--				else  
--						dac_en_s <= '0';
--				end if;
--						
--			else  count_DAC <= "0000000000000000";
--				
--			end if;
		
		
		
		
		
		
		
		

			END IF;
				
				
		END PROCESS;			

		
						-- Result Output
	   dac_busy_s <= dac_busy;
		dac_en <= dac_en_s;
		
		clk_out <= clk_out_s;
		
		--count <= count_s;
		count <= "00110000" & count_DAC ;
		
		

end behv;