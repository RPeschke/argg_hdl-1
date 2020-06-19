-- XGEN: Autogenerated File

library IEEE;
library UNISIM;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use UNISIM.VComponents.all;
use ieee.std_logic_unsigned.all;
use work.argg_hdl_core.all;
use work.span_t2_pack.all;
use work.span_t_pack.all;


package test_Config_pack is 

-------------------------------------------------------------------------
------- Start Psuedo Class test_Config -------------------------

type test_Config is record 
    var1 : span_t;
    var2 : span_t;
    var3 : span_t2;
    var4 : span_t2;
    var5 : std_logic_vector(7 downto 0);
    var6 : std_logic_vector(7 downto 0);
end record;
    
    
  constant test_Config_null : test_Config:= (
    var1 => (
    start => x"01",
    stop => x"10"
  ),
    var2 => (
    start => x"02",
    stop => x"20"
  ),
    var3 => span_t2_null,
    var4 => (
    start => x"04",
    stop => x"40"
  ),
    var5 => x"05",
    var6 => x"06"
  );


    type test_Config_a is array (natural range <>) of test_Config;
        

  procedure pull (self : inout test_Config; signal data_IO :  in  test_Config);
  procedure push (self : inout test_Config; signal data_IO :  out  test_Config);
------- End Psuedo Class test_Config -------------------------
-------------------------------------------------------------------------


end test_Config_pack;


package body test_Config_pack is

-------------------------------------------------------------------------
------- Start Psuedo Class test_Config -------------------------
procedure pull (self : inout test_Config; signal data_IO :  in  test_Config) is
   
  begin 
 self  := data_IO; 
end procedure;

procedure push (self : inout test_Config; signal data_IO :  out  test_Config) is
   
  begin 
 data_IO  <=  self; 
end procedure;

------- End Psuedo Class test_Config -------------------------
  -------------------------------------------------------------------------


end test_Config_pack;
