library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

entity clock_counter is
  Port (clk1: in std_logic;
  reset: in std_logic;
  houradder: in std_logic_vector (1 downto 0);
  minuteadder: in std_logic_vector (1 downto 0);
  am_pm: out std_logic;
  digit1,digit2,digit3,digit4,digit5,digit6: inout std_logic_vector   (3 downto 0)
  );
end clock_counter;

architecture Behavioral of clock_counter is

signal am_pm_reg: std_logic := '0';
signal am_pm_next: std_logic := '0';

signal seconds: INTEGER:=0;

type int_to_bin is array (0 to 9) of std_logic_vector   (3 downto 0);
constant int_bin : int_to_bin :=
("0000","0001","0010","0011","0100","0101","0110","0111","1000","1001");

begin

process (clk1, reset, minuteadder, houradder, seconds)
begin
if (reset='1' OR seconds=86400) then
seconds<=0;
elsif rising_edge(clk1) then
 seconds<=seconds+1;
IF minuteadder(0) ='1' then
 seconds<=seconds+60;
 elsif minuteadder(1) ='1' then
 seconds<=seconds+600;
 elsif houradder(0) ='1' THEN
 seconds<=seconds+3600;
 elsif houradder(1)='1' then
 seconds<=seconds+36000;
 end if;
 end if;
end process;
 digit1<=int_bin (((seconds mod 3600) mod 60) mod 10);
 digit2<=int_bin (((seconds mod 3600) mod 60 ) /10);
 digit3<=int_bin (((seconds mod 3600) /60) mod 10);
 digit4<=int_bin (((seconds mod 3600) /60) /10);
 digit5<=int_bin ((seconds /3600) mod 10);
 digit6<=int_bin ((seconds /3600) /10); 
 
 process(clk1, reset)
 begin
    if reset = '1' then 
        am_pm_reg <= '0';
    elsif (rising_edge(clk1)) then 
        if (digit6 = "0001") and (digit5 = "0010") and (digit4 = "0000") and (digit3 = "0000") and (digit2 = "0000") and (digit1 = "0000") then 
            am_pm_reg <= not am_pm_reg;
        elsif (digit6 = "0000") and (digit5 = "0000") and (digit4 = "0000") and (digit3 = "0000") and (digit2 = "0000") and (digit1 = "0000") then
            am_pm_reg <= '0'; 
        end if;
     end if;
 end process;
 
 am_pm <= am_pm_reg;
 
end Behavioral;
