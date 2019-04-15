library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controller is
    generic (
        n              : integer := 256;
        ram_size       : integer := 64;
        address_size   : integer := 8;
        label_size     : integer := 8
    );
    port (
        clk            : in    std_logic; 
        clk_inv        : in    std_logic; 
        rst            : in    std_logic;
        initiate       : inout std_logic;
        ready_signal   : inout std_logic;
        -- bi_bus         : inout std_logic_vector(n-1 downto 0);
	-- memory
	enable_mar_in  : inout std_logic;
 	enable_mdr_in  : inout std_logic;
 	enable_mdr_out : inout std_logic;
 	enable_write   : inout std_logic;
        mdr_data_out   : inout std_logic_vector(255 downto 0);
        
	 ---------------- Labels Ports --------------------------
        label_1_output : out std_logic_vector(15 downto 0);
        label_2_output : out std_logic_vector(15 downto 0);
        label_3_output : out std_logic_vector(15 downto 0);
        label_4_output : out std_logic_vector(15 downto 0);
        label_5_output : out std_logic_vector(15 downto 0);
        label_6_output : out std_logic_vector(15 downto 0);
        label_7_output : out std_logic_vector(15 downto 0);
        label_8_output : out std_logic_vector(15 downto 0);
        label_9_output : out std_logic_vector(15 downto 0);
        label_10_output: out std_logic_vector(15 downto 0)
        --------------------- Test Ports --------------------

    );
end entity controller;

architecture a_controller of controller is

    type state_type is ( idle , fetch_num_neuron ,  prepare_labels , fetch_neuron_weights , ready ); -- our fsm.    
    -- idle : state that make the fsm waiting to begin.
    -- prepare_labels : state to prepare bias registers with initial values ( latched from memory in specific location ).
    -- fetch_neuron : state to fetch neuron from the memory.
    -- fetch_weights : state to fetch all weight (note: the weights will be on mdr all the time).
    -- ready : state whose job is to rise a signal to booth's algorithm to start multipication.

    type sub_state_type is ( sub_state_1 , sub_state_2 , sub_state_3 , sub_state_4 , sub_state_5 );


    signal enable_decoder_src     : std_logic; -- enable the source decoder.
    signal enable_decoder_dst     : std_logic; -- enable the destination decoder.
    

    signal sel_src : std_logic_vector(3 downto 0); -- selector for the souce decoder.
    signal sel_dst : std_logic_vector(3 downto 0); -- selector for the destination decoder.
    
    -- num
    signal enable_num : std_logic;
    signal num_in : std_logic_vector(7 downto 0);
    signal num_out : std_logic_vector(7 downto 0);

    signal state : state_type;      -- main signal of fsm ( this is the main state ).
    signal sub_state : sub_state_type; -- signal to avoid infinite loop.

    -- null vec
    -- signal enable_null_vec : std_logic;
    signal null_vec_in : std_logic_vector(255 downto 0);
    signal null_vec_out : std_logic_vector(255 downto 0);
    
    -- address
    signal enable_address : std_logic;
    signal address_in  : std_logic_vector(7 downto 0);
    signal address_out : std_logic_vector(7 downto 0);    


    signal alu_inp1  : std_logic_vector(label_size - 1 downto 0);
    signal alu_inp2  : std_logic_vector(label_size - 1 downto 0);
    signal alu_out   : std_logic_vector(label_size - 1 downto 0);
    signal alu_sel   : std_logic;
    signal alu_cin   : std_logic;
    signal alu_cout  : std_logic;
    
    -- begin masterpieces :v



