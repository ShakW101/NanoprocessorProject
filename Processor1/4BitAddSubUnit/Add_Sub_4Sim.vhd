----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 12:25:43 AM
-- Design Name: 
-- Module Name: Add_Sub_4Sim - Behavioral
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

entity Add_Sub_4Sim is
--  Port ( );
end Add_Sub_4Sim;

architecture Behavioral of Add_Sub_4Sim is

component Add_Sub_4 is
    Port ( S_in1 : in STD_LOGIC_VECTOR (3 downto 0);
           S_in2 : in STD_LOGIC_VECTOR (3 downto 0);
           OpSel : in STD_LOGIC;
           S_out : out STD_LOGIC_VECTOR (3 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC;
           OverFlow : out STD_LOGIC);
end component;

SIGNAL S_in1,S_in2 : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL OpSel : STD_LOGIC;
SIGNAL S_out : STD_LOGIC_VECTOR(3 downto 0);
SIGNAL Carry,Zero,OverFlow : STD_LOGIC;





begin

UUT:   Add_Sub_4 
    PORT MAP(
       S_in1 => S_in1,
       S_in2 => S_in2,
       OpSel => OpSel,
       S_out => S_out,
       Carry => Carry,
       Zero => Zero,
       OverFlow => OverFlow
   );

process

begin
--Test case 1 Addition(OpSel = '0')

OpSel <= '0';
S_in1 <= "0011"; --3
S_in2 <= "0010";--2
wait for 100 ns;

--Test case 2 Subtraction(OpSel = '1')

OpSel <= '1';
S_in1 <= "0011"; --3
S_in2 <= "0010";  --2
wait for 100 ns;

--Test case 3
OpSel <= '0';
S_in1 <= "0000"; --0
S_in2 <= "0000";  --0
wait for 100 ns;


--Test case 4 (With borrow Zero result)
OpSel <= '1';
S_in1 <= "0011"; --3
S_in2 <= "0101"; --5
wait for 100 ns;

wait;

end process;


end Behavioral;
