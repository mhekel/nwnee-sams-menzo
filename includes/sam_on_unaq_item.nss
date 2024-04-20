#include "sam_inc"

void main()
{
    int nDebug = GetLocalInt(GetModule(), "sam_debug");
    object oItem = GetModuleItemLost();
    object oPC = GetModuleItemLostBy();
    string sTag = GetStringLowerCase(GetStringLeft(MakeResRef(oItem), 12));
    if (sTag == "") return;
    string sScript = "uaq_" + sTag;
    if (nDebug) {
        SendMessageToPC(oPC, "Executing script " + sScript);
    }
    ExecuteScript(sScript, oPC);

}
