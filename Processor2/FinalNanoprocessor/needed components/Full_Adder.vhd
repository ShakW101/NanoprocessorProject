----------------------------------------------------------------------------------

-- Group 17
-- Senevirathne S.M.P.U.
-- 
-- Create Date: 04/16/2024 12:27:08 PM
-- Design Name: Carry_Look_Ahead_Adder_Subtractor
-- Module Name: Full_Adder - Behavioral
-- Project Name: Nanoprocessor
-- Target Devices: Basys3 Board

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Full_Adder is
    Port ( A : in STD_LOGIC; --First input bit
           B : in STD_LOGIC; --Second input bit
           Carry_in : in STD_LOGIC; --Carry input bit
           Sum : out STD_LOGIC; --Sum output bit
           Carry_out : out STD_LOGIC; --Carry output bit
           P : out STD_LOGIC; --Propergate output bit
           G : out STD_LOGIC); --Generate output bit
end Full_Adder;

architecture Behavioral of Full_Adder is
component Half_Adder
    Port ( A : in STD_LOGIC; --First input bit
       B : in STD_LOGIC; --Second input bit
       Sum : out STD_LOGIC; --Sum output bit
       Carry : out STD_LOGIC); --Carry output bit
end component;

SIGNAL A1, A2, B1, B2: std_logic; --signal inputs of the two half adders
SIGNAL Sum1, Sum2, Carry1, Carry2: std_logic; --signal outputs of the two half adders
begin
    Half_Adder_2 : Half_Adder --mapping the bottom half adder
    port map(
        A => A2,
        B => B2,
        Sum => Sum2,
        Carry => Carry2
    );
    Half_Adder_1 : Half_Adder --mapping the top half adder
    port map(
        A => A1,
        B => B1,
        Sum => Sum1,
        Carry => Carry1
    );
--Assigning the inputs to the bottom half adder
A2 <= A;
B2 <= B;

--Defining generation and propergation bits
P <= Sum2;
G <= Carry2;

--Assigning the inputs to the top half adder
B1 <= Carry_in;
A1 <= Sum2;

--Defining Carry_out and sum
Carry_out <= Carry2 OR Carry1;
Sum <= Sum1;
end Behavioral;