library IEEE;
use ieee.std_logic_1164.all;

entity MUX2_gate is
 port (
  X0, X1, S : in std_logic;
  O : out std_logic
 ); 
end MUX2_gate;

architecture rtl of MUX2_gate is
begin
 process(X0, X1, S)
 begin 
  if S = '0' then
   O <= X0;
  else
  O <= X1;
  end if;
 end process;
end rtl;