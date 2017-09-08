-- Copyright (C) 1991-2012 Altera Corporation
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
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 12.0 Build 232 07/05/2012 Service Pack 1 SJ Web Edition"

-- DATE "01/12/2014 19:32:08"

-- 
-- Device: Altera EP3C5E144C8 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIII;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIII.CYCLONEIII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ex17 IS
    PORT (
	clk : IN std_logic;
	rst_n : IN std_logic;
	lcd_en : OUT std_logic;
	lcd_clk : OUT std_logic;
	lcd_hsy : OUT std_logic;
	lcd_vsy : OUT std_logic;
	lcd_db_r : OUT std_logic_vector(4 DOWNTO 0);
	lcd_db_g : OUT std_logic_vector(5 DOWNTO 0);
	lcd_db_b : OUT std_logic_vector(4 DOWNTO 0)
	);
END ex17;

-- Design Ports Information
-- lcd_en	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_clk	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_hsy	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_vsy	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_r[0]	=>  Location: PIN_70,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_r[1]	=>  Location: PIN_69,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_r[2]	=>  Location: PIN_68,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_r[3]	=>  Location: PIN_67,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_r[4]	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_g[0]	=>  Location: PIN_76,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_g[1]	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_g[2]	=>  Location: PIN_74,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_g[3]	=>  Location: PIN_73,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_g[4]	=>  Location: PIN_72,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_g[5]	=>  Location: PIN_71,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_b[0]	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_b[1]	=>  Location: PIN_83,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_b[2]	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_b[3]	=>  Location: PIN_79,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- lcd_db_b[4]	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst_n	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ex17 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst_n : std_logic;
SIGNAL ww_lcd_en : std_logic;
SIGNAL ww_lcd_clk : std_logic;
SIGNAL ww_lcd_hsy : std_logic;
SIGNAL ww_lcd_vsy : std_logic;
SIGNAL ww_lcd_db_r : std_logic_vector(4 DOWNTO 0);
SIGNAL ww_lcd_db_g : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_lcd_db_b : std_logic_vector(4 DOWNTO 0);
SIGNAL \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \rst_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \uut_lcd_driver|tmp_cnt[2]~9_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Equal4~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~17_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~18_combout\ : std_logic;
SIGNAL \uut_lcd_driver|always9~6_combout\ : std_logic;
SIGNAL \uut_lcd_driver|valid_yr~q\ : std_logic;
SIGNAL \uut_lcd_driver|always4~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|tmp_cnt[4]~11_combout\ : std_logic;
SIGNAL \uut_lcd_driver|valid_yr~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|valid_yr~1_combout\ : std_logic;
SIGNAL \lcd_en~output_o\ : std_logic;
SIGNAL \lcd_clk~output_o\ : std_logic;
SIGNAL \lcd_hsy~output_o\ : std_logic;
SIGNAL \lcd_vsy~output_o\ : std_logic;
SIGNAL \lcd_db_r[0]~output_o\ : std_logic;
SIGNAL \lcd_db_r[1]~output_o\ : std_logic;
SIGNAL \lcd_db_r[2]~output_o\ : std_logic;
SIGNAL \lcd_db_r[3]~output_o\ : std_logic;
SIGNAL \lcd_db_r[4]~output_o\ : std_logic;
SIGNAL \lcd_db_g[0]~output_o\ : std_logic;
SIGNAL \lcd_db_g[1]~output_o\ : std_logic;
SIGNAL \lcd_db_g[2]~output_o\ : std_logic;
SIGNAL \lcd_db_g[3]~output_o\ : std_logic;
SIGNAL \lcd_db_g[4]~output_o\ : std_logic;
SIGNAL \lcd_db_g[5]~output_o\ : std_logic;
SIGNAL \lcd_db_b[0]~output_o\ : std_logic;
SIGNAL \lcd_db_b[1]~output_o\ : std_logic;
SIGNAL \lcd_db_b[2]~output_o\ : std_logic;
SIGNAL \lcd_db_b[3]~output_o\ : std_logic;
SIGNAL \lcd_db_b[4]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \uut_lcd_driver|sft_cnt[0]~1_combout\ : std_logic;
SIGNAL \rst_n~input_o\ : std_logic;
SIGNAL \rst_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \uut_lcd_driver|sft_cnt[1]~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Equal0~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~1\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~3\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~5\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~7\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~9\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~10_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~11\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~12_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_hsy_r~2_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~4_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~13\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~15\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~16_combout\ : std_logic;
SIGNAL \uut_lcd_driver|x_cnt~2_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Equal1~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Equal1~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~8_combout\ : std_logic;
SIGNAL \uut_lcd_driver|x_cnt~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~14_combout\ : std_logic;
SIGNAL \uut_lcd_driver|x_cnt~3_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_hsy_r~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~6_combout\ : std_logic;
SIGNAL \uut_lcd_driver|x_cnt~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_hsy_r~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_hsy_r~3_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_hsy_r~q\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|always2~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~1\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~2_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~3\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~4_combout\ : std_logic;
SIGNAL \uut_lcd_driver|y_cnt~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Equal2~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|y_cnt~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~5\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~6_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~7\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~9\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~11\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~13\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~14_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~12_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Equal3~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~15\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~16_combout\ : std_logic;
SIGNAL \uut_lcd_driver|y_cnt~2_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Equal3~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_vsy_r~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_vsy_r~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_vsy_r~q\ : std_logic;
SIGNAL \uut_lcd_driver|tmp_cnt[0]~6\ : std_logic;
SIGNAL \uut_lcd_driver|tmp_cnt[1]~7_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Equal7~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Equal7~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|always4~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|validr~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|validr~q\ : std_logic;
SIGNAL \uut_lcd_driver|tmp_cnt[4]~12_combout\ : std_logic;
SIGNAL \uut_lcd_driver|tmp_cnt[4]~13_combout\ : std_logic;
SIGNAL \uut_lcd_driver|tmp_cnt[1]~8\ : std_logic;
SIGNAL \uut_lcd_driver|tmp_cnt[2]~10\ : std_logic;
SIGNAL \uut_lcd_driver|tmp_cnt[3]~14_combout\ : std_logic;
SIGNAL \uut_lcd_driver|tmp_cnt[3]~15\ : std_logic;
SIGNAL \uut_lcd_driver|tmp_cnt[4]~16_combout\ : std_logic;
SIGNAL \uut_lcd_driver|tmp_cnt[0]~5_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \uut_lcd_driver|y_cnt[1]~_wirecell_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add3~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add3~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~8_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add3~2_combout\ : std_logic;
SIGNAL \uut_lcd_driver|LessThan2~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add2~10_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add3~3_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~2_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~3_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~4_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~5_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~6_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~7_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~8_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~9_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~10_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~11_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~14_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~15_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~12_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~13_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~16_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Mux0~19_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_db_rgb~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|Add1~2_combout\ : std_logic;
SIGNAL \uut_lcd_driver|LessThan4~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|always9~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|always9~3_combout\ : std_logic;
SIGNAL \uut_lcd_driver|always9~4_combout\ : std_logic;
SIGNAL \uut_lcd_driver|always9~5_combout\ : std_logic;
SIGNAL \uut_lcd_driver|always9~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|always9~2_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_db_rgb[15]~1_combout\ : std_logic;
SIGNAL \uut_lcd_driver|valid~feeder_combout\ : std_logic;
SIGNAL \uut_lcd_driver|valid~q\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_db_r[0]~0_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_db_rgb~2_combout\ : std_logic;
SIGNAL \uut_lcd_driver|lcd_db_b[0]~0_combout\ : std_logic;
SIGNAL \myram_inst|altsyncram_component|auto_generated|q_a\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \uut_lcd_driver|y_cnt\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \uut_lcd_driver|x_cnt\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \uut_lcd_driver|tmp_cnt\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \uut_lcd_driver|sft_cnt\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \uut_lcd_driver|lcd_db_rgb\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \uut_lcd_driver|ALT_INV_validr~q\ : std_logic;
SIGNAL \uut_lcd_driver|ALT_INV_lcd_vsy_r~q\ : std_logic;
SIGNAL \uut_lcd_driver|ALT_INV_lcd_hsy_r~q\ : std_logic;

BEGIN

ww_clk <= clk;
ww_rst_n <= rst_n;
lcd_en <= ww_lcd_en;
lcd_clk <= ww_lcd_clk;
lcd_hsy <= ww_lcd_hsy;
lcd_vsy <= ww_lcd_vsy;
lcd_db_r <= ww_lcd_db_r;
lcd_db_g <= ww_lcd_db_g;
lcd_db_b <= ww_lcd_db_b;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & 
\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\ <= (\uut_lcd_driver|Add3~3_combout\ & \uut_lcd_driver|Add3~2_combout\ & \uut_lcd_driver|Add3~1_combout\ & \uut_lcd_driver|Add3~0_combout\ & 
\uut_lcd_driver|y_cnt[1]~_wirecell_combout\ & \uut_lcd_driver|y_cnt\(0));

\myram_inst|altsyncram_component|auto_generated|q_a\(16) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(0);
\myram_inst|altsyncram_component|auto_generated|q_a\(17) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(1);
\myram_inst|altsyncram_component|auto_generated|q_a\(18) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(2);
\myram_inst|altsyncram_component|auto_generated|q_a\(20) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(3);
\myram_inst|altsyncram_component|auto_generated|q_a\(21) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(4);
\myram_inst|altsyncram_component|auto_generated|q_a\(22) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(5);
\myram_inst|altsyncram_component|auto_generated|q_a\(23) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(6);
\myram_inst|altsyncram_component|auto_generated|q_a\(24) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(7);
\myram_inst|altsyncram_component|auto_generated|q_a\(25) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(8);
\myram_inst|altsyncram_component|auto_generated|q_a\(26) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(9);
\myram_inst|altsyncram_component|auto_generated|q_a\(27) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(10);
\myram_inst|altsyncram_component|auto_generated|q_a\(28) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(11);
\myram_inst|altsyncram_component|auto_generated|q_a\(29) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(12);
\myram_inst|altsyncram_component|auto_generated|q_a\(30) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\(13);

\myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & 
\~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\ & \~GND~combout\);

\myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\uut_lcd_driver|Add3~3_combout\ & \uut_lcd_driver|Add3~2_combout\ & \uut_lcd_driver|Add3~1_combout\ & \uut_lcd_driver|Add3~0_combout\ & 
\uut_lcd_driver|y_cnt[1]~_wirecell_combout\ & \uut_lcd_driver|y_cnt\(0));

\myram_inst|altsyncram_component|auto_generated|q_a\(0) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\myram_inst|altsyncram_component|auto_generated|q_a\(1) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\myram_inst|altsyncram_component|auto_generated|q_a\(2) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\myram_inst|altsyncram_component|auto_generated|q_a\(3) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\myram_inst|altsyncram_component|auto_generated|q_a\(4) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\myram_inst|altsyncram_component|auto_generated|q_a\(5) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\myram_inst|altsyncram_component|auto_generated|q_a\(6) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\myram_inst|altsyncram_component|auto_generated|q_a\(7) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);
\myram_inst|altsyncram_component|auto_generated|q_a\(8) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(8);
\myram_inst|altsyncram_component|auto_generated|q_a\(9) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(9);
\myram_inst|altsyncram_component|auto_generated|q_a\(10) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(10);
\myram_inst|altsyncram_component|auto_generated|q_a\(11) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(11);
\myram_inst|altsyncram_component|auto_generated|q_a\(12) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(12);
\myram_inst|altsyncram_component|auto_generated|q_a\(13) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(13);
\myram_inst|altsyncram_component|auto_generated|q_a\(14) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(14);
\myram_inst|altsyncram_component|auto_generated|q_a\(15) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(15);
\myram_inst|altsyncram_component|auto_generated|q_a\(19) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(16);
\myram_inst|altsyncram_component|auto_generated|q_a\(31) <= \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(17);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);

