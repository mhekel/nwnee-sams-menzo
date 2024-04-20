#include "spw_inc"

void main()
{
    object oMod = GetModule();
    SetCampaignInt("SOTS", "sam_hour", GetTimeHour(),oMod);
    SetCampaignInt("SOTS", "sam_ms", GetTimeMillisecond(),oMod);
    SetCampaignInt("SOTS", "sam_minute", GetTimeMinute(),oMod);
    SetCampaignInt("SOTS", "sam_second", GetTimeSecond(),oMod);
    SetCampaignInt("SOTS", "sam_year", GetCalendarYear(),oMod);
    SetCampaignInt("SOTS", "sam_month", GetCalendarMonth(),oMod);
    SetCampaignInt("SOTS", "sam_day", GetCalendarDay(),oMod);
}
