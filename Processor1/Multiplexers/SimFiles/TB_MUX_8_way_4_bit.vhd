----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 01:04:53 AM
-- Design Name: 
-- Module Name: TB_MUX_8_way_4_bit - Behavioral
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

entity TB_MUX_8_way_4_bit is
--  Port ( );
end TB_MUX_8_way_4_bit;

architecture Behavioral of TB_MUX_8_way_4_bit is

component MUX_8_way_4_bit
        Port ( 
            I0 : in STD_LOGIC_VECTOR (3 downto 0);
            I1 : in STD_LOGIC_VECTOR (3 downto 0);
            I2 : in STD_LOGIC_VECTOR (3 downto 0);
            I3 : in STD_LOGIC_VECTOR (3 downto 0);
            I4 : in STD_LOGIC_VECTOR (3 downto 0);
            I5 : in STD_LOGIC_VECTOR (3 downto 0);
            I6 : in STD_LOGIC_VECTOR (3 downto 0);
            I7 : in STD_LOGIC_VECTOR (3 downto 0);
            S_in : in STD_LOGIC_VECTOR (2 downto 0);
            Y_out : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

signal I0, I1, I2, I3, I4, I5, I6, I7 : std_logic_vector(3 downto 0);
signal S_in : std_logic_vector(2 downto 0);
signal Y_out : std_logic_vector(3 downto 0);

begin

UUT: MUX_8_way_4_bit port map (
        I0 => I0,
        I1 => I1,
        I2 => I2,
        I3 => I3,
        I4 => I4,
        I5 => I5,
        I6 => I6,
        I7 => I7,
        S_in => S_in,
        Y_out => Y_out
    );
    
process
begin

    I0 <= "1000";
    I1 <= "1001";
    I2 <= "1010";
    I3 <= "1011";
    I4 <= "1100";
    I5 <= "1101";
    I6 <= "1110";
    I7 <= "0111";
    S_in <= "010";
    wait for 100 ns;
    
    I0 <= "1000";
    I1 <= "1001";
    I2 <= "1010";
    I3 <= "1011";
    I4 <= "1100";
    I5 <= "1101";
    I6 <= "1110";
    I7 <= "0111";
    S_in <= "010";
    wait for 100 ns;
    
    I0 <= "1000";
    I1 <= "1001";
    I2 <= "1010";
    I3 <= "1011";
    I4 <= "1100";
    I5 <= "1101";
    I6 <= "1110";
    I7 <= "0111";
    S_in <= "110";
    wait for 100 ns;
    
    I0 <= "1000";
    I1 <= "1001";
    I2 <= "1010";
    I3 <= "1011";
    I4 <= "1100";
    I5 <= "1101";
    I6 <= "1110";
    I7 <= "0111";
    S_in <= "000";
    wait for 100 ns;
    
    I0 <= "1000";
    I1 <= "1001";
    I2 <= "1010";
    I3 <= "1011";
    I4 <= "1100";
    I5 <= "1101";
    I6 <= "1110";
    I7 <= "0111";
    S_in <= "110";
    wait;

end process;
end Behavioral;