begin
	
    process( clk , rst )
    begin

        if(rst='1') then 
          state <=  idle;
  	  sub_state <= sub_state_1;
	  enable_decoder_src <= '0';
	  sel_src <= "0000";
	  sel_dst <= "0000"; 
	  enable_decoder_dst <= '0';
    	  alu_cin <= '0';
	  enable_num <= '0';
	  ready_signal <= '0';
	  enable_mar_in  <= '0';
 	  enable_mdr_in  <= '0';
 	  enable_mdr_out <= '0';
 	  enable_write   <= '0';
	  address_in <= ( 7 downto 0 => '0');


        elsif (clk'event and clk = '1') then
            if(initiate = '1') then
                ready_signal <= '0'; 
		initiate <= '0';
                state <= fetch_num_neuron;       
            else
                case(state) is
                    when fetch_num_neuron =>
                        case(sub_state) is
                            when sub_state_1 =>
                                sel_src <= "0000";    
				sel_dst <= "0000"; 
                                enable_mar_in <= '0';
				enable_write <= '0'; 
                                enable_mdr_in <= '0';
				enable_mdr_out <= '0'; 
                                enable_decoder_src <= '0';
				enable_decoder_dst <= '0';
				address_in <= "00000000";
				enable_num <= '1';
				null_vec_in <= (255 downto 0 =>'0');
                                sub_state <= sub_state_2;
                            when sub_state_2 =>
                                sub_state <= sub_state_3;
				enable_address <= '1';
                                enable_mar_in <= '1';
                                enable_mdr_in <= '1';
                            when sub_state_3 =>
                                sub_state <= sub_state_4;
                                alu_inp1 <= address_out;
                                alu_inp2 <= "00000001";
                                alu_sel <= '0';
                                enable_mar_in <= '0';
                            when sub_state_4 =>
                                sub_state <= sub_state_5;
                                enable_mdr_out <= '1';
                                address_in <= alu_out;
                                enable_mdr_in <= '0';
                            when sub_state_5 =>
                                sub_state <= sub_state_1;
                                num_in <= mdr_data_out(7 downto 0);
                                state <= prepare_labels;
                                enable_mdr_out <= '0';
                        end case;

                    when prepare_labels =>

                        case(sub_state) is
                            when sub_state_1 =>
                                sel_src <= "0000";
				sel_dst <= "0000"; 
                                enable_mar_in <= '0';
				enable_write <= '0'; 
                                enable_mdr_in <= '0';
				enable_mdr_out <= '0'; 
                                enable_decoder_src <= '0';
				enable_decoder_dst <= '0';
                                sub_state <= sub_state_2;
                            when sub_state_2 => 
                                sub_state <= sub_state_3;
                                enable_mar_in <= '1';
                                enable_mdr_in <= '1';
                            when sub_state_3 =>
                                sub_state <= sub_state_4;
                                alu_inp1 <= address_out;
                                alu_inp2 <= "00000001";
                                alu_sel <= '0';
                                enable_mar_in <= '0';
                            when sub_state_4 =>
                                sub_state <= sub_state_5;
                                enable_mdr_out <= '1';
                                address_in <= alu_out;
                                enable_mdr_in <= '0';
                                enable_decoder_dst <= '1';
                                sel_dst <= "1111";
                            when sub_state_5 =>
                                sub_state <= sub_state_1;
                                state <= fetch_neuron_weights;
                                enable_mdr_out <= '0';
                                enable_decoder_dst <= '0';
                                sel_dst <= "0000";
                        end case;
                    
                    when fetch_neuron_weights =>
                        -- here all neurons are done and I'm waiting for another initiate signal.
                        if(num_out = null_vec_out(7 downto 0)) then
                            state <= idle;
                        end if;
                        -- if ready_signal is equal to zero this means booths needs more.
                        if ready_signal = '0' then
                            case(sub_state) is
                                when sub_state_1 =>
                                    sel_src <= "0000";          
				    sel_dst <= "0000"; 
                                    enable_mar_in <= '0';
				    enable_write <= '0'; 
                                    enable_mdr_in <= '0';
				    enable_mdr_out <= '0'; 
                                    enable_decoder_src <= '0';
			            enable_decoder_dst <= '0';
                                    ready_signal <= '0';
                                    sub_state <= sub_state_2;
                                when sub_state_2 => 
                                    sub_state <= sub_state_3;
                                    enable_mar_in <= '1';
                                    enable_mdr_in <= '1';
                                    alu_inp1 <= address_out;
                                    alu_inp2 <= "00000001";
                                    alu_sel <= '0';
                                when others =>
                                    state <= ready;
                                    sub_state <= sub_state_1;
                                    address_in <= alu_out;
                                    enable_mar_in <= '0';
                                    enable_mdr_in <= '0';
                            end case ;    
                        end if ;
                    when ready =>
                        case( sub_state ) is
                            when sub_state_1 =>
                                sel_src <= "0000";          
				sel_dst <= "0000"; 
                                enable_mar_in <= '0';
				enable_write <= '0'; 
                                enable_mdr_in <= '0';
				enable_mdr_out <= '0'; 
                                enable_decoder_src <= '0';
				enable_decoder_dst <= '0';
                                alu_inp1 <= num_out;
                                alu_inp2 <= "00000001";
                                alu_cin <= '0';
                                alu_sel <= '1';
                                sub_state <= sub_state_2;
                            when others =>
                                num_in <= alu_out;
                                ready_signal <= '1';
                                state <= fetch_neuron_weights;
                                sub_state <= sub_state_1;
                        end case;         
                    when idle => 
                        state <= idle;
                end case ;
            end if;
        end if ;
    end process ; 
    
    -- specialregfile : entity work.special_register_file port map ( clk , clk_inv , rst ,  enable_mar_in , enable_mdr_in , enable_mdr_out , enable_write , address_out, mdr_data_out );

    -- address_out <= address_out_7 & address_out_6 & address_out_5 & address_out_4 & address_out_3 & address_out_2 & address_out_1 & address_out_0;
    -- signal address_out : std_logic_vector(7 downto 0);

    labelsregfile  : entity work.label_register_file port map ( clk , rst , enable_decoder_src , enable_decoder_dst , sel_src, sel_dst , mdr_data_out , label_1_output , label_2_output , label_3_output , label_4_output , label_5_output , label_6_output , label_7_output , label_8_output , label_9_output , label_10_output );
    alu_subtractor_adder : entity work.alu generic map ( label_size ) port map ( alu_inp1 , alu_inp2 , alu_sel , alu_cin , alu_out , alu_cout );

    address: entity work.N_Dff generic map (address_size) port map ( clk , rst , enable_address , address_in , address_out );
    num : entity work.N_Dff generic map ( 8 ) port map ( clk , rst , enable_num , num_in , num_out );
    null_vec : entity work.N_Dff generic map ( 256 ) port map ( clk , rst , '0' , null_vec_in , null_vec_out );

end a_controller;
