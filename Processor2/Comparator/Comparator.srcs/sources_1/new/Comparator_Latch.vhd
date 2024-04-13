----------------------------------------------------------------------------------

-- Group 17
-- Senevirathne S.M.P.U.
-- 
-- Create Date: 04/13/2024 10:02:06 PM
-- Design Name: Comparator
-- Module Name: Comparator_Latch - Behavioral
-- Project Name: Nanoprocessor
-- Target Devices: Basys3 Board

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_Latch is
    Port ( An : in STD_LOGIC; --n th bit of number A
           Bn : in STD_LOGIC; --n th bit of number B
           IA : in STD_LOGIC; --input status: A
           IB : in STD_LOGIC; --input status: B
           OA : out STD_LOGIC; --output status: A
           OB : out STD_LOGIC); --output status: B
end Comparator_Latch;

architecture Behavioral of Comparator_Latch is

begin
    OA <= IA OR NOT(NOT(An) OR Bn OR IB); -- output status: A
    OB <= IB OR NOT(NOT(Bn) OR An OR IA); -- output status: B
end Behavioral;
