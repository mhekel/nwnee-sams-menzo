#include "spw_inc"

int StartingConditional()
{
    int iResult;
    object oPC = GetPCSpeaker();
    iResult = GetCampaignInt("SOTS", "sam_isclanmember",oPC) == TRUE;
    if (iResult) {
        SetCustomToken(7523, GetCampaignString("SOTS", "sam_clan",oPC));
    }
    return iResult;
}
