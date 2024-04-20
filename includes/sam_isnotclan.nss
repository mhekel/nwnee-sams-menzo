#include "spw_inc"

int StartingConditional()
{
    int iResult;
    object oPC = GetPCSpeaker();
    iResult = GetCampaignInt("SOTS", "sam_isclanmember",oPC) != TRUE;
    return iResult;
}