\rst_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \rst_n~input_o\);
\uut_lcd_driver|ALT_INV_validr~q\ <= NOT \uut_lcd_driver|validr~q\;
\uut_lcd_driver|ALT_INV_lcd_vsy_r~q\ <= NOT \uut_lcd_driver|lcd_vsy_r~q\;
\uut_lcd_driver|ALT_INV_lcd_hsy_r~q\ <= NOT \uut_lcd_driver|lcd_hsy_r~q\;

-- Location: FF_X29_Y3_N7
\uut_lcd_driver|tmp_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|tmp_cnt[2]~9_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	sclr => \uut_lcd_driver|ALT_INV_validr~q\,
	ena => \uut_lcd_driver|tmp_cnt[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|tmp_cnt\(2));

-- Location: M9K_X27_Y3_N0
\myram_inst|altsyncram_component|auto_generated|ram_block1a16\ : cycloneiii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"0000000000000000000000000000000000000000000000FF803FE003E00070001C00030000C00030000E0001800060001800070000C00030000C0003FC007F001800060001C00030000C00030000E000180006000180006000080002000080002000040001000040001000060001C00070001C00030000C0000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "myram_init.mif",
	init_file_layout => "port_a",
	logical_ram_name => "myram:myram_inst|altsyncram:altsyncram_component|altsyncram_loj1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 16,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_width => 6,
	port_b_data_width => 18,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	portadatain => \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAIN_bus\,
	portaaddr => \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \myram_inst|altsyncram_component|auto_generated|ram_block1a16_PORTADATAOUT_bus\);

-- Location: M9K_X27_Y3_N0
\myram_inst|altsyncram_component|auto_generated|ram_block1a0\ : cycloneiii_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init0 => X"00000000000000000000000000000000000000000000003FF80FFE007E001F00078001E00078003E000F0003C000F0007C001E00078001E000F807FC01FF0003C000F00038001E00078001E00070003C000F0003C000F00178005E00178005E001F0007C001F0007C000E00038000E00038000C00030000C000000000000000000000000000000000000000000000000",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "myram_init.mif",
	init_file_layout => "port_a",
	logical_ram_name => "myram:myram_inst|altsyncram:altsyncram_component|altsyncram_loj1:auto_generated|ALTSYNCRAM",
	operation_mode => "single_port",
	port_a_address_clear => "none",
	port_a_address_width => 6,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "clock0",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 63,
	port_a_logical_ram_depth => 64,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_width => 6,
	port_b_data_width => 18,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => GND,
	portare => VCC,
	clk0 => \clk~inputclkctrl_outclk\,
	portadatain => \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \myram_inst|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X29_Y3_N6
\uut_lcd_driver|tmp_cnt[2]~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|tmp_cnt[2]~9_combout\ = (\uut_lcd_driver|tmp_cnt\(2) & (\uut_lcd_driver|tmp_cnt[1]~8\ $ (GND))) # (!\uut_lcd_driver|tmp_cnt\(2) & (!\uut_lcd_driver|tmp_cnt[1]~8\ & VCC))
-- \uut_lcd_driver|tmp_cnt[2]~10\ = CARRY((\uut_lcd_driver|tmp_cnt\(2) & !\uut_lcd_driver|tmp_cnt[1]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(2),
	datad => VCC,
	cin => \uut_lcd_driver|tmp_cnt[1]~8\,
	combout => \uut_lcd_driver|tmp_cnt[2]~9_combout\,
	cout => \uut_lcd_driver|tmp_cnt[2]~10\);

-- Location: LCCOMB_X26_Y2_N6
\uut_lcd_driver|Equal4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Equal4~0_combout\ = (!\uut_lcd_driver|y_cnt\(4) & (!\uut_lcd_driver|y_cnt\(2) & (!\uut_lcd_driver|y_cnt\(0) & \uut_lcd_driver|Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(4),
	datab => \uut_lcd_driver|y_cnt\(2),
	datac => \uut_lcd_driver|y_cnt\(0),
	datad => \uut_lcd_driver|Equal3~0_combout\,
	combout => \uut_lcd_driver|Equal4~0_combout\);

-- Location: LCCOMB_X29_Y3_N26
\uut_lcd_driver|Mux0~17\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~17_combout\ = (\uut_lcd_driver|tmp_cnt\(0) & (\uut_lcd_driver|tmp_cnt\(1))) # (!\uut_lcd_driver|tmp_cnt\(0) & ((\uut_lcd_driver|tmp_cnt\(1) & (\myram_inst|altsyncram_component|auto_generated|q_a\(14))) # (!\uut_lcd_driver|tmp_cnt\(1) 
-- & ((\myram_inst|altsyncram_component|auto_generated|q_a\(12))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(0),
	datab => \uut_lcd_driver|tmp_cnt\(1),
	datac => \myram_inst|altsyncram_component|auto_generated|q_a\(14),
	datad => \myram_inst|altsyncram_component|auto_generated|q_a\(12),
	combout => \uut_lcd_driver|Mux0~17_combout\);

-- Location: LCCOMB_X28_Y3_N22
\uut_lcd_driver|Mux0~18\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~18_combout\ = (\uut_lcd_driver|tmp_cnt\(0) & ((\uut_lcd_driver|Mux0~17_combout\ & (\myram_inst|altsyncram_component|auto_generated|q_a\(15))) # (!\uut_lcd_driver|Mux0~17_combout\ & 
-- ((\myram_inst|altsyncram_component|auto_generated|q_a\(13)))))) # (!\uut_lcd_driver|tmp_cnt\(0) & (((\uut_lcd_driver|Mux0~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myram_inst|altsyncram_component|auto_generated|q_a\(15),
	datab => \myram_inst|altsyncram_component|auto_generated|q_a\(13),
	datac => \uut_lcd_driver|tmp_cnt\(0),
	datad => \uut_lcd_driver|Mux0~17_combout\,
	combout => \uut_lcd_driver|Mux0~18_combout\);

-- Location: LCCOMB_X29_Y2_N16
\uut_lcd_driver|always9~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|always9~6_combout\ = (\uut_lcd_driver|always9~5_combout\ & (\uut_lcd_driver|always9~2_combout\ & \uut_lcd_driver|always9~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|always9~5_combout\,
	datac => \uut_lcd_driver|always9~2_combout\,
	datad => \uut_lcd_driver|always9~0_combout\,
	combout => \uut_lcd_driver|always9~6_combout\);

-- Location: FF_X26_Y2_N3
\uut_lcd_driver|valid_yr\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|valid_yr~1_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|valid_yr~q\);

-- Location: LCCOMB_X26_Y2_N12
\uut_lcd_driver|always4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|always4~0_combout\ = (\uut_lcd_driver|x_cnt\(1) & (\uut_lcd_driver|valid_yr~q\ & (\uut_lcd_driver|x_cnt\(0) & \uut_lcd_driver|x_cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(1),
	datab => \uut_lcd_driver|valid_yr~q\,
	datac => \uut_lcd_driver|x_cnt\(0),
	datad => \uut_lcd_driver|x_cnt\(6),
	combout => \uut_lcd_driver|always4~0_combout\);

-- Location: LCCOMB_X29_Y2_N18
\uut_lcd_driver|tmp_cnt[4]~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|tmp_cnt[4]~11_combout\ = (\uut_lcd_driver|x_cnt\(4) & ((\uut_lcd_driver|x_cnt\(1)) # ((\uut_lcd_driver|x_cnt\(2)) # (\uut_lcd_driver|x_cnt\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(4),
	datab => \uut_lcd_driver|x_cnt\(1),
	datac => \uut_lcd_driver|x_cnt\(2),
	datad => \uut_lcd_driver|x_cnt\(3),
	combout => \uut_lcd_driver|tmp_cnt[4]~11_combout\);

-- Location: LCCOMB_X26_Y2_N28
\uut_lcd_driver|valid_yr~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|valid_yr~0_combout\ = (\uut_lcd_driver|valid_yr~q\ & (((!\uut_lcd_driver|Equal4~0_combout\) # (!\uut_lcd_driver|y_cnt\(1))) # (!\uut_lcd_driver|y_cnt\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(8),
	datab => \uut_lcd_driver|valid_yr~q\,
	datac => \uut_lcd_driver|y_cnt\(1),
	datad => \uut_lcd_driver|Equal4~0_combout\,
	combout => \uut_lcd_driver|valid_yr~0_combout\);

-- Location: LCCOMB_X26_Y2_N2
\uut_lcd_driver|valid_yr~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|valid_yr~1_combout\ = (\uut_lcd_driver|valid_yr~0_combout\) # ((\uut_lcd_driver|Equal3~1_combout\ & (\uut_lcd_driver|y_cnt\(4) & !\uut_lcd_driver|y_cnt\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|Equal3~1_combout\,
	datab => \uut_lcd_driver|y_cnt\(4),
	datac => \uut_lcd_driver|y_cnt\(0),
	datad => \uut_lcd_driver|valid_yr~0_combout\,
	combout => \uut_lcd_driver|valid_yr~1_combout\);

-- Location: IOOBUF_X34_Y9_N9
\lcd_en~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \lcd_en~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\lcd_clk~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|sft_cnt\(1),
	devoe => ww_devoe,
	o => \lcd_clk~output_o\);

-- Location: IOOBUF_X28_Y0_N23
\lcd_hsy~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|ALT_INV_lcd_hsy_r~q\,
	devoe => ww_devoe,
	o => \lcd_hsy~output_o\);

-- Location: IOOBUF_X25_Y0_N2
\lcd_vsy~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|ALT_INV_lcd_vsy_r~q\,
	devoe => ww_devoe,
	o => \lcd_vsy~output_o\);

-- Location: IOOBUF_X32_Y0_N23
\lcd_db_r[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|lcd_db_r[0]~0_combout\,
	devoe => ww_devoe,
	o => \lcd_db_r[0]~output_o\);

-- Location: IOOBUF_X30_Y0_N2
\lcd_db_r[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|lcd_db_r[0]~0_combout\,
	devoe => ww_devoe,
	o => \lcd_db_r[1]~output_o\);

-- Location: IOOBUF_X30_Y0_N9
\lcd_db_r[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|lcd_db_r[0]~0_combout\,
	devoe => ww_devoe,
	o => \lcd_db_r[2]~output_o\);

-- Location: IOOBUF_X30_Y0_N23
\lcd_db_r[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|lcd_db_r[0]~0_combout\,
	devoe => ww_devoe,
	o => \lcd_db_r[3]~output_o\);

-- Location: IOOBUF_X28_Y0_N2
\lcd_db_r[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|lcd_db_r[0]~0_combout\,
	devoe => ww_devoe,
	o => \lcd_db_r[4]~output_o\);

-- Location: IOOBUF_X34_Y4_N23
\lcd_db_g[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \lcd_db_g[0]~output_o\);

-- Location: IOOBUF_X34_Y3_N23
\lcd_db_g[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \lcd_db_g[1]~output_o\);

-- Location: IOOBUF_X34_Y2_N16
\lcd_db_g[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \lcd_db_g[2]~output_o\);

-- Location: IOOBUF_X34_Y2_N23
\lcd_db_g[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \lcd_db_g[3]~output_o\);

-- Location: IOOBUF_X32_Y0_N9
\lcd_db_g[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \lcd_db_g[4]~output_o\);

-- Location: IOOBUF_X32_Y0_N16
\lcd_db_g[5]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \lcd_db_g[5]~output_o\);

-- Location: IOOBUF_X34_Y9_N16
\lcd_db_b[0]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|lcd_db_b[0]~0_combout\,
	devoe => ww_devoe,
	o => \lcd_db_b[0]~output_o\);

