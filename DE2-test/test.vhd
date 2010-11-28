library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test is
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
end entity;



architecture behav of test is
component vga is
generic( 
H_SYNC_POLARITY:std_logic;
V_SYNC_POLARITY:std_logic;

CLK_DIV : integer range 1 to 2; --2 1

H_SYN   : integer; --96 120
H_BACK  : integer; --48 64
H_DATA  : integer; --640 800
H_FRONT : integer; --16 56
V_SYN   : integer; --2 6
V_BACK  : integer; --33 23
V_DATA  : integer; --480 600
V_FRONT : integer; --10 37
PIXELU_NA_RADKU : integer; --800 10bit 1040

SIRKA_ZNAKU : integer; --8
VYSKA_ZNAKU : integer; --8

BITOVA_SIRKA_BARVY : integer;

COLOR_FULL : integer;
COLOR_HALF : integer;
COLOR_TRICTVRTE : integer;
COLOR_NIC : integer
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
end component;

signal ramadr:std_logic_vector(12 downto 0):=(others=>'0');

type lut is array (natural range <>) of std_logic_vector(6 downto 0); -- type: unconstrained array of 7-bit words
  -- constant - look-up table contains the 7-segment codes for numbers 0 to 7
constant MY_LUT : lut := ("1000000","1111001","0100100","0110000","0011001","0010010","0000010", "1111000","0000000","0010000","0001000","0000011","1000110","0100001","0000110","0001110");

signal wren : std_logic:='0';
signal tlen3, tlen2 : std_logic:='1';
signal tlcount3, tlcount2 : std_logic_vector(25 downto 0);

signal signal_r_b, signal_g_b, signal_b_b : std_logic_vector(9 downto 0);

signal video_enable:std_logic;

signal pixel_h : integer range 0 to 639;
signal pixel_v : integer range 0 to 479;

signal znak_h : integer range -1 to 80;
signal znak_v : integer range 0 to 59;

signal blikatko:integer range 0 to 25000000;
signal blik, shift:std_logic;

begin



signal_r<="1111111111" when (znak_h=conv_integer(ramadr) mod 80 and znak_v=(conv_integer(ramadr)-(conv_integer(ramadr) mod 80))/80) and video_enable='1' and (blik='1' or shift='1') else
		    signal_r_b;

signal_g<="1111111111" when (znak_h=conv_integer(ramadr) mod 80 and znak_v=(conv_integer(ramadr)-(conv_integer(ramadr) mod 80))/80) and video_enable='1' and (blik='1' or shift='1') else
		    signal_g_b;
			 
signal_b<="1111111111" when (znak_h=conv_integer(ramadr) mod 80 and znak_v=(conv_integer(ramadr)-(conv_integer(ramadr) mod 80))/80) and video_enable='1' and (blik='1' or shift='1') else
		    signal_b_b;




hex(6 downto 0)<=MY_LUT(conv_integer(ramadr(3 downto 0)));
hex(13 downto 7)<=MY_LUT(conv_integer(ramadr(7 downto 4)));
hex(20 downto 14)<=MY_LUT(conv_integer(ramadr(11 downto 8)));
hex(27 downto 21)<=MY_LUT(conv_integer(ramadr(12 downto 12)));

hex(34 downto 28)<=MY_LUT(conv_integer(sw(3 downto 0)));
hex(41 downto 35)<=MY_LUT(conv_integer(sw(7 downto 4)));
hex(48 downto 42)<=MY_LUT(conv_integer(sw(11 downto 8)));
hex(55 downto 49)<=MY_LUT(conv_integer(sw(15 downto 12)));

x:process(clock,reset)
begin
if reset='0' then
ramadr<=(others=>'0');
--ramadr<=conv_std_logic_vector(X"12BF",13);
tlcount2<=(others=>'1');
tlcount3<=(others=>'1');
elsif clock'event and clock='1' then
shift<='0';
 
 if key3='0' and tlen3='1' then
 ramadr<=ramadr+1;
 
 if ramadr=X"12BF" then
  ramadr<=(others=>'0');
  end if;
 
 tlen3<='0';
 elsif key3='1' then
 tlen3<='1';
 tlcount3<=(others=>'1');
 elsif key3='0' and tlen3='0' then
  shift<='1';
  if tlcount3=0 then
  ramadr<=ramadr+1;
  
  if ramadr=X"12BF" then
  ramadr<=(others=>'0');
  end if;
  
  tlcount3<=(25=>'0',24=>'0',23=>'0',22=>'0',21=>'0',others=>'1');
  else
 
  tlcount3<=tlcount3-1;
  end if;
 end if; 
 
 
----------------------- 
 if key2='0' and tlen2='1' then
 ramadr<=ramadr-1;
 
 if ramadr=0 then
  ramadr<=conv_std_logic_vector(X"12BF",13);
  end if;
 
 tlen2<='0';
 elsif key2='1' then
 tlen2<='1';
 tlcount2<=(others=>'1');
 elsif key2='0' and tlen2='0' then
  shift<='1';
  if tlcount2=0 then
  ramadr<=ramadr-1;
  
  if ramadr=0 then
  ramadr<=conv_std_logic_vector(X"12BF",13);
  end if;
  
  tlcount2<=(25=>'0',24=>'0',23=>'0',22=>'0',21=>'0',others=>'1');
  else
 
  tlcount2<=tlcount2-1;
  end if;
 end if;
 
 
 
 end if;
end process;


wren<=not key1;

y:process(clock, reset)
begin
if reset='0' then

elsif clock'event and clock='1' then


end if;
end process;



blikatko_divider : process(clock, reset)
begin
if reset='0' then
blik<='0';
blikatko<=25000000;
elsif clock'event and clock='1' then

 if blikatko=0 then
 blik<=not blik;
 blikatko<=25000000;
 else
 blikatko<=blikatko-1;
 end if;

end if;
end process;



vgacko : vga generic map('0','0',2,96,48,640,16,2,33,480,10,800,8,8,10,1023,511,737,0) port map(clock, reset, h_sync, v_sync,pixclk,signal_r_b,signal_g_b,signal_b_b,sync,blank,video_enable,ramadr,sw,wren,open, pixel_h, pixel_v,znak_h,znak_v);

end architecture;