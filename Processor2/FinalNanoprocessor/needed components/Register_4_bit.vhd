----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 04:38:44 PM
-- Design Name: 
-- Module Name: Register_4_bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_4_bit is
    Port ( R_in : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           R_out : out STD_LOGIC_VECTOR (3 downto 0));
end Register_4_bit;


architecture Behavioral of Register_4_bit is

begin

    process (clk) begin
        if (rising_edge(clk)) then
            if EN = '1' then
                R_out <= R_in;
            end if;
        end if;
    end process;

end Behavioral;
