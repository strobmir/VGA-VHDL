library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity testbench is
end entity;


architecture behav of testbench is
  component vga is
  port(
clock, reset : in std_logic;
h_sync, v_sync, pixclk : out std_logic;
signal_r, signal_g, signal_b : out std_logic_vector(9 downto 0);
vga_sync : out std_logic:='0';
vga_blank : out std_logic:='0'
  );
end component;
signal clock : std_logic:='0';
signal reset : std_logic:='0';
begin
reset<='1' after 20ns;
clock<=not clock after 10ns;

dut:vga port map(clock, reset, open, open, open, open, open, open);
end architecture;