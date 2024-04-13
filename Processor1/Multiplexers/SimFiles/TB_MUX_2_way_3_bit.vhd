----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 11:09:21 PM
-- Design Name: 
-- Module Name: TB_MUX_2_way_4_bit - Behavioral
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

entity TB_MUX_2_way_3_bit is
--  Port ( );
end TB_MUX_2_way_3_bit;

architecture Behavioral of TB_MUX_2_way_3_bit is

component MUX_2_way_3_bit
    Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

Signal I0, I1 : STD_LOGIC_VECTOR (2 downto 0);
Signal Y : STD_LOGIC_VECTOR (2 downto 0);
signal S : STD_LOGIC;


begin

UUT : MUX_2_way_3_bit PORT MAP(
    I0 => I0,
    I1 => I1,
    Y => Y,
    S => S);
    
 process
 begin
 
    I0 <= "110";
    I1 <= "011";
    S <= '0';
    wait for 100 ns;
    
    I0 <= "010";
    I1 <= "011";
    S <= '1';
    wait for 100 ns;
        
    I0 <= "110";
    I1 <= "011";
    S <= '0';
    wait for 100 ns;
            
    I0 <= "010";
    I1 <= "000";
    S <= '1';
    wait for 100 ns;
    
    I0 <= "010";
    I1 <= "110";
    S <= '0';
    wait for 100 ns;
    
    I0 <= "010";
    I1 <= "110";
    S <= '1';
    wait for 100 ns;
    
    I0 <= "011";
    I1 <= "010";
    S <= '1';
    wait for 100 ns;
       
    I0 <= "101";
    I1 <= "111";
    S <= '0';
    wait;
 
 end process;

end Behavioral;
