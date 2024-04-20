void main()
{
    // If this is the PCs first time here, send them to talk to TBAOTA
    object oPC = GetExitingObject();
    if (GetIsPC(oPC)) {
    SetCampaignInt("SOTS", "st_client_server_entered", 1, oPC);
    /* //We don't want the PC getting ported by this script, we want them to get ported by the sam_goto_start
       //script which will fire from the door out of the hall of rememberance (SAM_tbaota_chamber).
            if (GetLocalInt(oPC, "SAM_first_time")) {
            location tbaota = GetLocation(GetObjectByTag("SAM_tbaota_chamber"));
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionJumpToLocation(tbaota));
        } else {
            ExecuteScript("sam_goto_start", oPC);
        }*/
    }
}
