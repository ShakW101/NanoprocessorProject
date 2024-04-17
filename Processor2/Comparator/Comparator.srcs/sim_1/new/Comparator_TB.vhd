----------------------------------------------------------------------------------

-- Group 17
-- Senevirathne S.M.P.U.
-- 
-- Create Date: 04/13/2024 10:02:06 PM
-- Design Name: Comparator
-- Module Name: Comparator_TB - Behavioral
-- Project Name: Nanoprocessor
-- Target Devices: Basys3 Board

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Comparator_TB is
end Comparator_TB;

architecture Behavioral of Comparator_TB is
    component Comparator is
        Port ( EN : in STD_LOGIC; --Enable input
               A : in STD_LOGIC_VECTOR (3 downto 0); --4 bit value: A
               B : in STD_LOGIC_VECTOR (3 downto 0); --4 bit value: B
               AGreat : out STD_LOGIC; --Is A the greater number?
               BGreat : out STD_LOGIC; --Is B the greater number?
               Equal : out STD_LOGIC); --Are the numbers equal?
    end component;
    
    --Signal EN, A, B, AGreat, BGreat and Equal
    SIGNAL EN : std_logic;
    SIGNAL A : std_logic_vector (3 downto 0);
    SIGNAL B : std_logic_vector (3 downto 0);
    SIGNAL AGreat : std_logic;
    SIGNAL BGreat : std_logic;
    SIGNAL Equal : std_logic;


begin
    Comparator_Sim : Comparator --mapping comparator for simulation
        port map(
            EN => EN,
            A => A,
            B => B,
            AGreat => AGreat,
            BGreat => BGreat,
            Equal => Equal);
    
    process begin
        wait for 100ns;
        EN <= '1';
        
        A <= "0000"; -- A = 0
        
        B <= "0000"; -- B = 0, Equal

    wait for 100ns;
        
        B <= "0111"; -- B = 7, BGreater
        wait for 100ns;
        
        B <= "1000"; -- B = -8, AGreater
        wait for 100ns;
        
        EN <= '0';
        
        A <= "0111"; -- A =7
        
        B <= "0000"; -- B = 0, AGreater
        wait for 100ns;
        
        B <= "0111"; -- B = 7, Equal
        wait for 100ns;
        
        B <= "1000"; -- B = -8, AGreater
        wait for 100ns;
        
        EN <= '1';
        
        A <= "1000"; -- A = -8
        
        B <= "0000"; -- B = 0, BGreater
        wait for 100ns;
        
        B <= "0111"; -- B = 7, BGreater
        wait for 100ns;
        
        B <= "1000"; -- B = -8, Equal
        wait for 100ns;

        EN <= '0';
        
        A <= "0000"; -- A = 0
        
        B <= "0000"; -- B = 0, Equal
        wait for 100ns;
        
        B <= "0111"; -- B = 7, BGreater
        wait for 100ns;
        
        B <= "1000"; -- B = -8, AGreater
        wait for 100ns;
        
        EN <= '1';
        
        A <= "0111"; -- A =7
        
        B <= "0000"; -- B = 0, AGreater
        wait for 100ns;
        
        B <= "0111"; -- B = 7, Equal
        wait for 100ns;
        
        B <= "1000"; -- B = -8, AGreater
        wait for 100ns;
        
        EN <= '0';
        
        A <= "1000"; -- A = -8
        
        B <= "0000"; -- B = 0, BGreater
        wait for 100ns;
        
        B <= "0111"; -- B = 7, BGreater
        wait for 100ns;
        
        B <= "1000"; -- B = -8, Equal
        wait for 100ns;
        
        EN <= '1';
        B <= "1010"; -- B = -6, BGreater
        
        
        wait;
    end process;

end Behavioral;
