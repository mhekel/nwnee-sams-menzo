#include "spw_inc"

void main()
{
    object oPC = OBJECT_SELF;
    if (GetIsPC(oPC)) {
        ExportSingleCharacter(oPC);
        SetCampaignInt("UDSM", "sam_hps", GetCurrentHitPoints(oPC),oPC);

      if(GetCampaignInt("UDSM", "st_client_server_entered",oPC) == 1)
      {
        location lPC = GetLocation(oPC);
        object oArea = GetAreaFromLocation(lPC);
        if (GetIsObjectValid(oArea) && GetName(oArea) != "") {
            SetCampaignInt("UDSM", "sam_location_saved", TRUE,oPC);
            SetCampaignLocation("LOCATIONS", "sam_location", lPC,oPC);
        }
     }
    }
}
