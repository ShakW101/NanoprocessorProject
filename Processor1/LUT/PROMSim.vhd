----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 08:16:56 PM
-- Design Name: 
-- Module Name: PROMSim - Behavioral
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

entity PROMSim is
--  Port ( );
end PROMSim;

architecture Behavioral of PROMSim is

component PROM is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal I : STD_LOGIC_VECTOR(2 downto 0);
signal O : STD_LOGIC_VECTOR( 11 downto 0);

begin

UUT : PROM

port map(
    I => I,
    O => O
);

process 

begin

I <= "000";
wait for 100 ns;

I <= "001";
wait for 100 ns;

I <= "010";
wait for 100 ns;

I <= "011";
wait for 100 ns;

I <= "100";
wait for 100 ns;

I <= "101";
wait for 100 ns;

I <= "110";
wait for 100 ns;

I <= "111";
wait for 100 ns;

wait;
end process;



end Behavioral;
