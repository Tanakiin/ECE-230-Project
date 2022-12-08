library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

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

    component twoscomplement 
    port (
        x : in STD_LOGIC_VECTOR (3 downto 0);
        result : out STD_LOGIC_VECTOR (3 downto 0);
        flag : out STD_LOGIC
    ); 
    end component;


    component increment 
    port (
        x : in STD_LOGIC_VECTOR ( 3 downto 0);
        result: out STD_LOGIC_VECTOR ( 3 downto 0);
        flag : out STD_LOGIC
    ); 
    end component; 
    
    component fulladder 
    port (
        x : in STD_LOGIC_VECTOR (3 downto 0);
        y : in STD_LOGIC_VECTOR (3 downto 0);
        cin : in STD_LOGIC;
        sum : out STD_LOGIC_VECTOR (3 downto 0);
        cout : out STD_LOGIC
    ); 
    end component; 

    component multiply 
    port (
        x: in  STD_LOGIC_VECTOR (3 downto 0);
        y: in  STD_LOGIC_VECTOR (3 downto 0);
        p: out STD_LOGIC_VECTOR (7 downto 0);
        flag: out STD_LOGIC
        );
    end component; 

    component wt_comparator
    port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        flag : inout STD_LOGIC;
        result : inout STD_LOGIC_VECTOR (3 downto 0)
        );
    end component; 

    component comparator
    port (
        x : in STD_LOGIC_VECTOR (3 downto 0);
        y : in STD_LOGIC_VECTOR (3 downto 0);
        result : out STD_LOGIC_VECTOR (3 downto 0);
        flag : out STD_LOGIC
        );
    end component; 

    component bitwise_and
    port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        Result : inout STD_LOGIC_VECTOR (3 downto 0);
        Flag : out STD_LOGIC
        );
    end component; 

    component bitwise_or
    port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        Result : inout STD_LOGIC_VECTOR (3 downto 0);
        Flag : out STD_LOGIC
        );
    end component; 

    component bitwise_xor
    port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        Result : inout STD_LOGIC_VECTOR (3 downto 0);
        Flag : out STD_LOGIC
        );
    end component; 

    component bitwise_xnor
    port (
        A : in STD_LOGIC_VECTOR (3 downto 0);
        B : in STD_LOGIC_VECTOR (3 downto 0);
        Result : inout STD_LOGIC_VECTOR (3 downto 0);
        Flag : out STD_LOGIC
        );
    end component; 

    signal A_Comp, B_comp, A_TwoComp,wt_comp_result, B_TwoComp, A_Inc, B_Inc, add_result, sub_result, mul_result, com_result, b_and_result, b_or_result, b_xor_result, b_xnor_result : STD_LOGIC_VECTOR;
    signal A_TwoComp_Flag, B_TwoComp_Flag, A_Inc_Flag, B_Inc_Flag, add_flag, sub_flag, mul_flag, com_flag, b_and_flag, b_or_flag, b_xor_flag ,wt_flag, b_xnor_flag : STD_LOGIC;

    
begin

-- instantiations here.

--complementA
 comp1: complement port map( x=> A, y=> A_comp );

 --complementB
 comp2 : complement port map (x=>B, y=> B_comp);


 --two'comp A
 Tcomp1: twoscomplement port map ( x=> A, result => A_TwoComp, flag => A_TwoComp_Flag);

  --two'comp B
 Tcomp2: twoscomplement port map ( x=> B, result => B_TwoComp, flag => B_TwoComp_Flag);

 --increment A
 inc1: increment port map (x => A, result => A_Inc, flag=> A_Inc_Flag); 

  --increment B
 inc2: increment port map(x => B, result => B_Inc, flag=> B_Inc_Flag); 

 -- addition 
 add: fulladder port map(x => A,y => B, cin => '0', sum => add_result, cout => add_flag); 

  -- subtraction
 sub: fulladder port map(x => A,y => B_comp, cin => '0', sum => sub_result, cout => sub_flag); 

 -- multiplicaton
 mul : multiply  port map (x => A, y => B, p => mul_result, flag => mul_flag );

 -- wt_comparator
 wt_com : wt_comparator  port map (A => A, B => B, flag => wt_flag, result => wt_comp_result);

 -- comparator
 com : comparator port map (x => A, y => B, result => com_result, flag => com_flag);

 -- bitwise_and
 b_and: bitwise_and port map (A => A, B => B, Result => b_and_result,  Flag => b_and_flag);

  -- bitwise_or
 b_or: bitwise_or port map (A => A, B => B, Result => b_or_result,  Flag => b_or_flag);

   -- bitwise_xor
 b_xor: bitwise_xor port map (A => A, B => B, Result => b_xor_result,  Flag => b_xor_flag);

    -- bitwise_xnor
 b_xnor: bitwise_xnor port map (A => A, B => B, Result => b_xnor_result,  Flag => b_xnor_flag);



ALU: process(CLK, RESET) begin
    if reset = '1' then
        result<="0000";
        flag <= '0';
    end if;
    if rising_edge(clk) then
        if load = '1' then
            
            case SEL is
    --            when "0000" =>
                when "0001" => 
                    result<=a_comp;
                when "0010"=>
                    result
            end case;
        else
            result<="0000";
            flag <= '0';
            
        end if;
    end if;

end process;


end Structure;
