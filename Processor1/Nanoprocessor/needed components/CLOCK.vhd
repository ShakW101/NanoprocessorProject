----------------------------------------------------------------------------------

-- Group 17
-- Senevirathne S.M.P.U. 
-- 
-- Create Date: 04/14/2024 01:36:22 AM
-- Design Name: Program_Counter
-- Module Name: CLOCK - Behavioral
-- Project Name: Nanoprocessor
-- Target Devices: Basys3 Board

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CLOCK is
    Port ( Clk_in  : in STD_LOGIC; --clock input signal with frequency f
           Clk_out : out STD_LOGIC); --modified clock output signal with frequency f/n
end CLOCK;

architecture Behavioral of CLOCK is
--signal count and Clk_status
    signal count : integer := 1;
    signal Clk_status : STD_LOGIC := '0';
    
begin
    process (Clk_in) begin 
    if (rising_edge (Clk_in)) then
        count <= Count +1;
            if (count =50000000) then --change 50000000 to a desired n value. Then the Clk_out frequency will be 1/n th of Clk_in frequency.
                Clk_status <= not Clk_status;
                Clk_out <= Clk_status;
                count <=1;
             end if;
    end if;
end process;

end Behavioral;
