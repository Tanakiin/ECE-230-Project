library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compare is
    Port ( x : in STD_LOGIC_VECTOR (3 downto 0);
           y : in STD_LOGIC_VECTOR (3 downto 0);
           result : out STD_LOGIC_VECTOR (3 downto 0);
           flag : out STD_LOGIC);
end compare;

architecture Behavioral of compare is

begin
process(x,y)
begin
if (x >= y) then
result <= "1111";
flag <= '1';
else
result <= "0000";
flag <= '0';

end if;
end process;
end Behavioral;
