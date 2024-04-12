#include "spw_inc"

void main()
{
    object oMod = GetModule();
    SetCampaignInt("UDSM", "sam_hour", GetTimeHour(),oMod);
    SetCampaignInt("UDSM", "sam_ms", GetTimeMillisecond(),oMod);
    SetCampaignInt("UDSM", "sam_minute", GetTimeMinute(),oMod);
    SetCampaignInt("UDSM", "sam_second", GetTimeSecond(),oMod);
    SetCampaignInt("UDSM", "sam_year", GetCalendarYear(),oMod);
    SetCampaignInt("UDSM", "sam_month", GetCalendarMonth(),oMod);
    SetCampaignInt("UDSM", "sam_day", GetCalendarDay(),oMod);
}
