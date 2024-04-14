----------------------------------------------------------------------------------
-- Team: GROUP 17
-- Engineers: Weerawansa, Senevirathne, Abhayawickrama, Gangadari
-- 
-- Create Date: 04/14/2024 09:11:28 PM
-- Design Name: 
-- Module Name: Nanoprocessor1 - Behavioral
-- Project Name: Nanoprocessor Competiton
-- Target Devices: 
-- Tool Versions: 
-- Description: Simple one that they gave

----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Nanoprocessor1 is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Zero : out std_logic;
           Overflow : out std_logic;
           InsNum : out std_logic_vector(2 downto 0);
          S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
          RD7Out: out std_logic_vector(3 downto 0));
end Nanoprocessor1;

architecture Behavioral of Nanoprocessor1 is

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

component PROM
port( I : in STD_LOGIC_VECTOR (2 downto 0);
          O : out STD_LOGIC_VECTOR (11 downto 0));
end component;

component MUX_2_way_4_bit
port(I0 : in STD_LOGIC_VECTOR (3 downto 0);
           I1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
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

component Add_Sub_4
Port ( S_in1 : in STD_LOGIC_VECTOR (3 downto 0);
           S_in2 : in STD_LOGIC_VECTOR (3 downto 0);
           OpSel : in STD_LOGIC;
           S_out : out STD_LOGIC_VECTOR (3 downto 0);
           Carry : out STD_LOGIC;
           OverFlow : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

component ProgramCounter
Port ( Clk : in STD_LOGIC;
    Res : in std_logic;
           I : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (2 downto 0));
end component;

component RCA_3
Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           S_out : out STD_LOGIC_VECTOR (2 downto 0));
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

--signals from INSTRUCTION DECODER
signal Reg_En, Mux_A, Mux_B : std_logic_vector(2 downto 0);
signal Load_Sel, Sub, Jump : std_logic;
signal Im_Val:std_logic_vector(3 downto 0);

--signals from MUX ABOVE DECODER
signal To_Register_Bank : std_logic_vector(3 downto 0);

--signals from REGISTER BANK
signal RD0, RD1, RD2, RD3, RD4, RD5, RD6, RD7: std_logic_vector(3 downto 0);

--signals from MUX_A and MUX_B
signal From_Mux_A, From_Mux_B: std_logic_vector(3 downto 0);

--signals from ADDER/SUBTRACTOR
signal From_Adder_Subtractor: std_logic_vector(3 downto 0);
signal Overflow_F, Zero_F, Carry_F:std_logic;

--signals from 3 BIT ADDER
signal From_3_Bit_Adder: std_logic_vector(2 downto 0);

--signals from MUX TO PROGRAM COUNTER
signal To_Program_Counter: std_logic_vector(2 downto 0);

--signals from PROGRAM COUNTER
signal From_Program_Counter: std_logic_vector(2 downto 0);

--signals from ROM
signal Instruction: std_logic_vector(11 downto 0);

begin

Instruction_Decoder: ins_decoder
port map(Ins => Instruction,
           JMP_CHK => From_Mux_A,
           Reg_En => Reg_En,
           Load_Sel => Load_Sel,
           JMP => Jump,
           Im_Val => Im_Val,
           Mux_A => Mux_A,
           Mux_B => Mux_B,
           Sub => Sub);

Mux_Above_InstructionDecoder: MUX_2_way_4_bit
port map(I0 => From_Adder_Subtractor,
           I1 => Im_Val,
           S => Load_Sel,
           Y => To_Register_Bank);
           
Register_Bank: RegisterBank
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

Mux_A_Above_Adder: MUX_8_way_4_bit
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
      
Mux_B_Above_Adder: MUX_8_way_4_bit
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

RCA_4_Bit: Add_Sub_4
Port map(S_in1 => From_Mux_A,
       S_in2 => From_Mux_B,
       OpSel => Sub,
       S_out => From_Adder_Subtractor,
       Carry => Carry_F,
       OverFlow => Overflow_F,
       Zero => Zero_F);
       
Program_Counter: ProgramCounter
Port map(Clk => Clk,
    Res => Reset,
    I => To_Program_Counter,
    Y => From_Program_Counter);
    
Adder_For_Program_Counter: RCA_3
Port map( I =>From_Program_Counter,
           S_out =>From_3_Bit_Adder);
           
Mux_For_Program_Counter: MUX_2_way_3_bit
Port map( I0 => From_3_Bit_Adder,
      I1 => Im_Val(2 downto 0),
      S => Jump,
      Y => To_Program_Counter);   
      
Program : PROM
port map( I => From_Program_Counter,
          O => Instruction);
          
To_Display : LUT_16_7 
Port map( address => RD7,
     data => S_7Seg);
RD7Out <= RD7;          
Zero <= Zero_F;
Overflow <= Overflow_F;
InsNum <= From_Program_Counter;

end Behavioral;
