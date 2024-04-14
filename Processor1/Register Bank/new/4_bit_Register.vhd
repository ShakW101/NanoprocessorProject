----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 04:53:06 AM
-- Design Name: 
-- Module Name: 4_bit_Register - Behavioral
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

entity 4_bit_Register is
    Port ( R_in : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           CLK : in STD_LOGIC;
           R_out : in STD_LOGIC_VECTOR (3 downto 0));
end 4_bit_Register;

architecture Behavioral of 4_bit_Register is

begin


end Behavioral;
