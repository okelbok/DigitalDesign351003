library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMP1_D is
    port (
        A, B        : in    std_logic;
        pE, pG, pL  : in    std_logic;                  -- p - previous
        E, G, L     : out   std_logic                   -- E - Equal (A = B), G - Greater (A = B), L - Less (A < B)
    );
end entity COMP1_D;

architecture Structural of COMP1_D is
    signal sA0, sA1, sB0, sB1           : std_logic;
    signal spE0, spG0, spG1, spL0, spL1 : std_logic;
    signal sCE, sCE0, sCE1, sCE2, sCE3  : std_logic;   -- CE - Current Equal
    signal snCE, snCE0, snCE1, snCE2    : std_logic;
    signal sAND_00, sAND_01             : std_logic;
    signal sAND_20, sAND_21             : std_logic;
    signal sAND_30, sAND_31             : std_logic;
    signal sAND_40, sAND_41             : std_logic;
    signal sAND_50, sAND_51             : std_logic;
    signal sOR_00, sOR_01               : std_logic;
    signal sNOR_00, sNOR_01             : std_logic;
    signal sE, sG, sL                   : std_logic;
    
    component INV_D is
        generic (
            IS_DELAYED  : boolean   := true;
            DELAY       : time      := 2 ns
        );
        port (
            X   : in    std_logic;
            Y   : out   std_logic
        );
    end component;
    
    component AND2_D is
        generic (
            IS_DELAYED  : boolean   := true;
            DELAY       : time      := 5 ns
        );
        port (
            X1, X2  : in    std_logic;
            Y       : out   std_logic
        );
    end component;
        
    component OR2_D is
        generic (
            IS_DELAYED  : boolean   := true;
            DELAY       : time      := 5 ns
        );
        port (
            X1, X2  : in    std_logic;
            Y       : out   std_logic
        );
    end component;
    
    component NOR2_D is
        generic (
            IS_DELAYED  : boolean   := true;
            DELAY       : time      := 7 ns
        );
        port (
            X1, X2  : in    std_logic;
            Y       : out   std_logic
        );
    end component;
    
    component XOR2_D is
        generic (
            IS_DELAYED  : boolean   := true;
            DELAY       : time      := 5 ns
        );
        port (
            X1, X2  : in    std_logic;
            Y       : out   std_logic
        );
    end component;
    
    component INTCON_D is
        generic (
            DELAY       : time  := 10 ns
        );
        port (
            X           : in    std_logic;
            Y           : out   std_logic
        );
    end component;
begin
    INTCON_0: INTCON_D port map (
        X => A,
        Y => sA0
    );
    
    INTCON_1: INTCON_D
    generic map (
        DELAY => 11 ns
    )
    port map (
        X => B,
        Y => sB0
    );
    
    INTCON_2: INTCON_D
    generic map (
        DELAY => 15 ns
    )
    port map (
        X => A,
        Y => sA1
    );
    
    INTCON_3: INTCON_D
    generic map (
        DELAY => 16 ns
    )
    port map (
        X => B,
        Y => sB1
    );
    
    INTCON_4: INTCON_D
    generic map (
        DELAY => 15 ns
    )
    port map (
        X => pE,
        Y => spE0
    );
    
    INTCON_5: INTCON_D port map (
        X => pG,
        Y => spG0
    );
    
    INTCON_6: INTCON_D 
    generic map (
        DELAY => 15 ns
    )    
    port map (
        X => pG,
        Y => spG1
    );
    
    INTCON_7: INTCON_D port map (
        X => pL,
        Y => spL0
    );
        
    INTCON_8: INTCON_D 
    generic map (
        DELAY => 15 ns
    )    
    port map (
        X => pL,
        Y => spL1
    );
    
    XOR2_0: XOR2_D port map (
        X1 => sA0,
        X2 => sB0,
        Y => snCE
    );
    
    INTCON_9: INTCON_D
    generic map (
        DELAY => 5 ns
    )
    port map (
        X => snCE,
        Y => snCE0
    );
    
    INTCON_10: INTCON_D port map (
        X => snCE,
        Y => snCE1
    );
    
    INTCON_11: INTCON_D port map (
        X => snCE,
        Y => snCE2
    );
    
    INV_0: INV_D port map (
        X => snCE0,
        Y => sCE
    );
    
    INTCON_12: INTCON_D port map (
        X => sCE,
        Y => sCE0
    );
    
    INTCON_13: INTCON_D 
    generic map (
        DELAY => 15 ns
    )    
    port map (
        X => sCE,
        Y => sCE1
    );
   
    INTCON_14: INTCON_D 
    generic map (
        DELAY => 20 ns
    )    
    port map (
        X => sCE,
        Y => sCE2
    );
        
    INTCON_15: INTCON_D 
    generic map (
        DELAY => 30 ns
    )    
    port map (
        X => sCE,
        Y => sCE3
    );
    
    NOR2_0: NOR2_D port map (
        X1 => spG0,
        X2 => spL0,
        Y => sNOR_00
    );
    
    INTCON_16: INTCON_D
    generic map (
        DELAY => 20 ns
    )
    port map (
        X => sNOR_00,
        Y => sNOR_01
    );
    
    AND2_0: AND2_D port map (
        X1 => spE0,
        X2 => sCE0,
        Y => sAND_00
    );
    
    INTCON_17: INTCON_D
    generic map (
        DELAY => 15 ns
    )
    port map (
        X => sAND_00,
        Y => sAND_01
    );
    
    OR2_0: OR2_D port map (
        X1 => sAND_01,
        X2 => sNOR_01,
        Y => sOR_00
    );
    
    INTCON_18: INTCON_D port map (
        X => sOR_00,
        Y => sOR_01
    );
    
    AND2_1: AND2_D port map (
        X1 => sOR_01,
        X2 => sCE3,
        Y => sE
    );
    
    INTCON_19: INTCON_D port map (
        X => sE,
        Y => E
    );
    
    AND2_2: AND2_D port map (
        X1 => sA1,
        X2 => snCE1,
        Y => sAND_20
    );
    
    INTCON_20: INTCON_D port map (
        X => sAND_20,
        Y => sAND_21
    );
    
    AND2_3: AND2_D port map (
        X1 => sCE1,
        X2 => spG1,
        Y => sAND_30
    );
    
    INTCON_21: INTCON_D port map (
        X => sAND_30,
        Y => sAND_31
    );
    
    OR2_1: OR2_D port map (
        X1 => sAND_21,
        X2 => sAND_31,
        Y => sG
    );
    
    INTCON_22: INTCON_D port map (
        X => sG,
        Y => G
    );
        
    AND2_4: AND2_D port map (
        X1 => sB1,
        X2 => snCE2,
        Y => sAND_40
    );
        
    INTCON_23: INTCON_D port map (
        X => sAND_40,
        Y => sAND_41
    );
    
    AND2_5: AND2_D port map (
        X1 => sCE2,
        X2 => spL1,
        Y => sAND_50
    );
        
    INTCON_24: INTCON_D port map (
        X => sAND_50,
        Y => sAND_51
    );
        
    OR2_2: OR2_D port map (
        X1 => sAND_41,
        X2 => sAND_51,
        Y => sL
    );
    
    INTCON_25: INTCON_D port map (
        X => sL,
        Y => L
    );
end Structural;   