library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity vga is
generic( 
H_SYNC_POLARITY:std_logic:='0';
V_SYNC_POLARITY:std_logic:='0';

H_SYN   : std_logic_vector(11 downto 0):=conv_std_logic_vector(96,12); --96 120
H_BACK  : std_logic_vector(11 downto 0):=conv_std_logic_vector(48,12); --48 64
H_DATA  : std_logic_vector(11 downto 0):=conv_std_logic_vector(640,12); --640 800
H_FRONT : std_logic_vector(11 downto 0):=conv_std_logic_vector(16,12); --16 56
V_SYN   : std_logic_vector(11 downto 0):=conv_std_logic_vector(2,12); --2 6
V_BACK  : std_logic_vector(11 downto 0):=conv_std_logic_vector(33,12); --33 23
V_DATA  : std_logic_vector(11 downto 0):=conv_std_logic_vector(480,12); --480 600
V_FRONT : std_logic_vector(11 downto 0):=conv_std_logic_vector(10,12); --10 37
PIXELU_NA_RADKU : std_logic_vector(11 downto 0):=conv_std_logic_vector(800,12) --800 10bit 1040

);
port(
clock, reset : in std_logic;
h_sync, v_sync, pixclk : out std_logic;
signal_r, signal_g, signal_b : out std_logic_vector(9 downto 0);
vga_sync : out std_logic:='1';
vga_blank : out std_logic:='1'
);
end entity;




architecture behav of vga is


COMPONENT ram IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		clock		: IN STD_LOGIC ;
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END COMPONENT ram;
COMPONENT rom IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (4 DOWNTO 0)
	);
END COMPONENT rom;


-------
signal pixel_clock : std_logic;

type state is (syn,back,data,front);

signal horizontal : state;
signal horizontal_citac : std_logic_vector(11 downto 0);
signal vertikal : state;
signal vertikal_citac : std_logic_vector(11 downto 0);
signal vertikal_citac_line : std_logic_vector(11 downto 0);
-------
signal h_enable, v_enable, enable : std_logic;
-------
signal r_sig, g_sig, b_sig : std_logic_vector(9 downto 0);
-------posice znaku a pixelu/radky
signal znak_h, znak_v : std_logic_vector(7 downto 0);
signal radka, radka_pom : std_logic_vector(11 downto 0);
signal pixel, pixel_pom : std_logic_vector(11 downto 0);


signal h_sync_b : std_logic;
signal v_sync_b : std_logic;
---RAM & ROM
signal ram_address : std_logic_vector(12 downto 0):=(others=>'0');
signal rom_address : std_logic_vector(10 downto 0);
signal ram_out, ram_data : std_logic_vector(7 downto 0);
signal rom_out : std_logic_vector(4 downto 0);
signal ram_wren : std_logic:='0';
---cela radka
signal cela_radka_r : std_logic_vector(639 downto 0);
signal cela_radka_g : std_logic_vector(639 downto 0);
signal cela_radka_b : std_logic_vector(639 downto 0);
---horizontalni stavovka
type statehor is (cekej, RAMM, RAMMX, ROMM1, ROMM1X, ROMM11, ROMM11X, ROMM111);
signal stavovy:statehor;
signal pomocny_inkr:std_logic_vector(11 downto 0);

signal ramadr:std_logic_vector(12 downto 0);
signal citac_znaku : integer range 0 to 128:=0;
signal citac_pixelu : integer range 0 to 640:=0;
begin

h_sync<=h_sync_b;
v_sync<=v_sync_b;


--prednastaveni RAM adresy
ramadr<=conv_std_logic_vector(0,13) when znak_v=0 else
	    conv_std_logic_vector(128,13) when znak_v=1 else
	    conv_std_logic_vector(256,13);


radkovani:process(clock, reset)
begin
if reset='0' then
 cela_radka_r<=(others=>'0');
 cela_radka_g<=(others=>'0');
 cela_radka_b<=(others=>'0');
 stavovy<=cekej;
 rom_address<=(others=>'0');
 citac_znaku<=0;
 citac_pixelu<=0;
