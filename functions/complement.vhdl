library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compliment is
    Port ( x : in STD_LOGIC_VECTOR ( 3 downto 0);
           y: out STD_LOGIC_VECTOR ( 3 downto 0)
    );
end compliment;

architecture Behavioral of compliment is

begin

    y <= not x;

end Behavioral;