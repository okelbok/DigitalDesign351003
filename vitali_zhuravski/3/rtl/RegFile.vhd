----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.04.2026 01:09:50
-- Design Name: 
-- Module Name: RegFile - Behavioral
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
use IEEE.MATH_REAL.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegFile is
    generic(
        N : natural := 6;
        M : natural := 4
    );
    port(
        CLK     : in  std_logic;
        
        RST     : in  std_logic;
        WE      : in  std_logic;
        WD      : in  std_logic_vector(N-1 downto 0);
        WAddr   : in  std_logic_vector(integer(ceil(log2(real(M))))-1 downto 0);
        
        RD      : out std_logic_vector(N-1 downto 0);
        RAddr   : in  std_logic_vector(integer(ceil(log2(real(M))))-1 downto 0)
    );
end RegFile;

architecture Behavioral of RegFile is

    component RegUnit is
        generic(
            N : natural := N
        );
        port(
            CLK    : in  std_logic;
            RST    : in  std_logic;
            EN     : in  std_logic;
            Din    : in  std_logic_vector(N-1 downto 0);
            Dout   : out std_logic_vector(N-1 downto 0)
        );
    end component;
    
    signal en_bits : std_logic_vector(M-1 downto 0);
    
    type reg_out_array is array (0 to M-1) of std_logic_vector(N-1 downto 0);
    signal reg_outs : reg_out_array;
begin
    
    P0 : process(WAddr, WE)
        variable cur_w : integer;
    begin
        cur_w := to_integer(unsigned(WAddr));
        en_bits <= (others => '0');
        en_bits(cur_w) <= WE;
    end process;

    U0 : for i in 0 to M-1 generate
        Ui : RegUnit port map(CLK => CLK, RST => RST, EN => en_bits(i), Din => WD, Dout => reg_outs(i));
    end generate;
    
    RD <= reg_outs(to_integer(unsigned(RAddr)));

end Behavioral;
