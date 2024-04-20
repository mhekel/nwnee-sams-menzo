/*::///////////////////////////////////////////////
//:: Default:On Module Load Script
//:: sam_on_mod_load
//:://////////////////////////////////////////////
//::
//:: Updated DM Elysium 03/2024
//::////////////////////////////////////////////*/
#include "spw_inc"
#include "sam_groovy_inc"
#include "sam_inc"
void main()
{


e                      

/*    SQLInit();
    GroovyInit();*/
    object oMod = GetModule();

    SetLocalInt(oMod, "sam_debug", FALSE);
    int nYear = GetCampaignInt("SOTS", "sam_year",oMod);
    int nMonth = GetCampaignInt("SOTS", "sam_month",oMod);
    int nDay = GetCampaignInt("SOTS", "sam_day",oMod);
    SetCalendar(nYear, nMonth, nDay);
    int nHour = GetCampaignInt("SOTS", "sam_hour",oMod);
    int nMillisecond = GetCampaignInt("SOTS", "sam_ms",oMod);
    int nMinute = GetCampaignInt("SOTS", "sam_minute",oMod);
    int nSecond = GetCampaignInt("SOTS", "sam_second",oMod);
    SetTime(nHour, nMinute, nSecond, nMillisecond);
    SetLocalInt(oMod, "sam_save_count", 50);
    ExecuteScript("sam_defaults",oMod);
    SetLocalInt(GetModule(), "dmfi_DMToolLock", 1);
}
