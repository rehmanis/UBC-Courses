-- Copyright (C) 2016  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Intel and sold by Intel or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "02/02/2017 21:10:30"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          binary_addsub_with_latch
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY binary_addsub_with_latch_vhd_vec_tst IS
END binary_addsub_with_latch_vhd_vec_tst;
ARCHITECTURE binary_addsub_with_latch_arch OF binary_addsub_with_latch_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL KEY0 : STD_LOGIC;
SIGNAL LED : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL SW9 : STD_LOGIC;
COMPONENT binary_addsub_with_latch
	PORT (
	KEY0 : IN STD_LOGIC;
	LED : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	SW9 : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : binary_addsub_with_latch
	PORT MAP (
-- list connections between master ports and signals
	KEY0 => KEY0,
	LED => LED,
	SW => SW,
	SW9 => SW9
	);

-- KEY0
t_prcs_KEY0: PROCESS
BEGIN
	KEY0 <= '0';
	WAIT FOR 380000 ps;
	KEY0 <= '1';
	WAIT FOR 20000 ps;
	KEY0 <= '0';
WAIT;
END PROCESS t_prcs_KEY0;
-- SW[7]
t_prcs_SW_7: PROCESS
BEGIN
	SW(7) <= '0';
WAIT;
END PROCESS t_prcs_SW_7;
-- SW[6]
t_prcs_SW_6: PROCESS
BEGIN
	SW(6) <= '0';
WAIT;
END PROCESS t_prcs_SW_6;
-- SW[5]
t_prcs_SW_5: PROCESS
BEGIN
	SW(5) <= '0';
WAIT;
END PROCESS t_prcs_SW_5;
-- SW[4]
t_prcs_SW_4: PROCESS
BEGIN
	SW(4) <= '0';
WAIT;
END PROCESS t_prcs_SW_4;
-- SW[3]
t_prcs_SW_3: PROCESS
BEGIN
	SW(3) <= '0';
WAIT;
END PROCESS t_prcs_SW_3;
-- SW[2]
t_prcs_SW_2: PROCESS
BEGIN
	SW(2) <= '0';
WAIT;
END PROCESS t_prcs_SW_2;
-- SW[1]
t_prcs_SW_1: PROCESS
BEGIN
	SW(1) <= '0';
WAIT;
END PROCESS t_prcs_SW_1;
-- SW[0]
t_prcs_SW_0: PROCESS
BEGIN
	SW(0) <= '1';
WAIT;
END PROCESS t_prcs_SW_0;

-- SW9
t_prcs_SW9: PROCESS
BEGIN
	SW9 <= '0';
WAIT;
END PROCESS t_prcs_SW9;
END binary_addsub_with_latch_arch;
