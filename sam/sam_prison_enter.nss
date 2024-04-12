#include "spw_inc"

void UnequipIfValidObject(object oItem) {
    if (GetIsObjectValid(oItem)) {
        ActionUnequipItem(oItem);
    }
}

void UnequipAllItems() {
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_ARMS));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_ARROWS));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_BELT));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_BOLTS));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_BOOTS));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_BULLETS));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_CARMOUR));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_CHEST));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_CLOAK));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_HEAD));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_LEFTHAND));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_LEFTRING));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_NECK));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND));
        UnequipIfValidObject(GetItemInSlot(INVENTORY_SLOT_RIGHTRING));
}

void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) && !GetIsDM(oPC)) {
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oPC, UnequipAllItems());
    }
}
