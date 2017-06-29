library ieee;
use ieee.std_logic_1164.all;


entity Reg_MEM_WB is
port(
clk : in std_logic;
dout_in, ALUresult_in : in std_logic_vector (31 downto 0);
control_in : std_logic_vector (7 downto 0);
dout_out, ALUresult_out : out std_logic_vector (31 downto 0);
control_out : out std_logic_vector (7 downto 0);
instruction_in : in std_logic_vector (31 downto 0);
instruction_out : out std_logic_vector (31 downto 0)
);
end entity;


architecture struct of Reg_MEM_WB is


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

R0: register_8bit port map (clk, clk_not, control_in, control_out);
R1: register_32bit port map(clk, clk_not, dout_in, dout_out);
R3: register_32bit port map(clk, clk_not, ALUresult_in, ALUresult_out);
I_reg: register_32bit port map (clk, clk_not, instruction_in, instruction_out);








end struct;



