class objectName:
    objectNameList = []

    def __init__(self, objTypeName,MemberTypeNames):
        self.objTypeName =  objTypeName
        self.MemberTypeNames = MemberTypeNames
        self.HDL_objectName = None

    def __eq__(self, rhs):
        return self.objTypeName ==  rhs.objTypeName  and self.MemberTypeNames == rhs.MemberTypeNames
    
    def __str__(self):

        ret = self.objTypeName +"<"
        start =""
        for x in self.MemberTypeNames :
            ret += start + x
            start = ", "

        ret += ">"

        if self.HDL_objectName:
            ret += "  -->  " + self.HDL_objectName
        return ret 

    def get_Name(self):
        candidats = [ x for x in self.objectNameList if x == self]
        if candidats:
            print("reuse Name for "+ str(self) + "  -->  " +candidats[0].HDL_objectName )
            return candidats[0].HDL_objectName

        sameTypeNameCandidates = [ x for x in self.objectNameList if x.objTypeName == self.objTypeName]

        self.HDL_objectName = self.objTypeName + str(len(self.objectNameList)) if len(sameTypeNameCandidates) > 0 else self.objTypeName
        self.objectNameList.append(self)
        print("New Name for ", str(self))
        return self.HDL_objectName





def make_object_name(objTypeName,MemberTypeNames):
    obj = objectName(objTypeName,MemberTypeNames)
    return obj.get_Name()