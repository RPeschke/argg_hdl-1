import ast
import os,sys,inspect
if __name__== "__main__":
    currentdir = os.path.dirname(os.path.abspath(inspect.getfile(inspect.currentframe())))
    parentdir = os.path.dirname(currentdir)
    sys.path.insert(0,parentdir) 
    from argg_hdl.argg_hdl_base import *
    from argg_hdl.xgenAST import *
    from argg_hdl.xgen_to_v_object import *
else:
    from .argg_hdl_base import *
    from .xgenAST import *
    from .xgen_to_v_object import *



class v_package_converter(hdl_converter_base):
    def parse_file(self,obj):
        
        for t  in obj.PackageContent:
            t = to_v_object(t)
            
            t.hdl_conversion__.parse_file(t)


    def includes(self, obj, name,parent):
        bufffer  = ""
        for t  in obj.PackageContent:
            t = to_v_object(t)
            
            bufffer += t.hdl_conversion__.includes(t,"",obj)
        ret = make_unique_includes(bufffer, obj.PackageName)
        return ret

    def getHeader(self, obj, name,parent):
        ret = ""
        for t  in obj.PackageContent:
            t = to_v_object(t)
            ret += t.hdl_conversion__.getHeader(t,"",obj)
        
        return ret

    def getBody(self,obj, name,parent):
        ret = ""
        for t  in obj.PackageContent:
            t = to_v_object(t)
            ret += t.hdl_conversion__.getBody(t,"",obj)
        
        return ret

    def get_entity_definition(self, obj):
        ret = ""
        for t  in obj.PackageContent:
            t = to_v_object(t)
            entity_def = t.hdl_conversion__.get_entity_definition(t)
            if entity_def.strip():
                ret += "\n\n" + entity_def + "\n\n"
        
        return ret

def Fill_AST_Tree(package,SourceFile):
    if not SourceFile:
        return
    package.astTree = xgenAST(SourceFile)

    for x in package.PackageContent:
        if x._issubclass_("v_class"):
            fun= package.astTree.extractFunctionsForClass(x ,package )
            x.hdl_conversion__.__ast_functions__ += fun
    
class v_package(vhdl_base):
    def __init__(self, PackageName,PackageContent, sourceFile=None):
        super().__init__()
        self.hdl_conversion__ = v_package_converter()
        
        s = isConverting2VHDL()
        set_isConverting2VHDL(True)
        proc = isProcess()
        set_isProcess(True)
        self.PackageName = PackageName
        self.PackageContent = PackageContent
        self.astTree = None
        self.astv_classes = None
        Fill_AST_Tree(self, sourceFile)

        set_isConverting2VHDL(s)
        set_isProcess(proc)
            
    





   

    def getName(self):
        return type(self).__name__
    def to_string(self):
        s = isConverting2VHDL()
        set_isConverting2VHDL(True)
        
        
        self.hdl_conversion__.parse_file(self)
        
        
        ret = "-- XGEN: Autogenerated File\n\n"
        ret += self.hdl_conversion__.includes(self, None, self)
        ret += "\n\n"
        p_header = self.hdl_conversion__.getHeader(self,None, self)
        if p_header.strip():
            ret += "package " + self.PackageName + " is \n\n"
            ret += p_header
            ret += "end " + self.PackageName + ";\n\n\n"

            ret += "package body "+ self.PackageName +" is\n\n"
            ret += self.hdl_conversion__.getBody(self,None, self)
            ret += "end "+ self.PackageName +";\n\n"
        
        ret += self.hdl_conversion__.get_entity_definition(self)

        set_isConverting2VHDL(s)
        return ret

    def getInstantByName(self,SymbolName):
        for t  in self.PackageContent:
            t = to_v_object(t)
            if t.name == SymbolName:
                return t


        raise Exception("unable to find type" , SymbolName)