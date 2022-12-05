library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use UNISIM.VComponents.all;

entity bitwise_or is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Result : inout STD_LOGIC_VECTOR (3 downto 0);
           Flag : out STD_LOGIC);
end bitwise_or;

architecture Behavioral of bitwise_or is

begin
    
PROCESS(Result)
  BEGIN
  IF Result="0000" THEN
  Flag <= '0';
  ELSE
  Flag <= '1';
  END IF;
  END PROCESS;    
    
Result(0)<= ( A(0) XOR B(0) );
Result(1)<= ( A(1) XOR B(1) );
Result(2)<= ( A(2) XOR B(2) );
Result(3)<= ( A(3) XOR B(3) );

end Behavioral;
