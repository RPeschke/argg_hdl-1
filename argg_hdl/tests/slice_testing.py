from enum import Enum, auto

from argg_hdl import *
from  argg_hdl.examples import *

from .helpers import Folders_isSame, vhdl_conversion, do_simulation,printf




class slice_TB(v_entity):
    def __init__(self):
        super().__init__()
        self.architecture()


    @architecture
    def architecture(self):
        clkgen = v_create(clk_generator())
        counter = v_slv()
        counter2 = v_slv()
        counter3 = v_slv(32,1)
        d0 = v_slv(4)
        d1 = v_slv(4)
        d2 = v_slv(4)
        d3 = v_slv(4)

        d4 = v_slv(16)


        
        @rising_edge(clkgen.clk)
        def proc():
            counter << counter +1
            counter2[15:32] << counter[1:23]
            counter3[1:32] << counter3
            d4 << (d0 & d1 & d2 & d3)

            if counter == 10:
                d0 << 0xA

            if counter == 20:
                d1 << 0xB
            
            if counter == 30:
                d2 << 0xC    
            if counter == 40:
                d3 << 0xD
            
            printf(
                hex(value(counter))+"; "+\
                hex(value(counter2)) + "; "+\
                hex(value(counter3))  + "; "+\
                hex(value(d0))  + "; "+\
                hex(value(d1))  + "; "+ \
                hex(value(d2))  + "; "+ \
                hex(value(d3))  + "; "+ \
                hex(value(d4))+  "\n"
            )
            


        end_architecture()


@do_simulation
def slice_TB_sim(OutputPath, f= None):
    
    tb1 = v_create(slice_TB())
    return tb1

@vhdl_conversion
def slice_TB_2vhdl(OutputPath, f= None):
    
    tb1 = v_create(slice_TB())
    return tb1