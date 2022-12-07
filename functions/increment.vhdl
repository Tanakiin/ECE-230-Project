library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity increment is
    Port ( x : in STD_LOGIC_VECTOR ( 3 downto 0);
           result: out STD_LOGIC_VECTOR ( 3 downto 0);
           flag : out STD_LOGIC;
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

    Stage0 : fulladder port map (x=> x, y=>"0001", cin => '0', sum => result, cout => flag);

end Behavioral;