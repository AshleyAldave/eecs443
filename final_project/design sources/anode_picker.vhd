library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity anode_picker is
  Port (WhichDisplay: in std_logic_vector (2 downto 0);
  anode: out std_logic_vector (7 downto 0) );
end anode_picker;

architecture Behavioral of anode_picker is
		 
signal temp : std_logic_vector (7 downto 0);		 
		 
begin
process(WhichDisplay)
begin
case (WhichDisplay) is
when "000" =>
temp <="01111111";
when "001" =>
temp <= "10111111";
when "010" =>
temp <= "11011111";
when "011" =>
temp <= "11101111";
when "100" =>
temp <= "11110111";
when "101" =>
temp <= "11111011";
when "110" =>
temp <= "11111101";
when "111" =>
temp <= "11111110";
when others => temp <= "11111111";
end case;
end process;

anode<=temp;

end Behavioral;