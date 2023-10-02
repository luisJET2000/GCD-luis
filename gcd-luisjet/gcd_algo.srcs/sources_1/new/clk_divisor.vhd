----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2023 15:54:58
-- Design Name: 
-- Module Name: clk_divisor - Behavioral
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
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_divisor is
Port ( clk: in std_logic;
       clk_1hz: out std_logic
);
end clk_divisor;

architecture Behavioral of clk_divisor is
signal count: std_logic_vector(25 downto 0);
signal slow_clk: std_logic;

begin
    count<= count+1 when rising_edge(clk);
    slow_clk <= count(25);
    clk_1Hz <= slow_clk;

end Behavioral;
