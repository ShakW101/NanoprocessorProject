----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 02:24:22 AM
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
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (13 downto 0));
end component;

signal I : STD_LOGIC_VECTOR(3 downto 0);
signal O : STD_LOGIC_VECTOR(13 downto 0);




begin

UUT : PROM
port map(
    I => I,
    O => O
    );
    
 process
 begin

I <= "0000";
wait for 100 ns;

I <= "0001";
wait for 100 ns;

I <= "0010";
wait for 100 ns;

I <= "0011";
wait for 100 ns;

I <= "1000";
wait for 100 ns;

I <= "1001";
wait for 100 ns;

I <= "1010";
wait for 100 ns;

I <= "0111";
wait for 100 ns;

I <= "1000";
wait for 100 ns;

I <= "1001";
wait for 100 ns;

I <= "1010";
wait for 100 ns;

wait;

end process;

end Behavioral;
