----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/13/2024 11:27:04 PM
-- Design Name: 
-- Module Name: Add_Sub_4 - Behavioral
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

entity Add_Sub_4 is
    Port ( S_in1 : in STD_LOGIC_VECTOR (3 downto 0);
           S_in2 : in STD_LOGIC_VECTOR (3 downto 0);
           OpSel : in STD_LOGIC;
           S_out : out STD_LOGIC_VECTOR (3 downto 0);
           Carry : out STD_LOGIC;
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end Add_Sub_4;

architecture Behavioral of Add_Sub_4 is

component FA
Port ( A : in STD_LOGIC;
       B : in STD_LOGIC;
       C_in : in STD_LOGIC;
       S : out STD_LOGIC;
       C_out : out STD_LOGIC);
end component;

SIGNAL S0,S1,S2,S3,C0,C1,C2,C3,I0,I1,I2,I3 : std_logic;

begin

I0 <= OpSel XOR S_in1(0);
I1 <= OpSel XOR S_in1(1);
I2 <= OpSel XOR  S_in1(2);
I3 <= OpSel XOR  S_in1(3);

FA_0 : FA
port map(
    A => S_in2(0),
    B => I0,
    C_in => OpSel,
    S => S0,
    C_out => C0
    );
    
FA_1 : FA
port map(
    A => S_in2(1),
    B => I1,
    C_in => C0,
    S => S1,
    C_out => C1
    );
    
FA_2 : FA
port map(
    A => S_in2(2),
    B => I2,
    C_in => C1,
    S => S2,
    C_out => C2
    );

FA_3 : FA
port map(
    A => S_in2(3),
    B => I3,
    C_in => C2,
    S => S3,
    C_out => C3
    );
    
Zero <= not(S0 or S1 or S2 or S3);
Carry  <= C3;
S_out(0) <= S0;
S_out(1) <= S1;
S_out(2) <= S2;
S_out(3) <= S3;

OverFlow <=  C2 xor C3;

end Behavioral;
