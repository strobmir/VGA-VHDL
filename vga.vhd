library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
---
entity vga is
generic( 
H_SYNC_POLARITY:std_logic:='0';
V_SYNC_POLARITY:std_logic:='0';

CLK_DIV : integer range 1 to 2:=2;

H_SYN   : integer:=96; --96 120
H_BACK  : integer:=48; --48 64
H_DATA  : integer:=640; --640 800
H_FRONT : integer:=16; --16 56
V_SYN   : integer:=2; --2 6
V_BACK  : integer:=33; --33 23
V_DATA  : integer:=480; --480 600
V_FRONT : integer:=10; --10 37
PIXELU_NA_RADKU : integer:=800; --800 10bit 1040

SIRKA_ZNAKU : integer:=6;
VYSKA_ZNAKU : integer:=10
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
signal pixel_clock_fin, pixel_clock2 : std_logic;

type state is (syn,back,data,front);

signal horizontal : state;
signal horizontal_citac : integer range 0 to PIXELU_NA_RADKU;
signal vertikal : state;
signal vertikal_citac : integer;
signal vertikal_citac_line : integer;
-------
signal h_enable, v_enable, enable : std_logic;
-------
signal r_sig, g_sig, b_sig : std_logic_vector(9 downto 0);
-------posice znaku a pixelu/radky
signal znak_h : integer range 0 to H_DATA/SIRKA_ZNAKU-1;
signal znak_v : integer range 0 to V_DATA/VYSKA_ZNAKU-1;
signal znak_h_min : integer range 0 to H_DATA/SIRKA_ZNAKU-1;
signal znak_v_min : integer range 0 to V_DATA/VYSKA_ZNAKU-1;
signal radka : integer range 0 to V_DATA-1;
signal radka_pom : integer range 0 to VYSKA_ZNAKU-1;
signal pixel : integer range 0 to H_DATA-1;
signal pixel_pom : integer range 0 to SIRKA_ZNAKU-1;


signal h_sync_b : std_logic;
signal v_sync_b : std_logic;
---RAM & ROM
signal ram_address : std_logic_vector(12 downto 0):=(others=>'0');
signal rom_address : std_logic_vector(10 downto 0);
signal ram_out, ram_data : std_logic_vector(7 downto 0);
signal rom_out : std_logic_vector(4 downto 0);
signal ram_wren : std_logic:='0';
---horizontalni stavovka
type statehor is (RAMADR, RAM1, RAM2, ROMADR, ROM1, ROM2, DATA, OSMY, DEVATY, DESATY);
signal stavovy:statehor;
signal pomocny_inkr:std_logic_vector(11 downto 0);

--signal ramadr:std_logic_vector(12 downto 0);
signal citac_znaku : integer range 0 to H_DATA/SIRKA_ZNAKU;
signal sig_out_r : std_logic_vector(SIRKA_ZNAKU-1 downto 0);
signal sig_out_g : std_logic_vector(SIRKA_ZNAKU-1 downto 0);
signal sig_out_b : std_logic_vector(SIRKA_ZNAKU-1 downto 0);
begin

h_sync<=h_sync_b;
v_sync<=v_sync_b;


radkovani:process(clock, reset)
begin
if reset='0' then
stavovy<=RAMADR;
elsif clock'event and clock='1' then
case stavovy is

when RAMADR=>

if h_enable='1' then
stavovy<=RAM1;
end if;


ram_address<=conv_std_logic_vector(znak_v*(H_DATA/VYSKA_ZNAKU)*8+znak_h,13);

when RAM1=>
stavovy<=RAM2;

when RAM2=>
stavovy<=ROMADR;

when ROMADR=>
rom_address<=("000"&ram_out)+conv_std_logic_vector(radka_pom,11);
stavovy<=ROM1;

when ROM1=>
stavovy<=ROM2;

when ROM2=>
stavovy<=DATA;

when DATA=>

sig_out_r<='0'&rom_out;
sig_out_g<='0'&rom_out;
sig_out_b<='0'&rom_out;




stavovy<=OSMY;

when OSMY=>
stavovy<=DEVATY;
when DEVATY=>
stavovy<=DESATY;
when DESATY=>
stavovy<=RAMADR;

end case;
end if;
end process radkovani;

--prednastaveni RAM adresy
--ramadr<=conv_std_logic_vector(0,13) when znak_v=0 else
--	    conv_std_logic_vector(106,13) when znak_v=1 else
--		 conv_std_logic_vector(212,13) when znak_v=2 else
--		 conv_std_logic_vector(318,13) when znak_v=3 else
--		 conv_std_logic_vector(424,13) when znak_v=4 else
--		 conv_std_logic_vector(530,13) when znak_v=5 else
--		 conv_std_logic_vector(636,13) when znak_v=6 else
--		 conv_std_logic_vector(742,13) when znak_v=7 else
--		 conv_std_logic_vector(848,13) when znak_v=8 else
--		 conv_std_logic_vector(954,13) when znak_v=9 else
--		 conv_std_logic_vector(1060,13) when znak_v=10 else
--		 conv_std_logic_vector(1166,13) when znak_v=11 else
--		 conv_std_logic_vector(1272,13) when znak_v=12 else
--		 conv_std_logic_vector(1378,13) when znak_v=13 else
--		 conv_std_logic_vector(1484,13) when znak_v=14 else
--		 conv_std_logic_vector(1590,13) when znak_v=15 else
--		 conv_std_logic_vector(1696,13) when znak_v=16 else
--		 conv_std_logic_vector(1802,13) when znak_v=17 else
--		 conv_std_logic_vector(1908,13) when znak_v=18 else
--		 conv_std_logic_vector(2014,13) when znak_v=19 else
--		 conv_std_logic_vector(2120,13) when znak_v=20 else
--		 conv_std_logic_vector(2226,13) when znak_v=21 else
--		 conv_std_logic_vector(2332,13) when znak_v=22 else
--		 conv_std_logic_vector(2438,13) when znak_v=23 else
--		 conv_std_logic_vector(2544,13) when znak_v=24 else
--		 conv_std_logic_vector(2650,13) when znak_v=25 else
--		 conv_std_logic_vector(2756,13) when znak_v=26 else
--		 conv_std_logic_vector(2862,13) when znak_v=27 else
--		 conv_std_logic_vector(2968,13) when znak_v=28 else
--		 conv_std_logic_vector(3074,13) when znak_v=29 else
--		 conv_std_logic_vector(3180,13) when znak_v=30 else
--		 conv_std_logic_vector(3286,13) when znak_v=31 else
--		 conv_std_logic_vector(3392,13) when znak_v=32 else
--		 conv_std_logic_vector(3498,13) when znak_v=33 else
--		 conv_std_logic_vector(3604,13) when znak_v=34 else
--		 conv_std_logic_vector(3710,13) when znak_v=35 else
--		 conv_std_logic_vector(3816,13) when znak_v=36 else
--		 conv_std_logic_vector(3922,13) when znak_v=37 else
--		 conv_std_logic_vector(4028,13) when znak_v=38 else
---		 conv_std_logic_vector(4134,13) when znak_v=39 else
	--	 conv_std_logic_vector(4240,13) when znak_v=40 else
--		 conv_std_logic_vector(4346,13) when znak_v=41 else
--		 conv_std_logic_vector(4452,13) when znak_v=42 else
	--	 conv_std_logic_vector(4558,13) when znak_v=43 else
--		 conv_std_logic_vector(4664,13) when znak_v=44 else
	--	 conv_std_logic_vector(4770,13) when znak_v=45 else
	--	 conv_std_logic_vector(4876,13) when znak_v=46 else
	 --  conv_std_logic_vector(4982,13);



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

r_sig<=(others=>'1') when sig_out_r(pixel_pom)='1' else
       (others=>'0');
g_sig<=(others=>'1') when sig_out_g(pixel_pom)='1' else
       (others=>'0');
b_sig<=(others=>'1') when sig_out_b(pixel_pom)='1' else
       (others=>'0');

-- podmineny vystup RGB signalu
signal_r<=r_sig when h_enable='1' and v_enable='1' else
          "0000000000";
signal_g<=g_sig when h_enable='1' and v_enable='1' else
          "0000000000";
signal_b<=b_sig when h_enable='1' and v_enable='1' else
          "0000000000";
----------




horizontalni:process(pixel_clock_fin, reset)
begin
if reset='0' then
h_sync_b<=not H_SYNC_POLARITY;
horizontal<=syn;
horizontal_citac<=H_SYN;
h_enable<='0';
--pixel<=0;
pixel_pom<=0;
znak_h<=0;
elsif pixel_clock_fin'event and pixel_clock_fin='1' then

if pixel=H_DATA-1 or h_enable='0' then
--pixel<=0;
pixel_pom<=0;
znak_h<=0;
elsif znak_h=132 and h_enable='1' then

else

if pixel_pom=SIRKA_ZNAKU-1 then
znak_h<=znak_h+1;
pixel_pom<=0;
else
--pixel<=pixel+1;
pixel_pom<=pixel_pom+1;
end if;
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
--vertikal_citac_line<=PIXELU_NA_RADKU-1;
--vertikal_citac_line<="111111111111"-conv_std_logic_vector(96, vertikal_citac_line'length);
v_enable<='0';
--radka<=0;
radka_pom<=0;
znak_v<=0;
elsif h_sync_b'event and h_sync_b= H_SYNC_POLARITY then   --konec syncu na horizontu


if radka=V_DATA-1 or v_enable='0' then
--radka<=0;
radka_pom<=0;
znak_v<=0;
else
if radka_pom=VYSKA_ZNAKU-1 then  --7
znak_v<=znak_v+1;
radka_pom<=0;
else
radka_pom<=radka_pom+1;
--radka<=radka+1;
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