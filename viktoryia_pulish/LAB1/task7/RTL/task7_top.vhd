library IEEE;
use ieee.std_logic_1164.all;

entity converter_structural is
 port (
  sw_i : in std_logic_vector(4 downto 0);
  led_o : out std_logic_vector(4 downto 0)
 );
end converter_structural;

architecture Structural of converter_structural is
    component MUX2_gate is
      port (A, B, sel : in std_logic; O : out std_logic);
    end component;

    component NOT_gate is
      port (A : in std_logic; O : out std_logic);
    end component;

    signal na, nb, nc, nd : std_logic;       -- input inversions
    signal xor_y3, xor_y2 : std_logic;       -- XOR results
    signal y3_step1, y3_step2 : std_logic;
    signal y2_step1, y2_step2 : std_logic;
    signal y1_step1, y1_step2, y1_step3 : std_logic;
    signal y0_step1, y0_step2, y0_step3 : std_logic;
begin
    -- inverters
    U_na: NOT_gate port map(A => sw_i(0), O => na);
    U_nb: NOT_gate port map(A => sw_i(1), O => nb);
    U_nc: NOT_gate port map(A => sw_i(2), O => nc);
    U_nd: NOT_gate port map(A => sw_i(3), O => nd);

    -- Y3 = x4·x3·x2·(x1 XOR x0)
    U_xor_y3: MUX2_gate port map(sel => sw_i(1), A => sw_i(0), B => na, O => xor_y3);
    U_y3_step1: MUX2_gate port map(sel => sw_i(2), A => '0', B => xor_y3, O => y3_step1);
    U_y3_step2: MUX2_gate port map(sel => sw_i(3), A => '0', B => y3_step1, O => y3_step2);
    U_y3_step3: MUX2_gate port map(sel => sw_i(4), A => '0', B => y3_step2, O => led_o(3));

    -- Y2 = x4·x1·x0·(x3 XOR x2)
    U_xor_y2: MUX2_gate port map(sel => sw_i(3), A => sw_i(2), B => nc, O => xor_y2);
    U_y2_step1: MUX2_gate port map(sel => sw_i(1), A => '0', B => xor_y2, O => y2_step1);
    U_y2_step2: MUX2_gate port map(sel => sw_i(0), A => '0', B => y2_step1, O => y2_step2);
    U_y2_step3: MUX2_gate port map(sel => sw_i(4), A => '0', B => y2_step2, O => led_o(2));

    -- Y1 = x3·x1·(x4 + x4'·x2·x0)
    U_y1_step1: MUX2_gate port map(sel => sw_i(2), A => '0', B => sw_i(0), O => y1_step1);
    U_y1_step2: MUX2_gate port map(sel => sw_i(4), A => y1_step1, B => '1', O => y1_step2);
    U_y1_step3: MUX2_gate port map(sel => sw_i(3), A => '0', B => y1_step2, O => y1_step3);
    U_y1_final: MUX2_gate port map(sel => sw_i(1), A => '0', B => y1_step3, O => led_o(1));

    -- Y0 = x2·x0·(x1 + x4·x3)
    U_y0_step1: MUX2_gate port map(sel => sw_i(4), A => '0', B => sw_i(3), O => y0_step1);
    U_y0_step2: MUX2_gate port map(sel => sw_i(1), A => y0_step1, B => '1', O => y0_step2);
    U_y0_step3: MUX2_gate port map(sel => sw_i(2), A => '0', B => y0_step2, O => y0_step3);
    U_y0_final: MUX2_gate port map(sel => sw_i(0), A => '0', B => y0_step3, O => led_o(0));

    -- Y4 = 0
    led_o(4) <= '0';

end architecture;
