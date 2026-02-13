library IEEE;
use ieee.std_logic_1164.all;

entity test_top is
    port (
    -- signals, can use vector
    -- std_logic - type of signals (another is bit = {0, 1})
    -- std_logic has more signals = {0, 1, x, u, z, w, [one more]}
    -- 0 or 1 - stable, x - undefined, we dont know
    -- 0 = 0 V, 1 = 3.3V
    led0_o : out std_logic; -- it can be anything from {0, 1, x, u, z, w, [one more]}
    led1_o : out std_logic;
    led2_o : out std_logic;
    led3_o : out std_logic;
    led4_o : out std_logic;
    led5_o : out std_logic;
    led6_o : out std_logic;
    led7_o : out std_logic;
    led8_o : out std_logic;
    led9_o : out std_logic;
    led10_o : out std_logic;
    led11_o : out std_logic;
    led12_o : out std_logic;
    led13_o : out std_logic;
    led14_o : out std_logic;
    led15_o : out std_logic
    );
end test_top;

architecture rtl of test_top is 
begin
-- the goal is to light LED(svetodiod)
led0_o <= '1';
led1_o <= '0';
led2_o <= '0';
led3_o <= '0';

led4_o <= '0';
led5_o <= '0';
led6_o <= '1';
led7_o <= '1';

led8_o <= '1';
led9_o <= '1';
led10_o <= '0';
led11_o <= '1';

led12_o <= '0';
led13_o <= '0';
led14_o <= '0';
led15_o <= '0';
-- <= equals to =
-- above is the scheme how to light LED
-- next we need constrains
end rtl;