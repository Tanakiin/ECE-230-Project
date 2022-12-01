library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity addition is
    Port ( x : in STD_LOGIC_VECTOR ( 3 downto 0);
           y: in STD_LOGIC_VECTOR ( 3 downto 0);
           cin: in STD_LOGIC_VECTOR;
           sum: out STD_LOGIC_VECTOR (3 downto 0);
           cout: out STD_LOGIC_VECTOR
    );
end addition;

architecture Structure of addition is

component myfulladder
    Port (
        x : in STD_LOGIC;
        y : in STD_LOGIC;
        cin : in STD_LOGIC;
        sum : out STD_LOGIC;
        cout : out STD_LOGIC);
end component;
signal c1, c2, c3: STD_LOGIC;


begin

Stage0: myfulladder port map(x=>x(0), y=>y(0), cin=>cin, sum=>sum(0), cout=>c1);
Stage1: myfulladder port map(x=>x(1), y=>y(1), cin=>c1, sum=>sum(1), cout=>c2);
Stage2: myfulladder port map(x=>x(2), y=>y(2), cin=>c2, sum=>sum(2), cout=>c3);
Stage3: myfulladder port map(x=>x(3), y=>y(3), cin=>c3, sum=>sum(3), cout=>cout);



end Structure;
