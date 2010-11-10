library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vga is
generic(
H_SYN   : std_logic_vector(9 downto 0):=conv_std_logic_vector(2,10);
H_BACK  : std_logic_vector(9 downto 0):=conv_std_logic_vector(5,10);
H_DATA  : std_logic_vector(9 downto 0):=conv_std_logic_vector(10,10);
H_FRONT : std_logic_vector(9 downto 0):=conv_std_logic_vector(5,10);
V_SYN   : std_logic_vector(8 downto 0):=conv_std_logic_vector(2,9);
V_BACK  : std_logic_vector(8 downto 0):=conv_std_logic_vector(3,9);
V_DATA  : std_logic_vector(8 downto 0):=conv_std_logic_vector(5,9);
V_FRONT : std_logic_vector(8 downto 0):=conv_std_logic_vector(3,9);
PIXELU_NA_RADKU : std_logic_vector(9 downto 0):=conv_std_logic_vector(22,10)
);
port(
clock, reset : in std_logic;
h_sync, v_sync : out std_logic;
signal_r, signal_g, signal_b : out std_logic_vector(9 downto 0)
);
end entity;




architecture behav of vga is
component ram IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END component ram;

-------
signal pixel_clock : std_logic;

type state is (syn,back,data,front);

signal horizontal : state;
signal horizontal_citac : std_logic_vector(9 downto 0);
signal vertikal : state;
signal vertikal_citac : std_logic_vector(8 downto 0);
signal vertikal_citac_line : std_logic_vector(9 downto 0);
-------
signal h_enable, v_enable : std_logic;
-------
signal r_sig, g_sig, b_sig : std_logic_vector(9 downto 0);
-------posice znaku a pixelu/radky

-------RAMka
signal ram_data, ram_q : std_logic_vector(7 downto 0);
signal ram_address : std_logic_vector(12 downto 0);
signal ram_wren : std_logic;
begin

pixel:process(clock, reset)
begin
if reset='1' then
---RAMka reset
ram_wren<='0';
ram_address<="0000000000001";


pixel_clock<='0';
elsif clock'event and clock='1' then
pixel_clock<=not pixel_clock;
end if;
end process;

-- podmineny vystup RGB signalu
signal_r<=r_sig when h_enable='1' and v_enable='1' else
          "0000000000";
signal_g<=g_sig when h_enable='1' and v_enable='1' else
          "0000000000";
signal_b<=b_sig when h_enable='1' and v_enable='1' else
          "0000000000";
----------


horizontalni:process(pixel_clock, reset)
begin
if reset='1' then
h_sync<='1';
horizontal<=syn;
horizontal_citac<=(others=>'1');
h_enable<='0';
elsif pixel_clock'event and pixel_clock='1' then
case horizontal is

 when syn=>
 h_sync<='0';
 if horizontal_citac=H_SYN-1 then
 horizontal<=back;
 horizontal_citac<=(others=>'0');
 h_sync<='1';
 else
 horizontal_citac<=horizontal_citac+1;
 end if;
 
 when back=>
 if horizontal_citac=H_BACK-1 then
 horizontal<=data;
 horizontal_citac<=(others=>'0');
 h_enable<='1';
 else
 horizontal_citac<=horizontal_citac+1;
 end if;
 
 when data=>
 if horizontal_citac=H_DATA-1 then
 horizontal<=front;
 horizontal_citac<=(others=>'0');
 h_enable<='0';
 else
 horizontal_citac<=horizontal_citac+1;
 end if;

 when front=>
 if horizontal_citac=H_FRONT-1 then
 horizontal<=syn;
 horizontal_citac<=(others=>'0');
 h_sync<='0';
 else
 horizontal_citac<=horizontal_citac+1;
 end if;

end case;
end if;
end process;


vertikalni:process(pixel_clock, reset)
begin
if reset='1' then
v_sync<='1';
vertikal<=syn;
vertikal_citac<=(others=>'1');
vertikal_citac_line<=PIXELU_NA_RADKU-1;
v_enable<='0';
elsif pixel_clock'event and pixel_clock='1' then
if vertikal_citac_line=PIXELU_NA_RADKU-1 then
--state automat
case vertikal is

when syn =>
v_sync<='0';
if vertikal_citac=V_SYN-1 then
vertikal<=back;
vertikal_citac<=(others=>'0');
v_sync<='1';
else
vertikal_citac<=vertikal_citac+1;
end if;

when back =>
if vertikal_citac=V_BACK-1 then
vertikal<=data;
vertikal_citac<=(others=>'0');
v_enable<='1';
else
vertikal_citac<=vertikal_citac+1;
end if;

when data =>
if vertikal_citac=V_DATA-1 then
vertikal<=front;
vertikal_citac<=(others=>'0');
v_enable<='0';
else
vertikal_citac<=vertikal_citac+1;
end if;

when front =>
if vertikal_citac=V_FRONT-1 then
vertikal<=syn;
vertikal_citac<=(others=>'0');
v_sync<='0';
else
vertikal_citac<=vertikal_citac+1;
end if;

end case;
vertikal_citac_line<=(others=>'0');
else
vertikal_citac_line<=vertikal_citac_line+1;
end if;

end if;

end process;



ram_inst : ram PORT MAP (
		ram_address,
		clock,
		ram_data,
		ram_wren,
		ram_q
);

end architecture;