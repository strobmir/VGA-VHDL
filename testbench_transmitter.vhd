library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity testbench is -- testbench is the "whole world", no need for inputs and outputs
end testbench;



architecture behav of testbench is
  component uart_transmitter
    generic(
MAX_VALUE:std_logic_vector(12 downto 0)
);
port(
data : in std_logic_vector(7 downto 0);
clock, reset, transmit : in std_logic;
tx : out std_logic
);
  end component uart_transmitter;

  signal clock   : std_logic := '0';
  signal data : std_logic_vector(7 downto 0);
  signal en:std_logic:='0';
  signal reset:std_logic:='0';
  signal count:integer:=0;

begin
  clock <= not clock after 10 ns;        -- the simplest way to simulate a periodical signal (50HMz)
  data<="00110001";

  X:process(clock)
  begin
  if clock'event and clock='1' then
  count<=count+1;
  
  if count>1 and count<3 then
  reset<='1';
  else
  reset<='0';
  end if;
  
  if count>5 and count<7 then
  en<='1';
  else
  en<='0';
  end if;
  end if;
  end process X;


  -- and finally, bind the tested unit
  dut: uart_transmitter generic map ("0000000000111") port map (data,clock,reset,en, open);

end behav;