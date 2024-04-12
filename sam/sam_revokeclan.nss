#include "spw_inc"

void main()
{
    object oPC = GetPCSpeaker();
    SetCampaignInt("UDSM", "sam_isclanmember", FALSE,oPC);
    DeleteCampaignVariable("UDSM", "sam_clan",oPC);
    object oItem = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem)) {
        string sResRef = GetResRef(oItem);
        if (sResRef == "clanrod" || sResRef == "clantoken") {
            DestroyObject(oItem);
        }
        oItem = GetNextItemInInventory(oPC);
    }
}
