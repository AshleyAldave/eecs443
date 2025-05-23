library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.ALL;

entity counter is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  houradder	: in std_logic_vector (1 downto 0);
			  minuteadder: in std_logic_vector (1 downto 0) ;
           anode : out std_logic_vector(7 downto 0);
			  segments : out std_logic_vector (7 downto 0)
           );
end counter;

architecture counter of counter is

component clk_1hz 
port(clk: in std_logic ;
clk1: out std_logic 
);
end component;

component clk_1khz
port (clk: in std_logic ;
clk2: out std_logic 
);
end component;

component mod6counter
port (clk2: in std_logic;
WhichDisplay: out std_logic_vector (2 downto 0));
end component;

component clock_counter
port(clk1: in std_logic ;
reset: in std_logic ;
houradder: in std_logic_vector (1 downto 0);
minuteadder: in std_logic_vector (1 downto 0);
 am_pm: out std_logic;
 digit1,digit2,digit3,digit4,digit5,digit6: inout std_logic_vector   (3 downto 0));
end component;

component anode_picker
port (WhichDisplay: in std_logic_vector (2 downto 0);
anode: out std_logic_vector (7 downto 0));
end component;

component decoder
port ( WhichDisplay: in std_logic_vector (2 downto 0);
digit1,digit2,digit3,digit4,digit5,digit6, digit7 : in std_logic_vector   (3 downto 0);
am_pm: in std_logic;
segments: out std_logic_vector (7 downto 0));
end component;

signal 	clk1 : std_logic :='0';
signal clk2: std_logic :='0';
signal 	am_pm : std_logic;
signal WhichDisplay: std_logic_vector (2 downto 0);
signal digit1,digit2,digit3,digit4,digit5,digit6, digit7:  std_logic_vector   (3 downto 0);

begin

comp1:clk_1hz PORT MAP(
clk => clk,
clk1 => clk1
);

comp2: clk_1khz PORT MAP(
clk => clk, 
clk2 => clk2
);

comp3: mod6counter  PORT MAP(
clk2 => clk2, 
WhichDisplay => WhichDisplay 
);

comp4: clock_counter PORT MAP(
clk1 => clk1,
reset => reset,
houradder => houradder,
minuteadder => minuteadder,
digit1 => digit1, 
digit2 => digit2,
digit3 => digit3,
digit4 => digit4,
digit5 => digit5,
digit6 => digit6,
am_pm => am_pm
--WhichDisplay => WhichDisplay,
--segments => segments     
--clk1, reset, houradder, minuteadder, digit1,digit2,digit3,digit4,digit5,digit6, am_pm
);

comp5: anode_picker PORT MAP(
WhichDisplay => WhichDisplay, 
anode => anode
);

comp6: decoder PORT MAP(
digit1 => digit1, 
digit2 => digit2,
digit3 => digit3,
digit4 => digit4,
digit5 => digit5,
digit6 => digit6,
digit7 => digit7,
am_pm => am_pm,
WhichDisplay => WhichDisplay,
segments => segments     
--WhichDisplay ,digit1,digit2,digit3,digit4,digit5,digit6,segments
);

end counter;
