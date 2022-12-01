library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity increment is
    Port ( x : in STD_LOGIC_VECTOR ( 3 downto 0);
           y: out STD_LOGIC_VECTOR ( 3 downto 0)
    );
end increment;

architecture Behavioral of increment is

begin

    y <= x + 1;

end Behavioral;