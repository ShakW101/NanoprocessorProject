----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2024 12:51:49 AM
-- Design Name: 
-- Module Name: TB_Nanoprocessor2 - Behavioral
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

entity TB_Nanoprocessor2 is
--  Port ( );
end TB_Nanoprocessor2;

architecture Behavioral of TB_Nanoprocessor2 is

component Nanoprocessor2 
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           RD7Out : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           InsNum : out std_logic_vector ( 3 downto 0);
           Overflow : out STD_LOGIC;
           Sign : out std_logic;
           Zero : out STD_LOGIC;
           AGreater : out STD_LOGIC;
           BGreater : out STD_LOGIC;
           Equal : out STD_LOGIC);
end component;

signal Clk :  STD_LOGIC := '0';
signal Reset :  STD_LOGIC;
signal RD7Out :  STD_LOGIC_VECTOR (3 downto 0);
signal S_7Seg :  STD_LOGIC_VECTOR (6 downto 0);
signal Overflow :  STD_LOGIC;
signal Sign :  std_logic;
signal Zero :  STD_LOGIC;
signal AGreater :  STD_LOGIC;
signal BGreater :  STD_LOGIC;
signal Equal :  STD_LOGIC;
signal InsNum :  std_logic_vector ( 3 downto 0);
begin

UUT : Nanoprocessor2 
    Port map ( Clk => Clk,
           Reset => Reset,
           RD7Out => RD7Out,
           S_7Seg => S_7Seg,
           InsNum => InsNum,
           Overflow => Overflow,
           Sign => Sign,
           Zero => Zero,
           AGreater => AGreater,
           BGreater => BGreater,
           Equal => Equal);

process begin 
wait for 5 ns;
Clk <= not Clk;
end process;

process begin
Reset <= '1';
wait for 15 ns;
reset <= '0';
wait;
end process;
end Behavioral;
