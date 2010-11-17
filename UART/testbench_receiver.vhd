library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity testbench is -- testbench is the "whole world", no need for inputs and outputs
end testbench;



architecture behav of testbench is
  component uart_receiver
generic(
MAX_VALUE:std_logic_vector(12 downto 0)
);
port(
data : out std_logic_vector(7 downto 0);
receive : out std_logic;
clock, reset, rx : in std_logic
);
  end component uart_receiver;

  signal clock   : std_logic := '0';
  signal reset:std_logic:='0';
  signal rx:std_logic:='1';
  signal count:integer:=0;

begin
  clock <= not clock after 10 ns;        -- the simplest way to simulate a periodical signal (50HMz)

  X:process(clock)
  begin
  if clock'event and clock='1' then
  count<=count+1;

  if count>1 and count<3 then
  reset<='1';
  else
  reset<='0';
  end if;

  end if;

  end process X;


  Z:process
  begin
  wait for 150ns;
  rx<='0'; --sb
  wait for 104166ns;
  rx<='1'; --1
  wait for 30ns;
  rx<='1'; --2
  wait for 30ns;
  rx<='0'; --3
  wait for 30ns;
  rx<='1'; --4
  wait for 30ns;
  rx<='0'; --5
  wait for 30ns;
  rx<='0'; --6
  wait for 30ns;
  rx<='1'; --7
  wait for 30ns;
  rx<='0'; --8
  wait for 30ns;
  rx<='1'; --sb
  
  end process Z;

  -- and finally, bind the tested unit
  dut: uart_receiver generic map ("1010001011000") port map (open,open,clock,reset, rx);

end behav;