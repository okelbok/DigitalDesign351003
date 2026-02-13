library ieee;

use ieee.std_logic_1164.all;

entity testTop is
  port (

    sw : in  std_logic_vector(7 downto 0);

    led_o : out std_logic_vector(15 downto 0)

  );
end testTop;

architecture rtl of testTop is
  constant I_VALUE : std_logic_vector(7 downto 0) := x"4C";  -- 0100 1100
  constant J_VALUE : std_logic_vector(7 downto 0) := x"1D";  -- 0001 1101

  signal xor_result : std_logic_vector(7 downto 0);
  signal is_correct : std_logic;
begin
  xor_result <= sw xor I_VALUE;

  is_correct <= '1' when (xor_result = J_VALUE) else '0';

  led_o(15 downto 8) <= (others => '0') when is_correct = '1' else
                        '1' & (6 downto 0 => '0');
  led_o(7 downto 0)  <= J_VALUE when is_correct = '1' else
                        (others => '0');
end rtl;