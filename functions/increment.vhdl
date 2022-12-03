library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity increment is
    Port ( x : in STD_LOGIC_VECTOR ( 3 downto 0);
           y: out STD_LOGIC_VECTOR ( 3 downto 0)
    );
end increment;

architecture Behavioral of increment is

component fulladder
    Port(
        x : in STD_LOGIC_VECTOR (3 downto 0);
        y : in STD_LOGIC_VECTOR (3 downto 0);
        cin : in STD_LOGIC;
        sum : out STD_LOGIC_VECTOR (3 downto 0);
        cout : out std_logic
        );
end component;

begin

    Stage0 : fulladder port map (x=> x(0), y=>"0001", cin => '0', sum => y, cout => flag);

end Behavioral;