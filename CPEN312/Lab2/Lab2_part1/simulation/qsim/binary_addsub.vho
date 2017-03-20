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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 16.1.0 Build 196 10/24/2016 SJ Lite Edition"

-- DATE "02/02/2017 21:10:32"

-- 
-- Device: Altera 5CEBA4F23C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	binary_addsub_with_latch IS
    PORT (
	LED : OUT std_logic_vector(7 DOWNTO 0);
	SW9 : IN std_logic;
	KEY0 : IN std_logic;
	SW : IN std_logic_vector(7 DOWNTO 0)
	);
END binary_addsub_with_latch;

-- Design Ports Information
-- LED[7]	=>  Location: PIN_U1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[6]	=>  Location: PIN_U2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[5]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[4]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[3]	=>  Location: PIN_Y3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[2]	=>  Location: PIN_W2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[1]	=>  Location: PIN_AA1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LED[0]	=>  Location: PIN_AA2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW9	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[4]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_V13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_U13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY0	=>  Location: PIN_U7,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF binary_addsub_with_latch IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LED : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_SW9 : std_logic;
SIGNAL ww_KEY0 : std_logic;
SIGNAL ww_SW : std_logic_vector(7 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \SW9~input_o\ : std_logic;
SIGNAL \KEY0~input_o\ : std_logic;
SIGNAL \KEY0~inputCLKENA0_outclk\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \inst1|20~q\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \inst1|19~q\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \inst1|18~q\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \inst1|17~q\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \inst1|16~q\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \inst1|15~q\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \inst1|14~q\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \inst1|13~q\ : std_logic;
SIGNAL \inst|_~22\ : std_logic;
SIGNAL \inst|_~23\ : std_logic;
SIGNAL \inst|_~19\ : std_logic;
SIGNAL \inst|_~20\ : std_logic;
SIGNAL \inst|_~16\ : std_logic;
SIGNAL \inst|_~17\ : std_logic;
SIGNAL \inst|_~13\ : std_logic;
SIGNAL \inst|_~14\ : std_logic;
SIGNAL \inst|_~10\ : std_logic;
SIGNAL \inst|_~11\ : std_logic;
SIGNAL \inst|_~7\ : std_logic;
SIGNAL \inst|_~8\ : std_logic;
SIGNAL \inst|_~4\ : std_logic;
SIGNAL \inst|_~5\ : std_logic;
SIGNAL \inst|sum\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_SW9~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \inst1|ALT_INV_20~q\ : std_logic;
SIGNAL \inst1|ALT_INV_18~q\ : std_logic;
SIGNAL \inst1|ALT_INV_19~q\ : std_logic;
SIGNAL \inst1|ALT_INV_17~q\ : std_logic;
SIGNAL \inst1|ALT_INV_16~q\ : std_logic;
SIGNAL \inst1|ALT_INV_14~q\ : std_logic;
SIGNAL \inst1|ALT_INV_15~q\ : std_logic;
SIGNAL \inst1|ALT_INV_13~q\ : std_logic;

BEGIN

LED <= ww_LED;
ww_SW9 <= SW9;
ww_KEY0 <= KEY0;
ww_SW <= SW;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_SW9~input_o\ <= NOT \SW9~input_o\;
\ALT_INV_SW[7]~input_o\ <= NOT \SW[7]~input_o\;
\ALT_INV_SW[6]~input_o\ <= NOT \SW[6]~input_o\;
\ALT_INV_SW[5]~input_o\ <= NOT \SW[5]~input_o\;
\ALT_INV_SW[4]~input_o\ <= NOT \SW[4]~input_o\;
\ALT_INV_SW[3]~input_o\ <= NOT \SW[3]~input_o\;
\ALT_INV_SW[2]~input_o\ <= NOT \SW[2]~input_o\;
\ALT_INV_SW[1]~input_o\ <= NOT \SW[1]~input_o\;
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\inst1|ALT_INV_20~q\ <= NOT \inst1|20~q\;
\inst1|ALT_INV_18~q\ <= NOT \inst1|18~q\;
\inst1|ALT_INV_19~q\ <= NOT \inst1|19~q\;
\inst1|ALT_INV_17~q\ <= NOT \inst1|17~q\;
\inst1|ALT_INV_16~q\ <= NOT \inst1|16~q\;
\inst1|ALT_INV_14~q\ <= NOT \inst1|14~q\;
\inst1|ALT_INV_15~q\ <= NOT \inst1|15~q\;
\inst1|ALT_INV_13~q\ <= NOT \inst1|13~q\;

-- Location: IOOBUF_X0_Y19_N22
\LED[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sum\(7),
	devoe => ww_devoe,
	o => ww_LED(7));

-- Location: IOOBUF_X0_Y19_N5
\LED[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sum\(6),
	devoe => ww_devoe,
	o => ww_LED(6));

-- Location: IOOBUF_X0_Y19_N56
\LED[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sum\(5),
	devoe => ww_devoe,
	o => ww_LED(5));

-- Location: IOOBUF_X0_Y19_N39
\LED[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sum\(4),
	devoe => ww_devoe,
	o => ww_LED(4));

-- Location: IOOBUF_X0_Y18_N45
\LED[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sum\(3),
	devoe => ww_devoe,
	o => ww_LED(3));

-- Location: IOOBUF_X0_Y18_N62
\LED[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sum\(2),
	devoe => ww_devoe,
	o => ww_LED(2));

-- Location: IOOBUF_X0_Y18_N96
\LED[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sum\(1),
	devoe => ww_devoe,
	o => ww_LED(1));

-- Location: IOOBUF_X0_Y18_N79
\LED[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sum\(0),
	devoe => ww_devoe,
	o => ww_LED(0));

-- Location: IOIBUF_X33_Y0_N75
\SW9~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW9,
	o => \SW9~input_o\);

