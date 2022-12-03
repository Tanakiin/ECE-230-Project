library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fulladder is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           cin : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           cout : out STD_LOGIC
          );
end fulladder;

architecture Behavioral of fulladder is

component adder
port(
     x : in STD_LOGIC;
     y : in STD_LOGIC;
     cin : in STD_LOGIC;
     sum : out STD_LOGIC;
     cout : out std_logic
);
end component;

signal c0,c1,c2 : std_logic;

begin

Stage0: adder port map (x => x(0), y=> y(0), cin => cin, sum => sum(0), cout=> c0);
Stage1: adder port map (x => x(1), y=> y(1), cin => c0, sum => sum(1), cout=> c1);
Stage2: adder port map (x => x(2), y=> y(2), cin => c1, sum => sum(2), cout=> c2);
Stage3: adder port map (x => x(3), y=> y(3), cin => c2, sum => sum(3), cout=> cout);

end Behavioral;
