----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 05:17:32 AM
-- Design Name: 
-- Module Name: RegisterBank - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterBank is
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           RB_in : in STD_LOGIC_VECTOR (3 downto 0);
           CLK_in : in STD_LOGIC;
           R0_out : out STD_LOGIC_VECTOR (3 downto 0);
           R1_out : out STD_LOGIC_VECTOR (3 downto 0);
           R2_out : out STD_LOGIC_VECTOR (3 downto 0);
           R3_out : out STD_LOGIC_VECTOR (3 downto 0);
           R4_out : out STD_LOGIC_VECTOR (3 downto 0);
           R5_out : out STD_LOGIC_VECTOR (3 downto 0);
           R6_out : out STD_LOGIC_VECTOR (3 downto 0);
           R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end RegisterBank;

architecture Behavioral of RegisterBank is

component Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Register_4_bit
    Port ( R_in : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           CLK : in STD_LOGIC;
           R_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal tempEN : STD_LOGIC_VECTOR (7 downto 0);

begin

Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
        I => S,
        EN => '1',
        Y => tempEN);

Register_4_bit_0 : Register_4_bit
    port map(
        R_in => "0000",
        EN => '1',
        CLK => CLK_in,
        R_out => R0_out);

Register_4_bit_1 : Register_4_bit
    port map(
        R_in => RB_in,
        EN => tempEN(1),
        CLK => CLK_in,
        R_out => R1_out);

Register_4_bit_2 : Register_4_bit
    port map(
        R_in => RB_in,
        EN => tempEN(2),
        CLK => CLK_in,
        R_out => R2_out);

Register_4_bit_3 : Register_4_bit
    port map(
        R_in => RB_in,
        EN => tempEN(3),
        CLK => CLK_in,
        R_out => R3_out);

Register_4_bit_4 : Register_4_bit
    port map(
        R_in => RB_in,
        EN => tempEN(4),
        CLK => CLK_in,
        R_out => R4_out);

Register_4_bit_5 : Register_4_bit
    port map(
        R_in => RB_in,
        EN => tempEN(5),
        CLK => CLK_in,
        R_out => R5_out);

Register_4_bit_6 : Register_4_bit
    port map(
        R_in => RB_in,
        EN => tempEN(6),
        CLK => CLK_in,
        R_out => R6_out);

Register_4_bit_7 : Register_4_bit
    port map(
        R_in => RB_in,
        EN => tempEN(7),
        CLK => CLK_in,
        R_out => R7_out);
        
end Behavioral;