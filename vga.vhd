library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
---
entity vga is
generic( 
H_SYNC_POLARITY:std_logic:='0';
V_SYNC_POLARITY:std_logic:='0';

CLK_DIV : integer range 1 to 2:=2; --2 1

H_SYN   : integer:=96; --96 120
H_BACK  : integer:=48; --48 64
H_DATA  : integer:=640; --640 800
H_FRONT : integer:=16; --16 56
V_SYN   : integer:=2; --2 6
V_BACK  : integer:=33; --33 23
V_DATA  : integer:=480; --480 600
V_FRONT : integer:=10; --10 37
PIXELU_NA_RADKU : integer:=800; --800 10bit 1040

SIRKA_ZNAKU : integer:=8; --8
VYSKA_ZNAKU : integer:=8; --8

BITOVA_SIRKA_BARVY : integer:=10;

COLOR_FULL : integer:=1023;
COLOR_HALF : integer:=511;
COLOR_TRICTVRTE : integer:=737;
COLOR_NIC : integer:=0
);
port(
clock, reset : in std_logic;
h_sync, v_sync, pixclk : out std_logic;
signal_r, signal_g, signal_b : out std_logic_vector(BITOVA_SIRKA_BARVY-1 downto 0);
sync : out std_logic:='1';
blank : out std_logic:='1';

video_enable : out std_logic;

vga_address : in std_logic_vector(12 downto 0);
vga_data : in std_logic_vector(15 downto 0);
vga_wren : in std_logic;
vga_out : out std_logic_vector(15 downto 0);

pixel_h : buffer integer range 0 to H_DATA-1;
pixel_v : buffer integer range 0 to V_DATA-1;

znak_h : buffer integer range -1 to H_DATA/SIRKA_ZNAKU;
znak_v : buffer integer range 0 to V_DATA/VYSKA_ZNAKU-1
);
end entity;




architecture behav of vga is


COMPONENT ram IS
	PORT
	(
		address_a		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		address_b		: IN STD_LOGIC_VECTOR (12 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data_a		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		data_b		: IN STD_LOGIC_VECTOR (15 DOWNTO 0);
		wren_a		: IN STD_LOGIC  := '0';
		wren_b		: IN STD_LOGIC  := '0';
		q_a		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0);
		q_b		: OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	);
END COMPONENT ram;
COMPONENT rom IS
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (10 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
END COMPONENT rom;


-------
signal pixel_clock_fin, pixel_clock2 : std_logic;

type state is (syn,back,data,front);

signal horizontal : state;
signal horizontal_citac : integer range 0 to PIXELU_NA_RADKU;
signal vertikal : state;
signal vertikal_citac : integer;
signal vertikal_citac_line : integer;
-------
signal h_enable, v_enable: std_logic;
-------
signal r_sig_backg, g_sig_backg, b_sig_backg, r_sig_font, g_sig_font, b_sig_font, r_sig, b_sig, g_sig : std_logic_vector(BITOVA_SIRKA_BARVY-1 downto 0);
-------posice znaku a pixelu/radky
--signal znak_h : integer range -1 to H_DATA/SIRKA_ZNAKU;
--signal znak_v : integer range 0 to V_DATA/VYSKA_ZNAKU-1;
signal radka : integer range 0 to V_DATA-1;
signal radka_pom : integer range 0 to VYSKA_ZNAKU-1;
--signal pixel_h : integer range 0 to H_DATA-1;
--signal pixel_v : integer range 0 to V_DATA-1;
signal pixel_pom : integer range 0 to SIRKA_ZNAKU-1;


signal h_sync_b : std_logic;
signal v_sync_b : std_logic;
---RAM & ROM
signal ram_address : std_logic_vector(12 downto 0):=(others=>'0');
signal rom_address : std_logic_vector(10 downto 0);
signal ram_out, ram_data : std_logic_vector(15 downto 0);
signal rom_out : std_logic_vector(7 downto 0);
signal ram_wren : std_logic:='0';
---horizontalni stavovka
type statehor is (RAMADR, RAM1, RAM2, ROMADR, ROM1, ROM2, DATA, OSMY, DEVATY, DESATY, JEDENACTY, DVANACTY, TRINACTY, CTRNACTY, PATNACTY, SESTNACTY);
signal stavovy:statehor;
signal pomocny_inkr:std_logic_vector(11 downto 0);

--signal ramadr:std_logic_vector(12 downto 0);
signal citac_znaku : integer range 0 to H_DATA/SIRKA_ZNAKU;
signal sig_out : std_logic_vector(15 downto 0);
begin

h_sync<=h_sync_b;
v_sync<=v_sync_b;
video_enable<=h_enable and v_enable;

radkovani:process(clock, reset)
begin
if reset='0' then
stavovy<=RAMADR;
elsif clock'event and clock='1' then
case stavovy is

when RAMADR=>

if h_enable='1' or h_sync_b=H_SYNC_POLARITY then
stavovy<=RAM1;
end if;


ram_address<=conv_std_logic_vector(znak_v*(H_DATA/SIRKA_ZNAKU)+znak_h+1,13);

when RAM1=>
stavovy<=RAM2;

when RAM2=>
stavovy<=ROMADR;

when ROMADR=>
rom_address<=conv_std_logic_vector((conv_integer(ram_out(7 downto 0))*8)+radka_pom,11);
stavovy<=ROM1;

when ROM1=>
stavovy<=ROM2;

when ROM2=>
stavovy<=DATA;

when DATA=>

stavovy<=OSMY;

when OSMY=>
stavovy<=DEVATY;
when DEVATY=>
stavovy<=DESATY;
when DESATY=>
stavovy<=JEDENACTY;
when JEDENACTY=>
stavovy<=DVANACTY;
when DVANACTY=>
stavovy<=TRINACTY;
when TRINACTY=>
stavovy<=CTRNACTY;
when CTRNACTY=>
stavovy<=PATNACTY;
when PATNACTY=>
stavovy<=SESTNACTY;
when SESTNACTY=>
sig_out<=ram_out(15 downto 8)&rom_out;
stavovy<=RAMADR;

end case;
end if;
end process radkovani;




pixel_clock_fin<=pixel_clock2 when CLK_DIV=2 else
        clock;
pixclk<=pixel_clock_fin;


pixell:process(clock, reset)
begin
if reset='0' then
pixel_clock2<='0';
elsif clock'event and clock='1' then


pixel_clock2<=not pixel_clock2;

end if;
end process;



-- podmineny vystup RGB signalu
signal_r<=r_sig when h_enable='1' and v_enable='1' else
          conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY);