-- Location: IOIBUF_X10_Y0_N92
\KEY0~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY0,
	o => \KEY0~input_o\);

-- Location: CLKCTRL_G5
\KEY0~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \KEY0~input_o\,
	outclk => \KEY0~inputCLKENA0_outclk\);

-- Location: IOIBUF_X34_Y0_N35
\SW[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: FF_X31_Y4_N52
\inst1|20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY0~inputCLKENA0_outclk\,
	asdata => \SW[7]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|20~q\);

-- Location: IOIBUF_X34_Y0_N52
\SW[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: FF_X31_Y4_N50
\inst1|19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY0~inputCLKENA0_outclk\,
	asdata => \SW[6]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|19~q\);

-- Location: IOIBUF_X36_Y0_N52
\SW[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: FF_X31_Y4_N47
\inst1|18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY0~inputCLKENA0_outclk\,
	asdata => \SW[5]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|18~q\);

-- Location: IOIBUF_X36_Y0_N35
\SW[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: FF_X31_Y4_N44
\inst1|17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY0~inputCLKENA0_outclk\,
	asdata => \SW[4]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|17~q\);

-- Location: IOIBUF_X34_Y0_N18
\SW[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: FF_X31_Y4_N41
\inst1|16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY0~inputCLKENA0_outclk\,
	asdata => \SW[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|16~q\);

-- Location: IOIBUF_X34_Y0_N1
\SW[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: FF_X31_Y4_N38
\inst1|15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY0~inputCLKENA0_outclk\,
	asdata => \SW[2]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|15~q\);

-- Location: IOIBUF_X33_Y0_N58
\SW[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: FF_X31_Y4_N34
\inst1|14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY0~inputCLKENA0_outclk\,
	asdata => \SW[1]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|14~q\);

-- Location: IOIBUF_X33_Y0_N41
\SW[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: FF_X31_Y4_N32
\inst1|13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \KEY0~inputCLKENA0_outclk\,
	asdata => \SW[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst1|13~q\);

-- Location: LABCELL_X31_Y4_N30
\inst|sum[0]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|sum\(0) = SUM(( !\inst1|13~q\ $ (!\SW[0]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \inst|_~22\ = CARRY(( !\inst1|13~q\ $ (!\SW[0]~input_o\) ) + ( !VCC ) + ( !VCC ))
-- \inst|_~23\ = SHARE((!\SW[0]~input_o\ & (\SW9~input_o\)) # (\SW[0]~input_o\ & ((\inst1|13~q\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010100110101001100000000000000000011110000111100",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW9~input_o\,
	datab => \inst1|ALT_INV_13~q\,
	datac => \ALT_INV_SW[0]~input_o\,
	cin => GND,
	sharein => GND,
	sumout => \inst|sum\(0),
	cout => \inst|_~22\,
	shareout => \inst|_~23\);

-- Location: LABCELL_X31_Y4_N33
\inst|sum[1]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|sum\(1) = SUM(( !\SW9~input_o\ $ (!\inst1|14~q\ $ (\SW[1]~input_o\)) ) + ( \inst|_~23\ ) + ( \inst|_~22\ ))
-- \inst|_~19\ = CARRY(( !\SW9~input_o\ $ (!\inst1|14~q\ $ (\SW[1]~input_o\)) ) + ( \inst|_~23\ ) + ( \inst|_~22\ ))
-- \inst|_~20\ = SHARE((\inst1|14~q\ & (!\SW9~input_o\ $ (!\SW[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000101000000000000000000101101010100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW9~input_o\,
	datac => \inst1|ALT_INV_14~q\,
	datad => \ALT_INV_SW[1]~input_o\,
	cin => \inst|_~22\,
	sharein => \inst|_~23\,
	sumout => \inst|sum\(1),
	cout => \inst|_~19\,
	shareout => \inst|_~20\);

-- Location: LABCELL_X31_Y4_N36
\inst|sum[2]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|sum\(2) = SUM(( !\SW9~input_o\ $ (!\SW[2]~input_o\ $ (\inst1|15~q\)) ) + ( \inst|_~20\ ) + ( \inst|_~19\ ))
-- \inst|_~16\ = CARRY(( !\SW9~input_o\ $ (!\SW[2]~input_o\ $ (\inst1|15~q\)) ) + ( \inst|_~20\ ) + ( \inst|_~19\ ))
-- \inst|_~17\ = SHARE((\inst1|15~q\ & (!\SW9~input_o\ $ (!\SW[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001100000011000000000000000000110100101101001",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW9~input_o\,
	datab => \ALT_INV_SW[2]~input_o\,
	datac => \inst1|ALT_INV_15~q\,
	cin => \inst|_~19\,
	sharein => \inst|_~20\,
	sumout => \inst|sum\(2),
	cout => \inst|_~16\,
	shareout => \inst|_~17\);

-- Location: LABCELL_X31_Y4_N39
\inst|sum[3]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|sum\(3) = SUM(( !\SW9~input_o\ $ (!\inst1|16~q\ $ (\SW[3]~input_o\)) ) + ( \inst|_~17\ ) + ( \inst|_~16\ ))
-- \inst|_~13\ = CARRY(( !\SW9~input_o\ $ (!\inst1|16~q\ $ (\SW[3]~input_o\)) ) + ( \inst|_~17\ ) + ( \inst|_~16\ ))
-- \inst|_~14\ = SHARE((\inst1|16~q\ & (!\SW9~input_o\ $ (!\SW[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000101000000000000000000101101010100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW9~input_o\,
	datac => \inst1|ALT_INV_16~q\,
	datad => \ALT_INV_SW[3]~input_o\,
	cin => \inst|_~16\,
	sharein => \inst|_~17\,
	sumout => \inst|sum\(3),
	cout => \inst|_~13\,
	shareout => \inst|_~14\);

-- Location: LABCELL_X31_Y4_N42
\inst|sum[4]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|sum\(4) = SUM(( !\inst1|17~q\ $ (!\SW9~input_o\ $ (\SW[4]~input_o\)) ) + ( \inst|_~14\ ) + ( \inst|_~13\ ))
-- \inst|_~10\ = CARRY(( !\inst1|17~q\ $ (!\SW9~input_o\ $ (\SW[4]~input_o\)) ) + ( \inst|_~14\ ) + ( \inst|_~13\ ))
-- \inst|_~11\ = SHARE((\inst1|17~q\ & (!\SW9~input_o\ $ (!\SW[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000110011000000000000000000000011110011000011",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	datab => \inst1|ALT_INV_17~q\,
	datac => \ALT_INV_SW9~input_o\,
	datad => \ALT_INV_SW[4]~input_o\,
	cin => \inst|_~13\,
	sharein => \inst|_~14\,
	sumout => \inst|sum\(4),
	cout => \inst|_~10\,
	shareout => \inst|_~11\);

-- Location: LABCELL_X31_Y4_N45
\inst|sum[5]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|sum\(5) = SUM(( !\SW9~input_o\ $ (!\inst1|18~q\ $ (\SW[5]~input_o\)) ) + ( \inst|_~11\ ) + ( \inst|_~10\ ))
-- \inst|_~7\ = CARRY(( !\SW9~input_o\ $ (!\inst1|18~q\ $ (\SW[5]~input_o\)) ) + ( \inst|_~11\ ) + ( \inst|_~10\ ))
-- \inst|_~8\ = SHARE((\inst1|18~q\ & (!\SW9~input_o\ $ (!\SW[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000101000000000000000000101101010100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW9~input_o\,
	datac => \inst1|ALT_INV_18~q\,
	datad => \ALT_INV_SW[5]~input_o\,
	cin => \inst|_~10\,
	sharein => \inst|_~11\,
	sumout => \inst|sum\(5),
	cout => \inst|_~7\,
	shareout => \inst|_~8\);

-- Location: LABCELL_X31_Y4_N48
\inst|sum[6]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|sum\(6) = SUM(( !\SW9~input_o\ $ (!\inst1|19~q\ $ (\SW[6]~input_o\)) ) + ( \inst|_~8\ ) + ( \inst|_~7\ ))
-- \inst|_~4\ = CARRY(( !\SW9~input_o\ $ (!\inst1|19~q\ $ (\SW[6]~input_o\)) ) + ( \inst|_~8\ ) + ( \inst|_~7\ ))
-- \inst|_~5\ = SHARE((\inst1|19~q\ & (!\SW9~input_o\ $ (!\SW[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000001010000101000000000000000000101101010100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW9~input_o\,
	datac => \inst1|ALT_INV_19~q\,
	datad => \ALT_INV_SW[6]~input_o\,
	cin => \inst|_~7\,
	sharein => \inst|_~8\,
	sumout => \inst|sum\(6),
	cout => \inst|_~4\,
	shareout => \inst|_~5\);

-- Location: LABCELL_X31_Y4_N51
\inst|sum[7]\ : cyclonev_lcell_comb
-- Equation(s):
-- \inst|sum\(7) = SUM(( !\SW9~input_o\ $ (!\inst1|20~q\ $ (\SW[7]~input_o\)) ) + ( \inst|_~5\ ) + ( \inst|_~4\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000101101010100101",
	shared_arith => "on")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW9~input_o\,
	datac => \inst1|ALT_INV_20~q\,
	datad => \ALT_INV_SW[7]~input_o\,
	cin => \inst|_~4\,
	sharein => \inst|_~5\,
	sumout => \inst|sum\(7));

-- Location: LABCELL_X40_Y29_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


