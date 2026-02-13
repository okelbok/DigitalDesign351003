library IEEE;
use ieee.std_logic_1164.all;

entity task4 is
    port (
    led0_o : out std_logic; 
    
    sw0_i: in std_logic;
    sw1_i: in std_logic;
    sw2_i: in std_logic;
    sw3_i: in std_logic
    );
end task4;

architecture rtl of task4 is 
begin
    led0_o <= (NOT sw0_i AND sw1_i) OR (sw1_i AND sw2_i) OR (NOT sw0_i AND NOT sw2_i AND NOT sw3_i) OR (NOT sw0_i AND sw2_i AND sw3_i);
end rtl;