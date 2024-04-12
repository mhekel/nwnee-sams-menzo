void main()
{
object oTarget = GetNearestObjectByTag("sam_general_store");
int nCount = GetLocalInt(oTarget, "OPENED");
if (nCount == 10)
{
    nCount = 0;
    object oItem = GetFirstItemInInventory(oTarget);
    while (GetIsObjectValid(oItem))
    {
        string sTag = GetTag(oItem);
        int nItems = GetLocalInt(oTarget, sTag);
        if (nItems == 1)
        {
            DestroyObject(oItem);
        }
        else
        {
            SetLocalInt(oTarget, sTag, 1);
        }
            oItem = GetNextItemInInventory(oTarget);
        }
        oItem = GetFirstItemInInventory(oTarget);
        while (GetIsObjectValid(oItem))
        {
            string sTag = GetTag(oItem);
            SetLocalInt(oTarget, sTag, 0);
            oItem = GetNextItemInInventory(oTarget);
        }
    }
    else
    {
        nCount++;
    }
    SetLocalInt(oTarget, "OPENED", nCount);
    OpenStore(oTarget, GetPCSpeaker());
}
