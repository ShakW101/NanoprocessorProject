----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 07:38:33 PM
-- Design Name: 
-- Module Name: TB_Ins_Dec - Behavioral
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

entity TB_Ins_Dec is
--  Port ( );
end TB_Ins_Dec;

architecture Behavioral of TB_Ins_Dec is

component Bit14_Instruction_Decoder 
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
end component;

signal Ins : std_logic_vector(13 downto 0);
signal JMP_CHK, Im_Val : std_logic_vector(3 downto 0);
signal Reg_En, Mux_A, Mux_B : std_logic_vector(2 downto 0);
signal Load_Sel, Sub, JMP, Com_En, Add_En : std_logic;

begin

UUT: Bit14_Instruction_Decoder 
    Port map( Ins => Ins,
           JMP_CHK => JMP_CHK,
           Reg_En => Reg_En,
           Im_Val => Im_Val,
           Load_Sel => Load_Sel,
           Mux_A => Mux_A,
           Mux_B => Mux_B,
           Sub => Sub,
           JMP => JMP,
           Com_En => Com_En,
           Add_En => Add_En);

process begin
JMP_CHK <= "0010";
Ins <= "00100100000011";
wait for 50 ns;
Ins <= "00000110000000";
wait for 50 ns;
Ins <= "01101000000000";
wait for 50 ns;
Ins <= "00011010010000";
wait for 50 ns;
Ins <= "01001100010000";
wait for 50 ns;
Ins <= "01011110100000";
wait for 50 ns;
Ins <= "00110000000001";
wait for 50 ns;
JMP_CHK <= "0000";
Ins <= "00110000000001";
wait for 50 ns;
Ins <= "10000010100000";
wait for 50 ns;
Ins <= "01110100000000";
wait for 50 ns;
Ins <= "10010000000000";
wait;


end process;

end Behavioral;
