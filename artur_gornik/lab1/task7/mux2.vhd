library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2 is
    Port ( 
        d0 : in  STD_LOGIC; 
        d1 : in  STD_LOGIC; 
        s  : in  STD_LOGIC; 
        y  : out STD_LOGIC 
    );
end mux2;

architecture rtl of mux2 is
begin
    y <= d0 when s = '0' else d1;
end rtl;