signal_g<=g_sig when h_enable='1' and v_enable='1' else
          conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY);
signal_b<=b_sig when h_enable='1' and v_enable='1' else
          conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY);
----------

horizontalni:process(pixel_clock_fin, reset)
begin
if reset='0' then
h_sync_b<=not H_SYNC_POLARITY;
horizontal<=syn;
horizontal_citac<=H_SYN;
h_enable<='0';
pixel_h<=0;
pixel_pom<=0;
znak_h<=0;
elsif pixel_clock_fin'event and pixel_clock_fin='1' then

if h_enable='0' then
pixel_h<=0;
pixel_pom<=0;
znak_h<=-1;

if horizontal=back and horizontal_citac=0 then
znak_h<=0;
end if;
--pixel_pom<=SIRKA_ZNAKU-1;
elsif pixel_pom=SIRKA_ZNAKU-1 then
znak_h<=znak_h+1;
pixel_pom<=0;
else
pixel_h<=pixel_h+1;
pixel_pom<=pixel_pom+1;
end if;


case horizontal is

 when syn=>
 h_sync_b<=H_SYNC_POLARITY;
 if horizontal_citac=0 then
 horizontal<=back;
 horizontal_citac<=H_BACK-1;
 h_sync_b<=not H_SYNC_POLARITY;
 else
 horizontal_citac<=horizontal_citac-1;
 end if;
 
 when back=>
 if horizontal_citac=0 then
 horizontal<=data;
 horizontal_citac<=H_DATA-1;
 h_enable<='1';
 else
 horizontal_citac<=horizontal_citac-1;
 end if;
 
 when data=>
 if horizontal_citac=0 then
 horizontal<=front;
 horizontal_citac<=H_FRONT-1;
 h_enable<='0';
 else
 horizontal_citac<=horizontal_citac-1;
 end if;

 when front=>
 if horizontal_citac=0 then
 horizontal<=syn;
 horizontal_citac<=H_SYN-1;
 h_sync_b<=H_SYNC_POLARITY;
 else
 horizontal_citac<=horizontal_citac-1;
 end if;

end case;
end if;
end process;


vertikalni:process(h_sync_b, reset)
begin
if reset='0' then
v_sync_b<=not V_SYNC_POLARITY;
vertikal<=syn;
vertikal_citac<=V_SYN;
v_enable<='0';
--radka<=0;
pixel_v<=0;
radka_pom<=0;
znak_v<=0;
elsif h_sync_b'event and h_sync_b= H_SYNC_POLARITY then   --konec syncu na horizontu


