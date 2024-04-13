library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_Ins_Decoder is

end TB_Ins_Decoder;

architecture Behavioral of TB_Ins_Decoder is

component ins_decoder
    port(Ins : in STD_LOGIC_VECTOR (11 downto 0);
           JMP_CHK : in STD_LOGIC_VECTOR (3 downto 0);
           Reg_En : out STD_LOGIC_VECTOR (2 downto 0);
           Load_Sel : out STD_LOGIC;
           JMP : out STD_LOGIC;
           Im_Val : out STD_LOGIC_VECTOR (3 downto 0);
           Mux_A : out STD_LOGIC_VECTOR (2 downto 0);
           Mux_B : out STD_LOGIC_VECTOR (2 downto 0);
           Sub : out STD_LOGIC);
end component;

signal Reg_En, Mux_A, Mux_B : std_logic_vector(2 downto 0);
signal JMP_CHK, Im_Val :  std_logic_vector(3 downto 0);
signal Ins : std_logic_vector(11 downto 0);
signal Load_Sel, JMP, Sub: std_logic;

begin

UUT : ins_decoder port map(
    Ins => Ins,
    JMP_CHK => JMP_CHK,
    Reg_En => Reg_En,
    Load_Sel => Load_Sel,
    Im_Val => Im_Val,
    Mux_A => Mux_A,
    Mux_B => Mux_B,
    Sub => Sub,
    JMP => JMP);

process begin

JMP_CHK <= "0000";
Ins <= "100010000010";

wait for 100 ns;

Ins <= "101110000011";

wait for 100 ns;

Ins <= "100100000001";

wait for 100 ns;

Ins <= "010100000000";

wait for 100 ns;

Ins <= "001110010000";

wait for 100 ns;

Ins <= "000010100000";

wait for 100 ns;

JMP_CHK <= "0001";
Ins <= "110010000110";

wait for 100 ns;

JMP_CHK <= "0000";
Ins <= "110000000100";

wait;

end process;

end Behavioral;
