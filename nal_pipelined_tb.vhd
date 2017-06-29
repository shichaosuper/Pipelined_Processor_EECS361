library ieee;
use ieee.std_logic_1164.all;
use work.eecs361.all;
use work.eecs361_gates.all;

entity NAL_pipelined_tb is
end entity;

architecture behav of NAL_pipelined_tb is

component NAL_pipelined is
port(pc_in, instruction : in std_logic_vector (31 downto 0);
busA, busB : in std_logic_vector (31 downto 0);
pc_out: out std_logic_vector (31 downto 0);
pc_trigger, stall : in std_logic);
end component;

signal pc_in_tb, instruction_tb, pc_out_tb, busA_tb, busB_tb: std_logic_vector (31 downto 0);
signal stall_tb, pc_trigger_tb : std_logic;


begin

dut : NAL_pipelined port map (pc_in_tb, instruction_tb, busA_tb, busB_tb, pc_out_tb, pc_trigger_tb, stall_tb);

testbench : process begin

stall_tb <= '0';
pc_trigger_tb <= '0';
pc_in_tb <= X"00400020";
busA_tb <= X"00000001";
busB_tb <= X"00000001";
instruction_tb <= X"1cc00003"; --bgtz
wait for 1 ns;
stall_tb <= '1';

wait for 1 ns;
stall_tb <= '0';
pc_in_tb <= X"00400020";
instruction_tb <= X"10c00003"; -- beq

wait for 1 ns;


end process;
end behav;
