//Modified into a pseudo heartbeat to be initiated from the on client enter
// event script.  The scripts will loop at a random interval of 91 to 190 seconds.
// KMdS

#include "aps_include"
#include "_colors"

void main()
{
    object oPC = OBJECT_SELF;
    if(!GetIsDM(oPC)){
        ExportSingleCharacter(oPC);
//      SendMessageToPC(oPC, GREEN+"Your character has been auto saved.");
        SetCampaignInt("UDSM", "sam_hps", GetCurrentHitPoints(oPC),oPC);

      if(GetCampaignInt("UDSM", "st_client_server_entered",oPC) == 1)
        {
        location lPC = GetLocation(oPC);
        if (GetIsObjectValid(GetAreaFromLocation(lPC))) {
            SetCampaignInt("UDSM", "sam_location_saved", TRUE,oPC);
            SetCampaignLocation("LOCATIONS", "sam_location", lPC,oPC);
        }
        }
        // Reiterate this script every 91 to 190 seconds.
        DelayCommand(90.0f+d100(), ExecuteScript("sam_save_char", oPC));
    }
}
