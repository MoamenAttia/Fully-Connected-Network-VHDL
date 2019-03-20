library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
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
  
  type state_type is ( idle , state_1 , state_2 , state_3 , state_4 , state_5, state_6 , state_7 , state_8 , state_9 , state_10 );
  signal state : state_type := idle; 

  signal alu_inp1  : std_logic_vector(15 downto 0) := (others => '0'); -- a
  signal alu_inp2	 : std_logic_vector(15 downto 0) := (others => '0'); -- b
  signal alu_out   : std_logic_vector(15 downto 0) := (others => '0'); -- add or sub
  signal alu_sel   : std_logic := '0';
  signal alu_cin   : std_logic := '0';
  signal alu_cout  : std_logic := '0';

  begin
    process(clk)
    begin
      if(rising_edge(clk)) then
        if (start_comp = '0' and not(state = idle)) then
          case state is
            when state_1 =>
              alu_inp1 <= answer;
              alu_inp2 <= label1_out;
              alu_sel <= '1';
            when state_2 =>
              alu_inp1 <= answer;
              alu_inp2 <= label2_out;
              alu_sel <= '1';
            when state_3 =>  
              alu_inp1 <= answer;
              alu_inp2 <= label3_out;
              alu_sel <= '1';
            when state_4 =>
              alu_inp1 <= answer;
              alu_inp2 <= label4_out;
              alu_sel <= '1';   
            when state_5 =>
              alu_inp1 <= answer;
              alu_inp2 <= label5_out;
              alu_sel <= '1';
            when state_6 =>
              alu_inp1 <= answer;
              alu_inp2 <= label6_out;
              alu_sel <= '1';
            when state_7 =>
              alu_inp1 <= answer;
              alu_inp2 <= label7_out;
              alu_sel <= '1';
            when state_8 =>
              alu_inp1 <= answer;
              alu_inp2 <= label8_out;
              alu_sel <= '1';
            when state_9 =>
              alu_inp1 <= answer;
              alu_inp2 <= label9_out;
              alu_sel <= '1';
            when state_10 =>
              alu_inp1 <= answer;
              alu_inp2 <= label10_out;
              alu_sel <= '1';
            when others =>
                state <= idle;
          end case;
        end if;
      elsif falling_edge(clk) then
        if start_comp = '1' then
          start_comp <= '0'; state <= state_1;
          done_comp <= '0';
          answer <= (others => '0');
        elsif (start_comp = '0' and not(state = idle)) then
          case state is
            when state_1 =>
              if(alu_out(15) = '1') then
                answer <= label1_out;
              end if;
              state <= state_2;
            when state_2 =>
              if(alu_out(15) = '1') then
                answer <= label2_out;
              end if;
              state <= state_3;
            when state_3 =>  
              if(alu_out(15) = '1') then
                answer <= label3_out;
              end if;
              state <= state_4;       
            when state_4 =>
              if(alu_out(15) = '1') then
                answer <= label4_out;
              end if;
              state <= state_5;   
            when state_5 =>
              if(alu_out(15) = '1') then
                answer <= label5_out;
              end if;
              state <= state_6;
            when state_6 =>
              if(alu_out(15) = '1') then
                answer <= label6_out;
              end if;
              state <= state_7;
            when state_7 =>
              if(alu_out(15) = '1') then
                answer <= label7_out;
              end if;
              state <= state_8;
            when state_8 =>
              if(alu_out(15) = '1') then
                answer <= label8_out;
              end if;
              state <= state_9;
            when state_9 =>
              if(alu_out(15) = '1') then
                answer <= label9_out;
              end if;
              state <= state_10;
            when state_10 =>
              if(alu_out(15) = '1') then
                answer <= label10_out;
              end if;
              state <= idle;
              done_comp <= '1';
            when others =>
                state <= idle;
          end case;
        end if;   
      end if ;
    end process;
    alu_subtractor_adder : entity work.alu generic map ( 16 ) port map ( alu_inp1 , alu_inp2 , alu_sel , alu_cin , alu_out , alu_cout );
end a_maximum_ic;