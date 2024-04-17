----------------------------------------------------------------------------------

-- Group 17
-- Senevirathne S.M.P.U.
-- 
-- Create Date: 04/16/2024 12:02:05 PM
-- Design Name: Carry_Look_Ahead_Adder_Subtractor
-- Module Name: Half_Adder - Behavioral
-- Project Name: Nanoprocessor
-- Target Devices: Basys3 Board

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Half_Adder is
    Port ( A : in STD_LOGIC; --First input bit
           B : in STD_LOGIC; --Second input bit
           Sum : out STD_LOGIC; --Sum output bit
           Carry : out STD_LOGIC); --Carry output bit
end Half_Adder;

architecture Behavioral of Half_Adder is

begin
    --Defining sum and carry of the half adder
    Sum <= A XOR B;
    Carry <= A AND B;
end Behavioral;
