library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity and2 is
  Port (I0: in STD_LOGIC; I1: in STD_LOGIC; O: out STD_LOGIC);
end and2;

architecture rtl of and2 is
begin
	O <= I0 and I1;
end rtl;
