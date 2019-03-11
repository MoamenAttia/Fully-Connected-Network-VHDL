library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;
    use ieee.std_logic_signed.all;
   
    entity Booth is
        port(M, R: in std_logic_vector(7 downto 0);
             O: out std_logic_vector(15 downto 0));
    end Booth;
   
    architecture booth of Booth is
signal P: std_logic_vector(16 downto 0);
signal s,a : std_logic_vector(16 downto 0);
        begin
           
            process(M, R)
             
             variable i:integer;
                begin
                    p <= "00000000000000000";
                    a <= R(7 downto 0)& "000000000";
		    s(16 downto 9) <= (not R) + '1';
		    s(8 downto 0)<= "000000000";
                    p(8 downto 1) <= M;
                   
                    for i in 0 to 7 loop
                       if(p(1) = '0' and p(0) = '1') then
                          p <= (p+a);
                         
                       elsif(p(1) = '1' and p(0) = '0') then
                          p <= (p+s);
                         
                       end if;
                      
                       p(15 downto 0) <= p(16 downto 1);
                      
                    end loop;
                   
                    O(15 downto 0) <= p(16 downto 1);
                   
                end process;
               
            end booth;