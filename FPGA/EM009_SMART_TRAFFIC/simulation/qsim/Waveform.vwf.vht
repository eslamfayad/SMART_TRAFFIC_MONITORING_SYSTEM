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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "03/12/2022 13:59:05"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Eslam_First_Fpga
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Eslam_First_Fpga_vhd_vec_tst IS
END Eslam_First_Fpga_vhd_vec_tst;
ARCHITECTURE Eslam_First_Fpga_arch OF Eslam_First_Fpga_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL cs : STD_LOGIC;
SIGNAL FPGA_CLK1_50 : STD_LOGIC;
SIGNAL KEY : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL Ldac : STD_LOGIC;
SIGNAL LED : STD_LOGIC_VECTOR(2 DOWNTO 1);
SIGNAL mosi : STD_LOGIC;
SIGNAL sck : STD_LOGIC;
COMPONENT Eslam_First_Fpga
	PORT (
	cs : OUT STD_LOGIC;
	FPGA_CLK1_50 : IN STD_LOGIC;
	KEY : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	Ldac : OUT STD_LOGIC;
	LED : OUT STD_LOGIC_VECTOR(2 DOWNTO 1);
	mosi : OUT STD_LOGIC;
	sck : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Eslam_First_Fpga
	PORT MAP (
-- list connections between master ports and signals
	cs => cs,
	FPGA_CLK1_50 => FPGA_CLK1_50,
	KEY => KEY,
	Ldac => Ldac,
	LED => LED,
	mosi => mosi,
	sck => sck
	);

-- FPGA_CLK1_50
t_prcs_FPGA_CLK1_50: PROCESS
BEGIN
	FOR i IN 1 TO 67
	LOOP
		FPGA_CLK1_50 <= '0';
		WAIT FOR 5000 ps;
		FPGA_CLK1_50 <= '1';
		WAIT FOR 5000 ps;
	END LOOP;
	FPGA_CLK1_50 <= '0';
	WAIT FOR 5000 ps;
	FPGA_CLK1_50 <= '1';
	WAIT FOR 5000 ps;
	FOR i IN 1 TO 31
	LOOP
		FPGA_CLK1_50 <= '0';
		WAIT FOR 5000 ps;
		FPGA_CLK1_50 <= '1';
		WAIT FOR 5000 ps;
	END LOOP;
	FPGA_CLK1_50 <= '0';
WAIT;
END PROCESS t_prcs_FPGA_CLK1_50;

-- KEY
t_prcs_KEY: PROCESS
BEGIN
	KEY <= '0';
WAIT;
END PROCESS t_prcs_KEY;

-- KEY[0]
t_prcs_KEY_0: PROCESS
BEGIN
	KEY(0) <= '1';
WAIT;
END PROCESS t_prcs_KEY_0;
END Eslam_First_Fpga_arch;
