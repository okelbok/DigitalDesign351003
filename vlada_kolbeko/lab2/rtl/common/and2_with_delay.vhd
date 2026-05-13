library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND2_D is
    generic (
        IS_DELAYED  : boolean   := true;
        DELAY       : time      := 5 ns
    );
    port (
        X1, X2      : in    std_logic;
        Y           : out   std_logic
    );
end AND2_D;

architecture Behavioral of AND2_D is
begin
    IF_AND2_D: 
    if IS_DELAYED generate
        Y <= inertial X1 and X2 after DELAY;
    end generate IF_AND2_D;
    
    IF_AND2_ND:
    if not IS_DELAYED generate
        Y <= X1 and X2;
    end generate IF_AND2_ND;
end Behavioral;