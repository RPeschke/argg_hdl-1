-- XGEN: Autogenerated File

library IEEE;
library UNISIM;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use UNISIM.VComponents.all;
use ieee.std_logic_unsigned.all;
use work.argg_hdl_core.all;
use work.ram_handler_pack.all;
use work.slv32_a_pack.all;


entity ram_block is 
  port(
    DataIO_s2m :  out  ram_handler_s2m := ram_handler_s2m_null;
    DataIO_m2s :  in  ram_handler_m2s := ram_handler_m2s_null;
    clk :  in  std_logic := '0'
  );
end entity;



architecture rtl of ram_block is

--------------------------ram_block-----------------
  signal mem : slv32_a(10 - 1 downto 0)  := (others => (others => '0'));
-------------------------- end ram_block-----------------

begin
  -- begin architecture
  
-----------------------------------
proc : process(clk) is
  begin
    if rising_edge(clk) then 
  
      if (DataIO_s2m.write_enable = '1') then 
        mem(to_integer(signed( DataIO_s2m.Write_address))) <= DataIO_s2m.Write_Data;
        
      end if;
    DataIO_m2s.read_data <= mem(to_integer(signed( DataIO_s2m.read_address)));
    end if;
  
  end process;
  -- end architecture

end architecture;