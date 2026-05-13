library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity NOR2_D is
    generic (
        IS_DELAYED  : boolean   := true;
        DELAY       : time      := 7 ns
    );
    port (
        X1, X2      : in    std_logic;
        Y           : out   std_logic
    );
end NOR2_D;

architecture Behavioral of NOR2_D is
begin
    IF_NOR2_D: 
    if IS_DELAYED generate
        Y <= inertial X1 nor X2 after DELAY;
    end generate IF_NOR2_D;
    
    IF_NOR2_ND:
    if not IS_DELAYED generate
        Y <= X1 nor X2;
    end generate IF_NOR2_ND;
end Behavioral;