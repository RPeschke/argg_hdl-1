-- XGEN: Autogenerated File

library IEEE;
library UNISIM;
library work;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use UNISIM.VComponents.all;
use ieee.std_logic_unsigned.all;
use work.argg_hdl_core.all;


package axisStream_slv32 is 

-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32 -------------------------

type axiStream_slv32_s2m is record 
    ready : std_logic;
end record;
    
    
  constant axiStream_slv32_s2m_null : axiStream_slv32_s2m:= (
    ready => '0'
  );


    type axiStream_slv32_s2m_a is array (natural range <>) of axiStream_slv32_s2m;
        


type axiStream_slv32_m2s is record 
    data : std_logic_vector(31 downto 0);
    last : std_logic;
    valid : std_logic;
end record;
    
    
  constant axiStream_slv32_m2s_null : axiStream_slv32_m2s:= (
    data => (others => '0'),
    last => '0',
    valid => '0'
  );


    type axiStream_slv32_m2s_a is array (natural range <>) of axiStream_slv32_m2s;
        


type axiStream_slv32 is record 
    data : std_logic_vector(31 downto 0);
    last : std_logic;
    ready : std_logic;
    valid : std_logic;
end record;
    
    
  constant axiStream_slv32_null : axiStream_slv32:= (
    data => (others => '0'),
    last => '0',
    ready => '0',
    valid => '0'
  );


    type axiStream_slv32_a is array (natural range <>) of axiStream_slv32;
        

  procedure pull (self :  inout axiStream_slv32; signal IO_data :  in axiStream_slv32_s2m);
  procedure push (self :  inout axiStream_slv32; signal IO_data :  out axiStream_slv32_m2s);
  procedure pull (self :  inout axiStream_slv32; signal IO_data :  in axiStream_slv32_m2s);
  procedure push (self :  inout axiStream_slv32; signal IO_data :  out axiStream_slv32_s2m);
------- End Psuedo Class axiStream_slv32 -------------------------
-------------------------------------------------------------------------


-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32_master -------------------------

type axiStream_slv32_master is record 
    tx : axiStream_slv32;
end record;
    
    
  constant axiStream_slv32_master_null : axiStream_slv32_master:= (
    tx => axiStream_slv32_null
  );


    type axiStream_slv32_master_a is array (natural range <>) of axiStream_slv32_master;
        

  procedure pull (self :  inout  axiStream_slv32_master;  signal tx :  in  axiStream_slv32_s2m);
  procedure push (self :  inout  axiStream_slv32_master;  signal tx :  out  axiStream_slv32_m2s);
  procedure pull (self :  inout  axiStream_slv32_master_a;  signal tx :  in  axiStream_slv32_s2m_a);
  procedure push (self :  inout  axiStream_slv32_master_a;  signal tx :  out  axiStream_slv32_m2s_a);
  procedure send_data_00 (self :  inout  axiStream_slv32_master; dataIn :  in  std_logic_vector);
  procedure send_data_01 (self :  inout  axiStream_slv32_master; signal dataIn :  in  std_logic_vector);
  function to_bool (self :   axiStream_slv32_master) return boolean;
  procedure Send_end_Of_Stream_00 (self :  inout  axiStream_slv32_master; EndOfStream :  in  boolean := True);
  function ready_to_send_0 (self :   axiStream_slv32_master) return boolean;
  procedure reset_0 (self :  inout  axiStream_slv32_master);
------- End Psuedo Class axiStream_slv32_master -------------------------
-------------------------------------------------------------------------


-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32_slave -------------------------

type axiStream_slv32_slave is record 
    data_internal2 : std_logic_vector(31 downto 0);
    data_internal_isLast2 : std_logic;
    data_internal_isvalid2 : std_logic;
    data_internal_was_read2 : std_logic;
    data_isvalid : std_logic;
    rx : axiStream_slv32;
