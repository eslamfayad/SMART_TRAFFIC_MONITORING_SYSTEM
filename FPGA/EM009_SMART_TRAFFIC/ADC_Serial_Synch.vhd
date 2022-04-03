library ieee;
use ieee.std_logic_1164.all;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ADC_Serial_Synch is
  
port (
		 reset      : IN  STD_LOGIC;
		 clk		   : IN	STD_LOGIC;
		 Adc_0_iN   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Adc_1_iN   : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		 Tx_ADC_0   : inout STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		 Tx_ADC_1   : inout STD_LOGIC_VECTOR(7 DOWNTO 0) ;
		 uart_ready   : IN STD_LOGIC;
		 to_uart_valid : out STD_LOGIC;
		 uart_EN	   : out STD_LOGIC
		--clk_out	   : OUT	STD_LOGIC
		);
end;

architecture behavior of ADC_Serial_Synch is
  SIGNAL  Adc_0_S  : STD_LOGIC_VECTOR(15 DOWNTO 0);  --latest channel 0 data received
  SIGNAL  Adc_1_S  : STD_LOGIC_VECTOR(15 DOWNTO 0);  --latest channel 1 data received
  SIGNAL  flag        : STD_LOGIC:= '0' ;                      --enable for spi bus
 -- SIGNAL  spi_busy       : STD_LOGIC;                      --busy signal from spi bus
  
  
  BEGIN
  PROCESS(clk,reset)
    
  BEGIN
    
	if reset = '0' then
			flag <= '0';
	      --Tx_ADC_0 <= "00000000";
    elsIF(clk'EVENT AND clk = '1') THEN   --rising system clock edge
         IF(uart_ready = '0') THEN 
			    IF flag = '0' then												--serial transaction with ADC not in process
                Tx_ADC_0<= "11111111";-- Adc_0_S(15 DOWNTO 8);                             --50ns wait time met
                uart_EN <= '1';                       --enable next serial transaction to get data
					 to_uart_valid <= '1';
			       flag <= '1';
			    ElsIF flag = '1' then
			       uart_EN <= '0';
				    Tx_ADC_0<= "11110000";-- Adc_0_S(7 DOWNTO 0);
				    uart_EN <= '1';
					 to_uart_valid <= '1';
				    flag <= '0';
			    Else 
				    uart_EN <= '0';
				    to_uart_valid <= '0';
			       flag <= '0';
             END IF;
		  
				
         ELSE                                 --serial transaction with ADC in process
            -- Tx_ADC_0 <= Tx_ADC_0;                          --clear clock counter
             flag <= '0';                     --clear enable signal for next transaction
         END IF;
    END IF;
  END PROCESS;
Adc_0_S <= Adc_0_iN;

 
END behavior;