int StartingConditional()
{
    int iResult;

    object oBard = OBJECT_SELF;
    iResult = GetLocalString(oBard, "sam_clanname") != "" && !GetLocalInt(oBard, "sam_clan_exists");
    return iResult;
}
