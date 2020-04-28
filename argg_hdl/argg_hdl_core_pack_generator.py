argg_hdl_core = """
-- XGEN: Autogenerated File

library IEEE;
library UNISIM;
use IEEE.numeric_std.all;
use IEEE.std_logic_1164.all;
use UNISIM.VComponents.all;
use ieee.std_logic_unsigned.all;


package argg_hdl_core is 
    procedure push(self : inout std_logic ; signal data : out std_logic) ;
    procedure pull(self : inout std_logic ; signal data : in std_logic) ;
    procedure push(self : inout std_logic_vector ; signal data : out std_logic_vector) ;
    procedure pull(self : inout std_logic_vector ; signal data  : in std_logic_vector) ;
end argg_hdl_core;


package body argg_hdl_core is
    procedure push(self : inout std_logic ; signal data : out std_logic) is 
    begin 
        data <= self ;
    end procedure;

    procedure pull(self : inout std_logic ; signal data : in std_logic) is 
    begin 
        self := data;
    end procedure;

    procedure push(self : inout std_logic_vector ; signal data : out std_logic_vector) is 
    begin 
        data <= self ;
    end procedure;

    procedure pull(self : inout std_logic_vector ; signal data  : in std_logic_vector) is 
    begin 
        self := data;
    end procedure;
end argg_hdl_core;
"""

def generate_files_in_folder(FolderName):
    with open(FolderName+"/argg_hdl_core.vhd","w",newline="") as f:
        f.write(argg_hdl_core)

    ## add more files here if needed