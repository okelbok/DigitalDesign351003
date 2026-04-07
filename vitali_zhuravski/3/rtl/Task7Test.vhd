----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2026 02:13:09
-- Design Name: 
-- Module Name: Task7Test - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Task7Test is
--  Port ( );
end Task7Test;

architecture Behavioral of Task7Test is
    constant ADDR_WIDTH : natural := 5;
    constant DATA_WIDTH : natural := 16;
    constant TOTAL_REGS : natural := 2 ** ADDR_WIDTH;

    component RegFile2R1W is
        generic(
            ADDR_WIDTH : natural := 5;
            DATA_WIDTH : natural := 16
        );
        port(
            CLK     : in  std_logic;
            CLR     : in  std_logic;
            W_EN    : in  std_logic;
            W_ADDR  : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
            W_DATA  : in  std_logic_vector(DATA_WIDTH - 1 downto 0);
            R_ADDR0 : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
            R_DATA0 : out std_logic_vector(DATA_WIDTH - 1 downto 0);
            R_ADDR1 : in  std_logic_vector(ADDR_WIDTH - 1 downto 0);
            R_DATA1 : out std_logic_vector(DATA_WIDTH - 1 downto 0)
        );
    end component;
    
    signal CLK     : std_logic := '0';
    signal CLR     : std_logic;
    signal W_EN    : std_logic;
    signal W_ADDR  : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    signal W_DATA  : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal R_ADDR0 : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    signal R_DATA0 : std_logic_vector(DATA_WIDTH - 1 downto 0);
    signal R_ADDR1 : std_logic_vector(ADDR_WIDTH - 1 downto 0);
    signal R_DATA1 : std_logic_vector(DATA_WIDTH - 1 downto 0);
