----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 10:49:55 PM
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
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           O : out STD_LOGIC_VECTOR (13 downto 0));
end PROM;

architecture Behavioral of PROM is

type rom_type is array (0 to 15) of std_logic_vector (13 downto 0);
    signal Program_ROM : rom_type :=(
        "00101110000000", --MOVI R7, 0
    "00101110000001", --MOVI R7, 1
    "01111100000000", --RES R6
    "00100110000110", --MOVI R3, 6
    "01111010000000", --RES R5
    "00001011110000", --ADD R5, R7
    "00001011100000", --ADD R5, R6
    "01111000000000", --RES R4
    "00001001110000", --ADD R4, R7
    "01111100000000", --RES R6
    "00001101000000", --ADD R6, R4
    "01111110000000", --RES R7
    "00001111010000", --ADD R7, R5
    "01010110100000", --DEC R3
    "00110110001110", --JZR R3, 15
    "00110000000100" --JZR R0, 5
         
        );

begin

O <= program_ROM(to_integer(unsigned(I)));

end Behavioral;