library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwise_or is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Result : out STD_LOGIC_VECTOR (3 downto 0);
           Flag : out STD_LOGIC);
end bitwise_or;

architecture Behavioral of bitwise_or is

begin
Result(0)<= ( A(0) OR B(0) );
Result(1)<= ( A(1) OR B(1) );
Result(2)<= ( A(2) OR B(2) );
Result(3)<= ( A(3) OR B(3) );

end Behavioral;