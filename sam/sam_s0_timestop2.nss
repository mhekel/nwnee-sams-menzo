//TOCATTATRASH - READ ME
//::///////////////////////////////////////////////
//:: Time Stop
//:: NW_S0_TimeStop.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
#include "NW_I0_GENERIC"
#include "x2_inc_spellhook"

//Change these setting to alter the spell's characteristics
float fDur     = IntToFloat(d4(1)+1)*6.0;// This is the formula for accurate 3rd ed.
float fDist    = 60.0; // Radius in meters -- for a wider area of affect increase this
float iLockTimer = 60.0;//Spell Time Lock duration (in seconds, use float values)
float f60togo = ( 60 - iLockTimer ) * -1;//Defining time variables
float f30togo = ( 30 - iLockTimer ) * -1;//Defining time variables
object oCTarget = GetLastSpellCaster();//Checking spell's caster
int iTimer = GetLocalInt(oCTarget, "TSTimer");//Checking if he used TS recently
string sSpellName = "Time Stop";

// Function to control Time Stop effects
void TSEffects(object oEffector, object oCaster)
{
// Clear the creature(s) action que
AssignCommand(oEffector,ClearAllActions(TRUE));
// Make module dominate the creature(s) for fDur seconds & Freeze the Animation to look like time stopped
AssignCommand(GetModule(),ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectPetrify(),oEffector,fDur));
ApplyEffectToObject(DURATION_TYPE_TEMPORARY,EffectVisualEffect(VFX_DUR_PETRIFY),oEffector,fDur);
    }
// Function to get creature(s) within radius and apply the alternate Time
// Stop
void TimeStop(object oTarget)
{
    object oNearestC;  // Define nearest creature

    // Begin loop to find all creatures within the fDist meter radius
    oNearestC = GetFirstObjectInShape(SHAPE_SPHERE, fDist,
    GetSpellTargetLocation(), FALSE, OBJECT_TYPE_CREATURE);
    while(GetIsObjectValid(oNearestC))
    {
    // To make sure it doesn't stop the caster or caster's familiar,
    // first henchman, or summons
        if ((oNearestC != oTarget) &&
           (GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oTarget) !=oNearestC) &&
           (GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oTarget) != oNearestC) &&
           (GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oTarget) != oNearestC) &&
           (GetAssociate(ASSOCIATE_TYPE_SUMMONED, oTarget) != oNearestC))
        {
            // Start the Time Stop effects
            DelayCommand(0.75,TSEffects(oNearestC,oTarget));
        }
        // Get the next creature in the fDist meter radius and continue loop
        oNearestC = GetNextObjectInShape(SHAPE_SPHERE, fDist,GetSpellTargetLocation(), FALSE, OBJECT_TYPE_CREATURE);
    }
}

// Begin Main Function
void main()
{
    if (!X2PreSpellCastCode())
    {
    // If code within the PreSpellCastHook (i.e. UMD) reports FALSE, do not run this spell
        return;
    }
// End of Spell Cast Hook
    if (iTimer == 0)
    {
    SetLocalInt(oCTarget, "TSTimer", 1);
    //Signal event to start the Time Stop
    SignalEvent(OBJECT_SELF, EventSpellCastAt(OBJECT_SELF, SPELL_TIME_STOP, FALSE));
    // Begin custom Time Stop
    TimeStop(OBJECT_SELF);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), GetSpellTargetLocation());
    SendMessageToPC(oCTarget, "Time Stop Cool Down has a timer of "+FloatToString(iLockTimer, 3, 1)+" seconds. You may not use Time Stop again for this period of time. Attempting to do so will spend the spell while producing no effect.");
    DelayCommand(f60togo, SendMessageToPC(oCTarget, "You have one minute left on your Time Stop Cool Down Timer."));
    DelayCommand(f30togo, SendMessageToPC(oCTarget, "You have thirty seconds left on your Time Stop Cool Down Timer."));
    DelayCommand(iLockTimer, SendMessageToPC(oCTarget, "Time Stop is once again available for use."));
    DelayCommand(iLockTimer, SetLocalInt(oCTarget, "TSTimer", 0));
    }
    else
    {
    SendMessageToPC(oCTarget, "You have used Time Stop too recently, the effect has been cancelled");
    }
}



