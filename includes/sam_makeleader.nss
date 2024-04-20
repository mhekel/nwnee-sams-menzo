#include "sam_inc"
#include "spw_inc"

void main()
{
    object oBard = OBJECT_SELF;
    object oPC = GetPCSpeaker();
    if (GetGold(oPC) < 1000000) {
        return;
    } else {
        TakeGoldFromCreature(1000000, oPC, TRUE);
    }
    object oItem = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem)) {
        string sResRef = GetResRef(oItem);
        if (sResRef == "clanrod" || sResRef == "clantoken") {
            DestroyObject(oItem);
        }
        oItem = GetNextItemInInventory(oPC);
    }
    object oClanRod = CreateItemOnObject("clanrod", oBard);
    object oClanToken = CreateItemOnObject("clantoken", oBard);
    string sClanName = GetLocalString(oBard, "sam_clanname");
    string sClanTagName = MakeScriptName(sClanName, 32);
    object oSpecificClanRod = CopyObject(oClanRod, GetLocation(oPC), oPC, sClanTagName);
    object oSpecificClanToken = CopyObject(oClanToken, GetLocation(oPC), oPC, sClanTagName);
    DestroyObject(oClanRod);
    DestroyObject(oClanToken);
    SetCampaignString("SOTS", "sam_clan", sClanName,oPC);
    SetCampaignInt("SOTS", "sam_isclanmember", TRUE,oPC);
    SetCampaignString("SOTS", "sam_clanname", sClanName,oSpecificClanToken);
    SetCampaignString("SOTS", "sam_clanname", sClanName,oSpecificClanRod);
    SetCampaignInt("SOTS", sClanName, TRUE,oBard);
    WriteTimestampedLogEntry(GetName(oPC) + " is now the leader of " + sClanName + ".");
}
