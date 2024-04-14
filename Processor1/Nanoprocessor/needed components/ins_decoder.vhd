
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ins_decoder is
    Port ( Ins : in STD_LOGIC_VECTOR (11 downto 0);
           JMP_CHK : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Sel : out STD_LOGIC;
           JMP : out STD_LOGIC;
           Im_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Mux_A : out STD_LOGIC_VECTOR (2 downto 0);
           Mux_B : out STD_LOGIC_VECTOR (2 downto 0);
           Sub : out STD_LOGIC);
end ins_decoder;

architecture Behavioral of ins_decoder is

component Decoder_2_to_4
port(
    I : in std_logic_vector(1 downto 0);
    EN: in std_logic;
    Y: out std_logic_vector(3 downto 0));
end component;

signal decoder_line: std_logic_vector(3 downto 0);
signal Can_JMP: std_logic;

begin

D0 : Decoder_2_to_4
    port map(
    I => Ins(11 downto 10),
    EN => '1',
    Y => decoder_line);
    
Can_JMP <= not(JMP_CHK(0) or JMP_CHK(1) or JMP_CHK(2) or JMP_CHK(3)); --checks if every bit coming from mux A is zero

Reg_En <= Ins(9 downto 7);
Load_Sel <= decoder_line(2);
Im_Val <= Ins(3 downto 0);
Mux_A <= Ins(9 downto 7);
Mux_B <= Ins(6 downto 4);
Sub <= decoder_line(1);
JMP <= Can_JMP and decoder_line(3);


end Behavioral;
