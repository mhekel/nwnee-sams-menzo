// Archaegeo 2002 Aug 9th
int nConv = FloatToInt(HoursToSeconds(1));

int SecondsSinceStart()
{
    object oMod = GetModule();
    int nCurYear = GetCalendarYear();
    int nCurMonth = GetCalendarMonth();
    int nCurDay = GetCalendarDay();
    int nCurHour = GetTimeHour();
    int nCurMin = GetTimeMinute();
    int nCurSec = GetTimeSecond();

    int nTotal = nCurSec;
    nTotal += nCurMin * 60;
    nTotal += nCurHour * nConv;
    nTotal += nCurDay * 24 * nConv;
    nTotal += nCurMonth * 28 * 24 * nConv;
    nTotal += nCurYear * 12 * 28 * 24 * nConv;

    return nTotal;
}

