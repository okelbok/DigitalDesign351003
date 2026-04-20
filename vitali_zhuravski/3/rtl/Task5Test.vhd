----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06.04.2026 02:54:57
-- Design Name: 
-- Module Name: Task5Test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Task5Test is
--  Port ( );
end Task5Test;

architecture Behavioral of Task5Test is

    component UniversalShiftRegister is
        generic (
            N : natural := 8
        );
        port(
            CLK  : in std_logic;
            CLR  : in std_logic;
            EN   : in std_logic;
            MODE : in std_logic_vector(1 downto 0);
            LOAD : in std_logic;
            Din  : in std_logic_vector(N - 1 downto 0);
            Dout : out std_logic_vector(N - 1 downto 0)
        );
    end component;

    signal CLK  : std_logic := '0';
    signal CLR  : std_logic;
    signal EN   : std_logic;
    signal MODE : std_logic_vector(1 downto 0);
    signal LOAD : std_logic;
    signal Din  : std_logic_vector(3 downto 0);
    signal Dout : std_logic_vector(3 downto 0);
begin
    U0 : UniversalShiftRegister
    generic map(N => 4)
    port map(CLK => CLK, CLR => CLR, EN => EN, MODE => MODE, LOAD => LOAD, Din => Din, Dout => Dout);

    CLK <= transport not CLK after 5 ns;

    process
        variable test_count : natural;
        variable succeeded_tests : natural;
    begin
        test_count := 0;
        succeeded_tests := 0;
        EN <= '0';
        LOAD <= '0';
        MODE <= "00";
        wait for 10 ns;
        
        report "Resetting shift register.";
        CLR <= '1';
        wait for 10 ns;
        CLR <= '0';
        test_count := test_count + 1;
        if Dout = "0000" then
            succeeded_tests := succeeded_tests + 1;
        else
            report "The register did not reset properly.";
        end if;
        
        report "Parallel load test.";
        Din <= "1111";
        MODE <= "10";
        wait for 10 ns;
        test_count := test_count + 3;
        if Dout = "0000" then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Parallel load should not be allowed when EN = '0'.";
        end if;
        EN <= '1';
        wait for 10 ns;
        if Dout = "0000" then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Parallel load should not be allowed when LOAD = '0'.";
        end if;
        LOAD <= '1';
        wait for 10 ns;
        if Dout = "1111" then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Parallel load should be allowed when EN = '1' and LOAD = '1'.";
        end if;
        LOAD <= '0';
        EN <= '0';
        wait for 10 ns;
        
        report "Shl test";
        MODE <= "00";
        wait for 10 ns;
        test_count := test_count + 2;
        if Dout = "1111" then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Left shifting should not be allowed when EN = '0'.";
        end if;
        EN <= '1';
        wait for 10 ns;
        if Dout = "1110" then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Left shifting should be allowed when EN = '1'.";
        end if;
        EN <= '0';
        wait for 10 ns;
        
        report "Shr test";
        MODE <= "01";
        wait for 10 ns;
        test_count := test_count + 2;
        if Dout = "1110" then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Right shifting should not be allowed when EN = '0'.";
        end if;
        EN <= '1';
        wait for 10 ns;
        if Dout = "0111" then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Right shifting should be allowed when EN = '1'.";
        end if;
        EN <= '0';
        wait for 10 ns;
        
        report natural'image(succeeded_tests) & " tests of " & natural'image(test_count) & " succeeded.";
        wait;
    end process;
end Behavioral;