begin
    U0 : RegFile2R1W
    generic map(ADDR_WIDTH => ADDR_WIDTH, DATA_WIDTH => DATA_WIDTH)
    port map(CLK => CLK, CLR => CLR, W_EN => W_EN, W_ADDR => W_ADDR,
             W_DATA => W_DATA, R_ADDR0 => R_ADDR0, R_DATA0 => R_DATA0,
             R_ADDR1 => R_ADDR1, R_DATA1 => R_DATA1);
             
    CLK <= transport not CLK after 5 ns;
    
    process
        variable succeeded_tests : natural;
        variable test_count : natural;
        variable counter : natural;
        variable is_different : boolean;
        variable actual : natural;
    begin
        succeeded_tests := 0;
        test_count := 0;
        
        CLR <= '0';
        W_EN <= '0';
        W_ADDR <= (others => '0');
        W_DATA <= (others => '0');
        R_ADDR0 <= (others => '0');
        R_ADDR1 <= (others => '0');
        wait for 10 ns;
        
        report "Read & write test.";
        counter := 1;
        W_EN <= '1';
        for i in 0 to TOTAL_REGS - 1 loop
            W_ADDR <= std_logic_vector(to_unsigned(i, ADDR_WIDTH));
            W_DATA <= std_logic_vector(to_unsigned(counter, DATA_WIDTH));
            wait for 10 ns;
            counter := counter + 23;
        end loop;
        test_count := test_count + 2;
        report "Reading from slot 0.";
        counter := 1;
        W_EN <= '0';
        is_different := false;
        for i in 0 to TOTAL_REGS - 1 loop
            R_ADDR0 <= std_logic_vector(to_unsigned(i, ADDR_WIDTH));
            wait for 10 ns;
            actual := to_integer(unsigned(R_DATA0));
            if actual /= counter then
                is_different := true;
                report "False value in register " & integer'image(i) & ". Expected=" & natural'image(counter) & ", actual=" & natural'image(actual) & ".";
            end if;
            counter := counter + 23;
        end loop;
        if not is_different then
            succeeded_tests := succeeded_tests + 1;
        end if;
        report "Reading from slot 1.";
        counter := 1;
        W_EN <= '0';
        is_different := false;
        for i in 0 to TOTAL_REGS - 1 loop
            R_ADDR1 <= std_logic_vector(to_unsigned(i, ADDR_WIDTH));
            wait for 10 ns;
            actual := to_integer(unsigned(R_DATA1));
            if actual /= counter then
                is_different := true;
                report "False value in register " & integer'image(i) & ". Expected=" & natural'image(counter) & ", actual=" & natural'image(actual) & ".";
            end if;
            counter := counter + 23;
        end loop;
        if not is_different then
            succeeded_tests := succeeded_tests + 1;
        end if;
        
        report "Forwarding test.";
        W_EN <= '1';
        W_ADDR <= std_logic_vector(to_unsigned(7, ADDR_WIDTH));
        R_ADDR0 <= std_logic_vector(to_unsigned(7, ADDR_WIDTH));
        R_ADDR1 <= std_logic_vector(to_unsigned(7, ADDR_WIDTH));
        W_DATA <= (others => '0');
        wait for 3 ns;
        test_count := test_count + 2;
        if W_DATA = R_DATA0 then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Forwarding in slot 0 does not work properly.";
        end if;
        if W_DATA = R_DATA1 then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Forwarding in slot 1 does not work properly.";
        end if;
        wait for 7 ns;
        W_EN <= '0';
        wait for 10 ns;
        
        report "2R1W test.";
        W_EN <= '1';
        W_DATA <= (others => '0');
        W_ADDR <= std_logic_vector(to_unsigned(0, ADDR_WIDTH));
        wait for 10 ns;
        W_ADDR <= std_logic_vector(to_unsigned(1, ADDR_WIDTH));
        wait for 10 ns;
        W_ADDR <= std_logic_vector(to_unsigned(2, ADDR_WIDTH));
        R_ADDR0 <= std_logic_vector(to_unsigned(0, ADDR_WIDTH));
        R_ADDR1 <= std_logic_vector(to_unsigned(1, ADDR_WIDTH));
        wait for 10 ns;
        test_count := test_count + 3;
        if W_DATA = R_DATA0 then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Simulatenous reading does not work properly in slot 0.";
        end if;
        if W_DATA = R_DATA1 then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Simulatenous reading does not work properly in slot 1.";
        end if;
        W_EN <= '0';
        R_ADDR0 <= std_logic_vector(to_unsigned(2, ADDR_WIDTH));
        wait for 10 ns;
        if W_DATA = R_DATA0 then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Simulatenous writing does not work properly.";
        end if;
        
        report "W_EN='0' test.";
        W_DATA <= (others => '0');
        W_ADDR <= std_logic_vector(to_unsigned(3, ADDR_WIDTH));
        wait for 10 ns;
        R_ADDR0 <= std_logic_vector(to_unsigned(3, ADDR_WIDTH));
        wait for 10 ns;
        test_count := test_count + 1;
        if W_DATA /= R_DATA0 then
            succeeded_tests := succeeded_tests + 1;
        else
            report "Writing should not work when W_EN='0'.";
        end if;
        
        report "Reset test.";
        CLR <= '1';
        wait for 10 ns;
        test_count := test_count + 1;
        for i in 0 to TOTAL_REGS - 1 loop
            R_ADDR0 <= std_logic_vector(to_unsigned(i, ADDR_WIDTH));
            wait for 10 ns;
            actual := to_integer(unsigned(R_DATA0));
            if actual /= 0 then
                is_different := true;
                report "False value in register " & integer'image(i) & ". Expected=0, actual=" & natural'image(actual) & ".";
            end if;
        end loop;
        if not is_different then
            succeeded_tests := succeeded_tests + 1;
        end if;
        
        report natural'image(succeeded_tests) & " tests of " & natural'image(test_count) & " succeeded.";
        wait;
    end process;
end Behavioral;
