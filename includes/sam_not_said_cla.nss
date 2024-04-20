int StartingConditional()
{
    int iResult;

    object oBard = OBJECT_SELF;
    iResult = GetLocalString(oBard, "sam_clanname") == "";
    return iResult;
}
