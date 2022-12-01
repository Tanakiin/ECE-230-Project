library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity twoscompliment is
    Port ( x : in STD_LOGIC_VECTOR ( 3 downto 0);
           result: out STD_LOGIC_VECTOR ( 3 downto 0);
           flag : out STD_LOGIC;
    );
end twoscompliment;

architecture Behavioral of twoscompliment is

signal c1,c2,c3: std_logic;
signal n : STD_LOGIC_VECTOR( 3 downto 0) := '0001';

component adder
    Port(
        x: in std_logic;
        y: in std_logic;
        cin: in std_logic;
        sum: out std_logic;
        cout: out std_logic
        );
end component;

begin

    Stage0: adder port map(x => x(0), y => n(0), cin => '0', sum=>result(0), cout=>c1);
    Stage1: adder port map(x => x(1), y => n(1), cin => c1, sum=>result(1), cout=>c2);
    Stage2: adder port map(x => x(2), y => n(2) , cin => c2, sum=>result(2), cout=>c3);
    Stage3: adder port map(x => x(3), y => n(3), cin => c3, sum=>result(3), cout=>flag);



end Behavioral;
