#include "hc_inc_subrace"

void main()
{
    if (GetLocalInt(OBJECT_SELF, "xp_awarded") != 1) {
        object oPC = GetLastUnlocked();
        int nDC = GetLockUnlockDC(OBJECT_SELF);
        if (nDC < 20) nDC = 20;
        int nXP = (nDC - 16) * 10;
        GiveXPToCreature(oPC, GetSubRaceXP(nXP, oPC));
        SetLocalInt(OBJECT_SELF, "xp_awarded", 1);
    }
}
