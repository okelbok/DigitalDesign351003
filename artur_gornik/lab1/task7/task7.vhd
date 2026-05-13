library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity task7 is
  Port ( 
        sw_i: in STD_LOGIC_VECTOR(3 downto 0);
        led_o: out STD_LOGIC_VECTOR(3 downto 0)
  );
end task7;

architecture rtl of task7 is

    component mux2
        Port ( 
            d0 : in  STD_LOGIC;
            d1 : in  STD_LOGIC;
            s  : in  STD_LOGIC;
            y  : out STD_LOGIC
        );
    end component;
    
    component inv2
            port (
                I: in std_logic;
                O: out std_logic
            );
    end component;
    
    alias G3: std_logic is sw_i(3);
    alias G2: std_logic is sw_i(2);
    alias G1: std_logic is sw_i(1);
    alias G0: std_logic is sw_i(0);
    
    signal not_G3, not_G2, not_G1, not_G0: std_logic;
    signal H1, G3_G1, not_G3_not_G1, R1, not_G3_G1, G3_not_G1, R2: std_logic;
begin
    U1: inv2 port map (I => G3, O => not_G3);
    U2: inv2 port map (I => G2, O => not_G2);
    U3: inv2 port map (I => G1, O => not_G1);
    U4: inv2 port map (I => G0, O => not_G0);
    
    U5: mux2 port map (s => G0, d0 => not_G3_not_G1, d1 => G3_G1, y  => led_o(0));
    U6: mux2 port map (s => G1, d0 => '0', d1 => G3, y  => G3_G1);
    U7: mux2 port map (s => not_G1, d0 => '0', d1 => not_G3, y  => not_G3_not_G1);
    
    U8: mux2 port map (s => G0, d0 => G3, d1 => not_G3, y  => R1); 
    U9: mux2 port map (s => not_G1, d0 => '0', d1 => R1, y  => led_o(1)); 
    
    U10: mux2 port map (s => G0, d0 => not_G3_G1, d1 => G3_not_G1, y  => led_o(2));
    U11: mux2 port map (s => G3, d0 => '0', d1 => not_G1, y  => G3_not_G1);
    U12: mux2 port map (s => G1, d0 => '0', d1 => not_G3, y  => not_G3_G1);
    
    U13: mux2 port map (s => G0, d0 => G3, d1 => not_G3, y  => R2); 
    U14: mux2 port map (s => G1, d0 => '0', d1 => R2, y  => led_o(3)); 

end rtl;
