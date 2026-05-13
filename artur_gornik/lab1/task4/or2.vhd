library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity or2 is
  Port (I0: in STD_LOGIC; I1: in STD_LOGIC; O: out STD_LOGIC);
end or2;

architecture rtl of or2 is
begin
	O <= I0 or I1;
end rtl;
