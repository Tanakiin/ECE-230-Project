library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twoscompliment is
    Port ( xin : in STD_LOGIC_VECTOR ( 3 downto 0);
           result: out STD_LOGIC_VECTOR ( 3 downto 0);
           flag : out STD_LOGIC;
    );
end twoscompliment;

architecture Behavioral of twoscompliment is

signal c0,c1,c2,c3: std_logic;
signal n : STD_LOGIC_VECTOR( 3 downto 0) := '0001';

component adder
    Port(
        xad: in std_logic;
        yad: in std_logic;
        cinad: in std_logic;
        sumad: out std_logic;
        coutad: out std_logic
        );
end component;

component compliment is
    Port ( xc : in STD_LOGIC_VECTOR ( 3 downto 0);
           yc: out STD_LOGIC_VECTOR ( 3 downto 0)
    );
end component;

begin

    Stage0: compliment port map(xc=> x, yc=> c0);
    Stage1: adder port map(xad => c0(0), yad => n(0), cinad => '0', sumad=>result(0), coutad=>c1);
    Stage2: adder port map(xad => c0(1), yad => n(1), cinad => c1, sumad=>result(1), coutad=>c2);
    Stage3: adder port map(xad => c0(2), yad => n(2) , cinad => c2, sumad=>result(2), coutad=>c3);
    Stage4: adder port map(xad => c0(3), yad => n(3), cinad => c3, sumad=>result(3), coutad=>flag);


end Behavioral;
