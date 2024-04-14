----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 11:04:28 PM
-- Design Name: 
-- Module Name: TB_Nanoprocessor1 - Behavioral
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

entity TB_Nanoprocessor1 is
--  Port ( );
end TB_Nanoprocessor1;

architecture Behavioral of TB_Nanoprocessor1 is

component Nanoprocessor1
Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Zero : out std_logic;
           Overflow : out std_logic;
           InsNum : out std_logic_vector(2 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
            RD7Out: out std_logic_vector(3 downto 0));
end component;

signal  reset, zero, overflow: std_logic;
signal clk : std_logic := '0';
signal rd7 : std_logic_vector( 3 downto 0);
signal ins : std_logic_vector( 2 downto 0);
signal  S_7Seg :  STD_LOGIC_VECTOR (6 downto 0);

begin

UUT: Nanoprocessor1
port map(Clk => clk,
Reset => reset,
Zero => zero,
Overflow => overflow,
InsNum => ins,
S_7Seg => S_7Seg,
RD7Out => rd7);

process begin

wait for 20 ns;

clk <= not clk;

end process;

process begin
reset <= '1';
wait for 30 ns;
reset <= '0';
wait;
end process;

end Behavioral;
