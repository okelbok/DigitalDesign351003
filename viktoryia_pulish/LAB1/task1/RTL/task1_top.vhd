library ieee;
use ieee.std_logic_1164.all;

entity led_const is
    port (
        led0    : out std_logic;
        led1    : out std_logic;
        led2    : out std_logic;
        led3    : out std_logic;
        led4    : out std_logic;
        led5    : out std_logic;
        led6    : out std_logic;
        led7    : out std_logic;
        led8    : out std_logic;
        led9    : out std_logic;
        led10   : out std_logic;
        led11   : out std_logic;
        led12   : out std_logic;
        led13   : out std_logic;
        led14   : out std_logic;
        led15   : out std_logic
        );
end led_const;

architecture rtl of led_const is
begin
    led0 <= '1';
    led1 <= '1';
    led2 <= '1';
    led3 <= '0';
    led4 <= '0';
    led5 <= '0';
    led6 <= '0';
    led7 <= '1';
    led8 <= '0';
    led9 <= '1';
    led10 <= '1';
    led11 <= '1';
    led12 <= '0';
    led13 <= '1';
    led14 <= '0';
    led15 <= '1';
end rtl; 
