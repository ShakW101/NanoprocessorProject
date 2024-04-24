----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/16/2024 08:47:19 PM
-- Design Name: 
-- Module Name: Nanoprocessor2 - Behavioral
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

entity Nanoprocessor2 is
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
           
end Nanoprocessor2;

architecture Behavioral of Nanoprocessor2 is
component MUX_2_way_4_bit
port(I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component PROM
port( I : in STD_LOGIC_VECTOR (3 downto 0);
          O : out STD_LOGIC_VECTOR (13 downto 0));
end component;

component RegisterBank
Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           RB_in : in STD_LOGIC_VECTOR (3 downto 0);
           CLK_in : in STD_LOGIC;
           R0_out : out STD_LOGIC_VECTOR (3 downto 0);
           R1_out : out STD_LOGIC_VECTOR (3 downto 0);
           R2_out : out STD_LOGIC_VECTOR (3 downto 0);
           R3_out : out STD_LOGIC_VECTOR (3 downto 0);
           R4_out : out STD_LOGIC_VECTOR (3 downto 0);
           R5_out : out STD_LOGIC_VECTOR (3 downto 0);
           R6_out : out STD_LOGIC_VECTOR (3 downto 0);
           R7_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_8_way_4_bit
port( I0 : in STD_LOGIC_VECTOR (3 downto 0);
          I1 : in STD_LOGIC_VECTOR (3 downto 0);
          I2 : in STD_LOGIC_VECTOR (3 downto 0);
          I3 : in STD_LOGIC_VECTOR (3 downto 0);
          I4 : in STD_LOGIC_VECTOR (3 downto 0);
          I5 : in STD_LOGIC_VECTOR (3 downto 0);
          I6 : in STD_LOGIC_VECTOR (3 downto 0);
          I7 : in STD_LOGIC_VECTOR (3 downto 0);
          S_in : in STD_LOGIC_VECTOR (2 downto 0);
          Y_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component ProgramCounter
Port ( Clk : in STD_LOGIC;
    Res : in std_logic;
           I : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component RCA_4
Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           S_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component MUX_2_way_3_bit
Port ( I0 : in STD_LOGIC_VECTOR (2 downto 0);
           I1 : in STD_LOGIC_VECTOR (2 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component  LUT_16_7 
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Comparator
Port ( EN : in STD_LOGIC; --Enable input
           A : in STD_LOGIC_VECTOR (3 downto 0); --4 bit value: A
           B : in STD_LOGIC_VECTOR (3 downto 0); --4 bit value: B
           AGreat : out STD_LOGIC; --Is A the greater number?
           BGreat : out STD_LOGIC; --Is B the greater number?
           Equal : out STD_LOGIC); --Are the numbers equal?
end component;

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

component Carry_Look_Ahead_Adder_Subtractor is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0); --Bus for the first binary number
           B : in STD_LOGIC_VECTOR (3 downto 0); --Bus for the second binary number
           Add_Sub : in STD_LOGIC; --Should we add B to A or should we subtract B from A? (1 for subtraction, 0 for addition)
           EN : in STD_LOGIC; --Enable input
           S : inout STD_LOGIC_VECTOR (3 downto 0); --Bus for the binary sum output
           Sign : inout STD_LOGIC; --Sign Bit: 1 for negative, 0 for positive
           Overflow : inout STD_LOGIC; --Overflow bit: Is there an overflow?
           --When the number is negative, is the number in range [-0,-8]: if yes, there is no overflow => Overflow =0; if no, there is an overflow => Overflow = 1
           --When the number is positive, is the number in range [+0, 7]: if yes, there is no overflow => Overflow =0; if no, there is an overflow => Overflow = 1
           Zero : inout STD_LOGIC --Is the result 0000?
         );
end component;

--signals from INSTRUCTION DECODER
signal Reg_En, Mux_A, Mux_B : std_logic_vector(2 downto 0);
signal Load_Sel, Sub, Jump, Add_En, Com_En : std_logic;
signal Im_Val:std_logic_vector(3 downto 0);

--signals from COMPARATOR


--signals from MUX ABOVE DECODER
signal To_Register_Bank : std_logic_vector(3 downto 0);

--signals from REGISTER BANK
signal RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7: std_logic_vector(3 downto 0);

--signals from MUX_A and MUX_B
signal From_Mux_A, From_Mux_B: std_logic_vector(3 downto 0);

--signals from ADDER/SUBTRACTOR
signal From_Adder_Subtractor: std_logic_vector(3 downto 0);
signal Overflow_F, Zero_F, Carry_F, Sign_F:std_logic;

--signals from 3 BIT ADDER
signal From_4_Bit_Adder: std_logic_vector(3 downto 0);

--signals from MUX TO PROGRAM COUNTER
signal To_Program_Counter: std_logic_vector(3 downto 0);

--signals from PROGRAM COUNTER
signal From_Program_Counter: std_logic_vector(3 downto 0);

--signals from ROM
signal Instruction: std_logic_vector(13 downto 0);

begin
Shakthis_Instruction_Decoder : Bit14_Instruction_Decoder 
    Port map( Ins => Instruction,
           JMP_CHK => From_Mux_A,
           Reg_En => Reg_En,
           Im_Val => Im_Val,
           Load_Sel => Load_Sel,
           Mux_A => Mux_A,
           Mux_B => Mux_B,
           Sub => Sub,
           JMP => Jump,
           Com_En => Com_En,
           Add_En => Add_En);
Lords_Adder : Carry_Look_Ahead_Adder_Subtractor 
Port map( A => From_Mux_A, --Bus for the first binary number
      B => From_Mux_B, --Bus for the second binary number
      Add_Sub => Sub, --Should we add B to A or should we subtract B from A? (1 for subtraction, 0 for addition)
      EN =>Add_En, --Enable input
      S => From_Adder_Subtractor,--Bus for the binary sum output
      Sign => Sign_F, --Sign Bit: 1 for negative, 0 for positive
      Overflow => Overflow_F, --Overflow bit: Is there an overflow?
      --When the number is negative, is the number in range [-0,-8]: if yes, there is no overflow => Overflow =0; if no, there is an overflow => Overflow = 1
      --When the number is positive, is the number in range [+0, 7]: if yes, there is no overflow => Overflow =0; if no, there is an overflow => Overflow = 1
      Zero => Zero_F);
         
Madhawas_Mux_Above_InstructionDecoder: MUX_2_way_4_bit
port map(I0 => From_Adder_Subtractor,
           I1 => Im_Val,
           S => Load_Sel,
           Y => To_Register_Bank);
           
Madhawas_Register_Bank: RegisterBank
Port map( S => Reg_En,
          RB_in => To_Register_Bank,
          CLK_in => Clk,
          R0_out =>RD0,
          R1_out =>RD1,
          R2_out =>RD2,
          R3_out =>RD3,
          R4_out =>RD4,
          R5_out =>RD5,
          R6_out =>RD6,
          R7_out =>RD7);

Madhawas_Mux_A_Above_Adder: MUX_8_way_4_bit
port map( I0 => RD0,
      I1 => RD1,
      I2 => RD2,
      I3 => RD3,
      I4 => RD4,
      I5 => RD5,
      I6 => RD6,
      I7 => RD7,
      S_in => Mux_A,
      Y_out => From_Mux_A);
      
Madhawas_Mux_B_Above_Adder: MUX_8_way_4_bit
  port map( I0 => RD0,
        I1 => RD1,
        I2 => RD2,
        I3 => RD3,
        I4 => RD4,
        I5 => RD5,
        I6 => RD6,
        I7 => RD7,
        S_in => Mux_B,
        Y_out => From_Mux_B);
        
Shakthis_Program_Counter: ProgramCounter
        Port map(Clk => Clk,
            Res => Reset,
            I => To_Program_Counter,
            Y => From_Program_Counter);
            
Sansalas_Adder_For_Program_Counter: RCA_4
Port map( I =>From_Program_Counter,
           S_out =>From_4_Bit_Adder);
           
Madhawas_Mux_For_Program_Counter: MUX_2_way_4_bit
Port map( I0 => From_4_Bit_Adder,
      I1 => Im_Val(3 downto 0),
      S => Jump,
      Y => To_Program_Counter);   
      
Sansalas_ROM : PROM
port map( I => From_Program_Counter,
          O => Instruction);
          
To_Display : LUT_16_7 
Port map( address => RD7,
     data => S_7Seg);
     

Lords_Comparator : Comparator
Port map( EN => Com_En, --Enable input
           A => From_Mux_A, --4 bit value: A
           B => From_Mux_B, --4 bit value: B
           AGreat => AGreater, --Is A the greater number?
           BGreat => BGreater, --Is B the greater number?
           Equal => Equal); --Are the numbers equal?

RD7Out <= RD7;          
Zero <= Zero_F;
Overflow <= Overflow_F;
Sign <= Sign_F;
InsNum <= From_Program_Counter;


end Behavioral;
