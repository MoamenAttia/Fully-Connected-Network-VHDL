library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity maximum_ic is
    port (
        clk            : in    std_logic; 
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
        answer         : inout std_logic_vector(15 downto 0)
    );
end entity maximum_ic;

architecture a_maximum_ic of maximum_ic is
  
  type state_type is ( idle , state_1 , state_2 , state_3 , state_4 , state_5 , state_6 , state_7 , state_8 );
  signal state : state_type := idle; 

  
  -- First Comparator
  signal comparator_first_inp1     : std_logic_vector(15 downto 0) := (others => '0');
  signal comparator_first_inp2	   : std_logic_vector(15 downto 0) := (others => '0');
  signal comparator_first_output   : std_logic_vector(15 downto 0) := (others => '0');

  -- Second Comparator
  signal comparator_second_inp1    : std_logic_vector(15 downto 0) := (others => '0');
  signal comparator_second_inp2	   : std_logic_vector(15 downto 0) := (others => '0');
  signal comparator_second_output  : std_logic_vector(15 downto 0) := (others => '0');
  
  -- Third Comparator
  signal comparator_third_inp1     : std_logic_vector(15 downto 0) := (others => '0');
  signal comparator_third_inp2	   : std_logic_vector(15 downto 0) := (others => '0');
  signal comparator_third_output   : std_logic_vector(15 downto 0) := (others => '0');
  
  -- Forth Comparator
  signal comparator_fourth_inp1    : std_logic_vector(15 downto 0) := (others => '0');
  signal comparator_fourth_inp2	   : std_logic_vector(15 downto 0) := (others => '0');
  signal comparator_fourth_output  : std_logic_vector(15 downto 0) := (others => '0');
  
  -- Fifth Comparator
  signal comparator_fifth_inp1     : std_logic_vector(15 downto 0) := (others => '0');
  signal comparator_fifth_inp2	   : std_logic_vector(15 downto 0) := (others => '0');
  signal comparator_fifth_output   : std_logic_vector(15 downto 0) := (others => '0');
  

  -- answers signals
  signal ans1 : std_logic_vector(15 downto 0) := (others => '0');
  signal ans2 : std_logic_vector(15 downto 0) := (others => '0');
  signal ans3 : std_logic_vector(15 downto 0) := (others => '0');
  signal ans4 : std_logic_vector(15 downto 0) := (others => '0');
  signal ans5 : std_logic_vector(15 downto 0) := (others => '0');
  signal ans6 : std_logic_vector(15 downto 0) := (others => '0');
  signal ans7 : std_logic_vector(15 downto 0) := (others => '0');
  signal ans8 : std_logic_vector(15 downto 0) := (others => '0');
  
  begin
    process(clk)
    begin
      if(clk'event and clk='1') then
        if start_comp = '1' then
          start_comp <= '0';
          done_comp <= '0';
          answer <= (others => '0');
          state <= state_1;
        elsif (start_comp = '0') then
          case state is
            when state_1 =>
              -- First Comparator Ports
              comparator_first_inp1 <= label1_out;
              comparator_first_inp2 <= label2_out;

              -- Second Comparator Ports
              comparator_second_inp1 <= label3_out;
              comparator_second_inp2 <= label4_out;

              -- Third Comparator Ports
              comparator_third_inp1 <= label5_out;
              comparator_third_inp2 <= label6_out;

              -- Forth Comparator Ports
              comparator_fourth_inp1 <= label7_out;
              comparator_fourth_inp2 <= label8_out;

              -- Fifth Comparator Ports
              comparator_fifth_inp1 <= label9_out;
              comparator_fifth_inp2 <= label10_out;
              
              -- state = next_state
              state <= state_2;

            when state_2 =>
              ans1 <= comparator_first_output;
              ans2 <= comparator_second_output;
              ans3 <= comparator_third_output;
              ans4 <= comparator_fourth_output;
              ans5 <= comparator_fifth_output;
              state <= state_3;

            when state_3 =>
              -- First Comparator Ports
              comparator_first_inp1 <= ans1;
              comparator_first_inp2 <= ans2;

              -- Second Comparator Ports
              comparator_second_inp1 <= ans3;
              comparator_second_inp2 <= ans4;

              -- Third Comparator Ports
              comparator_third_inp1 <= (others => '0');
              comparator_third_inp2 <= (others => '0');

              -- Forth Comparator Ports
              comparator_fourth_inp1 <= (others => '0');
              comparator_fourth_inp2 <= (others => '0');

              -- Fifth Comparator Ports
              comparator_fifth_inp1 <= label9_out;
              comparator_fifth_inp2 <= label10_out;

              -- state = next_state
              state <= state_4;
            
            when state_4 =>
              
              ans6 <= comparator_first_output;
              ans7 <= comparator_second_output;
              ans3 <= (others => '0');
              ans4 <= (others => '0');
              ans5 <= comparator_fifth_output;
              state <= state_5;
            
            when state_5 =>
              -- First Comparator Ports
              comparator_first_inp1 <= ans6;
              comparator_first_inp2 <= ans7;

              -- Second Comparator Ports
              comparator_second_inp1 <= (others => '0');
              comparator_second_inp2 <= (others => '0');

              -- Third Comparator Ports
              comparator_third_inp1 <= (others => '0');
              comparator_third_inp2 <= (others => '0');

              -- Forth Comparator Ports
              comparator_fourth_inp1 <= (others => '0');
              comparator_fourth_inp2 <= (others => '0');

              -- Fifth Comparator Ports
              comparator_fifth_inp1 <= label9_out;
              comparator_fifth_inp2 <= label10_out;

              -- state = next_state
              state <= state_6;
            
            when state_6 =>
              ans8 <= comparator_first_output;
              ans5 <= comparator_fifth_output;
              state <= state_7;

            when state_7 =>
               -- First Comparator Ports
               comparator_first_inp1 <= ans5;
               comparator_first_inp2 <= ans8;
 
               -- Second Comparator Ports
               comparator_second_inp1 <= (others => '0');
               comparator_second_inp2 <= (others => '0');
 
               -- Third Comparator Ports
               comparator_third_inp1 <= (others => '0');
               comparator_third_inp2 <= (others => '0');
 
               -- Forth Comparator Ports
               comparator_fourth_inp1 <= (others => '0');
               comparator_fourth_inp2 <= (others => '0');
 
               -- Fifth Comparator Ports
               comparator_fifth_inp1 <= (others => '0');
               comparator_fifth_inp2 <= (others => '0');
               
               -- state = next_state
               state <= state_8;
               
            when state_8 =>
              answer <= comparator_first_output;
              done_comp <= '1';
              state <= idle;
            when others =>
              state <= idle;
            end case;
        end if;
      end if;      
    end process;

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
