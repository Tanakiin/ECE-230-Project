
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twoscompliment is
    Port ( xin : in STD_LOGIC_VECTOR (3 downto 0);
           result : out STD_LOGIC_VECTOR (3 downto 0);
           flag : out STD_LOGIC
          );
end twoscompliment;

architecture Behavioral of twoscompliment is

signal c0 : STD_LOGIC_VECTOR (3 downto 0);
signal c1,c2,c3: std_logic;
signal n : STD_LOGIC_VECTOR( 3 downto 0) := "0001";

component fulladder
    Port(
        x : in STD_LOGIC_VECTOR (3 downto 0);
        y : in STD_LOGIC_VECTOR (3 downto 0);
        cin : in STD_LOGIC;
        sum : out STD_LOGIC_VECTOR (3 downto 0);
        cout : out std_logic
        );
end component;

component compliment is
    Port ( x : in STD_LOGIC_VECTOR ( 3 downto 0);
           y: out STD_LOGIC_VECTOR ( 3 downto 0)
    );
end component;

begin

    Stage0: compliment port map(x=> xin, y=> c0);
    Stage1: fulladder port map (x=> c0, y=>n, cin => '0', sum => result, cout => flag);

end behavioral;

