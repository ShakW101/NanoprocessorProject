library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RegisterBank_tb is
end RegisterBank_tb;

architecture Behavioral of RegisterBank_tb is
    -- Component declaration
    component RegisterBank
        Port (
            S : in STD_LOGIC_VECTOR (2 downto 0);
            RB_in : in STD_LOGIC_VECTOR (3 downto 0);
            CLK_in : in STD_LOGIC;
            R0_out : out STD_LOGIC_VECTOR (3 downto 0);
            R1_out : out STD_LOGIC_VECTOR (3 downto 0);
            R2_out : out STD_LOGIC_VECTOR (3 downto 0);
            R3_out : out STD_LOGIC_VECTOR (3 downto 0);
            R4_out : out STD_LOGIC_VECTOR (3 downto 0);
            R5_out : out STD_LOGIC_VECTOR (3 downto 0);
            R6_out : out STD_LOGIC_VECTOR (3 downto 0);
            R7_out : out STD_LOGIC_VECTOR (3 downto 0)
        );
    end component;

    signal S : STD_LOGIC_VECTOR (2 downto 0);
    signal RB_in : STD_LOGIC_VECTOR (3 downto 0);
    signal CLK_in : STD_LOGIC;
    signal R0_out, R1_out, R2_out, R3_out, R4_out, R5_out, R6_out, R7_out : STD_LOGIC_VECTOR (3 downto 0);

begin
    UUT: RegisterBank port map (
        S => S,
        RB_in => RB_in,
        CLK_in => CLK_in,
        R0_out => R0_out,
        R1_out => R1_out,
        R2_out => R2_out,
        R3_out => R3_out,
        R4_out => R4_out,
        R5_out => R5_out,
        R6_out => R6_out,
        R7_out => R7_out
    );

clk_process: process
begin
while now < 1000 ns loop
            CLK_in <= '0';
            wait for 5 ns;
            CLK_in <= '1';
            wait for 5 ns;
        end loop;
        wait;
end process;

process 
begin

    S <= "001";
    RB_in <= "0110";
    wait for 50 ns;

    S <= "101";
    RB_in <= "1000";
    wait for 50 ns;

    S <= "011";
    RB_in <= "1110";
    wait for 50 ns;
   
    S <= "011";
    RB_in <= "0110";
    wait for 50 ns;
    
    S <= "000";
    RB_in <= "1110";
    wait for 50 ns;
    
    S <= "111";
    RB_in <= "1111";
    wait;
    



end process;


   
   
end Behavioral;
