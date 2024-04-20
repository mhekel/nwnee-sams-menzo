//::///////////////////////////////////////////////
//:: Example XP2 OnActivate Script Script
//:: x2_mod_def_act
//:: (c) 2003 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Put into: OnItemActivate Event

*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: 2003-07-16
//:://////////////////////////////////////////////
#include "horse_include"
#include "x2_inc_switches"
void main()
{
     object oItem = GetItemActivated();
     object oPlayer = GetItemActivator();
     string sType = GetStringRight(GetTag (oItem), 5);
     GPA_OnActivate(oPlayer,oItem);


// UOAbigail crafting hook *****************************************************
//     object oPC = GetItemActivator();
//     object oTarget = GetItemActivatedTarget();
//     location lTarget = GetItemActivatedTargetLocation();
//
//     if (GetStringLeft(GetTag(oItem),5)=="_uoa_")
//      {
//       SetLocalObject(oPC,"oItemActivated",oItem);
//       SetLocalObject(oPC,"oItemActivatedTarget",oTarget);
//       SetLocalLocation(oPC,"lItemActivatedTarget",lTarget);
//       AssignCommand(oPC,ExecuteScript("_uoa_activate",oPC));
//       return;
//      }
//     if (GetStringLeft(GetStringRight(GetTag(oItem),8),5)=="_FOOD")
//      {
//       SetLocalObject(oPC,"oItemActivated",oItem);
//       SetLocalObject(oPC,"oItemActivatedTarget",oTarget);
//       SetLocalLocation(oPC,"lItemActivatedTarget",lTarget);
//       AssignCommand(oPC,ExecuteScript("_uoa_activate2",oPC));
//       return;
//      }
//End of UOAbigail Crafting hook ***********************************************

// FEIGN DEATH *****************************************************************
     if(GetTag (oItem) == "feigndeath")

    {
        ExecuteScript("feigndeath",oPlayer);
        return;
    }
// *****************************************************************************

if(GetTag (oItem) == "bandages")

    {
        ExecuteScript("bandagesx",oPlayer);
        return;
    }
// *****************************************************************************

if(GetTag (oItem) == "rations")

    {
        ExecuteScript("rationsx",oPlayer);
        return;
    }
// *****************************************************************************

if(GetTag (oItem) == "ironrations")

    {
        ExecuteScript("ironrationsx",oPlayer);
        return;
    }
// FISHING ITEMS ***************************************************************

//    // FISHING RODS

    if((GetTag (oItem) == "fishingrod")|(GetTag (oItem) == "smallfishingrod"))

    {
        ExecuteScript("fish_fishing",oPlayer);
        return;
    }

//    // FISHING BAITS

    if(GetTag (oItem) == "fishingbait")

    {
        ExecuteScript("fish_bait",oPlayer);
        return;
    }

// *****************************************************************************

// EAT FOODS *******************************************************************

    if(sType == "_FOOD")

    {
        ExecuteScript("food",oPlayer);
        return;
    }


// *****************************************************************************

// Drinks *******************************************************************

    if(sType == "DRINK")

    {
        ExecuteScript("drink",oPlayer);
        return;
    }


// *****************************************************************************

// NQ Player Guide *************************************************************

if(GetTag (oItem) == "nq_playguide")
        AssignCommand (oPlayer, ActionStartConversation (oPlayer, "playerguide", TRUE));

// End of NQ Player Guide ******************************************************

// EMOTE WAND ******************************************************************
     if(GetTag (oItem) == "emotewand")
        AssignCommand (oPlayer, ActionStartConversation (oPlayer, "emotewand", TRUE));
// End Emote Wand **************************************************************


     // * Generic Item Script Execution Code
     // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // * it will execute a script that has the same name as the item's tag
     // * inside this script you can manage scripts for all events by checking against
     // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
     {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_ACTIVATE);
        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
        {
           return;
        }

     }
// *****************************************************************************

}
