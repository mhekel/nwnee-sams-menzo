#include "sam_inc"

// Despawner Script - Used in OnExit in Area Properties
//
// The purpose of this script is to DestroyObject() all occurences of
// encounter spawned creatures when no PCs are left in the current
// area.
//
/// THCue

int CheckAreaForPCs() {
    // Start up the loop, setting oPC now to the first PC
    object oPC = GetFirstPC();
    // Continue looping until there are no more PCs left
    while (oPC != OBJECT_INVALID)
    {
        // Check the Area against the Area of the current PC
        // If they are the same, exit the function, as we do not need to
        // check anymore PCs
        if (!GetIsDM(oPC) && OBJECT_SELF == GetArea(oPC)) return TRUE;
        // If not, continue to the next PC
        oPC = GetNextPC();
    }
    return FALSE;
}

void DestroyIfValidObject(object o) {
    if (GetIsObjectValid(o) && !GetDroppableFlag(o)) {
        DestroyObject(o);
    }
}

void DespawnThyself() {
    // Make them destroyable
    SetIsDestroyable(TRUE, FALSE, FALSE);
    // Destroy them
    DestroyObject(OBJECT_SELF);
}

void Despawn()
{
    // If PCs, no despawn.
    if (CheckAreaForPCs()) return;

    // If we've made it this far, we know that there aren't any PCs in the area
    // Set oObject to the first object in the Area
    object oObject = GetFirstObjectInArea(OBJECT_SELF);
    // Continue looping until there are no more objects left
    while (oObject != OBJECT_INVALID)
    {
        // Test to see if oObject is a creature spawned from an encounter
        // If so, destroy the object
        if (GetIsEncounterCreature(oObject) || GetLocalInt(oObject, "sam_enc_creature")) {
            // Remove all items from the creatures inventory
            object oItem = GetFirstItemInInventory(oObject);
            while (GetIsObjectValid(oItem)) {
                DestroyIfValidObject(oItem);
                oItem = GetNextItemInInventory(oObject);
            }

            // Destroy all equipped items
            int i;
            for (i = 0; i < NUM_INVENTORY_SLOTS; i++) {
                DestroyIfValidObject(GetItemInSlot(i, oObject));
            }

            // Finally destroy the creature
            AssignCommand(oObject, DespawnThyself());
        }
        if (GetTag(oObject) == "DESTROYME"
            || GetObjectType(oObject) == OBJECT_TYPE_ITEM) {
            if (GetHasInventory(oObject)) {
                // Found a bag in the area
                object oItem = GetFirstItemInInventory(oObject);
                while (GetIsObjectValid(oItem)) {
                    DestroyObject(oItem);
                    oItem = GetNextItemInInventory(oObject);
                }
            }
            DestroyObject(oObject);
        }
        // Move on to the next object
        oObject = GetNextObjectInArea(OBJECT_SELF);
    }
}

// This script executes the area exiting script for the area.
void main() {
    object oPC = GetExitingObject();
    if (oPC != OBJECT_INVALID && GetIsPC(oPC) && !GetIsDM(oPC)) {
        object oArea = OBJECT_SELF;
        string sScript = "sax_" + MakeScriptName(GetTag(oArea), 12);
        ExecuteScript(sScript, oPC);
        // No PCs left, start the timer
        if (!CheckAreaForPCs()) DelayCommand(60.0, Despawn());
    }



}
