----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.04.2026 00:44:49
-- Design Name: 
-- Module Name: RegFile2R1W - Behavioral
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

entity RegFile2R1W is
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
end RegFile2R1W;

architecture Behavioral of RegFile2R1W is
    constant REG_COUNT : natural := 2 ** ADDR_WIDTH;
    
    type reg_array is array(REG_COUNT - 1 downto 0) of std_logic_vector(DATA_WIDTH - 1 downto 0);
    
    signal registers : reg_array;
begin
    process(CLK)
        variable w_index : natural;
    begin
        w_index := to_integer(unsigned(W_ADDR));
        if CLR = '1' then
            for i in registers'range loop
                registers(i) <= (others => '0');
            end loop;
        elsif rising_edge(CLK) and W_EN = '1' then
            registers(w_index) <= W_DATA;
        end if;
    end process;
    
    process(R_ADDR0, R_ADDR1, registers, W_ADDR, W_DATA, W_EN)
    begin
        if (W_ADDR = R_ADDR0) and (W_EN = '1') then
            R_DATA0 <= W_DATA;
        else
            R_DATA0 <= registers(to_integer(unsigned(R_ADDR0)));
        end if;
        
        if (W_ADDR = R_ADDR1) and (W_EN = '1') then
            R_DATA1 <= W_DATA;
        else
            R_DATA1 <= registers(to_integer(unsigned(R_ADDR1)));
        end if;
    end process;
end Behavioral;
