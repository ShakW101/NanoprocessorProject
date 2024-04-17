----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 05:57:04 PM
-- Design Name: 
-- Module Name: RCA_3Sim - Behavioral
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

entity RCA_4Sim is
--  Port ( );
end RCA_4Sim;

architecture Behavioral of RCA_4Sim is


COMPONENT RCA_4
 PORT( I: IN STD_LOGIC_VECTOR(3 downto 0); 
       S_out : OUT STD_LOGIC_VECTOR(3 downto 0));
 END COMPONENT;


    SIGNAL I: STD_LOGIC_VECTOR(3 downto 0);
    SIGNAL S_out : STD_LOGIC_VECTOR(3 downto 0);
    
begin

UUT:   RCA_4 
    PORT MAP(
       
      I => I,
      S_out => S_out
 );
 
 process
  begin
  I(0) <= '0'; 
  I(1) <= '0';
  I(2) <= '0';
  I(3) <= '0';
  
 WAIT FOR 100 ns; 
 
  I(0) <= '1'; 
  I(1) <= '0';
  I(2) <= '0';
  I(3) <= '0';
   
  WAIT FOR 100 ns; 
 
  I(0) <= '0'; 
  I(1) <= '1';
  I(2) <= '0';
  I(3) <= '0';
  
  WAIT FOR 100 ns;
  
  I(0) <= '1'; 
  I(1) <= '1';
  I(2) <= '0';
  I(3) <= '0';
    
    WAIT FOR 100 ns; 
  
  I(0) <= '1'; 
  I(1) <= '1';
  I(2) <= '1';
  I(3) <= '1';
    
    WAIT FOR 100 ns; 
  
 
  WAIT; 
  end process;



end Behavioral;
