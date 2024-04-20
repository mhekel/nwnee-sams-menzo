#include "spw_inc"

void main()
{
    object oPC = GetPCSpeaker();
    int nInClan = GetCampaignInt("SOTS", "sam_isclanmember",oPC);
    if (!nInClan) {
        SendMessageToPC(oPC, "You are not in a clan.");
        return;
    }
    string sClanName = GetCampaignString("SOTS", "sam_clan",oPC);
    object oOther = GetFirstPC();
    while(GetIsObjectValid(oOther)) {
        if (oOther != oPC) {
            if (GetCampaignInt("SOTS", "sam_isclanmember",oOther)) {
                string sOtherClanName = GetCampaignString("SOTS", "sam_clan",oOther);
                if (sOtherClanName == sClanName) {
                    SendMessageToPC(oPC, GetName(oOther) + " is in " + GetName(GetArea(oOther)) + ".");
                }
            }
        }
        oOther = GetNextPC();
    }
}
