library ieee;
use ieee.std_logic_1164.all;

entity comb_led_unit is
    port (
        sw0  : in std_logic;
        sw1  : in std_logic;
        sw2  : in std_logic;
        sw3  : in std_logic;
        sw4  : in std_logic;
        sw5  : in std_logic;
        sw6  : in std_logic;
        sw7  : in std_logic;
        led0  : out std_logic;
        led1  : out std_logic;
        led2  : out std_logic;
        led3  : out std_logic;
        led4  : out std_logic;
        led5  : out std_logic;
        led6  : out std_logic;
        led7  : out std_logic;
        led8  : out std_logic;
        led9  : out std_logic;
        led10 : out std_logic;
        led11 : out std_logic;
        led12 : out std_logic;
        led13 : out std_logic;
        led14 : out std_logic;
        led15 : out std_logic
    );
end comb_led_unit;

architecture rtl of comb_led_unit is
    constant I_const : std_logic_vector(7 downto 0) := "01001110"; 
    signal sw_vec  : std_logic_vector(7 downto 0);
    signal led_vec : std_logic_vector(15 downto 0);
begin
    sw_vec <= sw7 & sw6 & sw5 & sw4 & sw3 & sw2 & sw1 & sw0;
    -- sw_vec = 0011 1010
    led_vec <= (sw_vec xor I_const) & (sw_vec xor I_const);

    led0  <= led_vec(0);
    led1  <= led_vec(1);
    led2  <= led_vec(2);
    led3  <= led_vec(3);
    led4  <= led_vec(4);
    led5  <= led_vec(5);
    led6  <= led_vec(6);
    led7  <= led_vec(7);
    led8  <= led_vec(8);
    led9  <= led_vec(9);
    led10 <= led_vec(10);
    led11 <= led_vec(11);
    led12 <= led_vec(12);
    led13 <= led_vec(13);
    led14 <= led_vec(14);
    led15 <= led_vec(15);

end rtl;
