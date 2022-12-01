library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity multiply is 
    port (
        x: in  STD_LOGIC_VECTOR (3 downto 0);
        y: in  STD_LOGIC_VECTOR (3 downto 0);
        p: out STD_LOGIC_VECTOR (7 downto 0);
        flag: out STD_LOGIC);
end entity multiply;

architecture Structure of multiply is
    component adder
        port ( 
            A: in  STD_LOGIC_VECTOR (3 downto 0);
            B: in  STD_LOGIC_VECTOR (3 downto 0);
            Cin: in  std_logic;
            S: out STD_LOGIC_VECTOR (3 downto 0);
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
    adder port map (a => X0, b => Y0, cin => '0', cout => Y1(3), S(3) => Y1(2), S(2) => Y1(1), S(1) => Y1(0), S(0) => p(1));
cell_2: 
    adder port map (a => X1, b => Y1, cin => '0', cout => Y2(3), S(3) => Y2(2), S(2) => Y2(1), S(1) => Y2(0), S(0) => p(2));
cell_3: 
    adder port map (a => X2, b => Y2, cin => '0', cout => p(7), S => p(6 downto 3));
    p(0) <= x(0) and y(0); 

end Structure;