-- Location: IOOBUF_X34_Y9_N23
\lcd_db_b[1]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|lcd_db_b[0]~0_combout\,
	devoe => ww_devoe,
	o => \lcd_db_b[1]~output_o\);

-- Location: IOOBUF_X34_Y7_N9
\lcd_db_b[2]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|lcd_db_b[0]~0_combout\,
	devoe => ww_devoe,
	o => \lcd_db_b[2]~output_o\);

-- Location: IOOBUF_X34_Y7_N23
\lcd_db_b[3]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|lcd_db_b[0]~0_combout\,
	devoe => ww_devoe,
	o => \lcd_db_b[3]~output_o\);

-- Location: IOOBUF_X34_Y4_N16
\lcd_db_b[4]~output\ : cycloneiii_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \uut_lcd_driver|lcd_db_b[0]~0_combout\,
	devoe => ww_devoe,
	o => \lcd_db_b[4]~output_o\);

-- Location: IOIBUF_X0_Y11_N1
\clk~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G4
\clk~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X28_Y1_N18
\uut_lcd_driver|sft_cnt[0]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|sft_cnt[0]~1_combout\ = !\uut_lcd_driver|sft_cnt\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uut_lcd_driver|sft_cnt\(0),
	combout => \uut_lcd_driver|sft_cnt[0]~1_combout\);

-- Location: IOIBUF_X34_Y12_N1
\rst_n~input\ : cycloneiii_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst_n,
	o => \rst_n~input_o\);

-- Location: CLKCTRL_G9
\rst_n~inputclkctrl\ : cycloneiii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \rst_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \rst_n~inputclkctrl_outclk\);

-- Location: FF_X28_Y1_N19
\uut_lcd_driver|sft_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|sft_cnt[0]~1_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|sft_cnt\(0));

-- Location: LCCOMB_X28_Y1_N8
\uut_lcd_driver|sft_cnt[1]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|sft_cnt[1]~0_combout\ = \uut_lcd_driver|sft_cnt\(1) $ (\uut_lcd_driver|sft_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uut_lcd_driver|sft_cnt\(1),
	datad => \uut_lcd_driver|sft_cnt\(0),
	combout => \uut_lcd_driver|sft_cnt[1]~0_combout\);

-- Location: FF_X28_Y1_N9
\uut_lcd_driver|sft_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|sft_cnt[1]~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|sft_cnt\(1));

-- Location: LCCOMB_X30_Y2_N8
\uut_lcd_driver|Add1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add1~0_combout\ = \uut_lcd_driver|x_cnt\(0) $ (VCC)
-- \uut_lcd_driver|Add1~1\ = CARRY(\uut_lcd_driver|x_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|x_cnt\(0),
	datad => VCC,
	combout => \uut_lcd_driver|Add1~0_combout\,
	cout => \uut_lcd_driver|Add1~1\);

-- Location: LCCOMB_X28_Y1_N16
\uut_lcd_driver|Equal0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Equal0~0_combout\ = (\uut_lcd_driver|sft_cnt\(1) & !\uut_lcd_driver|sft_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uut_lcd_driver|sft_cnt\(1),
	datad => \uut_lcd_driver|sft_cnt\(0),
	combout => \uut_lcd_driver|Equal0~0_combout\);

-- Location: FF_X30_Y2_N9
\uut_lcd_driver|x_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|Add1~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|x_cnt\(0));

-- Location: LCCOMB_X30_Y2_N10
\uut_lcd_driver|Add1~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add1~2_combout\ = (\uut_lcd_driver|x_cnt\(1) & (!\uut_lcd_driver|Add1~1\)) # (!\uut_lcd_driver|x_cnt\(1) & ((\uut_lcd_driver|Add1~1\) # (GND)))
-- \uut_lcd_driver|Add1~3\ = CARRY((!\uut_lcd_driver|Add1~1\) # (!\uut_lcd_driver|x_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(1),
	datad => VCC,
	cin => \uut_lcd_driver|Add1~1\,
	combout => \uut_lcd_driver|Add1~2_combout\,
	cout => \uut_lcd_driver|Add1~3\);

-- Location: LCCOMB_X30_Y2_N12
\uut_lcd_driver|Add1~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add1~4_combout\ = (\uut_lcd_driver|x_cnt\(2) & (\uut_lcd_driver|Add1~3\ $ (GND))) # (!\uut_lcd_driver|x_cnt\(2) & (!\uut_lcd_driver|Add1~3\ & VCC))
-- \uut_lcd_driver|Add1~5\ = CARRY((\uut_lcd_driver|x_cnt\(2) & !\uut_lcd_driver|Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(2),
	datad => VCC,
	cin => \uut_lcd_driver|Add1~3\,
	combout => \uut_lcd_driver|Add1~4_combout\,
	cout => \uut_lcd_driver|Add1~5\);

-- Location: LCCOMB_X30_Y2_N14
\uut_lcd_driver|Add1~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add1~6_combout\ = (\uut_lcd_driver|x_cnt\(3) & (!\uut_lcd_driver|Add1~5\)) # (!\uut_lcd_driver|x_cnt\(3) & ((\uut_lcd_driver|Add1~5\) # (GND)))
-- \uut_lcd_driver|Add1~7\ = CARRY((!\uut_lcd_driver|Add1~5\) # (!\uut_lcd_driver|x_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(3),
	datad => VCC,
	cin => \uut_lcd_driver|Add1~5\,
	combout => \uut_lcd_driver|Add1~6_combout\,
	cout => \uut_lcd_driver|Add1~7\);

-- Location: LCCOMB_X30_Y2_N16
\uut_lcd_driver|Add1~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add1~8_combout\ = (\uut_lcd_driver|x_cnt\(4) & (\uut_lcd_driver|Add1~7\ $ (GND))) # (!\uut_lcd_driver|x_cnt\(4) & (!\uut_lcd_driver|Add1~7\ & VCC))
-- \uut_lcd_driver|Add1~9\ = CARRY((\uut_lcd_driver|x_cnt\(4) & !\uut_lcd_driver|Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(4),
	datad => VCC,
	cin => \uut_lcd_driver|Add1~7\,
	combout => \uut_lcd_driver|Add1~8_combout\,
	cout => \uut_lcd_driver|Add1~9\);

-- Location: LCCOMB_X30_Y2_N18
\uut_lcd_driver|Add1~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add1~10_combout\ = (\uut_lcd_driver|x_cnt\(5) & (!\uut_lcd_driver|Add1~9\)) # (!\uut_lcd_driver|x_cnt\(5) & ((\uut_lcd_driver|Add1~9\) # (GND)))
-- \uut_lcd_driver|Add1~11\ = CARRY((!\uut_lcd_driver|Add1~9\) # (!\uut_lcd_driver|x_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|x_cnt\(5),
	datad => VCC,
	cin => \uut_lcd_driver|Add1~9\,
	combout => \uut_lcd_driver|Add1~10_combout\,
	cout => \uut_lcd_driver|Add1~11\);

-- Location: FF_X30_Y2_N19
\uut_lcd_driver|x_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|Add1~10_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|x_cnt\(5));

-- Location: LCCOMB_X30_Y2_N20
\uut_lcd_driver|Add1~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add1~12_combout\ = (\uut_lcd_driver|x_cnt\(6) & (\uut_lcd_driver|Add1~11\ $ (GND))) # (!\uut_lcd_driver|x_cnt\(6) & (!\uut_lcd_driver|Add1~11\ & VCC))
-- \uut_lcd_driver|Add1~13\ = CARRY((\uut_lcd_driver|x_cnt\(6) & !\uut_lcd_driver|Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|x_cnt\(6),
	datad => VCC,
	cin => \uut_lcd_driver|Add1~11\,
	combout => \uut_lcd_driver|Add1~12_combout\,
	cout => \uut_lcd_driver|Add1~13\);

-- Location: FF_X30_Y2_N21
\uut_lcd_driver|x_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|Add1~12_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|x_cnt\(6));

-- Location: LCCOMB_X30_Y2_N28
\uut_lcd_driver|lcd_hsy_r~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|lcd_hsy_r~2_combout\ = (\uut_lcd_driver|x_cnt\(6) & (((!\uut_lcd_driver|lcd_hsy_r~q\)))) # (!\uut_lcd_driver|x_cnt\(6) & ((\uut_lcd_driver|x_cnt\(0) & ((!\uut_lcd_driver|lcd_hsy_r~q\))) # (!\uut_lcd_driver|x_cnt\(0) & 
-- (\uut_lcd_driver|x_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(1),
	datab => \uut_lcd_driver|x_cnt\(6),
	datac => \uut_lcd_driver|x_cnt\(0),
	datad => \uut_lcd_driver|lcd_hsy_r~q\,
	combout => \uut_lcd_driver|lcd_hsy_r~2_combout\);

-- Location: FF_X30_Y2_N13
\uut_lcd_driver|x_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|Add1~4_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|x_cnt\(2));

-- Location: LCCOMB_X30_Y2_N22
\uut_lcd_driver|Add1~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add1~14_combout\ = (\uut_lcd_driver|x_cnt\(7) & (!\uut_lcd_driver|Add1~13\)) # (!\uut_lcd_driver|x_cnt\(7) & ((\uut_lcd_driver|Add1~13\) # (GND)))
-- \uut_lcd_driver|Add1~15\ = CARRY((!\uut_lcd_driver|Add1~13\) # (!\uut_lcd_driver|x_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|x_cnt\(7),
	datad => VCC,
	cin => \uut_lcd_driver|Add1~13\,
	combout => \uut_lcd_driver|Add1~14_combout\,
	cout => \uut_lcd_driver|Add1~15\);

-- Location: LCCOMB_X30_Y2_N24
\uut_lcd_driver|Add1~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add1~16_combout\ = \uut_lcd_driver|x_cnt\(8) $ (!\uut_lcd_driver|Add1~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|x_cnt\(8),
	cin => \uut_lcd_driver|Add1~15\,
	combout => \uut_lcd_driver|Add1~16_combout\);

