-- XGEN: Autogenerated File

library IEEE;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use work.argg_hdl_core.all;
use work.axisStream_slv32.all;


entity stream_delay_one is 
  port(
    Axi_in_s2m :  out  axiStream_slv32_s2m := axiStream_slv32_s2m_null;
    Axi_in_m2s :  in  axiStream_slv32_m2s := axiStream_slv32_m2s_null;
    Axi_out_s2m :  in  axiStream_slv32_s2m := axiStream_slv32_s2m_null;
    Axi_out_m2s :  out  axiStream_slv32_m2s := axiStream_slv32_m2s_null;
    clk :  in  std_logic := '0'
  );
end entity;



architecture rtl of stream_delay_one is

--------------------------stream_delay_one-----------------
-------------------------- end stream_delay_one-----------------

begin

  -----------------------------------
  proc : process(clk) is
    variable axiSalve : axiStream_slv32_slave := axiStream_slv32_slave_null;
    variable axMaster : axiStream_slv32_master := axiStream_slv32_master_null;
    begin
      if rising_edge(clk) then 
        pull( self  =>  axiSalve, rx => Axi_in_m2s);
        pull( self  =>  axMaster, tx => Axi_out_s2m);
    
        if (( isReceivingData_0(self => axiSalve) and ready_to_send_0(self => axMaster)) ) then 
          get_value_00_rshift(self => axiSalve, rhs => axMaster);
          Send_end_Of_Stream_00(self => axMaster, EndOfStream => IsEndOfStream_0(self => axiSalve));
          
        end if;
          push( self  =>  axiSalve, rx => Axi_in_s2m);
        push( self  =>  axMaster, tx => Axi_out_m2s);
    end if;
    
    end process;
  
end architecture;