//::///////////////////////////////////////////////
//:: Generic On Pressed Respawn Button
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
// * June 1: moved RestoreEffects into plot include
*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   November
//:://////////////////////////////////////////////
#include "nw_i0_plot"

// * Applies an XP and GP penalty
// * to the player respawning
void ApplyPenalty(object oDead)
{
    int nXP;
    int nLevel;
    int nPenalty;
    int nHD;
    int nNewXP;

    nXP = GetXP(oDead);
    nLevel = GetHitDice(oDead);

    if (nLevel <5)
    {
    // Free respawn until level 5
    }

    if (nLevel > 5 && nLevel <=10)
    {
    nPenalty = 50 * GetHitDice(oDead);
    }

    if (nLevel > 10 && nLevel <= 20)
    {
    nPenalty = 100 * GetHitDice(oDead);
    }

    if (nLevel > 20 && nLevel <= 30)
    {
    nPenalty = 150 * GetHitDice(oDead);
    }

    if (nLevel > 30 && nLevel <= 40)
    {
    nPenalty = 200 * GetHitDice(oDead);
    }

    nHD = GetHitDice(oDead);
    nNewXP = nXP - nPenalty;

    SetXP(oDead, nNewXP);

    if (nLevel >5)
    {
    int nGoldToTake =    FloatToInt(0.30 * GetGold(oDead));

    AssignCommand(oDead, TakeGoldFromCreature(nGoldToTake, oDead, TRUE));
    DelayCommand(4.0, FloatingTextStrRefOnCreature(58299, oDead, FALSE));
    DelayCommand(4.8, FloatingTextStrRefOnCreature(58300, oDead, FALSE));
    }
}


void main()
{
    //int nARENA;
    object oRespawner = GetLastRespawnButtonPresser();
    SetLocalInt(oRespawner, "canfish", 0);


///////  Remove Custom Spell Ints //////////////////////////////////////////////

//SetLocalInt(oRespawner, "center", 0);

////////////////////////////////////////////////////////////////////////////////

    // Remove Death Token
    object oItemToTake;
    oItemToTake = GetItemPossessedBy(oRespawner, "deathtoken");
    if(GetIsObjectValid(oItemToTake) != 0)
        DestroyObject(oItemToTake);

    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oRespawner);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oRespawner)), oRespawner);
    RemoveEffects(oRespawner);
    ApplyPenalty(oRespawner);

    // Respawn character at last Bind Point
    //Persistant
    location lBindPoint;
    string sBindPoint = GetCampaignString("NQ", "BindPoint", oRespawner);
    location lBindAffinity = GetCampaignLocation("NQ", "BindLocation",oRespawner);


    //string sBindPoint = GetLocalString(oRespawner, "BindPoint");
    if (sBindPoint != "")
    {

        if (sBindPoint == "BindAffinity")
        {
        lBindPoint = lBindAffinity;
        AssignCommand(oRespawner, JumpToLocation(lBindPoint));
        }
        else
        {
        lBindPoint = GetLocation(GetObjectByTag(sBindPoint));
        AssignCommand(oRespawner, JumpToLocation(lBindPoint));
        }
        // Pretty Lights
        effect eVis = EffectVisualEffect(VFX_IMP_UNSUMMON);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oRespawner);

     }


 }
