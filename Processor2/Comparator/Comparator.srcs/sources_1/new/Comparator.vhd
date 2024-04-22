----------------------------------------------------------------------------------

-- Group 17
-- Senevirathne S.M.P.U.
-- 
-- Create Date: 04/13/2024 10:02:06 PM
-- Design Name: Comparator
-- Module Name: Comparator - Behavioral
-- Project Name: Nanoprocessor
-- Target Devices: Basys3 Board

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator is
    Port ( EN : in STD_LOGIC; --Enable input
           A : in STD_LOGIC_VECTOR (3 downto 0); --4 bit value: A
           B : in STD_LOGIC_VECTOR (3 downto 0); --4 bit value: B
           AGreat : out STD_LOGIC; --Is A the greater number?
           BGreat : out STD_LOGIC; --Is B the greater number?
           Equal : out STD_LOGIC); --Are the numbers equal?
end Comparator;

architecture Behavioral of Comparator is
component Comparator_Latch
    Port ( An : in STD_LOGIC; --n th bit of number A
       Bn : in STD_LOGIC; --n th bit of number B
       IA : in STD_LOGIC; --input status: A
       IB : in STD_LOGIC; --input status: B
       OA : out STD_LOGIC; --output status: A
       OA1 : out STD_LOGIC; --AGreat Special Case
       OB : out STD_LOGIC; --output status: B
       OB1 : out STD_LOGIC); --BGreat Special Case
end component;

SIGNAL IA3, IA2, IA1, IB3, IB2, IB1 : std_logic; --signal input statuses of A and B
SIGNAL OA3, OA2, OA1, OB3, OB2, OB1, OA1_3, OA1_2, OA1_1, OB1_3, OB1_2, OB1_1 : std_logic; --signal output statuses of A and B
SIGNAL An2, An1, An0, Bn2, Bn1, Bn0 : std_logic; --signal 2 downto 0 bits of A and B
SIGNAL OA1_x, OB1_y :std_logic; --special outputs
begin
    Comparator_Latch_3 : Comparator_Latch --mapping the bottom latch
    port map (
        An => An2,
        Bn => Bn2,
        IA => IA3,
        IB => IB3,
        OA => OA3,
        OA1 => OA1_3,
        OB => OB3,
        OB1 => OB1_3
    );
    Comparator_Latch_2 : Comparator_Latch --mapping the middle latch
    port map (
        An => An1,
        Bn => Bn1,
        IA => IA2,
        IB => IB2,
        OA => OA2,
        OA1 => OA1_2,
        OB => OB2,
        OB1 => OB1_2
    );
    Comparator_Latch_1 : Comparator_Latch --mapping the top latch
    port map (
        An => An0,
        Bn => Bn0,
        IA => IA1,
        IB => IB1,
        OA => OA1,
        OA1 => OA1_1,
        OB => OB1,
        OB1 => OB1_1
    );
--Assigning the inputs to the bottom latch
IA3 <= B(3) AND EN;
IB3 <= A(3) AND EN;
An2 <= A(2) AND EN;
Bn2 <= B(2) AND EN;

--Assigning the inputs to the middle latch
IA2 <= OA3;
IB2 <= OB3;
An1 <= A(1) AND EN;
Bn1 <= B(1) AND EN;

--Assigning the inputs to the top latch
IA1 <= OA2;
IB1 <= OB2;
An0 <= A(0) AND EN;
Bn0 <= B(0) AND EN;

--Defining OA1_x and OA1_y for the special cases
OA1_x <= OA1_3 OR OA1_2 OR OA1_1;
OB1_y <= OB1_3 OR OB1_2 OR OB1_1;

--Defining the flags; AGreat, BGreat and Equal
AGreat <= ((OA1 AND NOT(OB1)) OR OA1_x);
BGreat <= ((NOT(OA1) AND OB1) OR OB1_y);
Equal <= EN AND NOT(OA1 XOR OB1) AND NOT(OA1_x XOR OB1_y);

end Behavioral;
