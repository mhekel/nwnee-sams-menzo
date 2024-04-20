#include "sam_inc"
#include "spw_inc"

void main()
{
    object oPC = GetPCSpeaker();
    object oItem = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem)) {
        string sResRef = GetResRef(oItem);
        if (sResRef == "clanrod" || sResRef == "clantoken") {
            DestroyObject(oItem);
        }
        oItem = GetNextItemInInventory(oPC);
    }
    object oClanToken = CreateItemOnObject("clantoken", oPC);
    string sClanName = GetLocalString(oPC, "sam_join_clanname");
    string sClanTagName = MakeScriptName(sClanName, 32);
    object oSpecificClanToken = CopyObject(oClanToken, GetLocation(oPC), oPC, sClanTagName);
    DestroyObject(oClanToken);
    SetCampaignString("SOTS", "sam_clanname", sClanName,oSpecificClanToken);
    SetCampaignString("SOTS", "sam_clan", sClanName,oPC);
    SetCampaignInt("SOTS", "sam_isclanmember", TRUE,oPC);
    WriteTimestampedLogEntry(GetName(oPC) + " is now a member of " + sClanName);
}
