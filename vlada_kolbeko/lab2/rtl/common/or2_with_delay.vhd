library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OR2_D is
    generic (
        IS_DELAYED  : boolean   := true;
        DELAY       : time      := 5 ns
    );
    port (
        X1, X2      : in    std_logic;
        Y           : out   std_logic
    );
end OR2_D;

architecture Behavioral of OR2_D is
begin
    IF_OR2_D: 
    if IS_DELAYED generate
        Y <= inertial X1 or X2 after DELAY;
    end generate IF_OR2_D;
    
    IF_OR2_ND:
    if not IS_DELAYED generate
        Y <= X1 or X2;
    end generate IF_OR2_ND;
end Behavioral;