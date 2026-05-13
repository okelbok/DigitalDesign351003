library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMP1 is
    port (
        A, B        : in    std_logic;
        pE, pG, pL  : in    std_logic;          -- p - previous
        E, G, L     : out   std_logic           -- E - Equal (A = B), G - Greater (A = B), L - Less (A < B)
    );
end entity COMP1;

architecture Structural of COMP1 is
    signal nCE, CE          :   std_logic;      -- CE - Current Equal
    signal E_0, E_1, E_2    :   std_logic;
    signal G_0, G_1         :   std_logic;
    signal L_0, L_1         :   std_logic;
    
    component INV is
        port (
            X   : in    std_logic;
            Y   : out   std_logic
        );
    end component;
    
    component AND2 is
        port (
            X1, X2  : in    std_logic;
            Y       : out   std_logic
        );
    end component;
    
    component OR2 is
        port (
            X1, X2  : in    std_logic;
            Y       : out   std_logic
        );
    end component;
    
    component NOR2 is
        port (
            X1, X2  : in    std_logic;
            Y       : out   std_logic
        );
    end component;
    
    component XOR2 is
        port (
            X1, X2  : in    std_logic;
            Y       : out   std_logic
        );
    end component;
begin
    XOR2_0: XOR2 port map (
        X1 => A,
        X2 => B,
        Y => nCE
    );
    
    INV_0: INV port map (
        X => nCE,
        Y => CE
    );
    
    NOR2_0: NOR2 port map (
        X1 => pG,
        X2 => pL,
        Y => E_0
    );
    
    AND2_0: AND2 port map (
        X1 => pE,
        X2 => CE,
        Y => E_1
    );
    
    OR2_0: OR2 port map (
        X1 => E_0,
        X2 => E_1,
        Y => E_2
    );
    
    AND2_1: AND2 port map (
        X1 => E_2,
        X2 => CE,
        Y => E
    );
    
    AND2_2: AND2 port map (
        X1 => nCE,
        X2 => A,
        Y => G_0
    );
    
    AND2_3: AND2 port map (
        X1 => CE,
        X2 => pG,
        Y => G_1
    );
    
    OR2_1: OR2 port map (
        X1 => G_0,
        X2 => G_1,
        Y => G
    );
    
    AND2_4: AND2 port map (
        X1 => nCE,
        X2 => B,
        Y => L_0
    );
        
    AND2_5: AND2 port map (
        X1 => CE,
        X2 => pL,
        Y => L_1
    );
        
    OR2_2: OR2 port map (
        X1 => L_0,
        X2 => L_1,
        Y => L
    );
end Structural;   