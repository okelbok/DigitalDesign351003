library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity inv2 is
  Port ( I : in STD_LOGIC; O : out STD_LOGIC);
end inv2;

architecture rtl of inv2 is
begin
    O <= not I;
end rtl;
