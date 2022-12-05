library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bitwise_and is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Result : inout STD_LOGIC_VECTOR (3 downto 0);
           Flag : out STD_LOGIC);
end bitwise_and;

architecture Behavioral of bitwise_and is

begin
PROCESS(Result)
  BEGIN
  IF Result="0000" THEN
  Flag <= '0';
  ELSE
  Flag <= '1';
  END IF;
  END PROCESS;
    
Result(0)<= ( A(0) AND B(0) );
Result(1)<= ( A(1) AND B(1) );
Result(2)<= ( A(2) AND B(2) );
Result(3)<= ( A(3) AND B(3) );

end Behavioral;
