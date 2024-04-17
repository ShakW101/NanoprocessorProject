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
        "00000010100000",  --Add R1  , R2
        "00010010100000",  --Sub R1 - R2
        "00100010000011",  -- Move 3 to R1
        "00110000000011",  --Jump to line 3
        "01000010010000",  --Increase R1 by 1
        "01010010100000",  --Decrease R1 by 1
        "01100010000000",  --Negate R1
        "01110010000000",  --Reset R1 to 0
        "10000010100000", --Compare R1 , R2
        "10010000000000",
        "00101110000001",--Move 1 to R7
        "00101100000010", --Move 2 to R6
        "00001101110000",-- Add R6+R7
        "00011101110000",-- Sub R6-R7
        "01001110010000",--Increase R7 by 1
        "10010000000000"--
         
        );

begin

O <= program_ROM(to_integer(unsigned(I)));

end Behavioral;
