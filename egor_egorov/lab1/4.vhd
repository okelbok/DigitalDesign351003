library ieee;
use ieee.std_logic_1164.all;

entity testTop is
  port (
    sw : in std_logic_vector(3 downto 0);
    led_o : out std_logic_vector(15 downto 0)
  );
end testTop;

architecture rtl of testTop is
  signal A, B, C, D : std_logic;
  signal not_A, not_B, not_C, not_D : std_logic;
  signal term1, term2, term3, term4 : std_logic;
  signal F_result : std_logic;
begin
  A <= sw(3);
  B <= sw(2);
  C <= sw(1);
  D <= sw(0);
  
  not_A <= not A;
  not_B <= not B;
  not_C <= not C;
  not_D <= not D;
  
  term1 <= A and B and D;
  term2 <= A and not_C and not_D;
  term3 <= not_A and B and not_D;
  term4 <= not_A and not_B and D;
  
  F_result <= term1 or term2 or term3 or term4;
  

  led_o(15) <= F_result;
  led_o(14 downto 0) <= (others => '0');
end rtl;