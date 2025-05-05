library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mod8counter is
  Port (
    clk2 : in std_logic;
    WhichDisplay : out std_logic_vector(2 downto 0)
  );
end mod8counter;

architecture Behavioral of mod8counter is
  signal temp : std_logic_vector(2 downto 0) := "000";
begin
  process(clk2)
  begin
    if rising_edge(clk2) then
      if temp = "111" then
        temp <= "000";
      else
        temp <= std_logic_vector(unsigned(temp) + 1);
      end if;
    end if;
  end process;
  WhichDisplay <= temp;
end Behavioral;