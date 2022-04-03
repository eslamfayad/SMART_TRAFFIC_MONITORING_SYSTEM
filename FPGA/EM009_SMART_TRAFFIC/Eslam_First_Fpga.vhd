-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition"
-- CREATED		"Mon Mar 14 13:50:58 2022"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Eslam_First_Fpga IS 
	PORT
	(
		FPGA_CLK1_50 :  IN  STD_LOGIC;
		KEY :  IN  STD_LOGIC_VECTOR(0 TO 0);
		Ldac :  OUT  STD_LOGIC;
		mosi :  OUT  STD_LOGIC;
		sck :  OUT  STD_LOGIC;
		cs :  OUT  STD_LOGIC;
		LED :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 1)
	);
END Eslam_First_Fpga;

ARCHITECTURE bdf_type OF Eslam_First_Fpga IS 

COMPONENT counter
GENERIC (F : INTEGER;
			N : INTEGER;
			slaves : INTEGER
			);
	PORT(reset : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 Amp : IN STD_LOGIC;
		 dac_busy : IN STD_LOGIC;
		 dac_en : OUT STD_LOGIC;
		 clk_out : OUT STD_LOGIC;
		 count : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
	);
END COMPONENT;

COMPONENT pmod_dac_ad5541a
GENERIC (clk_freq : INTEGER;
			spi_clk_div : INTEGER
			);
	PORT(clk : IN STD_LOGIC;
		 reset_n : IN STD_LOGIC;
		 dac_tx_ena : IN STD_LOGIC;
		 update_output_n : IN STD_LOGIC;
		 dac_data : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
		 busy : OUT STD_LOGIC;
		 ldac_n : OUT STD_LOGIC;
		 mosi : OUT STD_LOGIC;
		 sclk : OUT STD_LOGIC;
		 ss_n : OUT STD_LOGIC_VECTOR(0 TO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(23 DOWNTO 0);


BEGIN 
LED(2) <= '0';



b2v_inst : counter
GENERIC MAP(F => 5,
			N => 26,
			slaves => 1
			)
PORT MAP(reset => KEY(0),
		 clk => FPGA_CLK1_50,
		 dac_busy => SYNTHESIZED_WIRE_0,
		 dac_en => SYNTHESIZED_WIRE_1,
		 clk_out => SYNTHESIZED_WIRE_2,
		 count => SYNTHESIZED_WIRE_3);



b2v_inst3 : pmod_dac_ad5541a
GENERIC MAP(clk_freq => 50,
			spi_clk_div => 2
			)
PORT MAP(clk => FPGA_CLK1_50,
		 reset_n => KEY(0),
		 dac_tx_ena => SYNTHESIZED_WIRE_1,
		 update_output_n => SYNTHESIZED_WIRE_2,
		 dac_data => SYNTHESIZED_WIRE_3,
		 busy => SYNTHESIZED_WIRE_0,
		 ldac_n => Ldac,
		 mosi => mosi,
		 sclk => sck,
		 ss_n(0) => cs);


LED(1) <= NOT(KEY);




END bdf_type;