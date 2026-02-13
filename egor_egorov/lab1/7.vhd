library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
  port(
    d0, d1 : in  std_logic;
    sel    : in  std_logic;
    y      : out std_logic
  );
end mux2;

architecture rtl of mux2 is
begin
  y <= d0 when sel = '0' else d1;
end rtl;

library ieee;
use ieee.std_logic_1164.all;

entity testTop is
  port (
    sw : in std_logic_vector(3 downto 0);
    led_o : out std_logic_vector(3 downto 0)
  );
end testTop;

architecture struct of testTop is
  signal A, B, C, D     : std_logic;
  signal not_D          : std_logic;

  signal L0_C_branch1, L0_C_branch2 : std_logic;
  signal L0_B_branch1, L0_B_branch2 : std_logic;

  signal L1_C_branch1, L1_C_branch2 : std_logic;
  signal L1_B_branch1, L1_B_branch2 : std_logic;

  signal L2_C_branch : std_logic;
  signal L2_B_branch1, L2_B_branch2 : std_logic;

  signal L3_C_branch : std_logic;
  signal L3_B_branch : std_logic;

begin
  A <= sw(3);
  B <= sw(2);
  C <= sw(1);
  D <= sw(0);
  not_D <= not D;

  -- =====================================================
  -- L0 = MUX(A, MUX(B, 0, MUX(C, not_D, D)), MUX(B, MUX(C, 0, not_D), 0))
  -- =====================================================

  -- MUX(C, not_D, D)
  L0_C_branch1_inst : entity work.mux2 port map(d0 => not_D, d1 => D, sel => C, y => L0_C_branch1);
  -- MUX(B, 0, MUX(C, not_D, D))
  L0_B_branch1_inst : entity work.mux2 port map(d0 => '0', d1 => L0_C_branch1, sel => B, y => L0_B_branch1);
  -- MUX(C, 0, not_D)
  L0_C_branch2_inst : entity work.mux2 port map(d0 => '0', d1 => not_D, sel => C, y => L0_C_branch2);
  -- MUX(B, MUX(C, 0, not_D), 0)
  L0_B_branch2_inst : entity work.mux2 port map(d0 => L0_C_branch2, d1 => '0', sel => B, y => L0_B_branch2);

  L0_final_inst : entity work.mux2 port map(d0 => L0_B_branch1, d1 => L0_B_branch2, sel => A, y => led_o(0));

  -- =====================================================
  -- L1 = MUX(A, MUX(B, 0, MUX(C, D, 0)), MUX(B, MUX(C, not_D, 0), 0))
  -- =====================================================

  -- MUX(C, D, 0)
  L1_C_branch1_inst : entity work.mux2 port map(d0 => D, d1 => '0', sel => C, y => L1_C_branch1);
  -- MUX(B, 0, MUX(C, D, 0))
  L1_B_branch1_inst : entity work.mux2 port map(d0 => '0', d1 => L1_C_branch1, sel => B, y => L1_B_branch1);
  -- MUX(C, not_D, 0)
  L1_C_branch2_inst : entity work.mux2 port map(d0 => not_D, d1 => '0', sel => C, y => L1_C_branch2);
  -- MUX(B, MUX(C, not_D, 0), 0)
  L1_B_branch2_inst : entity work.mux2 port map(d0 => L1_C_branch2, d1 => '0', sel => B, y => L1_B_branch2);

  L1_final_inst : entity work.mux2 port map(d0 => L1_B_branch1, d1 => L1_B_branch2, sel => A, y => led_o(1));

  -- =====================================================
  -- L2 = MUX(A, MUX(B, 0, C), MUX(B, MUX(C, not_D, 0), 0))
  -- =====================================================

  -- MUX(B, 0, C)
  L2_B_branch1_inst : entity work.mux2 port map(d0 => '0', d1 => C, sel => B, y => L2_B_branch1);
  -- MUX(C, not_D, 0)
  L2_C_branch_inst  : entity work.mux2 port map(d0 => not_D, d1 => '0', sel => C, y => L2_C_branch);
  -- MUX(B, MUX(C, not_D, 0), 0)
  L2_B_branch2_inst : entity work.mux2 port map(d0 => L2_C_branch, d1 => '0', sel => B, y => L2_B_branch2);

  L2_final_inst : entity work.mux2 port map(d0 => L2_B_branch1, d1 => L2_B_branch2, sel => A, y => led_o(2));

  -- =====================================================
  -- L3 = MUX(A, 0, MUX(B, MUX(C, D, not_D), 0))
  -- =====================================================

  -- MUX(C, D, not_D)
  L3_C_branch_inst : entity work.mux2 port map(d0 => D, d1 => not_D, sel => C, y => L3_C_branch);
  -- MUX(B, MUX(C, D, not_D), 0)
  L3_B_branch_inst : entity work.mux2 port map(d0 => L3_C_branch, d1 => '0', sel => B, y => L3_B_branch);

  L3_final_inst : entity work.mux2 port map(d0 => '0', d1 => L3_B_branch, sel => A, y => led_o(3));

end struct;