end record;
    
    
  constant axiStream_slv32_slave_null : axiStream_slv32_slave:= (
    data_internal2 => (others => '0'),
    data_internal_isLast2 => '0',
    data_internal_isvalid2 => '0',
    data_internal_was_read2 => '0',
    data_isvalid => '0',
    rx => axiStream_slv32_null
  );


    type axiStream_slv32_slave_a is array (natural range <>) of axiStream_slv32_slave;
        

  procedure pull (self :  inout  axiStream_slv32_slave;  signal rx :  in  axiStream_slv32_m2s);
  procedure push (self :  inout  axiStream_slv32_slave;  signal rx :  out  axiStream_slv32_s2m);
  procedure pull (self :  inout  axiStream_slv32_slave_a;  signal rx :  in  axiStream_slv32_m2s_a);
  procedure push (self :  inout  axiStream_slv32_slave_a;  signal rx :  out  axiStream_slv32_s2m_a);
  procedure get_value_00_rshift (self :  inout  axiStream_slv32_slave; rhs :  inout  axiStream_slv32_master);
  procedure get_value_01_rshift (self :  inout  axiStream_slv32_slave; signal rhs :  out  std_logic_vector);
  function to_bool (self :   axiStream_slv32_slave) return boolean;
  function IsEndOfStream_0 (self :   axiStream_slv32_slave) return boolean;
  function isReceivingData_0 (self :   axiStream_slv32_slave) return boolean;
  procedure observe_data_00 (self :  inout  axiStream_slv32_slave; dataOut :  out  std_logic_vector);
------- End Psuedo Class axiStream_slv32_slave -------------------------
-------------------------------------------------------------------------


end axisStream_slv32;


package body axisStream_slv32 is

-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32 -------------------------
procedure pull (self :  inout axiStream_slv32; signal IO_data :  in axiStream_slv32_s2m) is
   
  begin 
 
    
-- Start Connecting
    pull(self.ready, IO_data.ready);

-- End Connecting
    
             
end procedure;

procedure push (self :  inout axiStream_slv32; signal IO_data :  out axiStream_slv32_m2s) is
   
  begin 
 
    
-- Start Connecting
    push(self.data, IO_data.data);
    push(self.last, IO_data.last);
    push(self.valid, IO_data.valid);

-- End Connecting
    
             
end procedure;

procedure pull (self :  inout axiStream_slv32; signal IO_data :  in axiStream_slv32_m2s) is
   
  begin 
 
    
-- Start Connecting
    pull(self.data, IO_data.data);
    pull(self.last, IO_data.last);
    pull(self.valid, IO_data.valid);

-- End Connecting
    
             
end procedure;

procedure push (self :  inout axiStream_slv32; signal IO_data :  out axiStream_slv32_s2m) is
   
  begin 
 
    
-- Start Connecting
    push(self.ready, IO_data.ready);

-- End Connecting
    
             
end procedure;

------- End Psuedo Class axiStream_slv32 -------------------------
  -------------------------------------------------------------------------


-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32_master -------------------------
procedure pull (self :  inout  axiStream_slv32_master;  signal tx :  in  axiStream_slv32_s2m) is
   
  begin 
 
    
-- Start Connecting
    pull(self.tx, tx);

-- End Connecting
    
    if (self.tx.ready = '1') then 
      self.tx.valid := '0';
      self.tx.last := '0';
      self.tx.data := (others => '0');
      
    end if;
  
             
end procedure;

procedure push (self :  inout  axiStream_slv32_master;  signal tx :  out  axiStream_slv32_m2s) is
   
  begin 
 
    
-- Start Connecting
    push(self.tx, tx);

-- End Connecting
    
             
end procedure;

procedure pull (self :  inout  axiStream_slv32_master_a;  signal tx :  in  axiStream_slv32_s2m_a) is
   
  begin 
 
        for i in 0 to self'length - 1 loop
        pull( self =>  self(i), tx => tx(i));
        end loop;
             
end procedure;

procedure push (self :  inout  axiStream_slv32_master_a;  signal tx :  out  axiStream_slv32_m2s_a) is
   
  begin 
 
        for i in 0 to self'length - 1 loop
        push( self =>  self(i), tx => tx(i));
        end loop;
             
end procedure;

procedure reset_0 (self :  inout  axiStream_slv32_master) is
   
  begin 
 self.tx.valid := '0';
   
end procedure;

function ready_to_send_0 (self :   axiStream_slv32_master) return boolean is
   
  begin 
 return  not  ( self.tx.valid = '1' ) ;
   
end function;

procedure Send_end_Of_Stream_00 (self :  inout  axiStream_slv32_master; EndOfStream :  in  boolean := True) is
   
  begin 
 
    if (EndOfStream) then 
      self.tx.last := '1';
      
    else
      self.tx.last := '0';
      
    end if;
   
end procedure;

