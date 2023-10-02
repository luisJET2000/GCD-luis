----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2023 12:41:40
-- Design Name: 
-- Module Name: top_gcd - Behavioral
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

entity top_gcd is
  Port ( CLK : in STD_logic;
         btn3 : in std_logic; 
         btn0 : in std_logic;
         Adata: in std_logic_vector(3 downto 0);
         Bdata: in std_logic_vector(3 downto 0);
         a_to_g: out std_logic_vector(6 downto 0);
         an: out std_logic_vector(3 downto 0);
         done_led:out  std_logic
         );
end top_gcd;

architecture Behavioral of top_gcd is
signal clock_1hz, btn3_debounced, go_signal: std_logic;
signal gcd_out: std_logic_vector(3 downto 0);
begin
    U1: entity work.clk_divisor port map(
    clk => CLK,
    clk_1hz => clock_1hz
    );
    
    U2: entity work.debounce port map(
             inp => btn0,
             cclk => clock_1hz,
             clr => btn3, 
             outp =>btn3_debounced
    );
    
    U3: entity work.clk_pulse port map(
             inp => btn3_debounced,
             cclk => clock_1hz,
             clr=> btn3,
             outp =>go_signal
    ); 
    
    U4: entity work.gcd_algorithm port map(
            clk=> clock_1hz, 
            clr=> btn3, 
            go=> go_signal, 
            xin=> Adata,
            yin=> Bdata, 
            done=>done_led, 
            gcd=>gcd_out
    ); 
    U5: entity work.X7seg port map(
            xin =>gcd_out,
            cclk=>clock_1hz, 
            clr=>btn3, 
            a_to_g=> a_to_g, 
            an=> an
    );
        
end Behavioral;
