-- Copyright (C) 1991-2010 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 9.1 Build 350 03/24/2010 Service Pack 2 SJ Web Edition"

-- DATE "11/08/2010 21:39:10"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	main IS
    PORT (
	clock : IN std_logic;
	reset : IN std_logic;
	transmit : IN std_logic;
	tx : OUT std_logic;
	rx : IN std_logic;
	data : IN std_logic_vector(7 DOWNTO 0);
	led : OUT std_logic_vector(7 DOWNTO 0)
	);
END main;

-- Design Ports Information
-- tx	=>  Location: PIN_B25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[0]	=>  Location: PIN_AE22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[1]	=>  Location: PIN_AF22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[2]	=>  Location: PIN_W19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[3]	=>  Location: PIN_V18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[4]	=>  Location: PIN_U18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[5]	=>  Location: PIN_U17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[6]	=>  Location: PIN_AA20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led[7]	=>  Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clock	=>  Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset	=>  Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- transmit	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data[5]	=>  Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data[4]	=>  Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data[3]	=>  Location: PIN_AE14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data[6]	=>  Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data[7]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data[2]	=>  Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data[0]	=>  Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data[1]	=>  Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rx	=>  Location: PIN_C25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default

ARCHITECTURE structure OF main IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_transmit : std_logic;
SIGNAL ww_tx : std_logic;
SIGNAL ww_rx : std_logic;
SIGNAL ww_data : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_led : std_logic_vector(7 DOWNTO 0);
SIGNAL \neco2|delicka~1clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \neco2|receive~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clock~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \neco|Add0~0_combout\ : std_logic;
SIGNAL \neco|Add0~8_combout\ : std_logic;
SIGNAL \neco|Add0~16_combout\ : std_logic;
SIGNAL \neco2|citac[4]~23_combout\ : std_logic;
SIGNAL \neco2|citac[11]~38\ : std_logic;
SIGNAL \neco2|citac[12]~39_combout\ : std_logic;
SIGNAL \neco|citac~3_combout\ : std_logic;
SIGNAL \clock~combout\ : std_logic;
SIGNAL \clock~clkctrl_outclk\ : std_logic;
SIGNAL \neco|bitocet~2_combout\ : std_logic;
SIGNAL \reset~clk_delay_ctrl_clkout\ : std_logic;
SIGNAL \reset~clkctrl_outclk\ : std_logic;
SIGNAL \neco|citac~5_combout\ : std_logic;
SIGNAL \neco|Add0~1\ : std_logic;
SIGNAL \neco|Add0~3\ : std_logic;
SIGNAL \neco|Add0~4_combout\ : std_logic;
SIGNAL \neco|Add0~5\ : std_logic;
SIGNAL \neco|Add0~6_combout\ : std_logic;
SIGNAL \neco|citac~4_combout\ : std_logic;
SIGNAL \neco|Add0~2_combout\ : std_logic;
SIGNAL \neco|Equal0~2_combout\ : std_logic;
SIGNAL \neco|Add0~7\ : std_logic;
SIGNAL \neco|Add0~9\ : std_logic;
SIGNAL \neco|Add0~10_combout\ : std_logic;
SIGNAL \neco|Add0~11\ : std_logic;
SIGNAL \neco|Add0~12_combout\ : std_logic;
SIGNAL \neco|citac~2_combout\ : std_logic;
SIGNAL \neco|Add0~13\ : std_logic;
SIGNAL \neco|Add0~14_combout\ : std_logic;
SIGNAL \neco|Equal0~1_combout\ : std_logic;
SIGNAL \neco|Add0~15\ : std_logic;
SIGNAL \neco|Add0~17\ : std_logic;
SIGNAL \neco|Add0~18_combout\ : std_logic;
SIGNAL \neco|Add0~19\ : std_logic;
SIGNAL \neco|Add0~20_combout\ : std_logic;
SIGNAL \neco|citac~1_combout\ : std_logic;
SIGNAL \neco|Add0~21\ : std_logic;
SIGNAL \neco|Add0~22_combout\ : std_logic;
SIGNAL \neco|Add0~23\ : std_logic;
SIGNAL \neco|Add0~24_combout\ : std_logic;
SIGNAL \neco|citac~0_combout\ : std_logic;
SIGNAL \neco|Equal0~0_combout\ : std_logic;
SIGNAL \neco|Equal0~3_combout\ : std_logic;
SIGNAL \neco|clockstate~0_combout\ : std_logic;
SIGNAL \neco|clockstate~regout\ : std_logic;
SIGNAL \neco|bitocet~1_combout\ : std_logic;
SIGNAL \neco|LessThan0~0_combout\ : std_logic;
SIGNAL \neco|state~0_combout\ : std_logic;
SIGNAL \neco|state~regout\ : std_logic;
SIGNAL \neco|tx~3_combout\ : std_logic;
SIGNAL \neco|bitocet~0_combout\ : std_logic;
SIGNAL \neco|bitocet~3_combout\ : std_logic;
SIGNAL \transmit~combout\ : std_logic;
SIGNAL \neco|data_in[10]~feeder_combout\ : std_logic;
SIGNAL \neco|tx~0_combout\ : std_logic;
SIGNAL \neco|data_in[3]~feeder_combout\ : std_logic;
SIGNAL \neco|tx~1_combout\ : std_logic;
SIGNAL \neco|tx~2_combout\ : std_logic;
SIGNAL \neco|tx~4_combout\ : std_logic;
SIGNAL \neco|Mux0~0_combout\ : std_logic;
SIGNAL \neco|Mux0~1_combout\ : std_logic;
SIGNAL \neco|tx~5_combout\ : std_logic;
SIGNAL \neco|tx~regout\ : std_logic;
SIGNAL \neco2|receiving1~feeder_combout\ : std_logic;
SIGNAL \neco2|in_reset~regout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \neco2|delicka~1_combout\ : std_logic;
SIGNAL \neco2|delicka~1clkctrl_outclk\ : std_logic;
SIGNAL \neco2|receiving1~regout\ : std_logic;
SIGNAL \neco2|receiving2~0_combout\ : std_logic;
SIGNAL \neco2|receiving2~regout\ : std_logic;
SIGNAL \neco2|citac[0]~15_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \neco2|citac[0]~41_combout\ : std_logic;
SIGNAL \neco2|citac[0]~16\ : std_logic;
SIGNAL \neco2|citac[1]~17_combout\ : std_logic;
SIGNAL \neco2|citac[1]~18\ : std_logic;
SIGNAL \neco2|citac[2]~20\ : std_logic;
SIGNAL \neco2|citac[3]~21_combout\ : std_logic;
SIGNAL \neco2|citac[3]~22\ : std_logic;
SIGNAL \neco2|citac[4]~24\ : std_logic;
SIGNAL \neco2|citac[5]~26\ : std_logic;
SIGNAL \neco2|citac[6]~27_combout\ : std_logic;
SIGNAL \neco2|citac[6]~28\ : std_logic;
SIGNAL \neco2|citac[7]~29_combout\ : std_logic;
SIGNAL \neco2|delicka~0_combout\ : std_logic;
SIGNAL \neco2|citac[5]~25_combout\ : std_logic;
SIGNAL \neco2|Equal0~1_combout\ : std_logic;
SIGNAL \neco2|citac[7]~30\ : std_logic;
SIGNAL \neco2|citac[8]~31_combout\ : std_logic;
SIGNAL \neco2|citac[8]~32\ : std_logic;
SIGNAL \neco2|citac[9]~34\ : std_logic;
SIGNAL \neco2|citac[10]~35_combout\ : std_logic;
SIGNAL \neco2|citac[10]~36\ : std_logic;
SIGNAL \neco2|citac[11]~37_combout\ : std_logic;
SIGNAL \neco2|citac[9]~33_combout\ : std_logic;
SIGNAL \neco2|Equal0~2_combout\ : std_logic;
SIGNAL \neco2|citac[2]~19_combout\ : std_logic;
SIGNAL \neco2|Equal0~0_combout\ : std_logic;
SIGNAL \neco2|Equal0~3_combout\ : std_logic;
SIGNAL \neco2|clockstate~2_combout\ : std_logic;
SIGNAL \neco2|clockstate~regout\ : std_logic;
SIGNAL \neco2|bitocet[1]~1_combout\ : std_logic;
SIGNAL \neco2|bitocet~0_combout\ : std_logic;
SIGNAL \neco2|prijimac~0_combout\ : std_logic;
SIGNAL \neco2|bitocet[2]~3_combout\ : std_logic;
SIGNAL \neco2|bitocet~2_combout\ : std_logic;
SIGNAL \neco2|Equal1~0_combout\ : std_logic;
SIGNAL \neco2|receive~2_combout\ : std_logic;
SIGNAL \neco2|receive~feeder_combout\ : std_logic;
SIGNAL \neco2|receive~regout\ : std_logic;
SIGNAL \neco2|receive~clkctrl_outclk\ : std_logic;
SIGNAL \rx~combout\ : std_logic;
SIGNAL \neco2|Decoder0~0_combout\ : std_logic;
SIGNAL \neco2|Decoder0~1_combout\ : std_logic;
SIGNAL \neco2|data[0]~0_combout\ : std_logic;
SIGNAL \led[0]~reg0feeder_combout\ : std_logic;
SIGNAL \led[0]~reg0_regout\ : std_logic;
SIGNAL \neco2|Decoder0~2_combout\ : std_logic;
SIGNAL \neco2|data[1]~1_combout\ : std_logic;
SIGNAL \led[1]~reg0feeder_combout\ : std_logic;
SIGNAL \led[1]~reg0_regout\ : std_logic;
SIGNAL \neco2|Decoder0~3_combout\ : std_logic;
SIGNAL \neco2|data[2]~2_combout\ : std_logic;
SIGNAL \led[2]~reg0feeder_combout\ : std_logic;
SIGNAL \led[2]~reg0_regout\ : std_logic;
SIGNAL \neco2|Decoder0~4_combout\ : std_logic;
SIGNAL \neco2|data[3]~3_combout\ : std_logic;
SIGNAL \led[3]~reg0feeder_combout\ : std_logic;
SIGNAL \led[3]~reg0_regout\ : std_logic;
SIGNAL \neco2|Decoder0~5_combout\ : std_logic;
SIGNAL \neco2|Decoder0~6_combout\ : std_logic;
SIGNAL \neco2|data[4]~4_combout\ : std_logic;
SIGNAL \led[4]~reg0feeder_combout\ : std_logic;
SIGNAL \led[4]~reg0_regout\ : std_logic;
SIGNAL \neco2|Decoder0~7_combout\ : std_logic;
SIGNAL \neco2|data[5]~5_combout\ : std_logic;
SIGNAL \led[5]~reg0_regout\ : std_logic;
SIGNAL \neco2|Decoder0~8_combout\ : std_logic;
SIGNAL \neco2|data[6]~6_combout\ : std_logic;
SIGNAL \led[6]~reg0feeder_combout\ : std_logic;
SIGNAL \led[6]~reg0_regout\ : std_logic;
SIGNAL \neco2|Decoder0~9_combout\ : std_logic;
SIGNAL \neco2|data[7]~7_combout\ : std_logic;
SIGNAL \led[7]~reg0_regout\ : std_logic;
SIGNAL \neco2|bitocet\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \neco2|citac\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \neco2|data\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \neco|bitocet\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \neco|citac\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \neco|data_in\ : std_logic_vector(10 DOWNTO 0);
SIGNAL \data~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \neco|ALT_INV_tx~regout\ : std_logic;
SIGNAL \ALT_INV_transmit~combout\ : std_logic;
SIGNAL \ALT_INV_rx~combout\ : std_logic;
SIGNAL \ALT_INV_reset~clkctrl_outclk\ : std_logic;

