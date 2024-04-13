----------------------------------------------------------------------------------

-- Group 17
-- Senevirathne S.M.P.U. 
-- 
-- Create Date: 04/14/2024 01:36:22 AM
-- Design Name: Program_Counter
-- Module Name: CLOCK - Behavioral
-- Project Name: Nanoprocessor
-- Target Devices: Basys3 Board

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Program_Counter is
    Port ( CLK : in STD_LOGIC; --input CLOCK signal
           RESET : in STD_LOGIC; --Reset signal
           M_Mux : in STD_LOGIC_VECTOR (2 downto 0); --Memory select input value from Mux
           M_Sel : out STD_LOGIC_VECTOR (2 downto 0)); --Memory select output value to ROM
end Program_Counter;

architecture Behavioral of Program_Counter is

component CLOCK
port(
    Clk_in  : in STD_LOGIC;
    Clk_out : out STD_LOGIC);
end component;

--signal Clk_out
SIGNAL Clk_out : std_logic;

begin

--mapping CLOCK
CLOCK_PC : CLOCK
    port map (
        Clk_in => CLK,
        Clk_out => Clk_out
    );
    
--Defining Memory Select output values
M_Sel(2) <= M_Mux(2) AND NOT(RESET);
M_Sel(1) <= M_Mux(1) AND NOT(RESET);
M_Sel(0) <= M_Mux(0) AND NOT(RESET);

end Behavioral;
