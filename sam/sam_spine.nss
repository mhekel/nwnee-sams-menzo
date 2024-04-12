// hc_areanm_enter
// Hardcore Ruleset Wandering critter setup
// Archaegeo July 9, 2002

// To use:  Set WANDERCHANCE to the percent chance of a wandering creature
//          showing up if someone rests in the area.  Set WANDERSTRENGTH to
//          the level of difficulty to be used (1-20).

// Be sure to use a different version of this file (rename it) for each area
// that you need different strength wandering monsters in.

// Place the file once changed in the Areas OnEnter script spot.  If you already
// have one there, just cut and paste the lines below, minus the void main() part.

void main()
{
    int WANDERCHANCE=60; // 10% chance, chance this for more or less
    int WANDERSTRENGTH=5; // Something from the Summon Creature V table
    SetLocalInt(OBJECT_SELF, "WANDERCHANCE", WANDERCHANCE);
    SetLocalInt(OBJECT_SELF, "WANDERSTRENGTH", WANDERSTRENGTH);
    SetLocalInt(OBJECT_SELF, "sam_outside", 1);

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC)) {
        if (GetItemPossessedBy(oPC, "OgreLordPortal") == OBJECT_INVALID) {
            CreateItemOnObject("ogrelordportal", oPC);
        }
    }
}
