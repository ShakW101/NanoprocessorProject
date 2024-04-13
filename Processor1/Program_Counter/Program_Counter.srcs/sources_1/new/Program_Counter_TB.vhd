----------------------------------------------------------------------------------

-- Group 17
-- Senevirathne S.M.P.U. 
-- 
-- Create Date: 04/14/2024 01:36:22 AM
-- Design Name: Program_Counter
-- Module Name: Program_Counter_TB - Behavioral
-- Project Name: Nanoprocessor
-- Target Devices: Basys3 Board

----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter_TB is
end Program_Counter_TB;

architecture Behavioral of Program_Counter_TB is

    constant CLOCK_PERIOD : time := 10 ns;  -- Define clock period (10 ns)
    
    -- Signals for clock module
    signal clk_tb    : std_logic := '0';
    
    -- Signals for Program_Counter module
    signal reset_tb  : std_logic := '0';
    signal m_mux_tb  : std_logic_vector(2 downto 0) := "000";
    signal m_sel_tb  : std_logic_vector(2 downto 0);
    
    -- Component instantiation
    component CLOCK
        Port ( Clk_in  : in STD_LOGIC;
               Clk_out : out STD_LOGIC);
    end component;
    
    component Program_Counter
        Port ( CLK   : in STD_LOGIC;
               RESET : in STD_LOGIC;
               M_Mux : in STD_LOGIC_VECTOR (2 downto 0);
               M_Sel : out STD_LOGIC_VECTOR (2 downto 0));
    end component;

begin

    -- Instantiate CLOCK module
    clk_gen : CLOCK
        port map (
            Clk_in  => clk_tb,
            Clk_out => open  -- We don't need the output of the clock module in the testbench
        );
        
    -- Instantiate Program_Counter module
    pc : Program_Counter
        port map (
            CLK   => clk_tb,
            RESET => reset_tb,
            M_Mux => m_mux_tb,
            M_Sel => m_sel_tb
        );

    -- Clock process to generate clock signal
    clk_process : process
    begin
        while now < 1000 ns loop  -- Simulate for 1000 ns
            clk_tb <= '0';
            wait for CLOCK_PERIOD / 2;
            clk_tb <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
        wait;  -- End simulation
    end process;
    
    -- Stimulus process to apply inputs
    stimulus : process
    begin
        reset_tb <= '1';  -- Assert reset
        m_mux_tb <= "000";  -- Set initial M_Mux value
        
        wait for 20 ns;
        
        reset_tb <= '0';  -- De-assert reset
        
        -- Apply some inputs to M_Mux
        m_mux_tb <= "001";
        wait for 20 ns;
        m_mux_tb <= "010";
        wait for 20 ns;
        m_mux_tb <= "011";
        wait for 20 ns;
        
        -- You can continue applying more inputs here
        
        wait;
    end process;

end Behavioral;
