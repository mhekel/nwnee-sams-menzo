#include "x2_inc_switches"
#include "x2_inc_intweapon"
#include "x2_inc_itemprop"
#include "zep_inc_main"

void main()
{

    object oItem = GetPCItemLastUnequipped();
    object oPC   = GetPCItemLastUnequippedBy();
    string sTag = GetTag(oItem);

// AFK Flag remove Action ******************************************************
    if (sTag == "afkflag")
    {
     AssignCommand(oPC, ActionSpeakString("<----- Is back from being AFK",TALKVOLUME_SHOUT));
    }
// End AFK Flag remove action **************************************************


    ZEPGenderRestrict(oItem,oPC);
}
