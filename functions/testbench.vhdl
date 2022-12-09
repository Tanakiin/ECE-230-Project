library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toplevel_tb is
    Port ( );
end toplevel_tb;


architecture behavioral of toplevel_tb is

    component toplevel 
    port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        SEL : in STD_LOGIC_VECTOR(3 downto 0);
        RESET : in STD_LOGIC;
        LOAD : in STD_LOGIC;
        CLK : in STD_LOGIC;
        FLAG : out STD_LOGIC;
        RESULT : out STD_LOGIC_VECTOR (3 downto 0)
    );
    end component;

    signal A,B, SEL, RESULT : STD_LOGIC_VECTOR (3 downto 0);
    signal RESET,LOAD,CLK, FLAG : STD_LOGIC;
    constant time_period : time := 40 ns;

begin

UUT : toplevel port map (
    A => A,
    B => B,
    SEL => SEL,
    RESET => RESET,
    LOAD => LOAD,
    CLK => CLK,
    FLAG =>  FLAG,
    RESULT => RESULT
);

clk_process : process
begin

    CLK <= '0';
    wait for time_period/2;
    CLK <= '1';
    wait for time_period/2;

end process


tb : process
begin

    A <= "0001";
    B <= "0001";
    SEL <= "0111";
    RESET <= '0';
    LOAD <= '1';

    wait;

end process

end behavioral;
