library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity XOR2_D is
    generic (
        IS_DELAYED  : boolean   := true;
        DELAY       : time      := 5 ns
    );
    port (
        X1, X2      : in    std_logic;
        Y           : out   std_logic
    );
end XOR2_D;

architecture Behavioral of XOR2_D is
begin
    IF_XOR2_D: 
    if IS_DELAYED generate
        Y <= inertial X1 xor X2 after DELAY;
    end generate IF_XOR2_D;
    
    IF_XOR2_ND:
    if not IS_DELAYED generate
        Y <= X1 xor X2;
    end generate IF_XOR2_ND;
end Behavioral;