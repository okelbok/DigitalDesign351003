----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.03.2026 15:30:00
-- Design Name: 
-- Module Name: RegUnit - Behavioral
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

entity RegUnit is
    generic(
        N : natural := 34
    );
    port(
        CLK    : in  std_logic;
        RST    : in  std_logic;
        EN     : in  std_logic;
        Din    : in  std_logic_vector(N-1 downto 0);
        Dout   : out std_logic_vector(N-1 downto 0)
    );
end RegUnit;

architecture Behavioral of RegUnit is

    component DomFDCE is
        port(
            CLK : in std_logic;
            D : in std_logic;
            CLR_N : in std_logic;
            Q : out std_logic
        );
    end component;
    
    signal async_reset : std_logic;
    signal out_buf : std_logic_vector(N-1 downto 0);
    signal in_buf : std_logic_vector(N-1 downto 0);
--    signal inner_clk : std_logic;
begin
    P0 : process(CLK, RST)
    begin
        if rising_edge(CLK) then
            async_reset <= not RST;
        end if;
    end process;
    
--    inner_clk <= CLK and EN and async_reset;

--    U0 : for i in 0 to N-1 generate
--        Ui : DomFDCE port map(CLK => inner_clk, D => Din(i), CLR_N => async_reset, Q => Dout(i));
--    end generate;

    in_buf <= Din when EN = '1' else out_buf;

    U0 : for i in 0 to N-1 generate
        Ui : DomFDCE port map(CLK => CLK, D => in_buf(i), CLR_N => async_reset, Q => out_buf(i));
    end generate;

    Dout <= out_buf;
end Behavioral;
