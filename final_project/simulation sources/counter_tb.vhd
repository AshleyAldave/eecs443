library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_tb is
end counter_tb;

architecture sim of counter_tb is

  -- Signals to connect to the UUT
  signal clk     : std_logic := '0';
  signal reset   : std_logic := '0';
  signal houradder   : std_logic_vector(1 downto 0) := "00";
  signal minuteadder : std_logic_vector(1 downto 0) := "00";
  signal anode   : std_logic_vector(7 downto 0);
  signal segments: std_logic_vector(7 downto 0);

  -- Clock period
  constant clk_period : time := 10 ns;

begin

  -- Clock generation
  clk_process : process
  begin
    clk <= '0';
    wait for clk_period / 2;
    clk <= '1';
    wait for clk_period / 2;
  end process;

  -- Instantiate your design
  uut: entity work.counter
    port map (
      clk => clk,
      reset => reset,
      houradder => houradder,
      minuteadder => minuteadder,
      anode => anode,
      segments => segments
    );

  -- Stimulus process
  stim_proc: process
  begin
    wait for 100 ns;
    reset <= '1';
    wait for 20 ns;
    reset <= '0';

    -- Simulate minute add
    wait for 1 us;
    minuteadder <= "01";
    wait for 20 ns;
    minuteadder <= "00";

    -- Simulate hour add
    wait for 1 us;
    houradder <= "10";
    wait for 20 ns;
    houradder <= "00";

    -- Let it run
    wait for 10 us;

    -- End simulation
    wait;
  end process;

end sim;
