-- XGEN: Autogenerated File

library IEEE;
library UNISIM;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use UNISIM.VComponents.all;
use ieee.std_logic_unsigned.all;
use work.Counter_cl_pack.all;
use work.argg_hdl_core.all;


entity my_first_test_bench is 
end entity;



architecture rtl of my_first_test_bench is

--------------------------my_first_test_bench-----------------
--------------------------clkgen-----------------
  signal clkgen_clk : std_logic := '0'; 
-------------------------- end clkgen-----------------
-------------------------- end my_first_test_bench-----------------

begin
  -- begin architecture
  
-----------------------------------
proc : process(clkgen_clk) is
  variable counter : std_logic_vector(31 downto 0) := (others => '0');
  variable cnt : Counter_cl := Counter_cl_null;
  variable max_cnt : std_logic_vector(31 downto 0) := x"0000012c";
  begin
    if rising_edge(clkgen_clk) then 
      pull( self  =>  cnt);
  counter := counter + 1;
    count_to_max_00(self => cnt, maxValue => max_cnt);
    
      if (isDone_0(self => cnt)) then 
        reset_0(self => cnt);
        
      end if;
    end if;
  
  end process;
  -- end architecture

  clkgen : entity work.clk_generator port map (
    clk => clkgen_clk
  );
  
end architecture;