----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/22/2024 12:14:59 AM
-- Design Name: 
-- Module Name: MUX_8_to_1 - Behavioral
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

entity MUX_8_to_1 is
    Port ( I : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
end MUX_8_to_1;

architecture Behavioral of MUX_8_to_1 is

COMPONENT Decoder_3_to_8
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;

SIGNAL A, B : STD_LOGIC_VECTOR(7 DOWNTO 0);

begin

Decoder_3_to_8_0 : Decoder_3_to_8
    PORT MAP(
        I => S,
        Y => A,
        EN => EN
        );

B(7 DOWNTO 0) <= I(7 DOWNTO 0) AND A(7 DOWNTO 0);
Y <= B(0) OR B(1) OR B(2) OR B(3) OR B(4) OR B(5) OR B(6) OR B(7);

end Behavioral;
