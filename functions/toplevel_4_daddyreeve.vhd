library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.NUMERIC_STD.ALL;
--library UNISIM;
--use UNISIM.VComponents.all;

entity toplevel is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           SEL : in STD_LOGIC_VECTOR(3 downto 0);
           RESET : in STD_LOGIC;
           LOAD : in STD_LOGIC;
           CLK : in STD_LOGIC;
           FLAG : out STD_LOGIC;
           RESULT : out STD_LOGIC_VECTOR (3 downto 0));
end toplevel;

architecture Structure of toplevel is


    component complement 
    port(
        x: in std_logic_vector(3 downto 0);
        y: out std_logic_vector(3 downto 0)
    );
    end component;
    
begin
ALU: process(CLK, RESET)
begin
if rising_edge(clk) then
        case SEL is
--            when "0000" =>
            when "0001" => 
                stage1: complement port map( x => A, y => RESULT);
            when others =>
          end case;

end if;

end process;


end Structure;
