/*::///////////////////////////////////////////////
//:: Default:Area Based Subrace Start locator
//:: sam_goto_start
//:://////////////////////////////////////////////
//:: Rewritten By: Christine Reynolds
//::////////////////////////////////////////////*/
#include "spw_inc"
#include "hc_inc_subrace"
void main()
{
//defining the PC for using the script on the Hall of Rememberance exit door
object oPC;
    if(GetObjectType(OBJECT_SELF) == OBJECT_TYPE_DOOR)
    {
    oPC = GetEnteringObject();
    }
    else
    {
    oPC = OBJECT_SELF;
    }

    if (GetIsPC(oPC) && !GetIsDM(oPC))
    {
      if(GetCampaignInt("SOTS", "st_client_server_entered",oPC) == 1)
      {
            if (GetIsDead(oPC))
            {
            effect eRez = EffectResurrection();
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eRez, oPC);
            }

            AssignCommand(oPC, ClearAllActions());
            if (GetCampaignInt("SOTS", "sam_imprisoned",oPC))
            {
                AssignCommand(oPC, ActionJumpToLocation(GetLocation(GetObjectByTag("sam_torture_chamber"))));
            }
            else
            {
                location start = GetLocation(GetObjectByTag("SAM_start_location"));
                /*if ((IsDrow(oPC) && (GetAlignmentGoodEvil(oPC) != ALIGNMENT_GOOD)))
                {

                }
                if (IsUndead(oPC))
                {
                    start = GetLocation(GetWaypointByTag("WP_OOCStart_UD"));
                }
                if (IsMonster(oPC))
                {
                    start = GetLocation(GetWaypointByTag("WP_OOCStart_UD"));
                }*/

                location saved = GetCampaignLocation("LOCATIONS", "sam_location",oPC);
                if (GetAreaFromLocation(saved) != OBJECT_INVALID && GetResRef(GetAreaFromLocation(saved)) != "forestofcreation" && GetResRef(GetAreaFromLocation(saved)) != "ar_hall_rem")
                {
                start = saved;
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1), start);
                AssignCommand(oPC, ActionJumpToLocation(start));
                }
                else if(GetRacialType(oPC) == RACIAL_TYPE_DWARF)
                {
                start = GetLocation(GetWaypointByTag("WP_OOCStart"));
                AssignCommand(oPC, ActionJumpToLocation(start));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1), start);
                }
                else if(IsDrow(oPC) && (GetAlignmentGoodEvil(oPC) != ALIGNMENT_GOOD))
                {
                start = GetLocation(GetWaypointByTag("WP_OOCStart"));
                AssignCommand(oPC, ActionJumpToLocation(start));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1), start);
                }
                else if(IsMonster(oPC))
                {
                start = GetLocation(GetWaypointByTag("WP_OOCStart"));
                AssignCommand(oPC, ActionJumpToLocation(start));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1), start);
                }
                else if(Subrace_GetIsUndead(oPC) != FALSE)
                {
                start = GetLocation(GetWaypointByTag("WP_OOCStart"));
                AssignCommand(oPC, ActionJumpToLocation(start));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1), start);
                }
                else
                {
                AssignCommand(oPC, ActionJumpToLocation(start));
                ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_1), start);
                }
            }
      }
    }
}

