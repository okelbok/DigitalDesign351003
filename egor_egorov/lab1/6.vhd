library ieee;
use ieee.std_logic_1164.all;

entity testTop is
  port (
    sw : in std_logic_vector(3 downto 0);
    led_o : out std_logic_vector(3 downto 0)
  );
end testTop;

architecture rtl of testTop is
    signal A, B, C, D : std_logic;
    signal not_A, not_B, not_C, not_D : std_logic;
    signal L0, L1, L2, L3 : std_logic;
begin
    A <= sw(3);
    B <= sw(2);
    C <= sw(1);
    D <= sw(0);

    not_A <= not A;
    not_B <= not B;
    not_C <= not C;
    not_D <= not D;

    L0 <= (not_A and B and not_C and not_D)
          or
          (not_A and B and C and D)
          or
          (A and not_B and C and not_D);

    L1 <= (A and not_B and not_C and not_D)
          or
          (not_A and B and not_C and D);

    L2 <= (not_A and B and C)
          or
          (A and not_B and not_C and not_D);

    L3 <= (A and not_B and not_C and D)
          or
          (A and not_B and C and not_D);

    led_o(0) <= L0;
    led_o(1) <= L1;
    led_o(2) <= L2;
    led_o(3) <= L3;
end rtl;
