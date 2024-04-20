////////////////////////////////////////////////////////////////////////////////
// MWMDRAGON's Quest Item Conversation Checker
// q_c_questnumber
//
// Quest NPC Name:
// Quest Number:
//
////////////////////////////////////////////////////////////////////////////////

int GetNumItems(object oTarget,string sItem)
{
int nNumItems = 0;
object oItem = GetFirstItemInInventory(oTarget);
while (GetIsObjectValid(oItem) == TRUE)
{
if (GetTag(oItem) == sItem)
{
nNumItems = nNumItems + GetNumStackedItems(oItem);
}
oItem = GetNextItemInInventory(oTarget);
}
return nNumItems;
}

////////////////////////////////////////////////////////////////////////////////


int StartingConditional()
{
object oPC = GetPCSpeaker();

    int AMTTAKEITEM1 = GetLocalInt(OBJECT_SELF, "AMTTAKEITEM1");
    string TAGITEM1  = GetLocalString(OBJECT_SELF, "TAGITEM1");
    int AMTTAKEITEM2 = GetLocalInt(OBJECT_SELF, "AMTTAKEITEM2");
    string TAGITEM2  = GetLocalString(OBJECT_SELF, "TAGITEM2");
    int AMTTAKEITEM3 = GetLocalInt(OBJECT_SELF, "AMTTAKEITEM3");
    string TAGITEM3  = GetLocalString(OBJECT_SELF, "TAGITEM3");
    int AMTTAKEITEM4 = GetLocalInt(OBJECT_SELF, "AMTTAKEITEM4");
    string TAGITEM4  = GetLocalString(OBJECT_SELF, "TAGITEM4");
    int AMTTAKEITEM5 = GetLocalInt(OBJECT_SELF, "AMTTAKEITEM5");
    string TAGITEM5  = GetLocalString(OBJECT_SELF, "TAGITEM5");
    int AMTTAKEITEM6 = GetLocalInt(OBJECT_SELF, "AMTTAKEITEM6");
    string TAGITEM6  = GetLocalString(OBJECT_SELF, "TAGITEM6");
    int HASGOLD = GetGold(oPC);
    int NEEDGOLD = GetLocalInt(OBJECT_SELF, "TAKEGOLD");

    //FloatingTextStringOnCreature("The first quest item is " + TAGITEM1, oPC);
    //string sTest = IntToString(AMTTAKEITEM1);
    //FloatingTextStringOnCreature("The first quest item amount is " + sTest, oPC);
//                      Tag1       #                        Tag2        #                       Tag3        #                       Tag4        #                       Tag5        #                       Tag6        #
if ((GetNumItems(oPC, TAGITEM1) < AMTTAKEITEM1) || (GetNumItems(oPC, TAGITEM2) < AMTTAKEITEM2)|| (GetNumItems(oPC, TAGITEM3) < AMTTAKEITEM3)|| (GetNumItems(oPC, TAGITEM4) < AMTTAKEITEM4)|| (GetNumItems(oPC, TAGITEM5) < AMTTAKEITEM5)|| (GetNumItems(oPC, TAGITEM5) < AMTTAKEITEM6) || (HASGOLD < NEEDGOLD)) return FALSE;

return TRUE;
}