-- Location: LCCOMB_X30_Y2_N4
\uut_lcd_driver|x_cnt~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|x_cnt~2_combout\ = (\uut_lcd_driver|Add1~16_combout\ & (((!\uut_lcd_driver|x_cnt\(2)) # (!\uut_lcd_driver|Equal1~1_combout\)) # (!\uut_lcd_driver|x_cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(4),
	datab => \uut_lcd_driver|Equal1~1_combout\,
	datac => \uut_lcd_driver|x_cnt\(2),
	datad => \uut_lcd_driver|Add1~16_combout\,
	combout => \uut_lcd_driver|x_cnt~2_combout\);

-- Location: FF_X30_Y2_N5
\uut_lcd_driver|x_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|x_cnt~2_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|x_cnt\(8));

-- Location: LCCOMB_X30_Y2_N26
\uut_lcd_driver|Equal1~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Equal1~0_combout\ = (\uut_lcd_driver|x_cnt\(1) & (!\uut_lcd_driver|x_cnt\(6) & (\uut_lcd_driver|x_cnt\(8) & !\uut_lcd_driver|x_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(1),
	datab => \uut_lcd_driver|x_cnt\(6),
	datac => \uut_lcd_driver|x_cnt\(8),
	datad => \uut_lcd_driver|x_cnt\(5),
	combout => \uut_lcd_driver|Equal1~0_combout\);

-- Location: LCCOMB_X29_Y2_N22
\uut_lcd_driver|Equal1~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Equal1~1_combout\ = (!\uut_lcd_driver|x_cnt\(3) & (\uut_lcd_driver|x_cnt\(7) & (\uut_lcd_driver|x_cnt\(0) & \uut_lcd_driver|Equal1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(3),
	datab => \uut_lcd_driver|x_cnt\(7),
	datac => \uut_lcd_driver|x_cnt\(0),
	datad => \uut_lcd_driver|Equal1~0_combout\,
	combout => \uut_lcd_driver|Equal1~1_combout\);

-- Location: LCCOMB_X29_Y2_N8
\uut_lcd_driver|x_cnt~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|x_cnt~0_combout\ = (\uut_lcd_driver|Add1~8_combout\ & (((!\uut_lcd_driver|x_cnt\(4)) # (!\uut_lcd_driver|Equal1~1_combout\)) # (!\uut_lcd_driver|x_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(2),
	datab => \uut_lcd_driver|Equal1~1_combout\,
	datac => \uut_lcd_driver|x_cnt\(4),
	datad => \uut_lcd_driver|Add1~8_combout\,
	combout => \uut_lcd_driver|x_cnt~0_combout\);

-- Location: FF_X29_Y2_N9
\uut_lcd_driver|x_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|x_cnt~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|x_cnt\(4));

-- Location: LCCOMB_X29_Y2_N24
\uut_lcd_driver|x_cnt~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|x_cnt~3_combout\ = (\uut_lcd_driver|Add1~14_combout\ & (((!\uut_lcd_driver|x_cnt\(4)) # (!\uut_lcd_driver|Equal1~1_combout\)) # (!\uut_lcd_driver|x_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(2),
	datab => \uut_lcd_driver|Equal1~1_combout\,
	datac => \uut_lcd_driver|x_cnt\(4),
	datad => \uut_lcd_driver|Add1~14_combout\,
	combout => \uut_lcd_driver|x_cnt~3_combout\);

-- Location: FF_X29_Y2_N25
\uut_lcd_driver|x_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|x_cnt~3_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|x_cnt\(7));

-- Location: LCCOMB_X30_Y2_N30
\uut_lcd_driver|lcd_hsy_r~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|lcd_hsy_r~0_combout\ = (\uut_lcd_driver|x_cnt\(2) & (!\uut_lcd_driver|x_cnt\(7) & (!\uut_lcd_driver|x_cnt\(8) & \uut_lcd_driver|x_cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(2),
	datab => \uut_lcd_driver|x_cnt\(7),
	datac => \uut_lcd_driver|x_cnt\(8),
	datad => \uut_lcd_driver|x_cnt\(4),
	combout => \uut_lcd_driver|lcd_hsy_r~0_combout\);

-- Location: LCCOMB_X29_Y2_N10
\uut_lcd_driver|x_cnt~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|x_cnt~1_combout\ = (\uut_lcd_driver|Add1~6_combout\ & (((!\uut_lcd_driver|Equal1~1_combout\) # (!\uut_lcd_driver|x_cnt\(4))) # (!\uut_lcd_driver|x_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(2),
	datab => \uut_lcd_driver|x_cnt\(4),
	datac => \uut_lcd_driver|Add1~6_combout\,
	datad => \uut_lcd_driver|Equal1~1_combout\,
	combout => \uut_lcd_driver|x_cnt~1_combout\);

-- Location: FF_X29_Y2_N11
\uut_lcd_driver|x_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|x_cnt~1_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|x_cnt\(3));

-- Location: LCCOMB_X30_Y2_N2
\uut_lcd_driver|lcd_hsy_r~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|lcd_hsy_r~1_combout\ = (!\uut_lcd_driver|x_cnt\(5) & (\uut_lcd_driver|lcd_hsy_r~0_combout\ & \uut_lcd_driver|x_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|x_cnt\(5),
	datac => \uut_lcd_driver|lcd_hsy_r~0_combout\,
	datad => \uut_lcd_driver|x_cnt\(3),
	combout => \uut_lcd_driver|lcd_hsy_r~1_combout\);

-- Location: LCCOMB_X30_Y2_N0
\uut_lcd_driver|lcd_hsy_r~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|lcd_hsy_r~3_combout\ = (\uut_lcd_driver|lcd_hsy_r~2_combout\ & (((\uut_lcd_driver|lcd_hsy_r~q\ & !\uut_lcd_driver|lcd_hsy_r~1_combout\)))) # (!\uut_lcd_driver|lcd_hsy_r~2_combout\ & ((\uut_lcd_driver|Equal7~1_combout\) # 
-- ((\uut_lcd_driver|lcd_hsy_r~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001011110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|Equal7~1_combout\,
	datab => \uut_lcd_driver|lcd_hsy_r~2_combout\,
	datac => \uut_lcd_driver|lcd_hsy_r~q\,
	datad => \uut_lcd_driver|lcd_hsy_r~1_combout\,
	combout => \uut_lcd_driver|lcd_hsy_r~3_combout\);

-- Location: FF_X30_Y2_N1
\uut_lcd_driver|lcd_hsy_r\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|lcd_hsy_r~3_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|lcd_hsy_r~q\);

-- Location: LCCOMB_X28_Y2_N0
\uut_lcd_driver|Add2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add2~0_combout\ = \uut_lcd_driver|y_cnt\(0) $ (VCC)
-- \uut_lcd_driver|Add2~1\ = CARRY(\uut_lcd_driver|y_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|y_cnt\(0),
	datad => VCC,
	combout => \uut_lcd_driver|Add2~0_combout\,
	cout => \uut_lcd_driver|Add2~1\);

-- Location: LCCOMB_X28_Y2_N24
\uut_lcd_driver|always2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|always2~0_combout\ = (\uut_lcd_driver|x_cnt\(2) & (\uut_lcd_driver|Equal0~0_combout\ & (\uut_lcd_driver|x_cnt\(4) & \uut_lcd_driver|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(2),
	datab => \uut_lcd_driver|Equal0~0_combout\,
	datac => \uut_lcd_driver|x_cnt\(4),
	datad => \uut_lcd_driver|Equal1~1_combout\,
	combout => \uut_lcd_driver|always2~0_combout\);

-- Location: FF_X28_Y2_N1
\uut_lcd_driver|y_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|Add2~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|always2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|y_cnt\(0));

-- Location: LCCOMB_X28_Y2_N2
\uut_lcd_driver|Add2~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add2~2_combout\ = (\uut_lcd_driver|y_cnt\(1) & (!\uut_lcd_driver|Add2~1\)) # (!\uut_lcd_driver|y_cnt\(1) & ((\uut_lcd_driver|Add2~1\) # (GND)))
-- \uut_lcd_driver|Add2~3\ = CARRY((!\uut_lcd_driver|Add2~1\) # (!\uut_lcd_driver|y_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(1),
	datad => VCC,
	cin => \uut_lcd_driver|Add2~1\,
	combout => \uut_lcd_driver|Add2~2_combout\,
	cout => \uut_lcd_driver|Add2~3\);

-- Location: LCCOMB_X28_Y2_N4
\uut_lcd_driver|Add2~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add2~4_combout\ = (\uut_lcd_driver|y_cnt\(2) & (\uut_lcd_driver|Add2~3\ $ (GND))) # (!\uut_lcd_driver|y_cnt\(2) & (!\uut_lcd_driver|Add2~3\ & VCC))
-- \uut_lcd_driver|Add2~5\ = CARRY((\uut_lcd_driver|y_cnt\(2) & !\uut_lcd_driver|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(2),
	datad => VCC,
	cin => \uut_lcd_driver|Add2~3\,
	combout => \uut_lcd_driver|Add2~4_combout\,
	cout => \uut_lcd_driver|Add2~5\);

-- Location: LCCOMB_X28_Y2_N30
\uut_lcd_driver|y_cnt~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|y_cnt~1_combout\ = (\uut_lcd_driver|Add2~4_combout\ & (((\uut_lcd_driver|y_cnt\(1)) # (!\uut_lcd_driver|Equal2~0_combout\)) # (!\uut_lcd_driver|Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|Equal3~0_combout\,
	datab => \uut_lcd_driver|Add2~4_combout\,
	datac => \uut_lcd_driver|y_cnt\(1),
	datad => \uut_lcd_driver|Equal2~0_combout\,
	combout => \uut_lcd_driver|y_cnt~1_combout\);

-- Location: FF_X28_Y2_N31
\uut_lcd_driver|y_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|y_cnt~1_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|always2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|y_cnt\(2));

-- Location: LCCOMB_X26_Y2_N8
\uut_lcd_driver|Equal2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Equal2~0_combout\ = (!\uut_lcd_driver|y_cnt\(4) & (\uut_lcd_driver|y_cnt\(2) & (\uut_lcd_driver|y_cnt\(0) & \uut_lcd_driver|y_cnt\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(4),
	datab => \uut_lcd_driver|y_cnt\(2),
	datac => \uut_lcd_driver|y_cnt\(0),
	datad => \uut_lcd_driver|y_cnt\(8),
	combout => \uut_lcd_driver|Equal2~0_combout\);

-- Location: LCCOMB_X28_Y2_N28
\uut_lcd_driver|y_cnt~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|y_cnt~0_combout\ = (\uut_lcd_driver|Add2~2_combout\ & (((\uut_lcd_driver|y_cnt\(1)) # (!\uut_lcd_driver|Equal2~0_combout\)) # (!\uut_lcd_driver|Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|Equal3~0_combout\,
	datab => \uut_lcd_driver|Add2~2_combout\,
	datac => \uut_lcd_driver|y_cnt\(1),
	datad => \uut_lcd_driver|Equal2~0_combout\,
	combout => \uut_lcd_driver|y_cnt~0_combout\);

-- Location: FF_X28_Y2_N29
\uut_lcd_driver|y_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|y_cnt~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|always2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|y_cnt\(1));

-- Location: LCCOMB_X28_Y2_N6
\uut_lcd_driver|Add2~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add2~6_combout\ = (\uut_lcd_driver|y_cnt\(3) & (!\uut_lcd_driver|Add2~5\)) # (!\uut_lcd_driver|y_cnt\(3) & ((\uut_lcd_driver|Add2~5\) # (GND)))
-- \uut_lcd_driver|Add2~7\ = CARRY((!\uut_lcd_driver|Add2~5\) # (!\uut_lcd_driver|y_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|y_cnt\(3),
	datad => VCC,
	cin => \uut_lcd_driver|Add2~5\,
	combout => \uut_lcd_driver|Add2~6_combout\,
	cout => \uut_lcd_driver|Add2~7\);

-- Location: FF_X28_Y2_N7
\uut_lcd_driver|y_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|Add2~6_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|always2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|y_cnt\(3));

-- Location: LCCOMB_X28_Y2_N8
\uut_lcd_driver|Add2~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add2~8_combout\ = (\uut_lcd_driver|y_cnt\(4) & (\uut_lcd_driver|Add2~7\ $ (GND))) # (!\uut_lcd_driver|y_cnt\(4) & (!\uut_lcd_driver|Add2~7\ & VCC))
-- \uut_lcd_driver|Add2~9\ = CARRY((\uut_lcd_driver|y_cnt\(4) & !\uut_lcd_driver|Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(4),
	datad => VCC,
	cin => \uut_lcd_driver|Add2~7\,
	combout => \uut_lcd_driver|Add2~8_combout\,
	cout => \uut_lcd_driver|Add2~9\);

-- Location: LCCOMB_X28_Y2_N10
\uut_lcd_driver|Add2~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add2~10_combout\ = (\uut_lcd_driver|y_cnt\(5) & (!\uut_lcd_driver|Add2~9\)) # (!\uut_lcd_driver|y_cnt\(5) & ((\uut_lcd_driver|Add2~9\) # (GND)))
-- \uut_lcd_driver|Add2~11\ = CARRY((!\uut_lcd_driver|Add2~9\) # (!\uut_lcd_driver|y_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(5),
	datad => VCC,
	cin => \uut_lcd_driver|Add2~9\,
	combout => \uut_lcd_driver|Add2~10_combout\,
	cout => \uut_lcd_driver|Add2~11\);

-- Location: LCCOMB_X28_Y2_N12
\uut_lcd_driver|Add2~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add2~12_combout\ = (\uut_lcd_driver|y_cnt\(6) & (\uut_lcd_driver|Add2~11\ $ (GND))) # (!\uut_lcd_driver|y_cnt\(6) & (!\uut_lcd_driver|Add2~11\ & VCC))
-- \uut_lcd_driver|Add2~13\ = CARRY((\uut_lcd_driver|y_cnt\(6) & !\uut_lcd_driver|Add2~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(6),
	datad => VCC,
	cin => \uut_lcd_driver|Add2~11\,
	combout => \uut_lcd_driver|Add2~12_combout\,
	cout => \uut_lcd_driver|Add2~13\);

-- Location: LCCOMB_X28_Y2_N14
\uut_lcd_driver|Add2~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add2~14_combout\ = (\uut_lcd_driver|y_cnt\(7) & (!\uut_lcd_driver|Add2~13\)) # (!\uut_lcd_driver|y_cnt\(7) & ((\uut_lcd_driver|Add2~13\) # (GND)))
-- \uut_lcd_driver|Add2~15\ = CARRY((!\uut_lcd_driver|Add2~13\) # (!\uut_lcd_driver|y_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|y_cnt\(7),
	datad => VCC,
	cin => \uut_lcd_driver|Add2~13\,
	combout => \uut_lcd_driver|Add2~14_combout\,
	cout => \uut_lcd_driver|Add2~15\);

-- Location: FF_X28_Y2_N15
\uut_lcd_driver|y_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|Add2~14_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|always2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|y_cnt\(7));

-- Location: FF_X28_Y2_N13
\uut_lcd_driver|y_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|Add2~12_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|always2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|y_cnt\(6));

-- Location: LCCOMB_X28_Y2_N26
\uut_lcd_driver|Equal3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Equal3~0_combout\ = (!\uut_lcd_driver|y_cnt\(5) & (!\uut_lcd_driver|y_cnt\(7) & (!\uut_lcd_driver|y_cnt\(3) & !\uut_lcd_driver|y_cnt\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(5),
	datab => \uut_lcd_driver|y_cnt\(7),
	datac => \uut_lcd_driver|y_cnt\(3),
	datad => \uut_lcd_driver|y_cnt\(6),
	combout => \uut_lcd_driver|Equal3~0_combout\);

-- Location: LCCOMB_X28_Y2_N16
\uut_lcd_driver|Add2~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add2~16_combout\ = \uut_lcd_driver|Add2~15\ $ (!\uut_lcd_driver|y_cnt\(8))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \uut_lcd_driver|y_cnt\(8),
	cin => \uut_lcd_driver|Add2~15\,
	combout => \uut_lcd_driver|Add2~16_combout\);

-- Location: LCCOMB_X28_Y2_N20
\uut_lcd_driver|y_cnt~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|y_cnt~2_combout\ = (\uut_lcd_driver|Add2~16_combout\ & (((\uut_lcd_driver|y_cnt\(1)) # (!\uut_lcd_driver|Equal3~0_combout\)) # (!\uut_lcd_driver|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|Equal2~0_combout\,
	datab => \uut_lcd_driver|y_cnt\(1),
	datac => \uut_lcd_driver|Equal3~0_combout\,
	datad => \uut_lcd_driver|Add2~16_combout\,
	combout => \uut_lcd_driver|y_cnt~2_combout\);

-- Location: FF_X28_Y2_N21
\uut_lcd_driver|y_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|y_cnt~2_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|always2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|y_cnt\(8));

-- Location: LCCOMB_X26_Y2_N10
\uut_lcd_driver|Equal3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Equal3~1_combout\ = (!\uut_lcd_driver|y_cnt\(2) & (!\uut_lcd_driver|y_cnt\(8) & (\uut_lcd_driver|y_cnt\(1) & \uut_lcd_driver|Equal3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(2),
	datab => \uut_lcd_driver|y_cnt\(8),
	datac => \uut_lcd_driver|y_cnt\(1),
	datad => \uut_lcd_driver|Equal3~0_combout\,
	combout => \uut_lcd_driver|Equal3~1_combout\);

-- Location: LCCOMB_X26_Y2_N20
\uut_lcd_driver|lcd_vsy_r~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|lcd_vsy_r~0_combout\ = ((!\uut_lcd_driver|y_cnt\(4) & (\uut_lcd_driver|y_cnt\(0) & \uut_lcd_driver|Equal3~1_combout\))) # (!\uut_lcd_driver|lcd_vsy_r~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(4),
	datab => \uut_lcd_driver|lcd_vsy_r~q\,
	datac => \uut_lcd_driver|y_cnt\(0),
	datad => \uut_lcd_driver|Equal3~1_combout\,
	combout => \uut_lcd_driver|lcd_vsy_r~0_combout\);

-- Location: LCCOMB_X26_Y2_N24
\uut_lcd_driver|lcd_vsy_r~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|lcd_vsy_r~1_combout\ = ((\uut_lcd_driver|Equal4~0_combout\ & (!\uut_lcd_driver|y_cnt\(8) & !\uut_lcd_driver|y_cnt\(1)))) # (!\uut_lcd_driver|lcd_vsy_r~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|Equal4~0_combout\,
	datab => \uut_lcd_driver|y_cnt\(8),
	datac => \uut_lcd_driver|y_cnt\(1),
	datad => \uut_lcd_driver|lcd_vsy_r~0_combout\,
	combout => \uut_lcd_driver|lcd_vsy_r~1_combout\);

-- Location: FF_X26_Y2_N25
\uut_lcd_driver|lcd_vsy_r\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|lcd_vsy_r~1_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|lcd_vsy_r~q\);

-- Location: LCCOMB_X29_Y3_N2
\uut_lcd_driver|tmp_cnt[0]~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|tmp_cnt[0]~5_combout\ = \uut_lcd_driver|tmp_cnt\(0) $ (VCC)
-- \uut_lcd_driver|tmp_cnt[0]~6\ = CARRY(\uut_lcd_driver|tmp_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(0),
	datad => VCC,
	combout => \uut_lcd_driver|tmp_cnt[0]~5_combout\,
	cout => \uut_lcd_driver|tmp_cnt[0]~6\);

-- Location: LCCOMB_X29_Y3_N4
\uut_lcd_driver|tmp_cnt[1]~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|tmp_cnt[1]~7_combout\ = (\uut_lcd_driver|tmp_cnt\(1) & (!\uut_lcd_driver|tmp_cnt[0]~6\)) # (!\uut_lcd_driver|tmp_cnt\(1) & ((\uut_lcd_driver|tmp_cnt[0]~6\) # (GND)))
-- \uut_lcd_driver|tmp_cnt[1]~8\ = CARRY((!\uut_lcd_driver|tmp_cnt[0]~6\) # (!\uut_lcd_driver|tmp_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|tmp_cnt\(1),
	datad => VCC,
	cin => \uut_lcd_driver|tmp_cnt[0]~6\,
	combout => \uut_lcd_driver|tmp_cnt[1]~7_combout\,
	cout => \uut_lcd_driver|tmp_cnt[1]~8\);

-- Location: LCCOMB_X30_Y2_N6
\uut_lcd_driver|Equal7~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Equal7~0_combout\ = (!\uut_lcd_driver|x_cnt\(4) & (!\uut_lcd_driver|x_cnt\(3) & (!\uut_lcd_driver|x_cnt\(2) & !\uut_lcd_driver|x_cnt\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(4),
	datab => \uut_lcd_driver|x_cnt\(3),
	datac => \uut_lcd_driver|x_cnt\(2),
	datad => \uut_lcd_driver|x_cnt\(5),
	combout => \uut_lcd_driver|Equal7~0_combout\);

-- Location: LCCOMB_X29_Y2_N14
\uut_lcd_driver|Equal7~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Equal7~1_combout\ = (!\uut_lcd_driver|x_cnt\(8) & (!\uut_lcd_driver|x_cnt\(7) & \uut_lcd_driver|Equal7~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(8),
	datab => \uut_lcd_driver|x_cnt\(7),
	datad => \uut_lcd_driver|Equal7~0_combout\,
	combout => \uut_lcd_driver|Equal7~1_combout\);

-- Location: LCCOMB_X29_Y2_N12
\uut_lcd_driver|always4~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|always4~1_combout\ = (\uut_lcd_driver|valid_yr~q\ & (!\uut_lcd_driver|x_cnt\(4) & (!\uut_lcd_driver|x_cnt\(2) & \uut_lcd_driver|Equal1~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|valid_yr~q\,
	datab => \uut_lcd_driver|x_cnt\(4),
	datac => \uut_lcd_driver|x_cnt\(2),
	datad => \uut_lcd_driver|Equal1~1_combout\,
	combout => \uut_lcd_driver|always4~1_combout\);

-- Location: LCCOMB_X29_Y2_N0
\uut_lcd_driver|validr~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|validr~0_combout\ = (\uut_lcd_driver|always4~0_combout\ & ((\uut_lcd_driver|Equal7~1_combout\) # ((\uut_lcd_driver|validr~q\ & !\uut_lcd_driver|always4~1_combout\)))) # (!\uut_lcd_driver|always4~0_combout\ & (((\uut_lcd_driver|validr~q\ & 
-- !\uut_lcd_driver|always4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|always4~0_combout\,
	datab => \uut_lcd_driver|Equal7~1_combout\,
	datac => \uut_lcd_driver|validr~q\,
	datad => \uut_lcd_driver|always4~1_combout\,
	combout => \uut_lcd_driver|validr~0_combout\);

-- Location: FF_X29_Y2_N1
\uut_lcd_driver|validr\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|validr~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|validr~q\);

-- Location: LCCOMB_X29_Y3_N12
\uut_lcd_driver|tmp_cnt[4]~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|tmp_cnt[4]~12_combout\ = (!\uut_lcd_driver|x_cnt\(8) & (\uut_lcd_driver|x_cnt\(7) & (\uut_lcd_driver|x_cnt\(6) & \uut_lcd_driver|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(8),
	datab => \uut_lcd_driver|x_cnt\(7),
	datac => \uut_lcd_driver|x_cnt\(6),
	datad => \uut_lcd_driver|Equal0~0_combout\,
	combout => \uut_lcd_driver|tmp_cnt[4]~12_combout\);

-- Location: LCCOMB_X29_Y3_N14
\uut_lcd_driver|tmp_cnt[4]~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|tmp_cnt[4]~13_combout\ = ((\uut_lcd_driver|tmp_cnt[4]~12_combout\ & (\uut_lcd_driver|tmp_cnt[4]~11_combout\ $ (\uut_lcd_driver|x_cnt\(5))))) # (!\uut_lcd_driver|validr~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt[4]~11_combout\,
	datab => \uut_lcd_driver|validr~q\,
	datac => \uut_lcd_driver|x_cnt\(5),
	datad => \uut_lcd_driver|tmp_cnt[4]~12_combout\,
	combout => \uut_lcd_driver|tmp_cnt[4]~13_combout\);

-- Location: FF_X29_Y3_N5
\uut_lcd_driver|tmp_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|tmp_cnt[1]~7_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	sclr => \uut_lcd_driver|ALT_INV_validr~q\,
	ena => \uut_lcd_driver|tmp_cnt[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|tmp_cnt\(1));

-- Location: LCCOMB_X29_Y3_N8
\uut_lcd_driver|tmp_cnt[3]~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|tmp_cnt[3]~14_combout\ = (\uut_lcd_driver|tmp_cnt\(3) & (!\uut_lcd_driver|tmp_cnt[2]~10\)) # (!\uut_lcd_driver|tmp_cnt\(3) & ((\uut_lcd_driver|tmp_cnt[2]~10\) # (GND)))
-- \uut_lcd_driver|tmp_cnt[3]~15\ = CARRY((!\uut_lcd_driver|tmp_cnt[2]~10\) # (!\uut_lcd_driver|tmp_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|tmp_cnt\(3),
	datad => VCC,
	cin => \uut_lcd_driver|tmp_cnt[2]~10\,
	combout => \uut_lcd_driver|tmp_cnt[3]~14_combout\,
	cout => \uut_lcd_driver|tmp_cnt[3]~15\);

-- Location: FF_X29_Y3_N9
\uut_lcd_driver|tmp_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|tmp_cnt[3]~14_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	sclr => \uut_lcd_driver|ALT_INV_validr~q\,
	ena => \uut_lcd_driver|tmp_cnt[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|tmp_cnt\(3));

-- Location: LCCOMB_X29_Y3_N10
\uut_lcd_driver|tmp_cnt[4]~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|tmp_cnt[4]~16_combout\ = \uut_lcd_driver|tmp_cnt\(4) $ (!\uut_lcd_driver|tmp_cnt[3]~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|tmp_cnt\(4),
	cin => \uut_lcd_driver|tmp_cnt[3]~15\,
	combout => \uut_lcd_driver|tmp_cnt[4]~16_combout\);

-- Location: FF_X29_Y3_N11
\uut_lcd_driver|tmp_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|tmp_cnt[4]~16_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	sclr => \uut_lcd_driver|ALT_INV_validr~q\,
	ena => \uut_lcd_driver|tmp_cnt[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|tmp_cnt\(4));

-- Location: FF_X29_Y3_N3
\uut_lcd_driver|tmp_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|tmp_cnt[0]~5_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	sclr => \uut_lcd_driver|ALT_INV_validr~q\,
	ena => \uut_lcd_driver|tmp_cnt[4]~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|tmp_cnt\(0));

-- Location: LCCOMB_X26_Y3_N24
\~GND\ : cycloneiii_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X26_Y2_N26
\uut_lcd_driver|y_cnt[1]~_wirecell\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|y_cnt[1]~_wirecell_combout\ = !\uut_lcd_driver|y_cnt\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uut_lcd_driver|y_cnt\(1),
	combout => \uut_lcd_driver|y_cnt[1]~_wirecell_combout\);

-- Location: LCCOMB_X26_Y2_N18
\uut_lcd_driver|Add3~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add3~0_combout\ = \uut_lcd_driver|y_cnt\(1) $ (!\uut_lcd_driver|y_cnt\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uut_lcd_driver|y_cnt\(1),
	datad => \uut_lcd_driver|y_cnt\(2),
	combout => \uut_lcd_driver|Add3~0_combout\);

-- Location: LCCOMB_X26_Y2_N16
\uut_lcd_driver|Add3~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add3~1_combout\ = \uut_lcd_driver|y_cnt\(3) $ (((\uut_lcd_driver|y_cnt\(1)) # (\uut_lcd_driver|y_cnt\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|y_cnt\(3),
	datac => \uut_lcd_driver|y_cnt\(1),
	datad => \uut_lcd_driver|y_cnt\(2),
	combout => \uut_lcd_driver|Add3~1_combout\);

-- Location: FF_X28_Y2_N9
\uut_lcd_driver|y_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|Add2~8_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|always2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|y_cnt\(4));

-- Location: LCCOMB_X26_Y2_N22
\uut_lcd_driver|Add3~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add3~2_combout\ = \uut_lcd_driver|y_cnt\(4) $ ((((!\uut_lcd_driver|y_cnt\(1) & !\uut_lcd_driver|y_cnt\(2))) # (!\uut_lcd_driver|y_cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(1),
	datab => \uut_lcd_driver|y_cnt\(2),
	datac => \uut_lcd_driver|y_cnt\(3),
	datad => \uut_lcd_driver|y_cnt\(4),
	combout => \uut_lcd_driver|Add3~2_combout\);

-- Location: LCCOMB_X28_Y2_N22
\uut_lcd_driver|LessThan2~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|LessThan2~0_combout\ = (!\uut_lcd_driver|y_cnt\(4) & (((!\uut_lcd_driver|y_cnt\(2) & !\uut_lcd_driver|y_cnt\(1))) # (!\uut_lcd_driver|y_cnt\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(2),
	datab => \uut_lcd_driver|y_cnt\(1),
	datac => \uut_lcd_driver|y_cnt\(4),
	datad => \uut_lcd_driver|y_cnt\(3),
	combout => \uut_lcd_driver|LessThan2~0_combout\);

-- Location: FF_X28_Y2_N11
\uut_lcd_driver|y_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|Add2~10_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|always2~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|y_cnt\(5));

-- Location: LCCOMB_X28_Y2_N18
\uut_lcd_driver|Add3~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Add3~3_combout\ = \uut_lcd_driver|LessThan2~0_combout\ $ (!\uut_lcd_driver|y_cnt\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uut_lcd_driver|LessThan2~0_combout\,
	datad => \uut_lcd_driver|y_cnt\(5),
	combout => \uut_lcd_driver|Add3~3_combout\);

-- Location: LCCOMB_X28_Y3_N24
\uut_lcd_driver|Mux0~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~2_combout\ = (\uut_lcd_driver|tmp_cnt\(2) & ((\uut_lcd_driver|tmp_cnt\(3)) # ((\myram_inst|altsyncram_component|auto_generated|q_a\(21))))) # (!\uut_lcd_driver|tmp_cnt\(2) & (!\uut_lcd_driver|tmp_cnt\(3) & 
-- (\myram_inst|altsyncram_component|auto_generated|q_a\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(2),
	datab => \uut_lcd_driver|tmp_cnt\(3),
	datac => \myram_inst|altsyncram_component|auto_generated|q_a\(17),
	datad => \myram_inst|altsyncram_component|auto_generated|q_a\(21),
	combout => \uut_lcd_driver|Mux0~2_combout\);

-- Location: LCCOMB_X28_Y3_N26
\uut_lcd_driver|Mux0~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~3_combout\ = (\uut_lcd_driver|tmp_cnt\(3) & ((\uut_lcd_driver|Mux0~2_combout\ & (\myram_inst|altsyncram_component|auto_generated|q_a\(29))) # (!\uut_lcd_driver|Mux0~2_combout\ & 
-- ((\myram_inst|altsyncram_component|auto_generated|q_a\(25)))))) # (!\uut_lcd_driver|tmp_cnt\(3) & (((\uut_lcd_driver|Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myram_inst|altsyncram_component|auto_generated|q_a\(29),
	datab => \uut_lcd_driver|tmp_cnt\(3),
	datac => \myram_inst|altsyncram_component|auto_generated|q_a\(25),
	datad => \uut_lcd_driver|Mux0~2_combout\,
	combout => \uut_lcd_driver|Mux0~3_combout\);

-- Location: LCCOMB_X28_Y3_N0
\uut_lcd_driver|Mux0~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~4_combout\ = (\uut_lcd_driver|tmp_cnt\(2) & (((\uut_lcd_driver|tmp_cnt\(3))))) # (!\uut_lcd_driver|tmp_cnt\(2) & ((\uut_lcd_driver|tmp_cnt\(3) & ((\myram_inst|altsyncram_component|auto_generated|q_a\(24)))) # 
-- (!\uut_lcd_driver|tmp_cnt\(3) & (\myram_inst|altsyncram_component|auto_generated|q_a\(16)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(2),
	datab => \myram_inst|altsyncram_component|auto_generated|q_a\(16),
	datac => \uut_lcd_driver|tmp_cnt\(3),
	datad => \myram_inst|altsyncram_component|auto_generated|q_a\(24),
	combout => \uut_lcd_driver|Mux0~4_combout\);

-- Location: LCCOMB_X28_Y3_N6
\uut_lcd_driver|Mux0~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~5_combout\ = (\uut_lcd_driver|tmp_cnt\(2) & ((\uut_lcd_driver|Mux0~4_combout\ & ((\myram_inst|altsyncram_component|auto_generated|q_a\(28)))) # (!\uut_lcd_driver|Mux0~4_combout\ & 
-- (\myram_inst|altsyncram_component|auto_generated|q_a\(20))))) # (!\uut_lcd_driver|tmp_cnt\(2) & (((\uut_lcd_driver|Mux0~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(2),
	datab => \myram_inst|altsyncram_component|auto_generated|q_a\(20),
	datac => \myram_inst|altsyncram_component|auto_generated|q_a\(28),
	datad => \uut_lcd_driver|Mux0~4_combout\,
	combout => \uut_lcd_driver|Mux0~5_combout\);

-- Location: LCCOMB_X28_Y3_N8
\uut_lcd_driver|Mux0~6\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~6_combout\ = (\uut_lcd_driver|tmp_cnt\(1) & (\uut_lcd_driver|tmp_cnt\(0))) # (!\uut_lcd_driver|tmp_cnt\(1) & ((\uut_lcd_driver|tmp_cnt\(0) & (\uut_lcd_driver|Mux0~3_combout\)) # (!\uut_lcd_driver|tmp_cnt\(0) & 
-- ((\uut_lcd_driver|Mux0~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(1),
	datab => \uut_lcd_driver|tmp_cnt\(0),
	datac => \uut_lcd_driver|Mux0~3_combout\,
	datad => \uut_lcd_driver|Mux0~5_combout\,
	combout => \uut_lcd_driver|Mux0~6_combout\);

-- Location: LCCOMB_X29_Y3_N22
\uut_lcd_driver|Mux0~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~0_combout\ = (\uut_lcd_driver|tmp_cnt\(2) & (\uut_lcd_driver|tmp_cnt\(3))) # (!\uut_lcd_driver|tmp_cnt\(2) & ((\uut_lcd_driver|tmp_cnt\(3) & ((\myram_inst|altsyncram_component|auto_generated|q_a\(26)))) # (!\uut_lcd_driver|tmp_cnt\(3) 
-- & (\myram_inst|altsyncram_component|auto_generated|q_a\(18)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(2),
	datab => \uut_lcd_driver|tmp_cnt\(3),
	datac => \myram_inst|altsyncram_component|auto_generated|q_a\(18),
	datad => \myram_inst|altsyncram_component|auto_generated|q_a\(26),
	combout => \uut_lcd_driver|Mux0~0_combout\);

-- Location: LCCOMB_X29_Y3_N20
\uut_lcd_driver|Mux0~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~1_combout\ = (\uut_lcd_driver|tmp_cnt\(2) & ((\uut_lcd_driver|Mux0~0_combout\ & ((\myram_inst|altsyncram_component|auto_generated|q_a\(30)))) # (!\uut_lcd_driver|Mux0~0_combout\ & 
-- (\myram_inst|altsyncram_component|auto_generated|q_a\(22))))) # (!\uut_lcd_driver|tmp_cnt\(2) & (((\uut_lcd_driver|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(2),
	datab => \myram_inst|altsyncram_component|auto_generated|q_a\(22),
	datac => \uut_lcd_driver|Mux0~0_combout\,
	datad => \myram_inst|altsyncram_component|auto_generated|q_a\(30),
	combout => \uut_lcd_driver|Mux0~1_combout\);

-- Location: LCCOMB_X29_Y3_N30
\uut_lcd_driver|Mux0~7\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~7_combout\ = (\uut_lcd_driver|tmp_cnt\(2) & ((\uut_lcd_driver|tmp_cnt\(3)) # ((\myram_inst|altsyncram_component|auto_generated|q_a\(23))))) # (!\uut_lcd_driver|tmp_cnt\(2) & (!\uut_lcd_driver|tmp_cnt\(3) & 
-- ((\myram_inst|altsyncram_component|auto_generated|q_a\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(2),
	datab => \uut_lcd_driver|tmp_cnt\(3),
	datac => \myram_inst|altsyncram_component|auto_generated|q_a\(23),
	datad => \myram_inst|altsyncram_component|auto_generated|q_a\(19),
	combout => \uut_lcd_driver|Mux0~7_combout\);

-- Location: LCCOMB_X29_Y3_N16
\uut_lcd_driver|Mux0~8\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~8_combout\ = (\uut_lcd_driver|tmp_cnt\(3) & ((\uut_lcd_driver|Mux0~7_combout\ & ((\myram_inst|altsyncram_component|auto_generated|q_a\(31)))) # (!\uut_lcd_driver|Mux0~7_combout\ & 
-- (\myram_inst|altsyncram_component|auto_generated|q_a\(27))))) # (!\uut_lcd_driver|tmp_cnt\(3) & (((\uut_lcd_driver|Mux0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myram_inst|altsyncram_component|auto_generated|q_a\(27),
	datab => \uut_lcd_driver|tmp_cnt\(3),
	datac => \uut_lcd_driver|Mux0~7_combout\,
	datad => \myram_inst|altsyncram_component|auto_generated|q_a\(31),
	combout => \uut_lcd_driver|Mux0~8_combout\);

-- Location: LCCOMB_X28_Y3_N30
\uut_lcd_driver|Mux0~9\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~9_combout\ = (\uut_lcd_driver|tmp_cnt\(1) & ((\uut_lcd_driver|Mux0~6_combout\ & ((\uut_lcd_driver|Mux0~8_combout\))) # (!\uut_lcd_driver|Mux0~6_combout\ & (\uut_lcd_driver|Mux0~1_combout\)))) # (!\uut_lcd_driver|tmp_cnt\(1) & 
-- (\uut_lcd_driver|Mux0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(1),
	datab => \uut_lcd_driver|Mux0~6_combout\,
	datac => \uut_lcd_driver|Mux0~1_combout\,
	datad => \uut_lcd_driver|Mux0~8_combout\,
	combout => \uut_lcd_driver|Mux0~9_combout\);

-- Location: LCCOMB_X29_Y3_N18
\uut_lcd_driver|Mux0~10\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~10_combout\ = (\uut_lcd_driver|tmp_cnt\(1) & (((\uut_lcd_driver|tmp_cnt\(0))))) # (!\uut_lcd_driver|tmp_cnt\(1) & ((\uut_lcd_driver|tmp_cnt\(0) & ((\myram_inst|altsyncram_component|auto_generated|q_a\(9)))) # 
-- (!\uut_lcd_driver|tmp_cnt\(0) & (\myram_inst|altsyncram_component|auto_generated|q_a\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myram_inst|altsyncram_component|auto_generated|q_a\(8),
	datab => \uut_lcd_driver|tmp_cnt\(1),
	datac => \uut_lcd_driver|tmp_cnt\(0),
	datad => \myram_inst|altsyncram_component|auto_generated|q_a\(9),
	combout => \uut_lcd_driver|Mux0~10_combout\);

-- Location: LCCOMB_X29_Y3_N0
\uut_lcd_driver|Mux0~11\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~11_combout\ = (\uut_lcd_driver|tmp_cnt\(1) & ((\uut_lcd_driver|Mux0~10_combout\ & (\myram_inst|altsyncram_component|auto_generated|q_a\(11))) # (!\uut_lcd_driver|Mux0~10_combout\ & 
-- ((\myram_inst|altsyncram_component|auto_generated|q_a\(10)))))) # (!\uut_lcd_driver|tmp_cnt\(1) & (((\uut_lcd_driver|Mux0~10_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myram_inst|altsyncram_component|auto_generated|q_a\(11),
	datab => \uut_lcd_driver|tmp_cnt\(1),
	datac => \myram_inst|altsyncram_component|auto_generated|q_a\(10),
	datad => \uut_lcd_driver|Mux0~10_combout\,
	combout => \uut_lcd_driver|Mux0~11_combout\);

-- Location: LCCOMB_X28_Y3_N4
\uut_lcd_driver|Mux0~14\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~14_combout\ = (\uut_lcd_driver|tmp_cnt\(1) & (\uut_lcd_driver|tmp_cnt\(0))) # (!\uut_lcd_driver|tmp_cnt\(1) & ((\uut_lcd_driver|tmp_cnt\(0) & ((\myram_inst|altsyncram_component|auto_generated|q_a\(1)))) # (!\uut_lcd_driver|tmp_cnt\(0) 
-- & (\myram_inst|altsyncram_component|auto_generated|q_a\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(1),
	datab => \uut_lcd_driver|tmp_cnt\(0),
	datac => \myram_inst|altsyncram_component|auto_generated|q_a\(0),
	datad => \myram_inst|altsyncram_component|auto_generated|q_a\(1),
	combout => \uut_lcd_driver|Mux0~14_combout\);

-- Location: LCCOMB_X28_Y3_N14
\uut_lcd_driver|Mux0~15\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~15_combout\ = (\uut_lcd_driver|tmp_cnt\(1) & ((\uut_lcd_driver|Mux0~14_combout\ & (\myram_inst|altsyncram_component|auto_generated|q_a\(3))) # (!\uut_lcd_driver|Mux0~14_combout\ & 
-- ((\myram_inst|altsyncram_component|auto_generated|q_a\(2)))))) # (!\uut_lcd_driver|tmp_cnt\(1) & (((\uut_lcd_driver|Mux0~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(1),
	datab => \myram_inst|altsyncram_component|auto_generated|q_a\(3),
	datac => \uut_lcd_driver|Mux0~14_combout\,
	datad => \myram_inst|altsyncram_component|auto_generated|q_a\(2),
	combout => \uut_lcd_driver|Mux0~15_combout\);

-- Location: LCCOMB_X28_Y3_N28
\uut_lcd_driver|Mux0~12\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~12_combout\ = (\uut_lcd_driver|tmp_cnt\(1) & ((\uut_lcd_driver|tmp_cnt\(0)) # ((\myram_inst|altsyncram_component|auto_generated|q_a\(6))))) # (!\uut_lcd_driver|tmp_cnt\(1) & (!\uut_lcd_driver|tmp_cnt\(0) & 
-- (\myram_inst|altsyncram_component|auto_generated|q_a\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(1),
	datab => \uut_lcd_driver|tmp_cnt\(0),
	datac => \myram_inst|altsyncram_component|auto_generated|q_a\(4),
	datad => \myram_inst|altsyncram_component|auto_generated|q_a\(6),
	combout => \uut_lcd_driver|Mux0~12_combout\);

-- Location: LCCOMB_X28_Y3_N18
\uut_lcd_driver|Mux0~13\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~13_combout\ = (\uut_lcd_driver|tmp_cnt\(0) & ((\uut_lcd_driver|Mux0~12_combout\ & (\myram_inst|altsyncram_component|auto_generated|q_a\(7))) # (!\uut_lcd_driver|Mux0~12_combout\ & 
-- ((\myram_inst|altsyncram_component|auto_generated|q_a\(5)))))) # (!\uut_lcd_driver|tmp_cnt\(0) & (((\uut_lcd_driver|Mux0~12_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \myram_inst|altsyncram_component|auto_generated|q_a\(7),
	datab => \uut_lcd_driver|tmp_cnt\(0),
	datac => \myram_inst|altsyncram_component|auto_generated|q_a\(5),
	datad => \uut_lcd_driver|Mux0~12_combout\,
	combout => \uut_lcd_driver|Mux0~13_combout\);

-- Location: LCCOMB_X28_Y3_N20
\uut_lcd_driver|Mux0~16\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~16_combout\ = (\uut_lcd_driver|tmp_cnt\(2) & ((\uut_lcd_driver|tmp_cnt\(3)) # ((\uut_lcd_driver|Mux0~13_combout\)))) # (!\uut_lcd_driver|tmp_cnt\(2) & (!\uut_lcd_driver|tmp_cnt\(3) & (\uut_lcd_driver|Mux0~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|tmp_cnt\(2),
	datab => \uut_lcd_driver|tmp_cnt\(3),
	datac => \uut_lcd_driver|Mux0~15_combout\,
	datad => \uut_lcd_driver|Mux0~13_combout\,
	combout => \uut_lcd_driver|Mux0~16_combout\);

-- Location: LCCOMB_X28_Y3_N16
\uut_lcd_driver|Mux0~19\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|Mux0~19_combout\ = (\uut_lcd_driver|tmp_cnt\(3) & ((\uut_lcd_driver|Mux0~16_combout\ & (\uut_lcd_driver|Mux0~18_combout\)) # (!\uut_lcd_driver|Mux0~16_combout\ & ((\uut_lcd_driver|Mux0~11_combout\))))) # (!\uut_lcd_driver|tmp_cnt\(3) & 
-- (((\uut_lcd_driver|Mux0~16_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|Mux0~18_combout\,
	datab => \uut_lcd_driver|tmp_cnt\(3),
	datac => \uut_lcd_driver|Mux0~11_combout\,
	datad => \uut_lcd_driver|Mux0~16_combout\,
	combout => \uut_lcd_driver|Mux0~19_combout\);

-- Location: LCCOMB_X28_Y3_N12
\uut_lcd_driver|lcd_db_rgb~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|lcd_db_rgb~0_combout\ = (\uut_lcd_driver|always9~6_combout\ & ((\uut_lcd_driver|tmp_cnt\(4) & (!\uut_lcd_driver|Mux0~9_combout\)) # (!\uut_lcd_driver|tmp_cnt\(4) & ((!\uut_lcd_driver|Mux0~19_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|always9~6_combout\,
	datab => \uut_lcd_driver|tmp_cnt\(4),
	datac => \uut_lcd_driver|Mux0~9_combout\,
	datad => \uut_lcd_driver|Mux0~19_combout\,
	combout => \uut_lcd_driver|lcd_db_rgb~0_combout\);

-- Location: FF_X30_Y2_N11
\uut_lcd_driver|x_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|Add1~2_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|Equal0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|x_cnt\(1));

-- Location: LCCOMB_X29_Y2_N30
\uut_lcd_driver|LessThan4~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|LessThan4~0_combout\ = (!\uut_lcd_driver|x_cnt\(3) & (!\uut_lcd_driver|x_cnt\(2) & ((!\uut_lcd_driver|x_cnt\(0)) # (!\uut_lcd_driver|x_cnt\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(3),
	datab => \uut_lcd_driver|x_cnt\(1),
	datac => \uut_lcd_driver|x_cnt\(0),
	datad => \uut_lcd_driver|x_cnt\(2),
	combout => \uut_lcd_driver|LessThan4~0_combout\);

-- Location: LCCOMB_X29_Y2_N28
\uut_lcd_driver|always9~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|always9~0_combout\ = (\uut_lcd_driver|y_cnt\(7) & ((\uut_lcd_driver|x_cnt\(5)) # ((!\uut_lcd_driver|LessThan4~0_combout\)))) # (!\uut_lcd_driver|y_cnt\(7) & (!\uut_lcd_driver|LessThan2~0_combout\ & ((\uut_lcd_driver|x_cnt\(5)) # 
-- (!\uut_lcd_driver|LessThan4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101011001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(7),
	datab => \uut_lcd_driver|x_cnt\(5),
	datac => \uut_lcd_driver|LessThan4~0_combout\,
	datad => \uut_lcd_driver|LessThan2~0_combout\,
	combout => \uut_lcd_driver|always9~0_combout\);

-- Location: LCCOMB_X29_Y2_N26
\uut_lcd_driver|always9~3\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|always9~3_combout\ = (\uut_lcd_driver|x_cnt\(5) & (\uut_lcd_driver|y_cnt\(6) $ (((\uut_lcd_driver|y_cnt\(7)))))) # (!\uut_lcd_driver|x_cnt\(5) & (\uut_lcd_driver|x_cnt\(4) & (\uut_lcd_driver|y_cnt\(6) $ (\uut_lcd_driver|y_cnt\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(6),
	datab => \uut_lcd_driver|x_cnt\(5),
	datac => \uut_lcd_driver|x_cnt\(4),
	datad => \uut_lcd_driver|y_cnt\(7),
	combout => \uut_lcd_driver|always9~3_combout\);

-- Location: LCCOMB_X29_Y2_N20
\uut_lcd_driver|always9~4\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|always9~4_combout\ = (!\uut_lcd_driver|x_cnt\(8) & (\uut_lcd_driver|x_cnt\(7) & (\uut_lcd_driver|x_cnt\(6) & !\uut_lcd_driver|y_cnt\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(8),
	datab => \uut_lcd_driver|x_cnt\(7),
	datac => \uut_lcd_driver|x_cnt\(6),
	datad => \uut_lcd_driver|y_cnt\(8),
	combout => \uut_lcd_driver|always9~4_combout\);

-- Location: LCCOMB_X29_Y2_N6
\uut_lcd_driver|always9~5\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|always9~5_combout\ = (\uut_lcd_driver|always9~3_combout\ & (\uut_lcd_driver|always9~4_combout\ & ((\uut_lcd_driver|y_cnt\(7)) # (\uut_lcd_driver|y_cnt\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(7),
	datab => \uut_lcd_driver|y_cnt\(5),
	datac => \uut_lcd_driver|always9~3_combout\,
	datad => \uut_lcd_driver|always9~4_combout\,
	combout => \uut_lcd_driver|always9~5_combout\);

-- Location: LCCOMB_X29_Y2_N2
\uut_lcd_driver|always9~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|always9~1_combout\ = (\uut_lcd_driver|y_cnt\(7) & (\uut_lcd_driver|y_cnt\(5) & !\uut_lcd_driver|LessThan2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|y_cnt\(7),
	datac => \uut_lcd_driver|y_cnt\(5),
	datad => \uut_lcd_driver|LessThan2~0_combout\,
	combout => \uut_lcd_driver|always9~1_combout\);

-- Location: LCCOMB_X29_Y2_N4
\uut_lcd_driver|always9~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|always9~2_combout\ = (!\uut_lcd_driver|always9~1_combout\ & (((\uut_lcd_driver|LessThan4~0_combout\) # (!\uut_lcd_driver|x_cnt\(5))) # (!\uut_lcd_driver|x_cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|x_cnt\(4),
	datab => \uut_lcd_driver|x_cnt\(5),
	datac => \uut_lcd_driver|LessThan4~0_combout\,
	datad => \uut_lcd_driver|always9~1_combout\,
	combout => \uut_lcd_driver|always9~2_combout\);

-- Location: LCCOMB_X28_Y3_N2
\uut_lcd_driver|lcd_db_rgb[15]~1\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|lcd_db_rgb[15]~1_combout\ = (\uut_lcd_driver|Equal0~0_combout\) # (((!\uut_lcd_driver|always9~2_combout\) # (!\uut_lcd_driver|always9~5_combout\)) # (!\uut_lcd_driver|always9~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|Equal0~0_combout\,
	datab => \uut_lcd_driver|always9~0_combout\,
	datac => \uut_lcd_driver|always9~5_combout\,
	datad => \uut_lcd_driver|always9~2_combout\,
	combout => \uut_lcd_driver|lcd_db_rgb[15]~1_combout\);

-- Location: FF_X28_Y3_N13
\uut_lcd_driver|lcd_db_rgb[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|lcd_db_rgb~0_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|lcd_db_rgb[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|lcd_db_rgb\(15));

-- Location: LCCOMB_X29_Y3_N28
\uut_lcd_driver|valid~feeder\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|valid~feeder_combout\ = \uut_lcd_driver|validr~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \uut_lcd_driver|validr~q\,
	combout => \uut_lcd_driver|valid~feeder_combout\);

-- Location: FF_X29_Y3_N29
\uut_lcd_driver|valid\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|valid~feeder_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|valid~q\);

-- Location: LCCOMB_X29_Y3_N24
\uut_lcd_driver|lcd_db_r[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|lcd_db_r[0]~0_combout\ = (\uut_lcd_driver|lcd_db_rgb\(15) & \uut_lcd_driver|valid~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \uut_lcd_driver|lcd_db_rgb\(15),
	datad => \uut_lcd_driver|valid~q\,
	combout => \uut_lcd_driver|lcd_db_r[0]~0_combout\);

-- Location: LCCOMB_X28_Y3_N10
\uut_lcd_driver|lcd_db_rgb~2\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|lcd_db_rgb~2_combout\ = (\uut_lcd_driver|always9~6_combout\ & ((\uut_lcd_driver|tmp_cnt\(4) & (\uut_lcd_driver|Mux0~9_combout\)) # (!\uut_lcd_driver|tmp_cnt\(4) & ((\uut_lcd_driver|Mux0~19_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \uut_lcd_driver|always9~6_combout\,
	datab => \uut_lcd_driver|tmp_cnt\(4),
	datac => \uut_lcd_driver|Mux0~9_combout\,
	datad => \uut_lcd_driver|Mux0~19_combout\,
	combout => \uut_lcd_driver|lcd_db_rgb~2_combout\);

-- Location: FF_X28_Y3_N11
\uut_lcd_driver|lcd_db_rgb[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \uut_lcd_driver|lcd_db_rgb~2_combout\,
	clrn => \rst_n~inputclkctrl_outclk\,
	ena => \uut_lcd_driver|lcd_db_rgb[15]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \uut_lcd_driver|lcd_db_rgb\(0));

-- Location: LCCOMB_X30_Y3_N16
\uut_lcd_driver|lcd_db_b[0]~0\ : cycloneiii_lcell_comb
-- Equation(s):
-- \uut_lcd_driver|lcd_db_b[0]~0_combout\ = (\uut_lcd_driver|valid~q\ & \uut_lcd_driver|lcd_db_rgb\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \uut_lcd_driver|valid~q\,
	datad => \uut_lcd_driver|lcd_db_rgb\(0),
	combout => \uut_lcd_driver|lcd_db_b[0]~0_combout\);

ww_lcd_en <= \lcd_en~output_o\;

ww_lcd_clk <= \lcd_clk~output_o\;

ww_lcd_hsy <= \lcd_hsy~output_o\;

ww_lcd_vsy <= \lcd_vsy~output_o\;

ww_lcd_db_r(0) <= \lcd_db_r[0]~output_o\;

ww_lcd_db_r(1) <= \lcd_db_r[1]~output_o\;

ww_lcd_db_r(2) <= \lcd_db_r[2]~output_o\;

ww_lcd_db_r(3) <= \lcd_db_r[3]~output_o\;

ww_lcd_db_r(4) <= \lcd_db_r[4]~output_o\;

ww_lcd_db_g(0) <= \lcd_db_g[0]~output_o\;

ww_lcd_db_g(1) <= \lcd_db_g[1]~output_o\;

ww_lcd_db_g(2) <= \lcd_db_g[2]~output_o\;

ww_lcd_db_g(3) <= \lcd_db_g[3]~output_o\;

ww_lcd_db_g(4) <= \lcd_db_g[4]~output_o\;

ww_lcd_db_g(5) <= \lcd_db_g[5]~output_o\;

ww_lcd_db_b(0) <= \lcd_db_b[0]~output_o\;

ww_lcd_db_b(1) <= \lcd_db_b[1]~output_o\;

ww_lcd_db_b(2) <= \lcd_db_b[2]~output_o\;

ww_lcd_db_b(3) <= \lcd_db_b[3]~output_o\;

ww_lcd_db_b(4) <= \lcd_db_b[4]~output_o\;
END structure;


