#include "spw_inc"
#include "sam_timecheck"
//#include "sha_subr_methds"

object oPC = GetExitingObject();

void main()
{

    // For all script and system additions by KMdS
    ExecuteScript("kmds_on_exit", OBJECT_SELF);

    if(GetIsObjectValid(oPC) && GetIsPC(oPC)) {
        WriteTimestampedLogEntry(GetName(oPC) + " has exited the module");
    }
    if (!GetIsDM(oPC)) {

        if (GetIsObjectValid(oPC) && !GetLocalInt(oPC, "sam_initializing")) {
            SetCampaignInt("SOTS", "sam_hps", GetCurrentHitPoints(oPC),oPC);

        }
        if (GetIsObjectValid(oPC)) SetCampaignInt("SOTS", "sam_lastlogout", SecondsSinceStart(),oPC);
    }

    //Shayan Subrace
    SubraceOnClientLeave();
}