BEGIN

ww_clock <= clock;
ww_reset <= reset;
ww_transmit <= transmit;
tx <= ww_tx;
ww_rx <= rx;
ww_data <= data;
led <= ww_led;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\neco2|delicka~1clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \neco2|delicka~1_combout\);

\neco2|receive~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \neco2|receive~regout\);

\clock~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clock~combout\);

\reset~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset~clk_delay_ctrl_clkout\);
\neco|ALT_INV_tx~regout\ <= NOT \neco|tx~regout\;
\ALT_INV_transmit~combout\ <= NOT \transmit~combout\;
\ALT_INV_rx~combout\ <= NOT \rx~combout\;
\ALT_INV_reset~clkctrl_outclk\ <= NOT \reset~clkctrl_outclk\;

-- Location: LCCOMB_X36_Y20_N4
\neco|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~0_combout\ = \neco|citac\(0) $ (VCC)
-- \neco|Add0~1\ = CARRY(\neco|citac\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \neco|citac\(0),
	datad => VCC,
	combout => \neco|Add0~0_combout\,
	cout => \neco|Add0~1\);

-- Location: LCCOMB_X36_Y20_N12
\neco|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~8_combout\ = (\neco|citac\(4) & (\neco|Add0~7\ $ (GND))) # (!\neco|citac\(4) & (!\neco|Add0~7\ & VCC))
-- \neco|Add0~9\ = CARRY((\neco|citac\(4) & !\neco|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \neco|citac\(4),
	datad => VCC,
	cin => \neco|Add0~7\,
	combout => \neco|Add0~8_combout\,
	cout => \neco|Add0~9\);

-- Location: LCCOMB_X36_Y20_N20
\neco|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~16_combout\ = (\neco|citac\(8) & (\neco|Add0~15\ $ (GND))) # (!\neco|citac\(8) & (!\neco|Add0~15\ & VCC))
-- \neco|Add0~17\ = CARRY((\neco|citac\(8) & !\neco|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \neco|citac\(8),
	datad => VCC,
	cin => \neco|Add0~15\,
	combout => \neco|Add0~16_combout\,
	cout => \neco|Add0~17\);

-- Location: LCFF_X57_Y21_N11
\neco2|citac[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[4]~23_combout\,
	sdata => \~GND~combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(4));

-- Location: LCFF_X57_Y21_N27
\neco2|citac[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[12]~39_combout\,
	sdata => \neco2|delicka~0_combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(12));

-- Location: LCCOMB_X57_Y21_N10
\neco2|citac[4]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[4]~23_combout\ = (\neco2|citac\(4) & (\neco2|citac[3]~22\ $ (GND))) # (!\neco2|citac\(4) & (!\neco2|citac[3]~22\ & VCC))
-- \neco2|citac[4]~24\ = CARRY((\neco2|citac\(4) & !\neco2|citac[3]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|citac\(4),
	datad => VCC,
	cin => \neco2|citac[3]~22\,
	combout => \neco2|citac[4]~23_combout\,
	cout => \neco2|citac[4]~24\);

-- Location: LCCOMB_X57_Y21_N24
\neco2|citac[11]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[11]~37_combout\ = (\neco2|citac\(11) & (!\neco2|citac[10]~36\)) # (!\neco2|citac\(11) & ((\neco2|citac[10]~36\) # (GND)))
-- \neco2|citac[11]~38\ = CARRY((!\neco2|citac[10]~36\) # (!\neco2|citac\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco2|citac\(11),
	datad => VCC,
	cin => \neco2|citac[10]~36\,
	combout => \neco2|citac[11]~37_combout\,
	cout => \neco2|citac[11]~38\);

-- Location: LCCOMB_X57_Y21_N26
\neco2|citac[12]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[12]~39_combout\ = \neco2|citac[11]~38\ $ (!\neco2|citac\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \neco2|citac\(12),
	cin => \neco2|citac[11]~38\,
	combout => \neco2|citac[12]~39_combout\);

-- Location: LCFF_X34_Y20_N21
\neco|data_in[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	sdata => \data~combout\(6),
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_transmit~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|data_in\(7));

-- Location: LCFF_X36_Y20_N21
\neco|citac[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|Add0~16_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(8));

-- Location: LCFF_X35_Y20_N31
\neco|citac[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|citac~3_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(4));

-- Location: LCCOMB_X35_Y20_N30
\neco|citac~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|citac~3_combout\ = (\neco|Add0~8_combout\ & !\neco|Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \neco|Add0~8_combout\,
	datad => \neco|Equal0~3_combout\,
	combout => \neco|citac~3_combout\);

-- Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data(6),
	combout => \data~combout\(6));

-- Location: PIN_N2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clock~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clock,
	combout => \clock~combout\);

-- Location: CLKCTRL_G2
\clock~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~clkctrl_outclk\);

