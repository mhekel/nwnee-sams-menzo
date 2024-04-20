   //::///////////////////////////////////////////////
//:: Name   spw_inc
//:: Copyright (c) 2001 Bioware Corp. 
//:: Created for Sam's Server- Menzoberranzan 
//:: This function is open source. please credit us.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created/Updated By: DM Elysium
//:: Created On:
//:://////////////////////////////////////////////





#include "aps_include"

void EnsureObjectLoaded(object o) {
    int nLoaded = GetLocalInt(o, "SPW_LOADED");
    if (!nLoaded) {
        SetLocalInt(o, "SPW_LOADED", TRUE);
        ExecuteScript("spw_hashcode", o);
        string sHashcode = GetLocalString(o, "SPW_HASHCODE");
        string filename = "spw" + sHashcode;
        ExecuteScript(filename, o);
    }
}

string GetHashcodeForObject(object o) {
    EnsureObjectLoaded(o);
    return GetLocalString(o, "SPW_HASHCODE");
}


