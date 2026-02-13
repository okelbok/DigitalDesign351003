library IEEE;
use ieee.std_logic_1164.all;

entity alu_unit is 
 port(
 led_o : out std_logic_vector(5 downto 0);
 sw_i : in std_logic_vector(15 downto 0)
 );
end alu_unit;
 
architecture rtl of alu_unit is
begin

process(sw_i)
 variable borrow, x1, x2 : std_logic;
 variable minus_res : std_logic_vector(5 downto 0);
begin
 if sw_i(3 downto 0) = "0001" then
  led_o(5 downto 0) <= sw_i(15 downto 10) and sw_i(9 downto 4);
 elsif sw_i(3 downto 0) = "0010" then
  borrow := '0';
  for i in 0 to 5 loop
   x1 := sw_i(10 + i);
   x2 := sw_i(4 + i);
   minus_res(i) := x1 xor x2 xor borrow;
   borrow := ((not x1) and x2) or ((not (x1 xor x2)) and borrow);
  end loop;
  led_o <= minus_res;
 elsif sw_i(3 downto 0) = "0100" then
  led_o(5 downto 0) <= "000" & sw_i(15 downto 13); 
 else 
   led_o(5 downto 0) <= sw_i(15 downto 10) nor sw_i(9 downto 4);
 end if;
end process;

end rtl;