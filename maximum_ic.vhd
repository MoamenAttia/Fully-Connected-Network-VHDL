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
  begin
    process(clk)
    begin
      if(rising_edge(clk)) then
        if start_comp = '1' then
          start_comp <= '0'; state <= state_1;
          done_comp <= '0';
          answer <= (others => '0');
        elsif (start_comp = '0' and not(state = idle)) then
          case state is
            when state_1 =>
              if to_integer(signed(answer)) < to_integer(signed(label1_out)) then
                answer <= label1_out;
              end if ;
              state <= state_2;
            when state_2 =>
              if to_integer(signed(answer)) < to_integer(signed(label2_out)) then
                answer <= label2_out;
              end if ;
              state <= state_3;
            when state_3 =>  
              if to_integer(signed(answer)) < to_integer(signed(label3_out)) then
                answer <= label3_out;
              end if ;
              state <= state_4;
            when state_4 =>
              if to_integer(signed(answer)) < to_integer(signed(label4_out)) then
                answer <= label4_out;
              end if ;
              state <= state_5;
            when state_5 =>
              if to_integer(signed(answer)) < to_integer(signed(label5_out)) then
                answer <= label5_out;
              end if ;
              state <= state_6;
            when state_6 =>
              if to_integer(signed(answer)) < to_integer(signed(label6_out)) then
                answer <= label6_out;
              end if ;
              state <= state_7;
            when state_7 =>
              if to_integer(signed(answer)) < to_integer(signed(label7_out)) then
                answer <= label7_out;
              end if ;
              state <= state_8;
            when state_8 =>
              if to_integer(signed(answer)) < to_integer(signed(label8_out)) then
                answer <= label8_out;
              end if ;
              state <= state_9;
            when state_9 =>
              if to_integer(signed(answer)) < to_integer(signed(label9_out)) then
                answer <= label9_out;
              end if ;
              state <= state_10;
            when state_10 =>
              if to_integer(signed(answer)) < to_integer(signed(label10_out)) then
                answer <= label10_out;
              end if ;
              state <= idle;
              done_comp <= '1';
            when others =>
                state <= idle;
          end case;
        end if;
      end if ;
    end process;
end a_maximum_ic;
