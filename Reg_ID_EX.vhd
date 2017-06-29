library ieee;
use ieee.std_logic_1164.all;

entity Reg_ID_EX is
port(
clk : in std_logic;
shamt_in : in std_logic_vector (4 downto 0);
imm16_in : in std_logic_vector(15 downto 0);
control_in : in std_logic_vector (7 downto 0);
ALUop_in :in std_logic_vector (5 downto 0);
shamt_out : out std_logic_vector (4 downto 0);
imm16_out : out std_logic_vector(15 downto 0);
control_out : out std_logic_vector (7 downto 0);
ALUop_out :out std_logic_vector (5 downto 0);
ID_busA, ID_busB : in std_logic_vector (31 downto 0);
EX_busA, EX_busB : out std_logic_vector(31 downto 0);
instruction_in : in std_logic_vector (31 downto 0);
instruction_out : out std_logic_vector (31 downto 0));
end entity;


architecture struct of Reg_ID_EX is


component register_1bit is
port (clk, we, din: in std_logic;
dout  : out std_logic);
end component;

component register_32bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (31 downto 0);
dout  : out std_logic_vector (31 downto 0));
end component;

component register_16bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (15 downto 0);
dout  : out std_logic_vector (15 downto 0));
end component;

component register_5bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (4 downto 0);
dout  : out std_logic_vector (4 downto 0));
end component;

component register_6bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (5 downto 0);
dout  : out std_logic_vector (5 downto 0));
end component;

component register_8bit is
port (clk, we  : in std_logic;
din: in std_logic_vector (7 downto 0);
dout  : out std_logic_vector (7 downto 0));
end component;

component not_gate is
port ( x : in std_logic;
z : out std_logic);
end component;

signal clk_not : std_logic;


begin

C0: not_gate port map (clk, clk_not);

R7: register_32bit port map(clk, clk_not, ID_busA, EX_busA);
R0: register_8bit port map (clk, clk_not, control_in, control_out);
R4: register_16bit port map (clk, clk_not, imm16_in, imm16_out);
R5: register_5bit port map(clk, clk_not, shamt_in, shamt_out);
R6: register_6bit port map(clk, clk_not, ALUop_in, ALUop_out);
R8: register_32bit port map(clk, clk_not, ID_busB, EX_busB);
I_reg: register_32bit port map (clk, clk_not, instruction_in, instruction_out);


end struct;



