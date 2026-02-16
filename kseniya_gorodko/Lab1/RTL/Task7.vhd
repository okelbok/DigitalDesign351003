library ieee;
use ieee.std_logic_1164.all;

entity struct_code_unit is
    port(
        led_o: out std_logic_vector(3 downto 0);
        sw_i: in std_logic_vector (3 downto 0)
    );
end struct_code_unit;

architecture structural of struct_code_unit is
component INV
    port(
        a: in std_logic;
        z: out std_logic
    );
end component;
component MUX2
    port(
        a, b, s: in std_logic;
        z: out std_logic
    );
end component;
signal nsw_i: std_logic_vector(3 downto 0);
signal NaNb, NaNbc, ab, abNc, bNc, bNcNd, aNb, aNbc, aNbcd, bNcNd_aNbcd, y1, y2, y3: std_logic;
begin
    led_o(0) <= sw_i(0);

    u1: INV port map(a => sw_i(0), z => nsw_i(0));
    u2: INV port map(a => sw_i(1), z => nsw_i(1));
    u3: INV port map(a => sw_i(2), z => nsw_i(2));
    u4: INV port map(a => sw_i(3), z => nsw_i(3));

    u5: MUX2 port map(a => '0', b => nsw_i(3), s => nsw_i(2), z => NaNb);
    u6: MUX2 port map(a => '0', b => NaNb, s => sw_i(1), z => NaNbc);
    u7: MUX2 port map(a => '0', b => sw_i(3), s => sw_i(2), z => ab);
    u8: MUX2 port map(a => '0', b => ab, s => nsw_i(1), z => abNc);
    u9: MUX2 port map(a => NaNbc, b => '1', s => abNc, z => y1);
    led_o(1) <= y1;

    u10: MUX2 port map(a => '0', b => sw_i(2), s => nsw_i(1), z => bNc);
    u11: MUX2 port map(a => '0', b => bNc, s => nsw_i(0), z => bNcNd);
    u12: MUX2 port map(a => '0', b => sw_i(3), s => nsw_i(2), z => aNb);
    u13: MUX2 port map(a => '0', b => aNb, s => sw_i(1), z => aNbc);
    u14: MUX2 port map(a => '0', b => aNbc, s => sw_i(0), z => aNbcd);
    u15: MUX2 port map(a => bNcNd, b => '1', s => aNbcd, z => bNcNd_aNbcd);
    u16: MUX2 port map(a => bNcNd_aNbcd, b => '1', s => abNc, z => y2);
    led_o(2) <= y2;

    u17: MUX2 port map(a => '0', b => ab, s => sw_i(1), z => y3);
    led_o(3) <= y3;
end structural;