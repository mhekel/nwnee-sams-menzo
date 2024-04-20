// Medding and Resting script for NeverQuest

// includes to get functions not normally available.
#include "x0_i0_position"
#include "x2_inc_restsys"
#include "x2_inc_switches"

void applyMedittateEffects(object oPC);
void removeMedittateEffects(object oPC);

void main()
{
    object oPC = GetLastPCRested();
    int nCanrest = GetLocalInt(oPC, "canrest");
    int nLevel = GetHitDice(oPC);
    int nCurHP = GetCurrentHitPoints(oPC);
    int nMaxHP = GetMaxHitPoints(oPC);
    int nTakeHP = (nMaxHP - nCurHP);
    int nMeditateHP;
    int nCancelHP;
    int nIsPCdead;
    // Mana Ints
    int iLevel = GetHitDice(oPC);
    int iSpellcraft = GetSkillRank(SKILL_SPELLCRAFT, oPC, FALSE);
    int iGetMaxMana = iLevel * iSpellcraft;
    int iMaxMana = 50 + iGetMaxMana;

// Strip all magical effects on rest //////////////////////////////////////////
        effect eEffect;
        eEffect = EffectDispelMagicAll(40);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC,0.0);

// Called when the rest is started /////////////////////////////////////////////
    if (GetLastRestEventType() == REST_EVENTTYPE_REST_STARTED)
    {

       if (nLevel >= 5)
       {
         if (nCanrest == 0)
            {
///             // Do this for every character
                SetLocalInt(oPC, "cancelhp", nCurHP); // Gets Current hit points before rest
                DelayCommand(240.0f,SetLocalInt(oPC, "canrest", 0));// Delays resting for 4 minutes
                DelayCommand(239.0f,SetPanelButtonFlash(oPC, PANEL_BUTTON_REST, TRUE)); // Turns on the rest button in 8 minutes


            }
            else
            {

///             // Meditating Caster section************************************
                if ((GetLevelByClass(CLASS_TYPE_BARD, oPC)>= 1) || (GetLevelByClass(CLASS_TYPE_CLERIC, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_DRUID, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_SORCERER, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_WIZARD, oPC)>= 1))
                {
                FloatingTextStringOnCreature("You are Meditating, Not Resting.", oPC);
                applyMedittateEffects(oPC);
                SetLocalInt(oPC, "cancelhp", nCurHP);
                SetLocalInt(oPC, "lasthp", nTakeHP);
                }
                else
                {
                // Rested Non Caster********************************************
                AssignCommand(oPC, ClearAllActions());
                FloatingTextStringOnCreature("You can only rest once every 4 Minutes. The rest button will flash when you are able to rest again.", oPC);

                }
            }
        }
           else
           {
           // Recharges Mana to Max
           SetCampaignInt("NQ", "iMana", iMaxMana, oPC);
           }
    }

////
////////////////////////////////////////////////////////////////////////////////
//
//// Called when the rest is finished //////////////////////////////////////////
////

    if (GetLastRestEventType() == REST_EVENTTYPE_REST_FINISHED)
    {
     if (nCanrest == 1)
            {
                // Meditating Done *********************************************
                if ((GetLevelByClass(CLASS_TYPE_BARD, oPC)>= 1) || (GetLevelByClass(CLASS_TYPE_CLERIC, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_DRUID, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_SORCERER, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_WIZARD, oPC)>= 1))
                {
                nMeditateHP = GetLocalInt(oPC, "lasthp");
                effect eEffect;
                eEffect = EffectDamage(nMeditateHP, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_ENERGY);
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC);
                // Recharges Mana to Max
                SetCampaignInt("NQ", "iMana", iMaxMana, oPC);
                removeMedittateEffects(oPC);

                //Raises the PC if for some reason this script kills them
                nIsPCdead = GetIsDead(oPC);
                object oMod = GetModule();
                if (nIsPCdead == TRUE){ AssignCommand(oMod, ActionCastSpellAtObject(SPELL_RAISE_DEAD, oPC, METAMAGIC_NONE, TRUE,40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));}
                }
            }
            else
            {
            // Rest done non casters *******************************************
            if (nLevel >= 5){SetLocalInt(oPC, "canrest", 1);}
            }

    }

