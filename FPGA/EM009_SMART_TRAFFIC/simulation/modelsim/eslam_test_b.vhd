LIBRARY ieee  ; 
LIBRARY std  ; 
USE ieee.std_logic_1164.all  ; 
USE ieee.std_logic_arith.all  ; 
use ieee.numeric_std.all;
USE ieee.std_logic_textio.all  ; 
USE ieee.STD_LOGIC_UNSIGNED.all  ; 
USE ieee.std_logic_unsigned.all  ; 
USE std.textio.all  ; 
ENTITY eslam_test_b  IS 
  GENERIC (
    N  : INTEGER   := 26 ;  
    F  : INTEGER   := 5 ;  
    slaves  : INTEGER   := 1 ); 
END ; 

 
ARCHITECTURE eslam_test_b_arch OF eslam_test_b IS

  
  
  COMPONENT Eslam_First_Fpga  
    GENERIC ( 
      N  : INTEGER ; 
      F  : INTEGER ; 
      slaves  : INTEGER  );  
    PORT ( 
		FPGA_CLK1_50 :  IN  STD_LOGIC;
		Ldac :  OUT  STD_LOGIC;
		KEY :  IN  STD_LOGIC_VECTOR(0 TO 0);
		mosi :  OUT  STD_LOGIC;
		sck :  OUT  STD_LOGIC;
		cs :  OUT  STD_LOGIC;
		LED :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 1));
      
  END COMPONENT ;
 
  SIGNAL  FPGA_CLK1_50 :   STD_LOGIC;
  SIGNAL  Ldac :    STD_LOGIC;
  SIGNAL  KEY :    STD_LOGIC_VECTOR(0 TO 0);
  SIGNAL mosi :    STD_LOGIC;
  SIGNAL sck :    STD_LOGIC;
  SIGNAL  cs :    STD_LOGIC;
  SIGNAL LED :    STD_LOGIC_VECTOR(2 DOWNTO 1);


 constant clk_period : time := 20ns;



 
BEGIN
  DUT  : Eslam_First_Fpga  
    GENERIC MAP ( 
      N  => N  ,
      F  => F  ,
      slaves  => slaves   )
    PORT MAP ( 
      FPGA_CLK1_50   => FPGA_CLK1_50  ,
      Ldac   => Ldac  ,
      KEY   => KEY  ,
      mosi   => mosi  ,
      sck   => sck  ,
      cs   => cs  ,
      LED   => LED   ) ; 


		
		
		




-- "Clock Pattern" : dutyCycle = 50
-- Start Time = 0 ns, End Time = 1 us, Period = 20 ns
  clk_process :Process
	Begin
	 FPGA_CLK1_50  <= '0'  ;
	wait for 10 ns;
-- 10 ns, single loop till start period.

	 FPGA_CLK1_50  <= '1'  ;
	   wait for 10 ns ;
 End Process;
 
 
 -- "Constant Pattern"
-- Start Time = 0 ns, End Time = 1 us, Period = 0 ns
  tb :process
	Begin
	 KEY  <= "0"  ;
	wait for 10 ns ;
-- dumped values till 1 us
   KEY  <= "1"  ;
	wait;
 End Process;
END;
