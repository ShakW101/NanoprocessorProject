----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 03:21:25 PM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port ( Clk : in STD_LOGIC;
    Res : in std_logic;
           I : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end ProgramCounter;

architecture Behavioral of ProgramCounter is

component D_FF
port(D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;



begin

D0 :  D_FF
port map(
    D => I(0),
    Res => Res,
    Clk => Clk,
    Q => Y(0),
    Qbar => open);

D1 :  D_FF
port map(
    D => I(1),
    Res => Res,
    Clk => Clk,
    Q => Y(1),
    Qbar => open);

D2 :  D_FF
port map(
    D => I(2),
    Res => Res,
    Clk => Clk,
    Q => Y(2),
    Qbar => open);
    
D3 :  D_FF
    port map(
        D => I(3),
        Res => Res,
        Clk => Clk,
        Q => Y(3),
        Qbar => open);




end Behavioral;
