int CurrentTimeMillis()
{
    int time = GetTimeMillisecond();
    time += GetTimeSecond() * 1000;
    time += GetTimeMinute() * 60 * 1000;
    time += GetTimeHour() * 60 * 60 * 1000;
    time += GetCalendarDay() * 24 * 60 * 60 * 1000;
    time += GetCalendarMonth() * 28 * 24 * 60 * 60 * 1000;
    return time;
}
