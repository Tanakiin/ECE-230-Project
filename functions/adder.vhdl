library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity adder is
     Port ( x : in STD_LOGIC;
           y : in STD_LOGIC;
           cin : in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
end adder;

architecture Behavioral of adder is

begin

    sum <= (cin nor x) nor y  ;
    cout <= (cin and x) or (x and y) or (cin and y);

end Behavioral;
