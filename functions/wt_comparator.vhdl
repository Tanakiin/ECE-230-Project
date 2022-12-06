library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity wt_comp_1 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Flag : inout STD_LOGIC;
           Result : inout STD_LOGIC_VECTOR (3 downto 0));
end wt_comp_1;

architecture Behavioral of wt_comp_1 is

begin

PROCESS (Flag)
BEGIN
IF Flag = '1' THEN
Result <= "1111"; --If A<B, Result is 1111
ELSE
Result <= "0000"; --If A>= B, Result is 0000
END IF;
END PROCESS;

Flag<=((NOT A(3)) AND B(3)) OR ((NOT A(2)) AND B(2)) OR ((NOT A(1)) AND B(1)) OR ((NOT A(0)) AND B(0));
--Flag will be 1 if A<B, 0 otherwise


end Behavioral;
