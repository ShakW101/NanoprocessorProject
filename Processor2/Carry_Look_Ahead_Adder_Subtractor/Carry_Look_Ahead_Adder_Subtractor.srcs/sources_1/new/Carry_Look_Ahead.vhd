----------------------------------------------------------------------------------

-- Group 17
-- Senevirathne S.M.P.U.
-- 
-- Create Date: 04/16/2024 01:35:19 PM
-- Design Name: Carry_Look_Ahead_Adder_Subtractor
-- Module Name: Carry_Look_Ahead - Behavioral
-- Project Name: Nanoprocessor
-- Target Devices: Basys3 Board

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_Look_Ahead is
    Port ( P : in STD_LOGIC_VECTOR (2 downto 0); --Propergate input bus
           G : in STD_LOGIC_VECTOR (2 downto 0); --Propergate output bus
           Carry_in : in STD_LOGIC; --Carry input bit
           Carry_out : out STD_LOGIC_VECTOR (3 downto 2)); --Carry output bus
end Carry_Look_Ahead;

architecture Behavioral of Carry_Look_Ahead is

begin
--Defining Carry_out(2)
Carry_out(2) <= (Carry_in AND P(0) AND P(1)) OR (G(0) AND P(1)) OR G(1); 
--Defining Carry_out(1)
Carry_out(3) <= (Carry_in AND P(0) AND P(1) AND P(2)) OR (G(0) AND P(1) AND P(2)) OR (G(1) AND P(2)) OR G(2); 
end Behavioral;
