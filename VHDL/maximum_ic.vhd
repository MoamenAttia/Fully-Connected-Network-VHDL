library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maximum_ic is
    port (
        clk            : in    std_logic;
        rst            : in    std_logic;
        start_comp     : inout std_logic;
        done_comp      : inout std_logic;
        label1_out     : in    std_logic_vector(15 downto 0);
        label2_out     : in    std_logic_vector(15 downto 0);
        label3_out     : in    std_logic_vector(15 downto 0);
        label4_out     : in    std_logic_vector(15 downto 0);
        label5_out     : in    std_logic_vector(15 downto 0);
        label6_out     : in    std_logic_vector(15 downto 0);
        label7_out     : in    std_logic_vector(15 downto 0);
        label8_out     : in    std_logic_vector(15 downto 0);
        label9_out     : in    std_logic_vector(15 downto 0);
        label10_out    : in    std_logic_vector(15 downto 0);
        answer         : out std_logic_vector(15 downto 0)
    );
end entity maximum_ic;

architecture a_maximum_ic of maximum_ic is
  
  type state_type is ( idle , state_1 , state_2 , state_3 , state_4 );
  signal state : state_type; 
  signal next_state : state_type;
  
  -- First Comparator
  signal comparator_first_inp1     : std_logic_vector(15 downto 0);
  signal comparator_first_inp2	   : std_logic_vector(15 downto 0);
  signal comparator_first_output   : std_logic_vector(15 downto 0);

  -- Second Comparator
  signal comparator_second_inp1    : std_logic_vector(15 downto 0);
  signal comparator_second_inp2	   : std_logic_vector(15 downto 0);
  signal comparator_second_output  : std_logic_vector(15 downto 0);
  
  -- Third Comparator
  signal comparator_third_inp1     : std_logic_vector(15 downto 0);
  signal comparator_third_inp2	   : std_logic_vector(15 downto 0);
  signal comparator_third_output   : std_logic_vector(15 downto 0);
  
  -- Forth Comparator
  signal comparator_fourth_inp1    : std_logic_vector(15 downto 0);
  signal comparator_fourth_inp2	   : std_logic_vector(15 downto 0);
  signal comparator_fourth_output  : std_logic_vector(15 downto 0);
  
  -- Fifth Comparator
  signal comparator_fifth_inp1     : std_logic_vector(15 downto 0);
  signal comparator_fifth_inp2	   : std_logic_vector(15 downto 0);
  signal comparator_fifth_output   : std_logic_vector(15 downto 0);
  
  -- registers signals
  --------------------
  -- enable
  signal enable_ans1 : std_logic;
  signal enable_ans2 : std_logic;
  signal enable_ans3 : std_logic;
  signal enable_ans4 : std_logic;
  signal enable_ans5 : std_logic;
  signal enable_ans6 : std_logic;
  signal enable_ans7 : std_logic;
  signal enable_ans8 : std_logic;
  signal enable_answer_reg : std_logic;
  
  -- data_in
  signal ans1_in : std_logic_vector(15 downto 0);
  signal ans2_in : std_logic_vector(15 downto 0);
  signal ans3_in : std_logic_vector(15 downto 0);
  signal ans4_in : std_logic_vector(15 downto 0);
  signal ans5_in : std_logic_vector(15 downto 0);
  signal ans6_in : std_logic_vector(15 downto 0);
  signal ans7_in : std_logic_vector(15 downto 0);
  signal ans8_in : std_logic_vector(15 downto 0); 
  signal answer_reg_in : std_logic_vector(15 downto 0); 
  
  -- data_out
  signal ans1_out : std_logic_vector(15 downto 0);
  signal ans2_out : std_logic_vector(15 downto 0);
  signal ans3_out : std_logic_vector(15 downto 0);
  signal ans4_out : std_logic_vector(15 downto 0);
  signal ans5_out : std_logic_vector(15 downto 0);
  signal ans6_out : std_logic_vector(15 downto 0);
  signal ans7_out : std_logic_vector(15 downto 0);
  signal ans8_out : std_logic_vector(15 downto 0); 



  begin
    process(clk)
    begin
      if(clk'event and clk='1') then
        state <= next_state;
      end if;
    end process;

    process (state,start_comp)
    begin
      case( state ) is
        when idle =>
          if(start_comp = '1' and not(done_comp = '1')) then
            next_state <= state_1;
          else
            next_state <= idle;
          end if;
        when state_1 =>
          next_state <= state_2;
        when state_2 =>
          next_state <= state_3;
        when state_3 =>
          next_state <= state_4;
        when state_4 =>
          next_state <= idle;
      end case ;
    end process;


    -- combinational logic
    ----------------------
    -- First Step
    
    ans1_in <= comparator_first_output  when state = state_1 else "0000000000000000";
    ans2_in <= comparator_second_output when state = state_1 else "0000000000000000";
    ans3_in <= comparator_third_output  when state = state_1 else "0000000000000000";
    ans4_in <= comparator_fourth_output when state = state_1 else "0000000000000000";
    ans5_in <= comparator_fifth_output  when state = state_1 else "0000000000000000";
    
    enable_ans1 <= '1' when state = state_1 else '0';
    enable_ans2 <= '1' when state = state_1 else '0';
    enable_ans3 <= '1' when state = state_1 else '0';
    enable_ans4 <= '1' when state = state_1 else '0';
    enable_ans5 <= '1' when state = state_1 else '0';

    -- Second Step
    ans6_in <= comparator_first_output when state = state_2 else "0000000000000000";
    ans7_in <= comparator_second_output when state = state_2 else "0000000000000000";
    
    enable_ans6 <= '1' when state = state_2 else '0';
    enable_ans7 <= '1' when state = state_2 else '0';

    -- third
    ans8_in <= comparator_first_output when state = state_3 else "0000000000000000";
    enable_ans8 <= '1' when state = state_3 else '0';

    -- fourth
    answer_reg_in <= comparator_first_output when state = state_4 else "0000000000000000";
    enable_answer_reg <= '1' when state = state_4 else '0';

       
    -- done
    done_comp <= '1' when state = state_4;

    -- to_do
    comparator_first_inp1 <= label1_out when state = state_1 else 
                             ans1_out   when state = state_2 else 
                             ans6_out   when state = state_3 else
                             ans8_out   when state = state_4 else
                             "0000000000000000";

    comparator_first_inp2 <= label2_out when state = state_1 else 
                             ans2_out   when state = state_2 else
                             ans7_out   when state = state_3 else
                             ans5_out   when state = state_4 else
                             "0000000000000000";

    comparator_second_inp1 <= label3_out when state = state_1 else 
                              ans3_out   when state = state_2 else 
                              "0000000000000000";
    
    comparator_second_inp2 <= label4_out when state = state_1 else
                              ans4_out   when state = state_2 else 
                              "0000000000000000";

    comparator_third_inp1 <= label5_out when state = state_1 else "0000000000000000";
    comparator_third_inp2 <= label6_out when state = state_1 else "0000000000000000";

    comparator_fourth_inp1 <= label7_out when state = state_1 else "0000000000000000";
    comparator_fourth_inp2 <= label8_out when state = state_1 else "0000000000000000";

    comparator_fifth_inp1 <= label9_out when state = state_1 else "0000000000000000";
    comparator_fifth_inp2 <= label10_out when state = state_1 else "0000000000000000";
 

    -- ans1 => ans8 will be registers
    ans1 : entity work.register_edge_falling generic map ( 16 ) port map ( clk , rst , enable_ans1 , ans1_in , ans1_out );
    ans2 : entity work.register_edge_falling generic map ( 16 ) port map ( clk , rst , enable_ans2 , ans2_in , ans2_out );
    ans3 : entity work.register_edge_falling generic map ( 16 ) port map ( clk , rst , enable_ans3 , ans3_in , ans3_out );
    ans4 : entity work.register_edge_falling generic map ( 16 ) port map ( clk , rst , enable_ans4 , ans4_in , ans4_out );
    ans5 : entity work.register_edge_falling generic map ( 16 ) port map ( clk , rst , enable_ans5 , ans5_in , ans5_out );
    ans6 : entity work.register_edge_falling generic map ( 16 ) port map ( clk , rst , enable_ans6 , ans6_in , ans6_out );
    ans7 : entity work.register_edge_falling generic map ( 16 ) port map ( clk , rst , enable_ans7 , ans7_in , ans7_out );
    ans8 : entity work.register_edge_falling generic map ( 16 ) port map ( clk , rst , enable_ans8 , ans8_in , ans8_out );
    answer_reg : entity work.register_edge_falling generic map ( 16 ) port map ( clk , rst , enable_answer_reg , answer_reg_in , answer );

    comparator_1: 
    entity work.comparator
    port map ( 
      comparator_inp_1  => comparator_first_inp1,
      comparator_inp_2  => comparator_first_inp2,
      comparator_output => comparator_first_output
    );

    comparator_2: 
    entity work.comparator
    port map ( 
      comparator_inp_1  => comparator_second_inp1,
      comparator_inp_2  => comparator_second_inp2,
      comparator_output => comparator_second_output
    );

    comparator_3: 
    entity work.comparator
    port map ( 
      comparator_inp_1  => comparator_third_inp1,
      comparator_inp_2  => comparator_third_inp2,
      comparator_output => comparator_third_output
    );

    comparator_4: 
    entity work.comparator
    port map ( 
      comparator_inp_1  => comparator_fourth_inp1,
      comparator_inp_2  => comparator_fourth_inp2,
      comparator_output => comparator_fourth_output
    );

    comparator_5: 
    entity work.comparator
    port map ( 
      comparator_inp_1  => comparator_fifth_inp1,
      comparator_inp_2  => comparator_fifth_inp2,
      comparator_output => comparator_fifth_output
    );

end architecture;
