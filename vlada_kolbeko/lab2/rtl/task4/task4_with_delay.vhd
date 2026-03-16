library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMP3_D is
    port (
        sw_i    : in    std_logic_vector(15 downto 0);  -- A = sw_i[2:0], B = sw_i[5:3]
        led_o   : out   std_logic_vector(15 downto 0)   -- E = led_o[2], G = led_o[1], L = led_o[0]
    );
end entity COMP3_D;

architecture Structural of COMP3_D is
    signal sA0, sA1, sA2                            : std_logic;
    signal sB0, sB1, sB2                            : std_logic;
    signal pE_00, pE_01, pE_10, pE_11, pE_20, pE_21 : std_logic;
    signal pG_00, pG_01, pG_10, pG_11, pG_20, pG_21 : std_logic;
    signal pL_00, pL_01, pL_10, pL_11, pL_20, pL_21 : std_logic;
    
    component COMP1_D is
        port (
            A, B        : in    std_logic;
            pE, pG, pL  : in    std_logic;
            E, G, L     : out   std_logic
        );
     end component;
     
     component INTCON_D is
        generic (
             DELAY       : time  := 10 ns
        );
        port (
            X   : in    std_logic;
            Y   : out   std_logic
        );
     end component;
begin
    led_o(15 downto 4) <= (others => '0');
    
    INTCON_0: INTCON_D port map (
        X => sw_i(0),
        Y => sA0
    );
    
    INTCON_1: INTCON_D
    generic map (
        DELAY => 11 ns
    )
    port map (
        X => sw_i(3),
        Y => sB0
    );
    
    INTCON_2: INTCON_D
    generic map (
        DELAY => 15 ns
    )
    port map (
        X => sw_i(1),
        Y => sA1   
    );
    
    INTCON_3: INTCON_D
    generic map (
        DELAY => 16 ns
    )
    port map (
        X => sw_i(4),
        Y => sB1
    );
    
    INTCON_4: INTCON_D
    generic map (
        DELAY => 20 ns
    )
    port map (
        X => sw_i(2),
        Y => sA2
    );
    
    INTCON_5: INTCON_D
    generic map (
        DELAY => 21 ns
    )
    port map (
        X => sw_i(5),
        Y => sB2
    );
    
    COMP1_0: COMP1_D port map (
        A => sA0,
        B => sB0,
        pE => '0',
        pG => '0',
        pL => '0',
        E => pE_00,
        G => pG_00,
        L => pL_00
    );
    
    INTCON_6: INTCON_D port map (
        X => pE_00,
        Y => pE_01
    );
    
    INTCON_7: INTCON_D port map (
        X => pG_00,
        Y => pG_01
    );
    
    INTCON_8: INTCON_D port map (
        X => pL_00,
        Y => pL_01
    );

    COMP1_1: COMP1_D port map (
        A => sA1,
        B => sB1,
        pE => pE_01,
        pG => pG_01,
        pL => pL_01,
        E => pE_10,
        G => pG_10,
        L => pL_10
    );
    
    INTCON_9: INTCON_D port map (
        X => pE_10,
        Y => pE_11
    );
        
    INTCON_10: INTCON_D port map (
        X => pG_10,
        Y => pG_11
    );
        
    INTCON_11: INTCON_D port map (
        X => pL_10,
        Y => pL_11
    );
    
    COMP1_2: COMP1_D port map (
        A => sA2,
        B => sB2,
        pE => pE_11,
        pG => pG_11,
        pL => pL_11,
        E => pE_20,
        G => pG_20,
        L => pL_20
    );
  
    INTCON_12: INTCON_D 
    generic map (
        DELAY => 7 ns
    )
    port map (
        X => pE_20,
        Y => led_o(2)
    );
            
    INTCON_13: INTCON_D 
    generic map (
        DELAY => 7 ns
    )
    port map (
        X => pG_20,
        Y => led_o(1)
    );
            
    INTCON_14: INTCON_D 
    generic map (
        DELAY => 7 ns
    )
    port map (
        X => pL_20,
        Y => led_o(0)
    );
end Structural;