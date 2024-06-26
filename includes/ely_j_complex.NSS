//::///////////////////////////////////////////////
//:: TEMPLATES: Complex Plot Header
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By: DM Elysium
//:: Created On:  December
//:://////////////////////////////////////////////


//::///////////////////////////////////////////////
//:: Global
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 this returns the object where
 plot globals for this plot are suppose
 to be stored

*/
//:://////////////////////////////////////////////
//:: Created By:   Brent
//:: Created On:   December
//:://////////////////////////////////////////////

object Global()
{
    return GetLocalObject(OBJECT_SELF,"ELY_SOTS_GLOBALS");
}

//::///////////////////////////////////////////////
//:: SetGlobal
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
   Sets where all the globals for this plot
   are going to be stored.
*/
//:://////////////////////////////////////////////
//:: Created By: DM Elysium
//:: Created On:  December
//:://////////////////////////////////////////////

void SetGlobal(object oTarget, object oGlobal)
{
    SetLocalObject(oTarget,"ELY_SOTS_GLOBALS", oGlobal);
}


//::///////////////////////////////////////////////
//:: SetPlotTag
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void SetPlotTag(string sTag)
{
    SetLocalString(Global(), "ELY_SOTS_PLOT_TAG", sTag);
}
//::///////////////////////////////////////////////
//:: GetPlotTag
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

string GetPlotTag()
{
    return GetLocalString(Global(), "ELY_SOTS_PLOT_TAG");
}

//::///////////////////////////////////////////////
//:: SetArtifactItem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
void SetComplexItem(string sTag)
{
   SetLocalString(Global(), "ELY_SOTS_ITEM", sTag);
}

//::///////////////////////////////////////////////
//:: GetArtifactItem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

string GetComplexItem()
{
    return GetLocalString(Global(), "ELY_SOTS_ITEM");
}

//::///////////////////////////////////////////////
//:: PlayerHasArtifactItem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Checks if player has fetch item.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////
int PlayerHasComplexItem(object oPC)
{
    return GetIsObjectValid(GetItemPossessedBy(oPC,GetComplexItem()));
}
//::///////////////////////////////////////////////
//:: TakeFetchItem
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Removes the fetch item from player inventory.
*/
//:://////////////////////////////////////////////
//:: Created By:
//:: Created On:
//:://////////////////////////////////////////////

void TakeComplexItem(object oPC)
{
    object oItem =  GetItemPossessedBy(oPC,GetComplexItem());
    if (GetIsObjectValid(oItem) == TRUE)
    {
        DestroyObject(oItem);
    }
}


