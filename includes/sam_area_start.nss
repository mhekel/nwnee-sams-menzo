#include "spw_inc"

void main()
{
    // Move the player to their stored location
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC)) {
      if(GetCampaignInt("SOTS", "st_client_server_entered",oPC) == 1)
      {
        int nPlayerMoved = GetLocalInt(oPC, "sam_location_set");
        if (!nPlayerMoved) {
            SetLocalInt(oPC, "sam_location_set", TRUE);
            location lPC = GetCampaignLocation("LOCATIONS", "sam_location",oPC);
            if (GetIsObjectValid(GetAreaFromLocation(lPC))) {
                AssignCommand(oPC, JumpToLocation(lPC));
            }
        }
      }
    }
}