elsif clock'event and clock='1' then
--stavovka
 case stavovy is

  when cekej=>
   citac_znaku<=0;
   citac_pixelu<=0;
    if h_sync_b=H_SYNC_POLARITY then
     stavovy<=RAMM;
    end if;

  when RAMM=>
   if citac_znaku<=127 then
    citac_znaku<=citac_znaku+1;
    ram_address<=ramadr+citac_znaku;
    ram_wren<='0';
    stavovy<=RAMMX;
   else
    stavovy<=cekej;
   end if;

  when RAMMX=>
   stavovy<=ROMM1;

  when ROMM1=>
   rom_address<=(ram_out & "000")+radka_pom(10 downto 0);
   stavovy<=ROMM1X;

  when ROMM1X=>
   rom_address<=(ram_out & "000")+radka_pom(10 downto 0);
   stavovy<=ROMM11;

  when ROMM11=>
   stavovy<=ROMM11X;
   
  when ROMM11X=>
   stavovy<=ROMM111;
   
  when ROMM111=>
    --cela_radka_r<=rom_out(4 downto 0) & cela_radka_r(639 downto 5);
    if citac_pixelu<=635 then
    cela_radka_r(citac_pixelu+4 downto citac_pixelu)<=rom_out(4 downto 0);
    citac_pixelu<=citac_pixelu+5;
    end if;
    stavovy<=RAMM;

end case;

end if;
end process radkovani;






pixclk<=pixel_clock;
--pixclk<=clock;




--pixel_clock<=clock;

pixell:process(clock, reset)
begin
if reset='0' then
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



--r_sig<=("1100101100");
--g_sig<=("0000000000");
--b_sig<=("1100111111");

--r_sig<=("0000000000");
--g_sig<=(radka(9 downto 0));
--b_sig<=(pixel(9 downto 0));

--r_sig<=("0000000000");
--g_sig<=(radka(9 downto 0));
--b_sig<=(pixel(9 downto 0));

r_sig<="1111111111" when cela_radka_r(conv_integer(pixel))='1' else
       "0000000000";
g_sig<="1111111111" when cela_radka_g(conv_integer(pixel))='1' else
       "0000000000";
b_sig<="1111111111" when cela_radka_b(conv_integer(pixel))='1' else
       "0000000000";              

horizontalni:process(pixel_clock, reset)
begin
if reset='0' then
h_sync_b<=not H_SYNC_POLARITY;
horizontal<=syn;
horizontal_citac<=(others=>'1');
h_enable<='0';
pixel<=(others=>'0');
pixel_pom<=(others=>'0');
znak_h<=(others=>'0');
elsif pixel_clock'event and pixel_clock='1' then

if pixel=H_DATA-1 or h_enable='0' then
pixel<=(others=>'0');
pixel_pom<=(others=>'0');
znak_h<=(others=>'0');
else
pixel<=pixel+1;
pixel_pom<=pixel_pom+1;
if pixel_pom=4 then
znak_h<=znak_h+1;
pixel_pom<=(others=>'0');
end if;
end if;

case horizontal is

 when syn=>
 h_sync_b<=H_SYNC_POLARITY;
 if horizontal_citac=H_SYN-1 then
 horizontal<=back;
 horizontal_citac<=(others=>'0');
 h_sync_b<=not H_SYNC_POLARITY;
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
 h_sync_b<=H_SYNC_POLARITY;
 else
 horizontal_citac<=horizontal_citac+1;
 end if;

end case;
end if;
end process;


vertikalni:process(h_sync_b, reset)
begin
if reset='0' then
v_sync_b<=not V_SYNC_POLARITY;
vertikal<=syn;
vertikal_citac<=(others=>'1');
--vertikal_citac_line<=PIXELU_NA_RADKU-1;
vertikal_citac_line<="111111111111"-conv_std_logic_vector(96, vertikal_citac_line'length);
v_enable<='0';
radka<=(others=>'0');
radka_pom<=(others=>'0');
znak_v<=(others=>'0');
elsif h_sync_b'event and h_sync_b= H_SYNC_POLARITY then   --konec syncu na horizontu


if radka=V_DATA-1 or v_enable='0' then
radka<=(others=>'0');
radka_pom<=(others=>'0');
znak_v<=(others=>'0');
else
if radka_pom=7 then
znak_v<=znak_v+1;
radka_pom<=(others=>'0');
else
radka_pom<=radka_pom+1;
radka<=radka+1;
end if;
end if;

--state automat
case vertikal is

when syn =>
v_sync_b<=V_SYNC_POLARITY;
if vertikal_citac=V_SYN-1 then
vertikal<=back;
vertikal_citac<=(others=>'0');
v_sync_b<=not V_SYNC_POLARITY;
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
v_sync_b<=V_SYNC_POLARITY;
else
vertikal_citac<=vertikal_citac+1;
end if;

end case;



end if;

end process;





ram_inst : ram PORT MAP (
		address	 => ram_address,
		clock	 => clock,
		data	 => ram_data,
		wren	 => ram_wren,
		q	 => ram_out
	);
rom_inst : rom PORT MAP (
		address	 => rom_address,
		clock	 => clock,
		q	 => rom_out
	);


end architecture;