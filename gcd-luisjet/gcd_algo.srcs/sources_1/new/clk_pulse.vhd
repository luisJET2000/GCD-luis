----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.10.2023 15:40:23
-- Design Name: 
-- Module Name: clk_pulse - Behavioral
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

entity clk_pulse is
Port (  inp,cclk,clr: in std_logic;
        outp: out std_logic            
 );
end clk_pulse;

architecture Behavioral of clk_pulse is
        signal delay1, delay2, delay3: std_logic;
begin
    process(cclk, clr)
    begin 
                if clr= '1' then
                        delay1 <= '0';
                        delay2 <= '0';
                        delay3 <= '0';
                elsif rising_edge(cclk)then
                        delay1 <= inp;
                        delay2 <= delay1;
                        delay3 <= delay2;
                end if; 
     end process; 
outp <= delay1 and delay2 and (not delay3);
end Behavioral;