function to_bool (self :   axiStream_slv32_master) return boolean is
   
  begin 
 return ready_to_send_0(self => self);
   
end function;

procedure send_data_01 (self :  inout  axiStream_slv32_master; signal dataIn :  in  std_logic_vector) is
   
  begin 
 self.tx.valid := '1';
  self.tx.data := dataIn;
   
end procedure;

procedure send_data_00 (self :  inout  axiStream_slv32_master; dataIn :  in  std_logic_vector) is
   
  begin 
 self.tx.valid := '1';
  self.tx.data := dataIn;
   
end procedure;

------- End Psuedo Class axiStream_slv32_master -------------------------
  -------------------------------------------------------------------------


-------------------------------------------------------------------------
------- Start Psuedo Class axiStream_slv32_slave -------------------------
procedure pull (self :  inout  axiStream_slv32_slave;  signal rx :  in  axiStream_slv32_m2s) is
   
  begin 
 
    
-- Start Connecting
    pull(self.rx, rx);

-- End Connecting
    
    if (( self.rx.ready = '1' and self.rx.valid = '1') ) then 
      self.data_isvalid := '1';
      
    end if;
  self.data_internal_was_read2 := '0';
  self.rx.ready := '0';
  
    if (( self.data_isvalid = '1' and  not  ( self.data_internal_isvalid2 = '1' ) ) ) then 
      self.data_internal2 := self.rx.data;
      self.data_internal_isvalid2 := self.data_isvalid;
      self.data_internal_isLast2 := self.rx.last;
      self.data_isvalid := '0';
      
    end if;
  
             
end procedure;

procedure push (self :  inout  axiStream_slv32_slave;  signal rx :  out  axiStream_slv32_s2m) is
   
  begin 
 
    
    if (self.data_internal_was_read2 = '1') then 
      self.data_internal_isvalid2 := '0';
      
    end if;
  
    if ((  not  ( self.data_isvalid = '1' )  and  not  ( self.data_internal_isvalid2 = '1' ) ) ) then 
      self.rx.ready := '1';
      
    end if;
  
-- Start Connecting
    push(self.rx, rx);

-- End Connecting
    
             
end procedure;

procedure pull (self :  inout  axiStream_slv32_slave_a;  signal rx :  in  axiStream_slv32_m2s_a) is
   
  begin 
 
        for i in 0 to self'length - 1 loop
        pull( self =>  self(i), rx => rx(i));
        end loop;
             
end procedure;

procedure push (self :  inout  axiStream_slv32_slave_a;  signal rx :  out  axiStream_slv32_s2m_a) is
   
  begin 
 
        for i in 0 to self'length - 1 loop
        push( self =>  self(i), rx => rx(i));
        end loop;
             
end procedure;

procedure observe_data_00 (self :  inout  axiStream_slv32_slave; dataOut :  out  std_logic_vector) is
   
  begin 
 
    if (self.data_internal_isvalid2 = '1') then 
      dataOut := self.data_internal2;
      
    end if;
   
end procedure;

function isReceivingData_0 (self :   axiStream_slv32_slave) return boolean is
   
  begin 
 return self.data_internal_isvalid2 = '1';
   
end function;

function IsEndOfStream_0 (self :   axiStream_slv32_slave) return boolean is
   
  begin 
 return ( self.data_internal_isvalid2 > '0' and self.data_internal_isLast2 > '0') ;
   
end function;

function to_bool (self :   axiStream_slv32_slave) return boolean is
   
  begin 
 return isReceivingData_0(self => self);
   
end function;

procedure get_value_01_rshift (self :  inout  axiStream_slv32_slave; signal rhs :  out  std_logic_vector) is
   
  begin 
 rhs <= (others => '0');
  
    if (self.data_internal_isvalid2 = '1') then 
      rhs <= self.data_internal2;
      self.data_internal_was_read2 := '1';
      
    end if;
   
end procedure;

procedure get_value_00_rshift (self :  inout  axiStream_slv32_slave; rhs :  inout  axiStream_slv32_master) is
   
  begin 
 reset_0(self => rhs);
  
    if (self.data_internal_isvalid2 = '1') then 
      send_data_00(self => rhs, dataIn => self.data_internal2);
      self.data_internal_was_read2 := '1';
      
    end if;
   
end procedure;

------- End Psuedo Class axiStream_slv32_slave -------------------------
  -------------------------------------------------------------------------


end axisStream_slv32;

