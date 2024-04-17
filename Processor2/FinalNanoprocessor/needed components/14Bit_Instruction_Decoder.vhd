----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 06:52:17 PM
-- Design Name: 
-- Module Name: 14Bit_Instruction_Decoder - Behavioral
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

entity Bit14_Instruction_Decoder is
    Port ( Ins : in STD_LOGIC_VECTOR (13 downto 0);
           JMP_CHK : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Im_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Load_Sel : out STD_LOGIC;
           Mux_A : out STD_LOGIC_VECTOR (2 downto 0);
           Mux_B : out STD_LOGIC_VECTOR (2 downto 0);
           Sub : out STD_LOGIC;
           JMP : out STD_LOGIC;
           Com_En : out STD_LOGIC;
           Add_En : out STD_LOGIC);
end Bit14_Instruction_Decoder;



architecture Behavioral of Bit14_Instruction_Decoder is

component MUX_2_way_3_bit
Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

signal S, From_JMP_Chk: std_logic;

begin



Add_En <= ((not Ins(13)) and (not Ins(11)) )or (Ins(12) and (not Ins(10)));
Com_En <= Ins(13) and (not Ins(11)) and (not Ins(10));

Sub <= ((not Ins(13)) and (not Ins(11)) and Ins(10) and(not Ins(12))) or (Ins(12) and Ins(11) and (not Ins(10)));
Load_Sel <= Ins(11) and (Ins(12) xnor Ins(10));

From_JMP_Chk <= not(JMP_CHK(3) or JMP_CHK(2) or JMP_CHK(1) or JMP_CHK(0));
JMP <= ((not Ins(12)) and Ins(11) and Ins(10)) and From_JMP_CHK;

S <= Ins(13) or ((not Ins(12)) and Ins(11) and Ins(10));

Internal_Mux : MUX_2_way_3_bit
Port map( I0 => Ins(9 downto 7),
           I1 => "000",
           S => S,
           Y => Reg_En);

Im_Val <= Ins(3 downto 0);
Mux_A <= Ins(9 downto 7);
Mux_B <= Ins(6 downto 4);

end Behavioral;
