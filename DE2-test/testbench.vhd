library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end entity;


architecture behav of testbench is
  component test is
  port(
clock, reset : in std_logic;
h_sync, v_sync, pixclk : out std_logic;
signal_r, signal_g, signal_b : out std_logic_vector(9 downto 0);
sync : out std_logic:='1';
blank : out std_logic:='1';
sw : in std_logic_vector(15 downto 0);
key1, key2, key3 : in std_logic;
hex : out std_logic_vector(55 downto 0)
  );
end component;
signal clock : std_logic:='0';
signal reset : std_logic:='0';
begin
reset<='1' after 20ns;
clock<=not clock after 10ns;

dut:test port map(clock, reset, open, open, open, open, open, open, open, open, (others=>'1'), '1', '1', '1', open);
end architecture;