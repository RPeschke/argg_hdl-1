
from argg_hdl import *
from  argg_hdl.examples import *

from .helpers import Folders_isSame, vhdl_conversion, do_simulation,printf

class test_bench_axi_fifo(v_entity):
    def __init__(self):
        super().__init__()
        self.architecture()

    def architecture(self):
        clkgen = clk_generator()
        maxCount = v_slv(32,20)
        pipe1 = rollingCounter(clkgen.clk,maxCount) \
            | axiFifo(clkgen.clk)  \
            | axiFifo(clkgen.clk, depth = 5)  \
            | axiPrint(clkgen.clk) 
        
        end_architecture()






@do_simulation
def test_bench_axi_fifo_sim(OutputPath, f= None):
    tb = test_bench_axi_fifo()  
    return tb

@vhdl_conversion
def test_bench_axi_fifo_2vhdl(OutputPath, f= None):
    tb = test_bench_axi_fifo()  
    return tb
