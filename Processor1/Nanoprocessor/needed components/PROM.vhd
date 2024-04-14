----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 06:21:43 PM
-- Design Name: 
-- Module Name: PROM - Behavioral
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
use ieee.numeric_std.all; 


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PROM is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           O : out STD_LOGIC_VECTOR (11 downto 0));
end PROM;

architecture Behavioral of PROM is

    type rom_type is array (0 to 7) of std_logic_vector (11 downto 0);
        signal program_ROM : rom_type := (
            "100010000010", --MOVI R1,2
            "101110000011",--MOVI R7,3
            "100100000001", --MOVI R2, 1
            "010100000000", --NEG R2
            "001110010000", --ADD R7, R1
            "000010100000", --ADD R1, R2
            "110010000110", --JZR R1, 7
            "110000000100" --JZR R0, 5
           );

begin
    O <= program_ROM(to_integer(unsigned(I)));

end Behavioral;