-- Location: LCCOMB_X34_Y20_N10
\neco|bitocet~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|bitocet~2_combout\ = (\neco|bitocet\(3) & (!\neco|bitocet\(2) & ((!\neco|bitocet\(1)) # (!\neco|bitocet\(0))))) # (!\neco|bitocet\(3) & (\neco|bitocet\(0) & (\neco|bitocet\(1) & \neco|bitocet\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100001110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|bitocet\(0),
	datab => \neco|bitocet\(1),
	datac => \neco|bitocet\(3),
	datad => \neco|bitocet\(2),
	combout => \neco|bitocet~2_combout\);

-- Location: CLKDELAYCTRL_G4
\reset~clk_delay_ctrl\ : cycloneii_clk_delay_ctrl
-- pragma translate_off
GENERIC MAP (
	delay_chain_mode => "none",
	use_new_style_dq_detection => "false")
-- pragma translate_on
PORT MAP (
	clk => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	clkout => \reset~clk_delay_ctrl_clkout\);

-- Location: CLKCTRL_G4
\reset~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~clkctrl_outclk\);

-- Location: LCCOMB_X35_Y20_N18
\neco|citac~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|citac~5_combout\ = (\neco|Add0~0_combout\ & !\neco|Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|Add0~0_combout\,
	datad => \neco|Equal0~3_combout\,
	combout => \neco|citac~5_combout\);

-- Location: LCFF_X35_Y20_N19
\neco|citac[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|citac~5_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(0));

-- Location: LCCOMB_X36_Y20_N6
\neco|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~2_combout\ = (\neco|citac\(1) & (!\neco|Add0~1\)) # (!\neco|citac\(1) & ((\neco|Add0~1\) # (GND)))
-- \neco|Add0~3\ = CARRY((!\neco|Add0~1\) # (!\neco|citac\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \neco|citac\(1),
	datad => VCC,
	cin => \neco|Add0~1\,
	combout => \neco|Add0~2_combout\,
	cout => \neco|Add0~3\);

-- Location: LCCOMB_X36_Y20_N8
\neco|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~4_combout\ = (\neco|citac\(2) & (\neco|Add0~3\ $ (GND))) # (!\neco|citac\(2) & (!\neco|Add0~3\ & VCC))
-- \neco|Add0~5\ = CARRY((\neco|citac\(2) & !\neco|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco|citac\(2),
	datad => VCC,
	cin => \neco|Add0~3\,
	combout => \neco|Add0~4_combout\,
	cout => \neco|Add0~5\);

-- Location: LCFF_X36_Y20_N9
\neco|citac[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|Add0~4_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(2));

-- Location: LCCOMB_X36_Y20_N10
\neco|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~6_combout\ = (\neco|citac\(3) & (!\neco|Add0~5\)) # (!\neco|citac\(3) & ((\neco|Add0~5\) # (GND)))
-- \neco|Add0~7\ = CARRY((!\neco|Add0~5\) # (!\neco|citac\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco|citac\(3),
	datad => VCC,
	cin => \neco|Add0~5\,
	combout => \neco|Add0~6_combout\,
	cout => \neco|Add0~7\);

-- Location: LCCOMB_X35_Y20_N24
\neco|citac~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|citac~4_combout\ = (\neco|Add0~6_combout\ & !\neco|Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \neco|Add0~6_combout\,
	datad => \neco|Equal0~3_combout\,
	combout => \neco|citac~4_combout\);

-- Location: LCFF_X35_Y20_N25
\neco|citac[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|citac~4_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(3));

-- Location: LCFF_X36_Y20_N7
\neco|citac[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|Add0~2_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(1));

-- Location: LCCOMB_X36_Y20_N2
\neco|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Equal0~2_combout\ = (\neco|citac\(4) & (\neco|citac\(3) & (!\neco|citac\(2) & !\neco|citac\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|citac\(4),
	datab => \neco|citac\(3),
	datac => \neco|citac\(2),
	datad => \neco|citac\(1),
	combout => \neco|Equal0~2_combout\);

-- Location: LCCOMB_X36_Y20_N14
\neco|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~10_combout\ = (\neco|citac\(5) & (!\neco|Add0~9\)) # (!\neco|citac\(5) & ((\neco|Add0~9\) # (GND)))
-- \neco|Add0~11\ = CARRY((!\neco|Add0~9\) # (!\neco|citac\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco|citac\(5),
	datad => VCC,
	cin => \neco|Add0~9\,
	combout => \neco|Add0~10_combout\,
	cout => \neco|Add0~11\);

-- Location: LCFF_X36_Y20_N15
\neco|citac[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|Add0~10_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(5));

-- Location: LCCOMB_X36_Y20_N16
\neco|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~12_combout\ = (\neco|citac\(6) & (\neco|Add0~11\ $ (GND))) # (!\neco|citac\(6) & (!\neco|Add0~11\ & VCC))
-- \neco|Add0~13\ = CARRY((\neco|citac\(6) & !\neco|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco|citac\(6),
	datad => VCC,
	cin => \neco|Add0~11\,
	combout => \neco|Add0~12_combout\,
	cout => \neco|Add0~13\);

-- Location: LCCOMB_X35_Y20_N28
\neco|citac~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|citac~2_combout\ = (\neco|Add0~12_combout\ & !\neco|Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \neco|Add0~12_combout\,
	datad => \neco|Equal0~3_combout\,
	combout => \neco|citac~2_combout\);

-- Location: LCFF_X35_Y20_N29
\neco|citac[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|citac~2_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(6));

-- Location: LCCOMB_X36_Y20_N18
\neco|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~14_combout\ = (\neco|citac\(7) & (!\neco|Add0~13\)) # (!\neco|citac\(7) & ((\neco|Add0~13\) # (GND)))
-- \neco|Add0~15\ = CARRY((!\neco|Add0~13\) # (!\neco|citac\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco|citac\(7),
	datad => VCC,
	cin => \neco|Add0~13\,
	combout => \neco|Add0~14_combout\,
	cout => \neco|Add0~15\);

-- Location: LCFF_X36_Y20_N19
\neco|citac[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|Add0~14_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(7));

-- Location: LCCOMB_X36_Y20_N0
\neco|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Equal0~1_combout\ = (!\neco|citac\(8) & (\neco|citac\(6) & (!\neco|citac\(5) & !\neco|citac\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|citac\(8),
	datab => \neco|citac\(6),
	datac => \neco|citac\(5),
	datad => \neco|citac\(7),
	combout => \neco|Equal0~1_combout\);

-- Location: LCCOMB_X36_Y20_N22
\neco|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~18_combout\ = (\neco|citac\(9) & (!\neco|Add0~17\)) # (!\neco|citac\(9) & ((\neco|Add0~17\) # (GND)))
-- \neco|Add0~19\ = CARRY((!\neco|Add0~17\) # (!\neco|citac\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco|citac\(9),
	datad => VCC,
	cin => \neco|Add0~17\,
	combout => \neco|Add0~18_combout\,
	cout => \neco|Add0~19\);

-- Location: LCFF_X36_Y20_N23
\neco|citac[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|Add0~18_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(9));

-- Location: LCCOMB_X36_Y20_N24
\neco|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~20_combout\ = (\neco|citac\(10) & (\neco|Add0~19\ $ (GND))) # (!\neco|citac\(10) & (!\neco|Add0~19\ & VCC))
-- \neco|Add0~21\ = CARRY((\neco|citac\(10) & !\neco|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco|citac\(10),
	datad => VCC,
	cin => \neco|Add0~19\,
	combout => \neco|Add0~20_combout\,
	cout => \neco|Add0~21\);

-- Location: LCCOMB_X35_Y20_N16
\neco|citac~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|citac~1_combout\ = (!\neco|Equal0~3_combout\ & \neco|Add0~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \neco|Equal0~3_combout\,
	datad => \neco|Add0~20_combout\,
	combout => \neco|citac~1_combout\);

-- Location: LCFF_X35_Y20_N17
\neco|citac[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|citac~1_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(10));

-- Location: LCCOMB_X36_Y20_N26
\neco|Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~22_combout\ = (\neco|citac\(11) & (!\neco|Add0~21\)) # (!\neco|citac\(11) & ((\neco|Add0~21\) # (GND)))
-- \neco|Add0~23\ = CARRY((!\neco|Add0~21\) # (!\neco|citac\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco|citac\(11),
	datad => VCC,
	cin => \neco|Add0~21\,
	combout => \neco|Add0~22_combout\,
	cout => \neco|Add0~23\);

-- Location: LCFF_X36_Y20_N27
\neco|citac[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|Add0~22_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(11));

-- Location: LCCOMB_X36_Y20_N28
\neco|Add0~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Add0~24_combout\ = \neco|Add0~23\ $ (!\neco|citac\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \neco|citac\(12),
	cin => \neco|Add0~23\,
	combout => \neco|Add0~24_combout\);

-- Location: LCCOMB_X35_Y20_N22
\neco|citac~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|citac~0_combout\ = (!\neco|Equal0~3_combout\ & \neco|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \neco|Equal0~3_combout\,
	datad => \neco|Add0~24_combout\,
	combout => \neco|citac~0_combout\);

-- Location: LCFF_X35_Y20_N23
\neco|citac[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|citac~0_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|citac\(12));

-- Location: LCCOMB_X35_Y20_N2
\neco|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Equal0~0_combout\ = (\neco|citac\(10) & (\neco|citac\(12) & (!\neco|citac\(11) & !\neco|citac\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|citac\(10),
	datab => \neco|citac\(12),
	datac => \neco|citac\(11),
	datad => \neco|citac\(9),
	combout => \neco|Equal0~0_combout\);

-- Location: LCCOMB_X36_Y20_N30
\neco|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Equal0~3_combout\ = (!\neco|citac\(0) & (\neco|Equal0~2_combout\ & (\neco|Equal0~1_combout\ & \neco|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|citac\(0),
	datab => \neco|Equal0~2_combout\,
	datac => \neco|Equal0~1_combout\,
	datad => \neco|Equal0~0_combout\,
	combout => \neco|Equal0~3_combout\);

-- Location: LCCOMB_X35_Y20_N26
\neco|clockstate~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|clockstate~0_combout\ = (!\neco|clockstate~regout\ & \neco|Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \neco|clockstate~regout\,
	datad => \neco|Equal0~3_combout\,
	combout => \neco|clockstate~0_combout\);

-- Location: LCFF_X35_Y20_N27
\neco|clockstate\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|clockstate~0_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|clockstate~regout\);

-- Location: LCCOMB_X34_Y20_N24
\neco|bitocet~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|bitocet~1_combout\ = (!\neco|bitocet\(0) & ((!\neco|bitocet\(2)) # (!\neco|bitocet\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|bitocet\(3),
	datac => \neco|bitocet\(0),
	datad => \neco|bitocet\(2),
	combout => \neco|bitocet~1_combout\);

-- Location: LCFF_X34_Y20_N25
\neco|bitocet[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|bitocet~1_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	ena => \neco|tx~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|bitocet\(0));

-- Location: LCCOMB_X34_Y20_N12
\neco|LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|LessThan0~0_combout\ = ((!\neco|bitocet\(2) & ((!\neco|bitocet\(0)) # (!\neco|bitocet\(1))))) # (!\neco|bitocet\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|bitocet\(3),
	datab => \neco|bitocet\(1),
	datac => \neco|bitocet\(0),
	datad => \neco|bitocet\(2),
	combout => \neco|LessThan0~0_combout\);

-- Location: LCCOMB_X35_Y20_N0
\neco|state~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|state~0_combout\ = ((\neco|state~regout\ & ((\neco|LessThan0~0_combout\) # (!\neco|clockstate~regout\)))) # (!\transmit~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmit~combout\,
	datab => \neco|clockstate~regout\,
	datac => \neco|state~regout\,
	datad => \neco|LessThan0~0_combout\,
	combout => \neco|state~0_combout\);

-- Location: LCFF_X35_Y20_N1
\neco|state\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|state~0_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|state~regout\);

-- Location: LCCOMB_X35_Y20_N4
\neco|tx~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|tx~3_combout\ = (\transmit~combout\ & (\neco|clockstate~regout\ & \neco|state~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \transmit~combout\,
	datab => \neco|clockstate~regout\,
	datad => \neco|state~regout\,
	combout => \neco|tx~3_combout\);

-- Location: LCFF_X34_Y20_N11
\neco|bitocet[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|bitocet~2_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	ena => \neco|tx~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|bitocet\(3));

-- Location: LCCOMB_X34_Y20_N4
\neco|bitocet~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|bitocet~0_combout\ = (\neco|bitocet\(2) & (!\neco|bitocet\(3) & (\neco|bitocet\(0) $ (\neco|bitocet\(1))))) # (!\neco|bitocet\(2) & (\neco|bitocet\(0) $ ((\neco|bitocet\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|bitocet\(0),
	datab => \neco|bitocet\(2),
	datac => \neco|bitocet\(1),
	datad => \neco|bitocet\(3),
	combout => \neco|bitocet~0_combout\);

-- Location: LCFF_X34_Y20_N5
\neco|bitocet[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|bitocet~0_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	ena => \neco|tx~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|bitocet\(1));

-- Location: LCCOMB_X34_Y20_N28
\neco|bitocet~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|bitocet~3_combout\ = (!\neco|bitocet\(3) & (\neco|bitocet\(2) $ (((\neco|bitocet\(0) & \neco|bitocet\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|bitocet\(0),
	datab => \neco|bitocet\(1),
	datac => \neco|bitocet\(2),
	datad => \neco|bitocet\(3),
	combout => \neco|bitocet~3_combout\);

-- Location: LCFF_X34_Y20_N29
\neco|bitocet[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|bitocet~3_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	ena => \neco|tx~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|bitocet\(2));

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data(7),
	combout => \data~combout\(7));

-- Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\transmit~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_transmit,
	combout => \transmit~combout\);

-- Location: LCFF_X34_Y20_N17
\neco|data_in[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	sdata => \data~combout\(7),
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_transmit~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|data_in\(8));

-- Location: LCCOMB_X34_Y20_N22
\neco|data_in[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|data_in[10]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \neco|data_in[10]~feeder_combout\);

-- Location: LCFF_X34_Y20_N23
\neco|data_in[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|data_in[10]~feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	ena => \ALT_INV_transmit~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|data_in\(10));

-- Location: LCCOMB_X34_Y20_N16
\neco|tx~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|tx~0_combout\ = (\neco|bitocet\(0) & (!\neco|bitocet\(1) & ((\neco|data_in\(10))))) # (!\neco|bitocet\(0) & ((\neco|bitocet\(1) & ((\neco|data_in\(10)))) # (!\neco|bitocet\(1) & (\neco|data_in\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|bitocet\(0),
	datab => \neco|bitocet\(1),
	datac => \neco|data_in\(8),
	datad => \neco|data_in\(10),
	combout => \neco|tx~0_combout\);

-- Location: PIN_N25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data(0),
	combout => \data~combout\(0));

-- Location: LCFF_X34_Y20_N9
\neco|data_in[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	sdata => \data~combout\(0),
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_transmit~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|data_in\(1));

-- Location: PIN_P25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data(2),
	combout => \data~combout\(2));

-- Location: LCCOMB_X34_Y20_N6
\neco|data_in[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|data_in[3]~feeder_combout\ = \data~combout\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \data~combout\(2),
	combout => \neco|data_in[3]~feeder_combout\);

-- Location: LCFF_X34_Y20_N7
\neco|data_in[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|data_in[3]~feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	ena => \ALT_INV_transmit~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|data_in\(3));

-- Location: LCCOMB_X34_Y20_N8
\neco|tx~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|tx~1_combout\ = (\neco|bitocet\(0) & ((\neco|bitocet\(1) & ((\neco|data_in\(3)))) # (!\neco|bitocet\(1) & (\neco|data_in\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|bitocet\(0),
	datab => \neco|bitocet\(1),
	datac => \neco|data_in\(1),
	datad => \neco|data_in\(3),
	combout => \neco|tx~1_combout\);

-- Location: PIN_N26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data(1),
	combout => \data~combout\(1));

-- Location: LCFF_X34_Y20_N3
\neco|data_in[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	sdata => \data~combout\(1),
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_transmit~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|data_in\(2));

-- Location: LCCOMB_X34_Y20_N2
\neco|tx~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|tx~2_combout\ = (\neco|tx~1_combout\) # ((!\neco|bitocet\(0) & (\neco|data_in\(2) & \neco|bitocet\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|bitocet\(0),
	datab => \neco|tx~1_combout\,
	datac => \neco|data_in\(2),
	datad => \neco|bitocet\(1),
	combout => \neco|tx~2_combout\);

-- Location: LCCOMB_X34_Y20_N14
\neco|tx~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|tx~4_combout\ = (\neco|bitocet\(3) & (!\neco|bitocet\(2) & (\neco|tx~0_combout\))) # (!\neco|bitocet\(3) & ((\neco|bitocet\(2)) # ((\neco|tx~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010101100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|bitocet\(3),
	datab => \neco|bitocet\(2),
	datac => \neco|tx~0_combout\,
	datad => \neco|tx~2_combout\,
	combout => \neco|tx~4_combout\);

-- Location: PIN_AD13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data(5),
	combout => \data~combout\(5));

-- Location: LCFF_X34_Y20_N19
\neco|data_in[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	sdata => \data~combout\(5),
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_transmit~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|data_in\(6));

-- Location: PIN_AE14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data(3),
	combout => \data~combout\(3));

-- Location: LCFF_X34_Y20_N27
\neco|data_in[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	sdata => \data~combout\(3),
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_transmit~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|data_in\(4));

-- Location: PIN_AF14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data(4),
	combout => \data~combout\(4));

-- Location: LCFF_X34_Y20_N31
\neco|data_in[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	sdata => \data~combout\(4),
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_transmit~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|data_in\(5));

-- Location: LCCOMB_X34_Y20_N26
\neco|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Mux0~0_combout\ = (\neco|bitocet\(0) & ((\neco|bitocet\(1)) # ((\neco|data_in\(5))))) # (!\neco|bitocet\(0) & (!\neco|bitocet\(1) & (\neco|data_in\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|bitocet\(0),
	datab => \neco|bitocet\(1),
	datac => \neco|data_in\(4),
	datad => \neco|data_in\(5),
	combout => \neco|Mux0~0_combout\);

-- Location: LCCOMB_X34_Y20_N18
\neco|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|Mux0~1_combout\ = (\neco|bitocet\(1) & ((\neco|Mux0~0_combout\ & (\neco|data_in\(7))) # (!\neco|Mux0~0_combout\ & ((\neco|data_in\(6)))))) # (!\neco|bitocet\(1) & (((\neco|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|data_in\(7),
	datab => \neco|bitocet\(1),
	datac => \neco|data_in\(6),
	datad => \neco|Mux0~0_combout\,
	combout => \neco|Mux0~1_combout\);

-- Location: LCCOMB_X34_Y20_N0
\neco|tx~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco|tx~5_combout\ = (\neco|LessThan0~0_combout\ & (((\neco|bitocet\(2) & !\neco|Mux0~1_combout\)) # (!\neco|tx~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco|LessThan0~0_combout\,
	datab => \neco|bitocet\(2),
	datac => \neco|tx~4_combout\,
	datad => \neco|Mux0~1_combout\,
	combout => \neco|tx~5_combout\);

-- Location: LCFF_X34_Y20_N1
\neco|tx\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco|tx~5_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	ena => \neco|tx~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco|tx~regout\);

-- Location: LCCOMB_X56_Y22_N22
\neco2|receiving1~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|receiving1~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \neco2|receiving1~feeder_combout\);

-- Location: LCFF_X56_Y22_N3
\neco2|in_reset\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|receive~2_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|in_reset~regout\);

-- Location: PIN_N23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: LCCOMB_X56_Y22_N4
\neco2|delicka~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|delicka~1_combout\ = (\neco2|in_reset~regout\) # (!\reset~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \neco2|in_reset~regout\,
	datad => \reset~combout\,
	combout => \neco2|delicka~1_combout\);

-- Location: CLKCTRL_G7
\neco2|delicka~1clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \neco2|delicka~1clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \neco2|delicka~1clkctrl_outclk\);

-- Location: LCFF_X56_Y22_N23
\neco2|receiving1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_rx~combout\,
	datain => \neco2|receiving1~feeder_combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|receiving1~regout\);

-- Location: LCCOMB_X56_Y22_N26
\neco2|receiving2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|receiving2~0_combout\ = (\neco2|receiving2~regout\) # (\neco2|receiving1~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \neco2|receiving2~regout\,
	datad => \neco2|receiving1~regout\,
	combout => \neco2|receiving2~0_combout\);

-- Location: LCFF_X56_Y22_N27
\neco2|receiving2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|receiving2~0_combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|receiving2~regout\);

-- Location: LCCOMB_X57_Y21_N2
\neco2|citac[0]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[0]~15_combout\ = \neco2|citac\(0) $ (VCC)
-- \neco2|citac[0]~16\ = CARRY(\neco2|citac\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \neco2|citac\(0),
	datad => VCC,
	combout => \neco2|citac[0]~15_combout\,
	cout => \neco2|citac[0]~16\);

-- Location: LCCOMB_X59_Y21_N8
\~GND\ : cycloneii_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X57_Y21_N30
\neco2|citac[0]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[0]~41_combout\ = ((!\neco2|receiving2~regout\ & \neco2|receiving1~regout\)) # (!\neco2|Equal0~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|receiving2~regout\,
	datab => \neco2|receiving1~regout\,
	datad => \neco2|Equal0~3_combout\,
	combout => \neco2|citac[0]~41_combout\);

-- Location: LCFF_X57_Y21_N3
\neco2|citac[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[0]~15_combout\,
	sdata => \~GND~combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(0));

-- Location: LCCOMB_X57_Y21_N4
\neco2|citac[1]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[1]~17_combout\ = (\neco2|citac\(1) & (!\neco2|citac[0]~16\)) # (!\neco2|citac\(1) & ((\neco2|citac[0]~16\) # (GND)))
-- \neco2|citac[1]~18\ = CARRY((!\neco2|citac[0]~16\) # (!\neco2|citac\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco2|citac\(1),
	datad => VCC,
	cin => \neco2|citac[0]~16\,
	combout => \neco2|citac[1]~17_combout\,
	cout => \neco2|citac[1]~18\);

-- Location: LCFF_X57_Y21_N5
\neco2|citac[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[1]~17_combout\,
	sdata => \~GND~combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(1));

-- Location: LCCOMB_X57_Y21_N6
\neco2|citac[2]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[2]~19_combout\ = (\neco2|citac\(2) & (\neco2|citac[1]~18\ $ (GND))) # (!\neco2|citac\(2) & (!\neco2|citac[1]~18\ & VCC))
-- \neco2|citac[2]~20\ = CARRY((\neco2|citac\(2) & !\neco2|citac[1]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|citac\(2),
	datad => VCC,
	cin => \neco2|citac[1]~18\,
	combout => \neco2|citac[2]~19_combout\,
	cout => \neco2|citac[2]~20\);

-- Location: LCCOMB_X57_Y21_N8
\neco2|citac[3]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[3]~21_combout\ = (\neco2|citac\(3) & (!\neco2|citac[2]~20\)) # (!\neco2|citac\(3) & ((\neco2|citac[2]~20\) # (GND)))
-- \neco2|citac[3]~22\ = CARRY((!\neco2|citac[2]~20\) # (!\neco2|citac\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco2|citac\(3),
	datad => VCC,
	cin => \neco2|citac[2]~20\,
	combout => \neco2|citac[3]~21_combout\,
	cout => \neco2|citac[3]~22\);

-- Location: LCFF_X57_Y21_N9
\neco2|citac[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[3]~21_combout\,
	sdata => \~GND~combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(3));

-- Location: LCCOMB_X57_Y21_N12
\neco2|citac[5]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[5]~25_combout\ = (\neco2|citac\(5) & (!\neco2|citac[4]~24\)) # (!\neco2|citac\(5) & ((\neco2|citac[4]~24\) # (GND)))
-- \neco2|citac[5]~26\ = CARRY((!\neco2|citac[4]~24\) # (!\neco2|citac\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|citac\(5),
	datad => VCC,
	cin => \neco2|citac[4]~24\,
	combout => \neco2|citac[5]~25_combout\,
	cout => \neco2|citac[5]~26\);

-- Location: LCCOMB_X57_Y21_N14
\neco2|citac[6]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[6]~27_combout\ = (\neco2|citac\(6) & (\neco2|citac[5]~26\ $ (GND))) # (!\neco2|citac\(6) & (!\neco2|citac[5]~26\ & VCC))
-- \neco2|citac[6]~28\ = CARRY((\neco2|citac\(6) & !\neco2|citac[5]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco2|citac\(6),
	datad => VCC,
	cin => \neco2|citac[5]~26\,
	combout => \neco2|citac[6]~27_combout\,
	cout => \neco2|citac[6]~28\);

-- Location: LCFF_X57_Y21_N15
\neco2|citac[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[6]~27_combout\,
	sdata => \~GND~combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(6));

-- Location: LCCOMB_X57_Y21_N16
\neco2|citac[7]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[7]~29_combout\ = (\neco2|citac\(7) & (!\neco2|citac[6]~28\)) # (!\neco2|citac\(7) & ((\neco2|citac[6]~28\) # (GND)))
-- \neco2|citac[7]~30\ = CARRY((!\neco2|citac[6]~28\) # (!\neco2|citac\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|citac\(7),
	datad => VCC,
	cin => \neco2|citac[6]~28\,
	combout => \neco2|citac[7]~29_combout\,
	cout => \neco2|citac[7]~30\);

-- Location: LCCOMB_X56_Y22_N8
\neco2|delicka~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|delicka~0_combout\ = (\neco2|receiving1~regout\ & !\neco2|receiving2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \neco2|receiving1~regout\,
	datad => \neco2|receiving2~regout\,
	combout => \neco2|delicka~0_combout\);

-- Location: LCFF_X57_Y21_N17
\neco2|citac[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[7]~29_combout\,
	sdata => \neco2|delicka~0_combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(7));

-- Location: LCFF_X57_Y21_N13
\neco2|citac[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[5]~25_combout\,
	sdata => \~GND~combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(5));

-- Location: LCCOMB_X57_Y21_N0
\neco2|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Equal0~1_combout\ = (((\neco2|citac\(7)) # (\neco2|citac\(5))) # (!\neco2|citac\(6))) # (!\neco2|citac\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|citac\(4),
	datab => \neco2|citac\(6),
	datac => \neco2|citac\(7),
	datad => \neco2|citac\(5),
	combout => \neco2|Equal0~1_combout\);

-- Location: LCCOMB_X57_Y21_N18
\neco2|citac[8]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[8]~31_combout\ = (\neco2|citac\(8) & (\neco2|citac[7]~30\ $ (GND))) # (!\neco2|citac\(8) & (!\neco2|citac[7]~30\ & VCC))
-- \neco2|citac[8]~32\ = CARRY((\neco2|citac\(8) & !\neco2|citac[7]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco2|citac\(8),
	datad => VCC,
	cin => \neco2|citac[7]~30\,
	combout => \neco2|citac[8]~31_combout\,
	cout => \neco2|citac[8]~32\);

-- Location: LCFF_X57_Y21_N19
\neco2|citac[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[8]~31_combout\,
	sdata => \neco2|delicka~0_combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(8));

-- Location: LCCOMB_X57_Y21_N20
\neco2|citac[9]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[9]~33_combout\ = (\neco2|citac\(9) & (!\neco2|citac[8]~32\)) # (!\neco2|citac\(9) & ((\neco2|citac[8]~32\) # (GND)))
-- \neco2|citac[9]~34\ = CARRY((!\neco2|citac[8]~32\) # (!\neco2|citac\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|citac\(9),
	datad => VCC,
	cin => \neco2|citac[8]~32\,
	combout => \neco2|citac[9]~33_combout\,
	cout => \neco2|citac[9]~34\);

-- Location: LCCOMB_X57_Y21_N22
\neco2|citac[10]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|citac[10]~35_combout\ = (\neco2|citac\(10) & (\neco2|citac[9]~34\ $ (GND))) # (!\neco2|citac\(10) & (!\neco2|citac[9]~34\ & VCC))
-- \neco2|citac[10]~36\ = CARRY((\neco2|citac\(10) & !\neco2|citac[9]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \neco2|citac\(10),
	datad => VCC,
	cin => \neco2|citac[9]~34\,
	combout => \neco2|citac[10]~35_combout\,
	cout => \neco2|citac[10]~36\);

-- Location: LCFF_X57_Y21_N23
\neco2|citac[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[10]~35_combout\,
	sdata => \neco2|delicka~0_combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(10));

-- Location: LCFF_X57_Y21_N25
\neco2|citac[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[11]~37_combout\,
	sdata => \neco2|delicka~0_combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(11));

-- Location: LCFF_X57_Y21_N21
\neco2|citac[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[9]~33_combout\,
	sdata => \neco2|delicka~0_combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(9));

-- Location: LCCOMB_X56_Y21_N0
\neco2|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Equal0~2_combout\ = ((\neco2|citac\(11)) # ((\neco2|citac\(9)) # (\neco2|citac\(8)))) # (!\neco2|citac\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|citac\(10),
	datab => \neco2|citac\(11),
	datac => \neco2|citac\(9),
	datad => \neco2|citac\(8),
	combout => \neco2|Equal0~2_combout\);

-- Location: LCFF_X57_Y21_N7
\neco2|citac[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|citac[2]~19_combout\,
	sdata => \~GND~combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	sload => \neco2|citac[0]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|citac\(2));

-- Location: LCCOMB_X58_Y21_N24
\neco2|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Equal0~0_combout\ = (\neco2|citac\(0)) # ((\neco2|citac\(2)) # ((\neco2|citac\(1)) # (!\neco2|citac\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|citac\(0),
	datab => \neco2|citac\(2),
	datac => \neco2|citac\(1),
	datad => \neco2|citac\(3),
	combout => \neco2|Equal0~0_combout\);

-- Location: LCCOMB_X57_Y21_N28
\neco2|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Equal0~3_combout\ = ((\neco2|Equal0~1_combout\) # ((\neco2|Equal0~2_combout\) # (\neco2|Equal0~0_combout\))) # (!\neco2|citac\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|citac\(12),
	datab => \neco2|Equal0~1_combout\,
	datac => \neco2|Equal0~2_combout\,
	datad => \neco2|Equal0~0_combout\,
	combout => \neco2|Equal0~3_combout\);

-- Location: LCCOMB_X56_Y22_N24
\neco2|clockstate~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|clockstate~2_combout\ = (!\neco2|clockstate~regout\ & (!\neco2|Equal0~3_combout\ & ((\neco2|receiving2~regout\) # (!\neco2|receiving1~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|receiving2~regout\,
	datab => \neco2|receiving1~regout\,
	datac => \neco2|clockstate~regout\,
	datad => \neco2|Equal0~3_combout\,
	combout => \neco2|clockstate~2_combout\);

-- Location: LCFF_X56_Y22_N25
\neco2|clockstate\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|clockstate~2_combout\,
	aclr => \neco2|delicka~1clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|clockstate~regout\);

-- Location: LCCOMB_X51_Y22_N20
\neco2|bitocet[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|bitocet[1]~1_combout\ = \neco2|bitocet\(1) $ (((\neco2|receiving2~regout\ & (\neco2|bitocet\(0) & \neco2|clockstate~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|receiving2~regout\,
	datab => \neco2|bitocet\(0),
	datac => \neco2|bitocet\(1),
	datad => \neco2|clockstate~regout\,
	combout => \neco2|bitocet[1]~1_combout\);

-- Location: LCFF_X51_Y22_N21
\neco2|bitocet[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|bitocet[1]~1_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|bitocet\(1));

-- Location: LCCOMB_X51_Y22_N26
\neco2|bitocet~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|bitocet~0_combout\ = (!\neco2|bitocet\(0) & (((\neco2|bitocet\(2)) # (\neco2|bitocet\(1))) # (!\neco2|bitocet\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|bitocet\(3),
	datab => \neco2|bitocet\(2),
	datac => \neco2|bitocet\(0),
	datad => \neco2|bitocet\(1),
	combout => \neco2|bitocet~0_combout\);

-- Location: LCCOMB_X56_Y22_N20
\neco2|prijimac~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|prijimac~0_combout\ = (\neco2|clockstate~regout\ & \neco2|receiving2~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \neco2|clockstate~regout\,
	datad => \neco2|receiving2~regout\,
	combout => \neco2|prijimac~0_combout\);

-- Location: LCFF_X51_Y22_N27
\neco2|bitocet[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|bitocet~0_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	ena => \neco2|prijimac~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|bitocet\(0));

-- Location: LCCOMB_X51_Y22_N16
\neco2|bitocet[2]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|bitocet[2]~3_combout\ = \neco2|bitocet\(2) $ (((\neco2|bitocet\(1) & (\neco2|bitocet\(0) & \neco2|prijimac~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|bitocet\(1),
	datab => \neco2|bitocet\(0),
	datac => \neco2|bitocet\(2),
	datad => \neco2|prijimac~0_combout\,
	combout => \neco2|bitocet[2]~3_combout\);

-- Location: LCFF_X51_Y22_N17
\neco2|bitocet[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|bitocet[2]~3_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|bitocet\(2));

-- Location: LCCOMB_X51_Y22_N14
\neco2|bitocet~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|bitocet~2_combout\ = (\neco2|bitocet\(1) & (\neco2|bitocet\(3) $ (((\neco2|bitocet\(2) & \neco2|bitocet\(0)))))) # (!\neco2|bitocet\(1) & (\neco2|bitocet\(3) & ((\neco2|bitocet\(2)) # (\neco2|bitocet\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|bitocet\(1),
	datab => \neco2|bitocet\(2),
	datac => \neco2|bitocet\(3),
	datad => \neco2|bitocet\(0),
	combout => \neco2|bitocet~2_combout\);

-- Location: LCFF_X51_Y22_N15
\neco2|bitocet[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|bitocet~2_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	ena => \neco2|prijimac~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|bitocet\(3));

-- Location: LCCOMB_X51_Y22_N10
\neco2|Equal1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Equal1~0_combout\ = (!\neco2|bitocet\(2) & (\neco2|bitocet\(3) & (!\neco2|bitocet\(1) & !\neco2|bitocet\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|bitocet\(2),
	datab => \neco2|bitocet\(3),
	datac => \neco2|bitocet\(1),
	datad => \neco2|bitocet\(0),
	combout => \neco2|Equal1~0_combout\);

-- Location: LCCOMB_X56_Y22_N2
\neco2|receive~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|receive~2_combout\ = (\neco2|receiving2~regout\ & (\neco2|clockstate~regout\ & \neco2|Equal1~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \neco2|receiving2~regout\,
	datac => \neco2|clockstate~regout\,
	datad => \neco2|Equal1~0_combout\,
	combout => \neco2|receive~2_combout\);

-- Location: LCCOMB_X64_Y19_N30
\neco2|receive~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|receive~feeder_combout\ = \neco2|receive~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \neco2|receive~2_combout\,
	combout => \neco2|receive~feeder_combout\);

-- Location: LCFF_X64_Y19_N31
\neco2|receive\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~combout\,
	datain => \neco2|receive~feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|receive~regout\);

-- Location: CLKCTRL_G5
\neco2|receive~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \neco2|receive~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \neco2|receive~clkctrl_outclk\);

-- Location: PIN_C25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rx~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rx,
	combout => \rx~combout\);

-- Location: LCCOMB_X51_Y22_N12
\neco2|Decoder0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Decoder0~0_combout\ = (!\neco2|bitocet\(2) & (\neco2|receiving2~regout\ & \neco2|clockstate~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \neco2|bitocet\(2),
	datac => \neco2|receiving2~regout\,
	datad => \neco2|clockstate~regout\,
	combout => \neco2|Decoder0~0_combout\);

-- Location: LCCOMB_X51_Y22_N30
\neco2|Decoder0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Decoder0~1_combout\ = (!\neco2|Equal1~0_combout\ & (!\neco2|bitocet\(0) & (!\neco2|bitocet\(1) & \neco2|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|Equal1~0_combout\,
	datab => \neco2|bitocet\(0),
	datac => \neco2|bitocet\(1),
	datad => \neco2|Decoder0~0_combout\,
	combout => \neco2|Decoder0~1_combout\);

-- Location: LCCOMB_X50_Y22_N22
\neco2|data[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|data[0]~0_combout\ = (\neco2|Decoder0~1_combout\ & (\rx~combout\)) # (!\neco2|Decoder0~1_combout\ & ((\neco2|data\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rx~combout\,
	datac => \neco2|data\(0),
	datad => \neco2|Decoder0~1_combout\,
	combout => \neco2|data[0]~0_combout\);

-- Location: LCFF_X50_Y22_N23
\neco2|data[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|data[0]~0_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|data\(0));

-- Location: LCCOMB_X50_Y22_N8
\led[0]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \led[0]~reg0feeder_combout\ = \neco2|data\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \neco2|data\(0),
	combout => \led[0]~reg0feeder_combout\);

-- Location: LCFF_X50_Y22_N9
\led[0]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \neco2|receive~clkctrl_outclk\,
	datain => \led[0]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[0]~reg0_regout\);

-- Location: LCCOMB_X51_Y22_N24
\neco2|Decoder0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Decoder0~2_combout\ = (!\neco2|Equal1~0_combout\ & (\neco2|bitocet\(0) & (!\neco2|bitocet\(1) & \neco2|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|Equal1~0_combout\,
	datab => \neco2|bitocet\(0),
	datac => \neco2|bitocet\(1),
	datad => \neco2|Decoder0~0_combout\,
	combout => \neco2|Decoder0~2_combout\);

-- Location: LCCOMB_X50_Y22_N0
\neco2|data[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|data[1]~1_combout\ = (\neco2|Decoder0~2_combout\ & (\rx~combout\)) # (!\neco2|Decoder0~2_combout\ & ((\neco2|data\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rx~combout\,
	datac => \neco2|data\(1),
	datad => \neco2|Decoder0~2_combout\,
	combout => \neco2|data[1]~1_combout\);

-- Location: LCFF_X50_Y22_N1
\neco2|data[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|data[1]~1_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|data\(1));

-- Location: LCCOMB_X50_Y22_N26
\led[1]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \led[1]~reg0feeder_combout\ = \neco2|data\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \neco2|data\(1),
	combout => \led[1]~reg0feeder_combout\);

-- Location: LCFF_X50_Y22_N27
\led[1]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \neco2|receive~clkctrl_outclk\,
	datain => \led[1]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[1]~reg0_regout\);

-- Location: LCCOMB_X51_Y22_N18
\neco2|Decoder0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Decoder0~3_combout\ = (!\neco2|Equal1~0_combout\ & (!\neco2|bitocet\(0) & (\neco2|bitocet\(1) & \neco2|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|Equal1~0_combout\,
	datab => \neco2|bitocet\(0),
	datac => \neco2|bitocet\(1),
	datad => \neco2|Decoder0~0_combout\,
	combout => \neco2|Decoder0~3_combout\);

-- Location: LCCOMB_X50_Y22_N10
\neco2|data[2]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|data[2]~2_combout\ = (\neco2|Decoder0~3_combout\ & (\rx~combout\)) # (!\neco2|Decoder0~3_combout\ & ((\neco2|data\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rx~combout\,
	datac => \neco2|data\(2),
	datad => \neco2|Decoder0~3_combout\,
	combout => \neco2|data[2]~2_combout\);

-- Location: LCFF_X50_Y22_N11
\neco2|data[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|data[2]~2_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|data\(2));

-- Location: LCCOMB_X50_Y22_N20
\led[2]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \led[2]~reg0feeder_combout\ = \neco2|data\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \neco2|data\(2),
	combout => \led[2]~reg0feeder_combout\);

-- Location: LCFF_X50_Y22_N21
\led[2]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \neco2|receive~clkctrl_outclk\,
	datain => \led[2]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[2]~reg0_regout\);

-- Location: LCCOMB_X51_Y22_N4
\neco2|Decoder0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Decoder0~4_combout\ = (!\neco2|Equal1~0_combout\ & (\neco2|bitocet\(0) & (\neco2|bitocet\(1) & \neco2|Decoder0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|Equal1~0_combout\,
	datab => \neco2|bitocet\(0),
	datac => \neco2|bitocet\(1),
	datad => \neco2|Decoder0~0_combout\,
	combout => \neco2|Decoder0~4_combout\);

-- Location: LCCOMB_X50_Y22_N12
\neco2|data[3]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|data[3]~3_combout\ = (\neco2|Decoder0~4_combout\ & (\rx~combout\)) # (!\neco2|Decoder0~4_combout\ & ((\neco2|data\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rx~combout\,
	datac => \neco2|data\(3),
	datad => \neco2|Decoder0~4_combout\,
	combout => \neco2|data[3]~3_combout\);

-- Location: LCFF_X50_Y22_N13
\neco2|data[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|data[3]~3_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|data\(3));

-- Location: LCCOMB_X50_Y22_N6
\led[3]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \led[3]~reg0feeder_combout\ = \neco2|data\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \neco2|data\(3),
	combout => \led[3]~reg0feeder_combout\);

-- Location: LCFF_X50_Y22_N7
\led[3]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \neco2|receive~clkctrl_outclk\,
	datain => \led[3]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[3]~reg0_regout\);

-- Location: LCCOMB_X51_Y22_N22
\neco2|Decoder0~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Decoder0~5_combout\ = (\neco2|bitocet\(2) & (\neco2|receiving2~regout\ & \neco2|clockstate~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \neco2|bitocet\(2),
	datac => \neco2|receiving2~regout\,
	datad => \neco2|clockstate~regout\,
	combout => \neco2|Decoder0~5_combout\);

-- Location: LCCOMB_X51_Y22_N0
\neco2|Decoder0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Decoder0~6_combout\ = (!\neco2|Equal1~0_combout\ & (!\neco2|bitocet\(0) & (!\neco2|bitocet\(1) & \neco2|Decoder0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|Equal1~0_combout\,
	datab => \neco2|bitocet\(0),
	datac => \neco2|bitocet\(1),
	datad => \neco2|Decoder0~5_combout\,
	combout => \neco2|Decoder0~6_combout\);

-- Location: LCCOMB_X50_Y22_N30
\neco2|data[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|data[4]~4_combout\ = (\neco2|Decoder0~6_combout\ & ((\rx~combout\))) # (!\neco2|Decoder0~6_combout\ & (\neco2|data\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \neco2|Decoder0~6_combout\,
	datac => \neco2|data\(4),
	datad => \rx~combout\,
	combout => \neco2|data[4]~4_combout\);

-- Location: LCFF_X50_Y22_N31
\neco2|data[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|data[4]~4_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|data\(4));

-- Location: LCCOMB_X50_Y22_N16
\led[4]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \led[4]~reg0feeder_combout\ = \neco2|data\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \neco2|data\(4),
	combout => \led[4]~reg0feeder_combout\);

-- Location: LCFF_X50_Y22_N17
\led[4]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \neco2|receive~clkctrl_outclk\,
	datain => \led[4]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[4]~reg0_regout\);

-- Location: LCCOMB_X51_Y22_N2
\neco2|Decoder0~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Decoder0~7_combout\ = (!\neco2|Equal1~0_combout\ & (\neco2|bitocet\(0) & (!\neco2|bitocet\(1) & \neco2|Decoder0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|Equal1~0_combout\,
	datab => \neco2|bitocet\(0),
	datac => \neco2|bitocet\(1),
	datad => \neco2|Decoder0~5_combout\,
	combout => \neco2|Decoder0~7_combout\);

-- Location: LCCOMB_X50_Y22_N24
\neco2|data[5]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|data[5]~5_combout\ = (\neco2|Decoder0~7_combout\ & (\rx~combout\)) # (!\neco2|Decoder0~7_combout\ & ((\neco2|data\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rx~combout\,
	datac => \neco2|data\(5),
	datad => \neco2|Decoder0~7_combout\,
	combout => \neco2|data[5]~5_combout\);

-- Location: LCFF_X50_Y22_N25
\neco2|data[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|data[5]~5_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|data\(5));

-- Location: LCFF_X50_Y22_N19
\led[5]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \neco2|receive~clkctrl_outclk\,
	sdata => \neco2|data\(5),
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[5]~reg0_regout\);

-- Location: LCCOMB_X51_Y22_N28
\neco2|Decoder0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Decoder0~8_combout\ = (!\neco2|Equal1~0_combout\ & (!\neco2|bitocet\(0) & (\neco2|bitocet\(1) & \neco2|Decoder0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|Equal1~0_combout\,
	datab => \neco2|bitocet\(0),
	datac => \neco2|bitocet\(1),
	datad => \neco2|Decoder0~5_combout\,
	combout => \neco2|Decoder0~8_combout\);

-- Location: LCCOMB_X50_Y22_N2
\neco2|data[6]~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|data[6]~6_combout\ = (\neco2|Decoder0~8_combout\ & (\rx~combout\)) # (!\neco2|Decoder0~8_combout\ & ((\neco2|data\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \rx~combout\,
	datac => \neco2|data\(6),
	datad => \neco2|Decoder0~8_combout\,
	combout => \neco2|data[6]~6_combout\);

-- Location: LCFF_X50_Y22_N3
\neco2|data[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|data[6]~6_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|data\(6));

-- Location: LCCOMB_X50_Y22_N4
\led[6]~reg0feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \led[6]~reg0feeder_combout\ = \neco2|data\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \neco2|data\(6),
	combout => \led[6]~reg0feeder_combout\);

-- Location: LCFF_X50_Y22_N5
\led[6]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \neco2|receive~clkctrl_outclk\,
	datain => \led[6]~reg0feeder_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[6]~reg0_regout\);

-- Location: LCCOMB_X51_Y22_N6
\neco2|Decoder0~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|Decoder0~9_combout\ = (!\neco2|Equal1~0_combout\ & (\neco2|bitocet\(0) & (\neco2|bitocet\(1) & \neco2|Decoder0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \neco2|Equal1~0_combout\,
	datab => \neco2|bitocet\(0),
	datac => \neco2|bitocet\(1),
	datad => \neco2|Decoder0~5_combout\,
	combout => \neco2|Decoder0~9_combout\);

-- Location: LCCOMB_X51_Y22_N8
\neco2|data[7]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \neco2|data[7]~7_combout\ = (\neco2|Decoder0~9_combout\ & (\rx~combout\)) # (!\neco2|Decoder0~9_combout\ & ((\neco2|data\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rx~combout\,
	datac => \neco2|data\(7),
	datad => \neco2|Decoder0~9_combout\,
	combout => \neco2|data[7]~7_combout\);

-- Location: LCFF_X51_Y22_N9
\neco2|data[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clock~clkctrl_outclk\,
	datain => \neco2|data[7]~7_combout\,
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \neco2|data\(7));

-- Location: LCFF_X53_Y22_N25
\led[7]~reg0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \neco2|receive~clkctrl_outclk\,
	sdata => \neco2|data\(7),
	aclr => \ALT_INV_reset~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \led[7]~reg0_regout\);

-- Location: PIN_B25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\tx~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \neco|ALT_INV_tx~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_tx);

-- Location: PIN_AE22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[0]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(0));

-- Location: PIN_AF22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[1]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(1));

-- Location: PIN_W19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[2]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(2));

-- Location: PIN_V18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[3]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(3));

-- Location: PIN_U18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[4]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(4));

-- Location: PIN_U17,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[5]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(5));

-- Location: PIN_AA20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[6]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(6));

-- Location: PIN_Y18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \led[7]~reg0_regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led(7));
END structure;


