#include "x2_inc_switches"
#include "omw_plns"

//Count items
int GetNumItems(object oPC,string sItem)
{
int nNumItems = 0;
object oItemcount = GetFirstItemInInventory(oPC);
while (GetIsObjectValid(oItemcount) == TRUE)
{
if (GetTag(oItemcount) == sItem)
{
nNumItems = nNumItems + GetNumStackedItems(oItemcount);
}
oItemcount = GetNextItemInInventory(oPC);
}
return nNumItems;
}

// Main Script
void main()
{
// Loot Notification
RunLootNotificationOnAcquire();

object oItem = GetModuleItemAcquired();
object oPC = GetModuleItemAcquiredBy();
string sItemTag = GetTag(oItem);
int iDroppable = GetDroppableFlag(oItem);

    if (GetIsPC(GetItemPossessor(oItem)))
        {
        SetLocalInt(oItem, "PCItem", 1);
        }

object oAcquirer = GetItemPossessor(oItem);

    if (GetIsPC(oPC) == TRUE)
        {
        string sNoDrop = GetStringLeft(GetTag (oItem), 7);
        if(sNoDrop == "NODROP_")
            {
            SetItemCursedFlag(oItem, TRUE);
            }

        string sLore = GetStringLeft(GetTag (oItem), 5);
        if(sLore == "LORE_")
            {
            if (GetNumItems(oPC, sItemTag) > 1)
                {
                DestroyObject(oItem, 0.3);
                FloatingTextStringOnCreature("This item is LORE, so you can only possess one at a time.", oPC);
                }
            }
        }


}


