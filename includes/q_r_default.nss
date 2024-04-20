////////////////////////////////////////////////////////////////////////////////
// MWMDRAGON's Quest Item Removal and Reward Script
//q_r_questnumber
//
// Quest NPC Name:
// Quest Number:
////////////////////////////////////////////////////////////////////////////////

// Persistant Quest Journal Include
#include "pjq_inc"

void main()
{

    int nItemCount1;
    int nItemCount2;
    int nItemCount3;
    int nItemCount4;
    int nItemCount5;
    int nItemCount6;

    nItemCount1 = 0;
    nItemCount2 = 0;
    nItemCount3 = 0;
    nItemCount4 = 0;
    nItemCount5 = 0;
    nItemCount6 = 0;

    object oPC;
    oPC = GetPCSpeaker();
    int nPCLevel;
    nPCLevel = GetHitDice(oPC);

    object oItem1;
    object oItem2;
    object oItem3;
    object oItem4;
    object oItem5;
    object oItem6;

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

    int TAKEGOLD = GetLocalInt(OBJECT_SELF, "TAKEGOLD");
    int GIVEGOLD = GetLocalInt(OBJECT_SELF, "GIVEGOLD");
    int XPREWARD = GetLocalInt(OBJECT_SELF, "XPREWARD");
    string ITEMREWARD = GetLocalString(OBJECT_SELF, "ITEMREWARD"); //resref
    string QUESTNUMBER = GetLocalString(OBJECT_SELF, "QUESTNUMBER");//needs to be string even though it is a number

// Item 1 removeal Loop *****************************************************(1)

    oItem1 = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem1))
        {
        // Check the tag on the current item
        if (GetTag(oItem1) == TAGITEM1 && nItemCount1 <AMTTAKEITEM1) // Item tag and amount to take
            {
            DestroyObject(oItem1);
            nItemCount1 = nItemCount1 + 1;
            }
        // Now move on to the next item
        oItem1 = GetNextItemInInventory(oPC);
        } // End while loop

// Item 2 removeal Loop *****************************************************(2)

    oItem2 = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem2))
        {
        // Check the tag on the current item
        if (GetTag(oItem2) == TAGITEM2 && nItemCount2 <AMTTAKEITEM2) // Item tag and amount to take
            {
            DestroyObject(oItem2);
            nItemCount2 = nItemCount2 + 1;
                        }
        // Now move on to the next item
        oItem2 = GetNextItemInInventory(oPC);
        } // End while loop

// Item 3 removeal Loop *****************************************************(3)

    oItem3 = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem3))
        {
        // Check the tag on the current item
        if (GetTag(oItem3) == TAGITEM3 && nItemCount3 <AMTTAKEITEM3) // Item tag and amount to take
            {
            DestroyObject(oItem3);
            nItemCount3 = nItemCount3 + 1;
            }
        // Now move on to the next item
        oItem3 = GetNextItemInInventory(oPC);
        } // End while loop

// Item 4 removeal Loop *****************************************************(4)

    oItem4 = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem4))
        {
        // Check the tag on the current item
        if (GetTag(oItem4) == TAGITEM4 && nItemCount4 <AMTTAKEITEM4) // Item tag and amount to take
            {
            DestroyObject(oItem4);
            nItemCount4 = nItemCount4 + 1;
            }
        // Now move on to the next item
        oItem4 = GetNextItemInInventory(oPC);
        } // End while loop

// Item 5 removeal Loop *****************************************************(5)

    oItem5 = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem5))
        {
        // Check the tag on the current item
        if (GetTag(oItem5) == TAGITEM5 && nItemCount5 <AMTTAKEITEM5) // Item tag and amount to take
            {
            DestroyObject(oItem5);
            nItemCount5 = nItemCount5 + 1;
            }
        // Now move on to the next item
        oItem5 = GetNextItemInInventory(oPC);
        } // End while loop

// Item 6 removeal Loop *****************************************************(6)

    oItem6 = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oItem6))
        {
        // Check the tag on the current item
        if (GetTag(oItem6) == TAGITEM6 && nItemCount6 <AMTTAKEITEM6) // Item tag and amount to take
            {
            DestroyObject(oItem6);
            nItemCount6 = nItemCount6 + 1;
            }
        // Now move on to the next item
        oItem6 = GetNextItemInInventory(oPC);
        } // End while loop

// Gold Removal *****************************************************(Take Gold)

        AssignCommand(oPC, TakeGoldFromCreature(TAKEGOLD, oPC, TRUE));
//
// Reward Area *********************************************************(Reward)

// GOLD ************************************************************************
    // Gold
    GiveGoldToCreature(oPC, GIVEGOLD);

// EXP *************************************************************************

    // Experience
    GiveXPToCreature(oPC, XPREWARD);

// ITEM ************************************************************************

    // Item
    CreateItemOnObject(ITEMREWARD, oPC); // Uses the items resref

// Persistan Journal Quest Removal ********************************(RemoveQuest)

    //RemovePersistentJournalQuestEntry("QUESTNUMBER", oPC, FALSE, FALSE);
    RemoveJournalQuestEntry(QUESTNUMBER, oPC, FALSE, FALSE);

} // End script

