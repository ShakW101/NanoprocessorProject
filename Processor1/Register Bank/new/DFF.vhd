----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 03:41:32 AM
-- Design Name: 
-- Module Name: DFF - Behavioral
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

entity DFF is
    Port ( D : in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : inout STD_LOGIC;
           QC : inout STD_LOGIC);
end DFF;

architecture Behavioral of DFF is

signal A, B, C : Std_logic;

begin

A <= (En and D) or ( (not En) and Q);
B <= NOT (A and Clk);
C <= NOT ((not A) and Clk);
Q <= NOT (QC and B);
QC <= NOT (Q and C); 


--process (Clk)
--begin
--    if rising_edge(Clk) then
--        A <= (En and D) or ((not En) and Q);
--        B <= NOT (A and Clk);
--        C <= NOT ((not A) and Clk);
--        Q <= NOT (QC and B);
--        QC <= NOT (Q and C); 
--    end if;
--end process;


end Behavioral;



