-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.argg_hdl_core.all;
use work.v_symbol_pack.all;


entity slice_TB is 
end entity;



architecture rtl of slice_TB is

--------------------------slice_TB-----------------
  signal counter : slv32 := std_logic_vector_ctr(0, 32); 
  signal counter2 : slv32 := std_logic_vector_ctr(0, 32); 
  signal counter3 : slv32 := std_logic_vector_ctr(1, 32); 
  signal d0 : slv4 := std_logic_vector_ctr(0, 4); 
  signal d1 : slv4 := std_logic_vector_ctr(0, 4); 
  signal d2 : slv4 := std_logic_vector_ctr(0, 4); 
  signal d3 : slv4 := std_logic_vector_ctr(0, 4); 
  signal d4 : slv16 := std_logic_vector_ctr(0, 16); 
--------------------------clkgen-----------------
  signal clkgen_clk : std_logic := std_logic_ctr(0, 1); 
-------------------------- end clkgen-----------------
-------------------------- end slice_TB-----------------

begin
  -- begin architecture
  
-----------------------------------
proc : process(clkgen_clk) is
  
  begin
  
  if rising_edge(clkgen_clk) then
  counter <= counter + 1;
    counter2(31  downto  15) <= counter(22  downto  1);
    counter3(31  downto  1) <= counter3;
    d4 <= d0 & d1 & d2 & d3;
    
      if (counter = 10) then 
        d0  <=  std_logic_vector(to_unsigned(10, d0'length));
        
      end if;
    
      if (counter = 20) then 
        d1  <=  std_logic_vector(to_unsigned(11, d1'length));
        
      end if;
    
      if (counter = 30) then 
        d2  <=  std_logic_vector(to_unsigned(12, d2'length));
        
      end if;
    
      if (counter = 40) then 
        d3  <=  std_logic_vector(to_unsigned(13, d3'length));
        
      end if;
    
  end if;
  
  
  end process;
  -- end architecture

  clkgen : entity work.clk_generator port map (
    clk => clkgen_clk
  );
  
end architecture;