////
////////////////////////////////////////////////////////////////////////////////
//
//// Called when the rest is cancelled /////////////////////////////////////////
////

   if (GetLastRestEventType() == REST_EVENTTYPE_REST_CANCELLED)
    {
        // Rest Canceled********************************************************

                if ((GetLevelByClass(CLASS_TYPE_BARD, oPC)>= 1) || (GetLevelByClass(CLASS_TYPE_CLERIC, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_DRUID, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_SORCERER, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_WIZARD, oPC)>= 1))
                {
                if (nCanrest == 0)//Cancel rest allowed Casters
                        {
                            effect eEffect;
                            int nCancelHP = GetLocalInt(oPC, "cancelhp");
                            int nCurCancelHP = GetCurrentHitPoints(oPC);
                            int nTakeCancelHP = (nCurCancelHP - nCancelHP);
                            if (nCurCancelHP >= nMaxHP){nTakeCancelHP = 0;}

                            eEffect = EffectDamage(nTakeCancelHP, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_ENERGY);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC);
                            if (nLevel >= 5){SetLocalInt(oPC, "canrest", 1);}
                            //Raises the PC if for some reason this script kills them
                            nIsPCdead = GetIsDead(oPC);
                            object oMod = GetModule();
                            if (nIsPCdead == TRUE){ AssignCommand(oMod, ActionCastSpellAtObject(SPELL_RAISE_DEAD, oPC, METAMAGIC_NONE, TRUE,40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));}

                        }
                        else //Cancel rest not allowed Casters
                        {
                            nMeditateHP = GetLocalInt(oPC, "lasthp");
                            effect eEffect;
                            eEffect = EffectDamage(nMeditateHP, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_ENERGY);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC);
                            removeMedittateEffects(oPC);
                            //Raises the PC if for some reason this script kills them
                            nIsPCdead = GetIsDead(oPC);
                            object oMod = GetModule();
                            if (nIsPCdead == TRUE){ AssignCommand(oMod, ActionCastSpellAtObject(SPELL_RAISE_DEAD, oPC, METAMAGIC_NONE, TRUE,40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));}
                        }

                }
                else  // Cancel Non Casters
                {
                    if (nCanrest == 0) // Cancel Rest allowed Non Casters
                        {
                            effect eEffect;
                            int nCancelHP = GetLocalInt(oPC, "cancelhp");
                            int nCurCancelHP = GetCurrentHitPoints(oPC);
                            int nTakeCancelHP = (nCurCancelHP - nCancelHP);
                            if (nCurCancelHP >= nMaxHP){nTakeCancelHP = 0;}

                            eEffect = EffectDamage(nTakeCancelHP, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_ENERGY);
                            ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC);
                            if (nLevel >= 5){SetLocalInt(oPC, "canrest", 1);}
                            //Raises the PC if for some reason this script kills them
                            nIsPCdead = GetIsDead(oPC);
                            object oMod = GetModule();
                            if (nIsPCdead == TRUE){ AssignCommand(oMod, ActionCastSpellAtObject(SPELL_RAISE_DEAD, oPC, METAMAGIC_NONE, TRUE,40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));}
                        }
                        else // Cancel Rest Not allowed Non Casters
                        {
                        // Nothing for non casters if not allowed to rest
                        }

                 }



    }



}

////
////////////////////////////////////////////////////////////////////////////////
////
//// Extra functions made for the Meditating Effects //////////////////////////
////
void applyMedittateEffects(object oPC)
{

    if((GetLevelByClass(CLASS_TYPE_BARD, oPC)>= 1) || (GetLevelByClass(CLASS_TYPE_CLERIC, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_DRUID, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_SORCERER, oPC)>= 1)|| (GetLevelByClass(CLASS_TYPE_WIZARD, oPC)>= 1))
    {

        string sID = GetName(oPC) + GetPCPublicCDKey(oPC);

        location lSpBook = GenerateNewLocation(oPC,0.8f, GetFacing(oPC), GetFacing(oPC));

        object oSpellBook =CreateObject(OBJECT_TYPE_PLACEABLE, "x0_tome", lSpBook, FALSE);

        effect ePulse = EffectVisualEffect(VFX_DUR_BLUR);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, ePulse, oSpellBook);
        DelayCommand(80.0, DestroyObject(oSpellBook, 0.0));   // added to help get rid of staying books
        SetLocalObject(GetModule(), "visSpellBook" + sID, oSpellBook);
    }

    effect eBlackOut = EffectVisualEffect( VFX_DUR_BLACKOUT );
    eBlackOut = SupernaturalEffect(eBlackOut);


        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBlackOut, oPC, 20.0);

}
//---------------------------------------------------------------------------
//---------------------------------------------------------------------------
void removeMedittateEffects(object oPC)
{
  effect eOld = GetFirstEffect(oPC);

  while(GetIsEffectValid(eOld)) {
    if( GetEffectSubType(eOld) == SUBTYPE_SUPERNATURAL &&
        GetEffectType(eOld) == EFFECT_TYPE_VISUALEFFECT &&
        GetEffectDurationType(eOld) == DURATION_TYPE_TEMPORARY ) {
      RemoveEffect(oPC, eOld);
      break;
    }
    eOld = GetNextEffect(oPC);
  }

        string sID = GetName(oPC) + GetPCPublicCDKey(oPC);
        object oSpBook
            = GetLocalObject(GetModule(), "visSpellBook" + sID);
        if(GetIsObjectValid(oSpBook)) {
            DestroyObject(oSpBook);
            }
}
//----------------------------------------------------------------------------
