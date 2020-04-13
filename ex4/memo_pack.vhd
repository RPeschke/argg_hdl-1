-- XGEN: Autogenerated File

library IEEE;
library UNISIM;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use UNISIM.VComponents.all;
use ieee.std_logic_unsigned.all;
use work.argg_hdl_core.all;
use work.slv32_a_pack.all;


package memo_pack is 

-------------------------------------------------------------------------
------- Start Psuedo Class memo -------------------------

type memo_sig is record 
    l : slv32_a(100 - 1 downto 0);
end record;
    
    
  constant memo_sig_null : memo_sig:= (
    l => (others => (others => '0'))
  );


    type memo_sig_a is array (natural range <>) of memo_sig;
        

-- v_list getHeader
-- empty procedure removed. name: 'pull'
-- empty procedure removed. name: 'push'
-- empty procedure removed. name: 'pull'
-- empty procedure removed. name: 'push'
  procedure get_data_01 (signal self_sig :  memo_sig; self_sig_l :  in   slv32_a; signal data :  out  std_logic_vector(31 downto 0));
  procedure set_data_01 (signal self_sig :  memo_sig; self_sig_l :  out   slv32_a; signal data :  in  std_logic_vector(31 downto 0));
------- End Psuedo Class memo -------------------------
-------------------------------------------------------------------------


end memo_pack;


package body memo_pack is

-------------------------------------------------------------------------
------- Start Psuedo Class memo -------------------------
-- empty procedure removed. name: 'pull'
-- empty procedure removed. name: 'push'
-- empty procedure removed. name: 'pull'
-- empty procedure removed. name: 'push'
procedure set_data_01 (signal self_sig :  memo_sig; self_sig_l :  out   slv32_a; signal data :  in  std_logic_vector(31 downto 0)) is
   
  begin 
 self_sig_l(0) <= data;
   
end procedure;

procedure get_data_01 (signal self_sig :  memo_sig; self_sig_l :  in   slv32_a; signal data :  out  std_logic_vector(31 downto 0)) is
   
  begin 
 data <= self_sig.l(0);
   
end procedure;

------- End Psuedo Class memo -------------------------
  -------------------------------------------------------------------------


end memo_pack;
