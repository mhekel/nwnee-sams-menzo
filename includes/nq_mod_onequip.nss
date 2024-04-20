#include "x2_inc_switches"
#include "x2_inc_intweapon"
#include "x2_inc_itemprop"
#include "zep_inc_main"

void main()
{

    object oItem = GetPCItemLastEquipped();
    object oPC   = GetPCItemLastEquippedBy();

    string sTag = GetTag(oItem);
    int nItemType = GetBaseItemType(oItem);

// AFK Flag Action *************************************************************
    if (sTag == "afkflag")
    {
     AssignCommand(oPC, ActionSpeakString("<----- Is AFK",TALKVOLUME_SHOUT));
    }
// End AFK Flag Action *********************************************************

// Shield Bash validity check **************************************************
    if ((nItemType == BASE_ITEM_SMALLSHIELD) | (nItemType == BASE_ITEM_LARGESHIELD) | (nItemType == BASE_ITEM_TOWERSHIELD))
   {
    if (nItemType == BASE_ITEM_SMALLSHIELD){;}
    if (nItemType == BASE_ITEM_LARGESHIELD){;}
    if (nItemType == BASE_ITEM_TOWERSHIELD){;}
   }
// End Shield Bash Check *******************************************************


// Level Requirment Items ******************************************************

    int LEVELNEEDED = GetLocalInt(oItem, "LEVELNEEDED");
    int iLevel = GetHitDice(oPC);
    string sThisLevel = IntToString(LEVELNEEDED);
    if (LEVELNEEDED > iLevel)
    {
    ClearAllActions(TRUE);
    SetCommandable(FALSE, oPC);
    DelayCommand(1.0, AssignCommand(oPC, ActionUnequipItem(oItem)));
    DelayCommand(1.0, SetCommandable(TRUE, oPC));
    FloatingTextStringOnCreature("You need to be level (" + sThisLevel + ") to equip this item.", oPC);
    }

// End of Level Requirement Items **********************************************

    ZEPGenderRestrict(oItem,oPC);
}