if radka=V_DATA-1 or v_enable='0' then
--radka<=0;
pixel_v<=0;
radka_pom<=0;
znak_v<=0;
else
pixel_v<=pixel_v+1;
if radka_pom=VYSKA_ZNAKU-1 then  --7
znak_v<=znak_v+1;
radka_pom<=0;
else
radka_pom<=radka_pom+1;
--radka<=radka+1;
pixel_v<=pixel_v+1;
end if;
end if;

--state automat
case vertikal is

when syn =>
v_sync_b<=V_SYNC_POLARITY;
if vertikal_citac=0 then
vertikal<=back;
vertikal_citac<=V_BACK-1;
v_sync_b<=not V_SYNC_POLARITY;
else
vertikal_citac<=vertikal_citac-1;
end if;

when back =>
if vertikal_citac=0 then
vertikal<=data;
vertikal_citac<=V_DATA-1;
v_enable<='1';
else
vertikal_citac<=vertikal_citac-1;
end if;

when data =>
if vertikal_citac=0 then
vertikal<=front;
vertikal_citac<=V_FRONT-1;
v_enable<='0';
else
vertikal_citac<=vertikal_citac-1;
end if;

when front =>
if vertikal_citac=0 then
vertikal<=syn;
vertikal_citac<=V_SYN-1;
v_sync_b<=V_SYNC_POLARITY;
else
vertikal_citac<=vertikal_citac-1;
end if;

end case;



end if;

end process;





ram_inst : ram PORT MAP (
		address_a	 => ram_address,
		address_b    => vga_address,
		clock	 => clock,
		data_a => ram_data,
		data_b => vga_data,
		wren_a => ram_wren,
		wren_b => vga_wren,
		q_a	 => ram_out,
		q_b    => vga_out
	);
rom_inst : rom PORT MAP (
		address	 => rom_address,
		clock	 => clock,
		q	 => rom_out
	);



--kombinacni hruzodesnost ...
r_sig_backg <= conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=0 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=1 else
               conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=2 else
               conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=3 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=4 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=5 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=6 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=7 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=8 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=9 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=10 else
               conv_std_logic_vector(COLOR_TRICTVRTE, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=11 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=12 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=13 else
               conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=14 else
               conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY);
g_sig_backg <= conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=0 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=1 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=2 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=3 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=4 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=5 else
               conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=6 else
               conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=7 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=8 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=9 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=10 else
               conv_std_logic_vector(COLOR_TRICTVRTE, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=11 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=12 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=13 else
               conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=14 else
               conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY);
b_sig_backg <= conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=0 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=1 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=2 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=3 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=4 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=5 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=6 else
               conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=7 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=8 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=9 else
               conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=10 else
               conv_std_logic_vector(COLOR_TRICTVRTE, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=11 else
               conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=12 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=13 else
               conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(15 downto 12)=14 else
               conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY);
-----------------------------------------------------------
r_sig_font <= conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=0 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=1 else
              conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=2 else
              conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=3 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=4 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=5 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=6 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=7 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=8 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=9 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=10 else
              conv_std_logic_vector(COLOR_TRICTVRTE, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=11 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=12 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=13 else
              conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=14 else
              conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY);
g_sig_font <= conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=0 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=1 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=2 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=3 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=4 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=5 else
              conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=6 else
              conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=7 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=8 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=9 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=10 else
              conv_std_logic_vector(COLOR_TRICTVRTE, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=11 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=12 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=13 else
              conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=14 else
              conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY);
b_sig_font <= conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=0 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=1 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=2 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=3 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=4 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=5 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=6 else
              conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=7 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=8 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=9 else
              conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=10 else
              conv_std_logic_vector(COLOR_TRICTVRTE, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=11 else
              conv_std_logic_vector(COLOR_HALF, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=12 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=13 else
              conv_std_logic_vector(COLOR_NIC, BITOVA_SIRKA_BARVY) when sig_out(11 downto 8)=14 else
              conv_std_logic_vector(COLOR_FULL, BITOVA_SIRKA_BARVY);

r_sig<=r_sig_backg when sig_out(pixel_pom)='0' else
       r_sig_font;
g_sig<=g_sig_backg when sig_out(pixel_pom)='0' else
       g_sig_font;
b_sig<=b_sig_backg when sig_out(pixel_pom)='0' else
       b_sig_font;



end architecture;