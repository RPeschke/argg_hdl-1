import argparse
import os,sys,inspect
import copy
from enum import Enum 



from argg_hdl.argg_hdl_base import *
from argg_hdl.argg_hdl_v_symbol import *
from argg_hdl.argg_hdl_v_Package import *
from argg_hdl.argg_hdl_v_class import *


class counter_state(Enum):
    idle    = 0
    running = 1
    done    = 2

class time_span(v_class):
    def __init__(self, CounterLength):
        super().__init__("time_span"+ str(CounterLength))
        self.__v_classType__         = v_classType_t.Record_t
        self.min  = v_slv(CounterLength)
        self.max  = v_slv(CounterLength)

class counter(v_class):
    def __init__(self, CounterLength):
        super().__init__("counter_"+ str(CounterLength))
        self.__v_classType__         = v_classType_t.Slave_t
        AddDataType(  time_span(CounterLength)  )
        self.state = v_enum(counter_state)
        self.Count = v_slv(CounterLength)
        self.MaxCount = v_slv(CounterLength)

    def _onPull(self):
        if self.isRunning():
            self.Count <<  self.Count +1

        if self.isRunning() and self.Count >= self.MaxCount:
            self.state << counter_state.done
            self.Count << 0

    

    def StartCountTo(self, MaxCount= port_in(v_slv())):
        if self.isReady():
            self.state << counter_state.running
            self.MaxCount << MaxCount
            self.Count << 0
            

    def StartCountFromTo(self,MinCount= port_in(v_slv()), MaxCount= port_in(v_slv())):
        if self.isReady():
            self.state << counter_state.running
            self.MaxCount << MaxCount
            self.Count << MinCount


        
    def stopCounter(self):
        self.state << counter_state.done
    
    def isReady(self):
        return self.state == counter_state.idle

    def isRunning(self):
        return self.state == counter_state.running
    
    def isDone(self):
        return self.state == counter_state.done

    def reset(self):
        self.state << counter_state.idle
        self.Count << 0



    def InTimeWindowSLV(self,TimeMin=port_in(v_slv()),TimeMax=port_in(v_slv()), DataIn=port_in(v_slv())):
        
        DataOut=v_slv("DataIn'length")
        DataOut << 0
        if self.isRunning() and TimeMin <= self.Count and self.Count < TimeMax:
            DataOut << DataIn

        return DataOut

    def InTimeWindowSl(self,TimeMin=port_in(v_slv()),TimeMax=port_in(v_slv())):
        DataOut=v_sl()
        DataOut << 0
        if self.isRunning() and TimeMin <= self.Count and self.Count < TimeMax:
            DataOut << 1  
        return DataOut
        

    def InTimeWindowSLV_r(self,TimeSpan=port_in(dataType()), DataIn=port_in(v_slv())):
        
        DataOut=v_slv("DataIn'length")
        DataOut << 0
        if self.isRunning() and TimeSpan.min <= self.Count and self.Count < TimeSpan.max:
            DataOut << DataIn

        return DataOut

    def InTimeWindowSl_r(self,TimeSpan=port_in(dataType())):
        DataOut=v_sl()
        DataOut << 0
        if self.isRunning() and TimeSpan.min <= self.Count and self.Count < TimeSpan.max:
            DataOut << 1  
        return DataOut
