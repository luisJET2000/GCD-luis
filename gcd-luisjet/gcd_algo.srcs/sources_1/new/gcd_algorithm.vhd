-----------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.STD_logic_unsigned.all; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity gcd_algorithm is
 Port (clk: in STD_LOGIC;
        clr: in STD_LOGIC; 
        go : in STD_LOGIC;
        xin : in STD_LOGIC_VECTOR(3 downto 0);
        yin : in STD_LOGIC_VECTOR(3 downto 0);
        done : out STD_LOGIC;
        gcd : out STD_LOGIC_VECTOR(3 downto 0));
end gcd_algorithm;

architecture Behavioral of gcd_algorithm is
    signal x,y: STD_LOGIC_VECTOR(3 downto 0);
begin
gcd_algoritmo:process(clk,clr)
    variable calc,donev: std_logic; 
  begin 
    if(clr='1')then
        x<=(others=>'0');
        y<=(others=>'0');            
        gcd <= (others =>'0');
        donev:='0';        
        calc:='0';         
    elsif (rising_edge(clk))then 
        donev :='0';
        if(go='1')then
            x <=xin;
            y <=yin;
            calc:='1';
        elsif(calc='1')then 
        if(x=y)then
                gcd <= x;
                donev:='1';
                calc :='0';
        elsif(x < y)then
                y <= y-x;
        else
                x <=x-y;
         end if; 
      end if;
end if;                                             
done <= donev; 
end process gcd_algoritmo;


end Behavioral;
