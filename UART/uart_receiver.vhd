library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity uart_receiver is
generic(
MAX_VALUE:std_logic_vector(12 downto 0)
);
port(
data : out std_logic_vector(7 downto 0);
receive : out std_logic;
clock, reset, rx : in std_logic
);
end entity;

architecture uart_RxD of uart_receiver is
signal citac:std_logic_vector(MAX_VALUE'length-1 downto 0);
signal clockstate: std_logic;
signal in_reset, receiving1, receiving2:std_logic;
signal bitocet:integer range 0 to 9;
begin

delicka:process(clock, reset, in_reset)
begin
 if reset='1' or in_reset='1' then
  citac<=(others=>'0');
  clockstate<='0';
  --in_reset<='0';
  receiving2<='0';
 elsif clock'event and clock='1' then
  clockstate<='0';
  --in_reset<='0';
   if citac=MAX_VALUE then
    citac<=(others=>'0');
    clockstate<=not clockstate;
   else
    citac<=citac+1;
  end if;
  
  if receiving1='1' and receiving2='0' then
  citac<="1111110000000";
  clockstate<='0';
  receiving2<='1';
  end if;
 end if;
end process delicka;

pom:process(rx, reset, in_reset)
begin
if reset='1' or in_reset='1' then
receiving1<='0';
elsif rx'event and rx='0' then
receiving1<='1';
end if;
end process pom;

prijimac:process(clock,reset)
begin
if reset='1' then
bitocet<=0;
in_reset<='0';
receive<='0';
data<=(others=>'0');
elsif clock'event and clock='1' then
in_reset<='0';
receive<='0';
if clockstate='1' and receiving2='1' then

if bitocet/=8 then
data(bitocet)<=rx;
end if;

bitocet<=bitocet+1;

if bitocet=8 then
in_reset<='1';
bitocet<=0;
receive<='1';
end if;

end if;
end if;
end process prijimac;

end architecture;