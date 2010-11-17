library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity uart_transmitter is
generic(
MAX_VALUE:std_logic_vector(12 downto 0)
);
port(
data : in std_logic_vector(7 downto 0);
clock, reset, transmit : in std_logic;
tx : out std_logic
);
end entity;


architecture uart_TxD of uart_transmitter is
signal citac:std_logic_vector(MAX_VALUE'length-1 downto 0);
signal data_in:std_logic_vector(10 downto 0);
signal clockstate: std_logic;
-----
type   states_t   is (cekej, vysilej); -- enum type declaration
signal state    : states_t;
----
signal bitocet:integer range 0 to 11;
begin


delicka:process(clock, reset)
begin
 if reset='1' then
  citac<=(others=>'0');
  clockstate<='0';
 elsif clock'event and clock='1' then
  clockstate<='0';
   if citac=MAX_VALUE then
    citac<=(others=>'0');
    clockstate<=not clockstate;
   else
    citac<=citac+1;
  end if;
 end if;
end process delicka;


vysilac:process(clock, reset)
begin
 if reset='1' then
  bitocet<=0;
  data_in<=(others=>'0');
  tx<='1';
  state<=cekej;
 elsif clock'event and clock='1' then
  if transmit='1' then
   state<=vysilej;
   data_in<="11" & data & '0';
  elsif clockstate='1' then

  case state is

  when cekej=>
 
  when vysilej=>
   if bitocet<11 then
    tx<=data_in(bitocet);
    bitocet<=bitocet+1;
   else
    bitocet<=0;
    state<=cekej;
    tx<='1';
   end if;
   
  end case;
 end if;
end if;
end process vysilac;

end uart_TxD;