library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;

entity decoder is
  Port (  digit1,digit2,digit3,digit4,digit5,digit6, digit7 : in std_logic_vector   (3 downto 0);
  am_pm : in std_logic;
  WhichDisplay : in std_logic_vector (2 downto 0);
  segments: out std_logic_vector (7 downto 0)
 );
end decoder;

architecture Behavioral of decoder is
type display is array (0 to 11) of std_logic_vector (7 downto 0);
constant converter : display :=
		("11000000","11111001","10100100","10110000","10011001","10010010","10000010","11111000",
		 "10000000","10010000", "10001000", "10001100");
		 
signal temp : std_logic_vector (7 downto 0);

begin
process(WhichDisplay)
begin
case (WhichDisplay) is
when "000" =>
temp <= converter(to_integer(unsigned(digit1)));
when "001" =>
temp <= converter(to_integer(unsigned(digit2)));
when "010" =>
temp <= converter(to_integer(unsigned(digit3)));
when "011" =>
temp <= converter(to_integer(unsigned(digit4)));
when "100" =>
temp <= converter(to_integer(unsigned(digit5)));
when "101" =>
temp <= converter(to_integer(unsigned(digit6)));
when "111" =>
temp <= converter(to_integer(unsigned(digit7)));


when "110" =>
if am_pm = '0' then 
    temp <= converter(10);
else 
    temp <= converter(11);
end if;


when others => temp <= "11111111"; 
end case;

end process;

segments<=temp;

end Behavioral;
