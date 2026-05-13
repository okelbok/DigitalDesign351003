library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INV_D is
    generic (
        IS_DELAYED  : boolean   := true;
        DELAY       : time      := 2 ns
    );
    port (
        X           : in    std_logic;
        Y           : out   std_logic
    );
end INV_D;

architecture Behavioral of INV_D is
begin
    IF_INV_D: 
    if IS_DELAYED generate
        Y <= inertial not X after DELAY;
    end generate IF_INV_D;
    
    IF_INV_ND:
    if not IS_DELAYED generate
        Y <= not X;
    end generate IF_INV_ND;
end Behavioral;