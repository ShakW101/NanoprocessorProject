----------------------------------------------------------------------------------

-- Group 17
-- Senevirathne S.M.P.U.
-- 
-- Create Date: 04/16/2024 04:38:31 PM
-- Design Name: Carry_Look_Ahead_Adder_Subtractor
-- Module Name: Carry_Look_Ahead_Adder_Subtractor_TB - Behavioral
-- Project Name: Nanoprocessor
-- Target Devices: Basys3 Board

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_Look_Ahead_Adder_Subtractor_TB is
end Carry_Look_Ahead_Adder_Subtractor_TB;

architecture Behavioral of Carry_Look_Ahead_Adder_Subtractor_TB is
    component Carry_Look_Ahead_Adder_Subtractor is
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0); --Bus for the first binary number
               B : in STD_LOGIC_VECTOR (3 downto 0); --Bus for the second binary number
               Add_Sub : in STD_LOGIC; --Should we add B to A or should we subtract B from A? (1 for subtraction, 0 for addition)
               EN : in STD_LOGIC; --Enable input
               S : inout STD_LOGIC_VECTOR (3 downto 0); --Bus for the binary sum output
               Sign : inout STD_LOGIC; --Sign Bit: 1 for negative, 0 for positive
               Overflow : inout STD_LOGIC; --Overflow bit: Is there an overflow?
               --When the number is negative, is the number in range [-0,-8]: if yes, there is no overflow => Overflow =0; if no, there is an overflow => Overflow = 1
               --When the number is positive, is the number in range [+0, 7]: if yes, there is no overflow => Overflow =0; if no, there is an overflow => Overflow = 1
               Zero : out STD_LOGIC); --Is the output zero(0000) even when Enable is 1?
    end component;
    
    --Signal the inputs and outputs of Carry Look Ahead Adder Subtractor
    SIGNAL A, B, S : std_logic_vector(3 downto 0);
    SIGNAL Add_Sub, EN, Sign, Overflow, Zero: std_logic;
begin
    Carry_Look_Ahead_Adder_Subtractor_Sim : Carry_Look_Ahead_Adder_Subtractor --mapping Carry Look Ahead Adder Subtractor for simulation
        port map(
            A => A,
            B => B,
            Add_Sub => Add_Sub,
            EN => EN,
            S => S,
            Sign => Sign,
            Overflow => Overflow,
            Zero => Zero
        );
    
    process begin
        wait for 100ns;
        EN <= '1';
        Add_Sub <= '0';
        A <= "0000";
        B <= "0000"; -- 0+0 = 0000(0), Carry = 0 (+0), Overflow = 0(C=0, positive; O=0, No overflow => in range [+0,7] )
        
        wait for 100ns;
        A <= "1001";
        B <= "0010"; -- -7+(2) = -5 = 1011(d), Carry =1, Overflow =0 (C=1, negative; O= 1, No overflow => in range [-0,-8] )
        
        wait for 100ns;
        A <= "0110";
        B <= "0110"; -- 6+(6) = 12 = 1100(c), Carry =0, Overflow =1 (C=0, positive; O= 0, overflowed positively => Above 7 )
        
        wait for 100ns;
        A <= "0001";
        B <= "0010"; -- 1+2 = 3 = 0011(3), Carry = 0, Overflow = 0(C=0, positive; O=0, No overflow => in range [+0,7] )
        
        wait for 100ns;
        A <= "1000";
        B <= "0111"; -- -8+7 = -1 = 1111(f), Carry = 1, Overflow = 0(C=1, negative; O=1, No overflow => in range [-0,-8] )
        
        wait for 100ns;
        A <= "0111";
        B <= "1000"; -- 7+(-8) = -1 = 1111(f), Carry = 1, Overflow = 0(C=1, negative; O=1, No overflow => in range [-0,-8] )
        
        wait for 100ns;
        A <= "0111";
        B <= "1001"; -- 7+(-7) = 0 = 0000(0), Carry =0 (+0), Overflow =0 (C=0, positive; O= 0, No overflow => in range [+0,7] )
        
        wait for 100ns;
        A <= "0100";
        B <= "1101"; -- 4+(-3) = 1 = 0001(1), Carry =0, Overflow =0 (C=0, positive; O= 0, No overflow => in range [+0,7] )
        
        wait for 100ns;
        A <= "0100";
        B <= "1100"; -- 4+(-4) = 0 = 0000(0), Carry =0 (+0), Overflow =0 (C=0, positive; O= 0, No overflow => in range [+0,7] )
        
        wait for 100ns;
        A <= "1001";
        B <= "0001"; -- -7+(1) = -6 = 1010(a), Carry =1, Overflow =0 (C=1, negative; O= 0, No overflow => in range [-0,-8] )
        
        wait for 100ns;
        A <= "1001";
        B <= "0010"; -- -7+(2) = -5 = 1011(b), Carry =1, Overflow =0 (C=1, negative; O= 0, No overflow => in range [-0,-8] )
        
        wait for 100ns;
        Add_Sub <= '1';
        A <= "0000";
        B <= "0000"; -- 0-0 = 0000(0), Carry = 1 (-0), Overflow = 0(C=1, negative; O=0, No overflow => in range [-0,-8])
        
        wait for 100ns;
        A <= "1001";
        B <= "0010"; -- -7-(2) = -9 = 0111(7), Carry =1, Overflow =1 (C=1, negative; O= 1, overflowed negatively => Below -8 )
        
        wait for 100ns;
        A <= "0110";
        B <= "0110"; -- 6-(6) = 0 = 0000(0), Carry =1 (-0), Overflow =0 (C=1, negative; O= 0, No overflow => in range[-0-8] )
        
        wait for 100ns;
        A <= "0001";
        B <= "0010"; -- 1-2 = -1 = 1111(f), Carry = 1, Overflow = 0(C=1, negative; O=0, No overflow => in range [-0,-8])
        
        wait for 100ns;
        A <= "1000";
        B <= "0111"; -- -8-7 = -15 = 0001(1), Carry = 1, Overflow = 1(C=1, negative; O=1, overflowed negatively => Below -8)
        
        wait for 100ns;
        A <= "0111";
        B <= "1000"; -- 7-(-8) = 15 = 1111(f), Carry =0, Overflow = 1 (C=0, positive; O=1, overflowed positively => Above 7)
        
        wait for 100ns;
        A <= "0111";
        B <= "1001"; -- 7-(-7) = 14 = 1110(e), Carry =0, Overflow =1 (C=0, positive; O= 1, overflowed positively => Above 7)
        
        wait for 100ns;
        A <= "0100";
        B <= "1101"; -- 4-(-3) = 7 = 0111(7), Carry =0, Overflow =0 (C=0, positive; O= 0, No overflow => in range [+0,7] )
        
        wait for 100ns;
        A <= "0100";
        B <= "1100"; -- 4-(-4) = 8 = 1000(8), Carry =0, Overflow =1 (C=0, positive; O= 0, overflowed positively => Above 7 )
        
        wait for 100ns;
        A <= "1001";
        B <= "0001"; -- -7-(1) = -8 = 1000(8), Carry =1, Overflow =0 (C=1, negative; O= 0, No overflow => in range [-0,-8] )
        
        wait for 100ns;
        A <= "1001";
        B <= "0010"; -- -7-(2) = -9 = 0111(7), Carry =1, Overflow =1 (C=1, negative; O= 1, overflowed negatively => Below -8 )
        wait;
    end process;

end Behavioral;
