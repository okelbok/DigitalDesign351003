library ieee;
use ieee.std_logic_1164.all;

entity f_e8d5 is
    port (
        sw0 : in std_logic;
        sw1 : in std_logic;
        sw2 : in std_logic;
        sw3 : in std_logic;
        led0 : out std_logic
    );
end f_e8d5;

architecture structural of f_e8d5 is

    component INV is
        port (
            A : in std_logic;
            Y : out std_logic
        );
    end component;
    
    component AND2 is
        port (
            A : in std_logic;
            B : in std_logic;
            Y : out std_logic
        );
    end component;
    
    component AND3 is
        port (
            A : in std_logic;
            B : in std_logic;
            C : in std_logic;
            Y : out std_logic
        );
    end component;
    
    component OR4 is
        port (
            A : in std_logic;
            B : in std_logic;
            C : in std_logic;
            D : in std_logic;
            Y : out std_logic
        );
    end component;

    signal nx1, nx4 : std_logic;
    signal a1, a2, a3, a4 : std_logic;

begin

    U0: INV port map (
        A => sw0,
        Y => nx1
    );
    
    U1: INV port map (
        A => sw3,
        Y => nx4
    );
    
    U2: AND2 port map (
        A => sw1,
        B => sw2,
        Y => a1
    );
    
    U3: AND2 port map (
        A => nx1,
        B => nx4,
        Y => a2
    );
    
    U4: AND3 port map (
        A => sw0,
        B => sw2,
        C => sw3,
        Y => a3
    );
    
    U5: AND3 port map (
        A => sw0,
        B => sw1,
        C => sw3,
        Y => a4
    );
    
    U6: OR4 port map (
        A => a1,
        B => a2,
        C => a3,
        D => a4,
        Y => led0
    );

end structural;