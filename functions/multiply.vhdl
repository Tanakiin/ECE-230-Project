library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiply is
    port (
        x: in  STD_LOGIC_VECTOR (3 downto 0);
        y: in  STD_LOGIC_VECTOR (3 downto 0);
        p: inout STD_LOGIC_VECTOR (7 downto 0);
        mult: out STD_LOGIC_VECTOR (3 downto 0);
        flag: out STD_LOGIC);
end entity multiply;

architecture Structure of multiply is
    component fulladder
        port (
            x: in  STD_LOGIC_VECTOR (3 downto 0);
            y: in  STD_LOGIC_VECTOR (3 downto 0);
            Cin: in  std_logic;
            Sum: out STD_LOGIC_VECTOR (3 downto 0);
            Cout: out std_logic);
    end component;

    signal X0, X1, X2:  STD_LOGIC_VECTOR (3 downto 0);
    signal Y0, Y1, Y2:  STD_LOGIC_VECTOR (3 downto 0);

begin
    X0 <= (x(3) and y(1), x(2) and y(1), x(1) and y(1), x(0) and y(1));
    X1 <= (x(3) and y(2), x(2) and y(2), x(1) and y(2), x(0) and y(2));
    X2 <= (x(3) and y(3), x(2) and y(3), x(1) and y(3), x(0) and y(3));
    Y0 <= ('0', x(3) and y(0), x(2) and y(0), x(1) and y(0));

cell_1:
    fulladder port map (x => X0, y => Y0, cin => '0', cout => Y1(3), Sum(3) => Y1(2), Sum(2) => Y1(1), Sum(1) => Y1(0), Sum(0) => p(1));
cell_2:
    fulladder port map (x => X1, y => Y1, cin => '0', cout => Y2(3), Sum(3) => Y2(2), Sum(2) => Y2(1), Sum(1) => Y2(0), Sum(0) => p(2));
cell_3:
    fulladder port map (x => X2, y => Y2, cin => '0', cout => p(7), Sum => p(6 downto 3));
    p(0) <= x(0) and y(0);
    mult <= p(3 downto 0);
    flag <= p(7) or p(6) or p(5) or p(4);

end Structure;