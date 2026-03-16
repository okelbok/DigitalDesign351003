library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMP3 is
    port (
        sw_i    : in    std_logic_vector(15 downto 0);  -- A = sw_i[2:0], B = sw_i[5:3]
        led_o   : out   std_logic_vector(15 downto 0)   -- E = led_o[2], G = led_o[1], L = led_o[0]
    );
end entity COMP3;

architecture Structural of COMP3 is
    signal pE1, pE2 :   std_logic;
    signal pG1, pG2 :   std_logic;
    signal pL1, pL2 :   std_logic;
    
    component COMP1 is
        port (
            A, B        : in    std_logic;
            pE, pG, pL  : in    std_logic;
            E, G, L     : out   std_logic
        );
     end component;
begin
    led_o(15 downto 3) <= (others => '0');
    
    COMP1_0: COMP1 port map (
        A => sw_i(0),
        B => sw_i(3),
        pE => '0',
        pG => '0',
        pL => '0',
        E => pE1,
        G => pG1,
        L => pL1
    );

    COMP1_1: COMP1 port map (
        A => sw_i(1),
        B => sw_i(4),
        pE => pE1,
        pG => pG1,
        pL => pL1,
        E => pE2,
        G => pG2,
        L => pL2
    );
    
    COMP1_2: COMP1 port map (
        A => sw_i(2),
        B => sw_i(5),
        pE => pE2,
        pG => pG2,
        pL => pL2,
        E => led_o(2),
        G => led_o(1),
        L => led_o(0)
    );
end Structural;