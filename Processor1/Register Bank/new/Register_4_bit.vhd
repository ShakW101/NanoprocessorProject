----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 04:54:48 AM
-- Design Name: 
-- Module Name: Register_4_bit - Behavioral
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

entity Register_4_bit is
    Port ( R_in : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           CLK : in STD_LOGIC;
           R_out : out STD_LOGIC_VECTOR (3 downto 0));
end Register_4_bit;

architecture Behavioral of Register_4_bit is

component DFF
    Port ( D : in STD_LOGIC;
       En : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : inout STD_LOGIC;
       QC : inout STD_LOGIC);
end component;

signal temp : std_logic_vector(3 downto 0);

begin

DFF_0 : DFF
    port map(        
        D => R_in(0),
        En => EN,
        Clk => CLK,
        Q => temp(0));

DFF_1 : DFF
    port map(        
        D => R_in(1),
        En => EN,
        Clk => CLK,
        Q => temp(1));

DFF_2 : DFF
    port map(        
        D => R_in(2),
        En => EN,
        Clk => CLK,
        Q => temp(2));

DFF_3 : DFF
    port map(        
        D => R_in(3),
        En => EN,
        Clk => CLK,
        Q => temp(3)); 
        
R_out <= temp;       
        
end Behavioral;
