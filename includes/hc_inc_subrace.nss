#include "sha_subr_methds"
//Note: a lot of this script should now be obsolete, some parts however still apply or are redone for Shayan's Subrace Engine.
int SHA_GetECL(object oPC)
{
  int iLevel = GetPlayerLevel(oPC);
  if(iLevel > MAXIMUM_PLAYER_LEVEL)
  {
     iLevel = MAXIMUM_PLAYER_LEVEL;
  }
  string Subrace = GetSubRace(oPC);
  if(Subrace == "")
  { return iLevel; }
  else
  {  iLevel += GetECL(oPC); }

  if(iLevel < 0)
  {
     iLevel = 0;
  }
  return iLevel;
}

int SUBRACESYSTEM=1;

/*
//there is now a subrace function for this
int IsUndead(object oPC)
{
    if (GetStringLowerCase(GetSubRace(oPC)) == "undead")
    {
        return TRUE;
    }
    return FALSE;
}*/

int IsDrow(object oPC)
{
    if (GetRacialType(oPC) == RACIAL_TYPE_ELF)
    {
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "drow elf")
        {
            return TRUE;
        }
        else
        {
            return FALSE;
        }
    }
    return FALSE;
}

int IsHalfDragon(object oPC)
{
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "half-red dragon" || sSubRace == "half-blue dragon" || sSubRace == "half-black dragon" || sSubRace == "half-green dragon" || sSubRace == "half-white dragon" || sSubRace == "half-brass dragon" || sSubRace == "half-bronze dragon" || sSubRace == "half-copper dragon" || sSubRace == "half-gold dragon" || sSubRace == "half-silver dragon")
        {
            return TRUE;
        } else {
            return FALSE;
        }
    return FALSE;
}

int IsMonster(object oPC)
{
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "bugbear" || sSubRace == "gnoll" || sSubRace == "goblin" || sSubRace == "kobold" || sSubRace == "kuo-toa" || sSubRace == "lizardfolk" || sSubRace == "ogre" || sSubRace == "orc" || sSubRace == "minotaur" )
        {
            return TRUE;
        } else {
            return FALSE;
        }
    return FALSE;
}


/*// Reworked to enable the application of original ECL and monster effects for PC's ... KMdS
int IsMonster(object oPC)
{
    int nMonsterType = 0;

    if (GetRacialType(oPC) == RACIAL_TYPE_HUMAN)
    {
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if      (sSubRace == "goblin")      nMonsterType = 1;
        else if (sSubRace == "kobold")      nMonsterType = 2;
        else if (sSubRace == "minotaur")    nMonsterType = 3;
        else if (sSubRace == "ogre")        nMonsterType = 4;
        else if (sSubRace == "gnoll")       nMonsterType = 5;
        else if (sSubRace == "lizardfolk")  nMonsterType = 6;
        else if (sSubRace == "orc")         nMonsterType = 7;
        else if (sSubRace == "kua-toa")     nMonsterType = 8;
        else if (sSubRace == "bugbear")     nMonsterType = 9;
    }
    return nMonsterType;
}

object GetEffectEnforcer(string effectname)
{
    object enforcer = GetLocalObject(GetModule(), effectname);
    if (GetIsObjectValid(enforcer))
    {
        return enforcer;
    }
    object subracegod = GetObjectByTag("subracegod");
    enforcer = CreateObject(OBJECT_TYPE_CREATURE, "willowisp001", GetLocation(GetObjectByTag("WP_SUBRACES")));
    SetLocalObject(GetModule(), effectname, enforcer);
    return enforcer;
}

void Subraces_SafeRemoveEffect(object oTarget, effect eEffect)
{
    object oCreator = GetEffectCreator(eEffect);
    if (GetTag(oCreator) != "subracegod")
    {
        RemoveEffect(oTarget, eEffect);
    }
}

object GetLightEffectEnforcer()
{
    return GetEffectEnforcer("SAM_SUBRACE_ENFORCER_light");
}

void GiveUndeadAbilities(object oPC)
{
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID)
    {
        if (GetTag(oItem) == "undead_fear")DestroyObject(oItem);
        if (GetTag(oItem) == "undead_touch") DestroyObject(oItem);
        if (GetTag(oItem) == "undead_control") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_ud_vtouc")))CreateItemOnObject("subrace_ud_vtouc", oPC);
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_ud_fear")))CreateItemOnObject("subrace_ud_fear", oPC);
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_ud_contr")))CreateItemOnObject("subrace_ud_contr", oPC);
}
void GiveHalfYuanTiAbilities(object oPC)
{
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID)
    {
        if (GetTag(oItem) == "hyt_fear")DestroyObject(oItem);
        if (GetTag(oItem) == "hyt_darkness") DestroyObject(oItem);
        if (GetTag(oItem) == "hyt_entangle") DestroyObject(oItem);
        if (GetTag(oItem) == "hyt_neutralize") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_hy_dark")))CreateItemOnObject("subrace_hy_dark", oPC);
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_hy_entag")))CreateItemOnObject("subrace_hy_entag", oPC);
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_hy_fear")))CreateItemOnObject("subrace_hy_fear", oPC);
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_hy_npois")))CreateItemOnObject("subrace_hy_npois", oPC);
}

void GiveHalfRedDragonAbility(object oPC)
{
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID)
    {
        if (GetTag(oItem) == "halfredbreath")DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_hrd")))CreateItemOnObject("subrace_hrd", oPC);
}

void GiveDeepGnomeAbility(object oPC)
{
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID)
    {
        if (GetTag(oItem) == "svirfneblinblur")DestroyObject(oItem);
        if (GetTag(oItem) == "svirfneblinblind")DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_dg_blind")))CreateItemOnObject("subrace_dg_blind", oPC);
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_dg_blur")))CreateItemOnObject("subrace_dg_blur", oPC);
}

void GiveDrowAbility(object oPC)
{
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID)
    {
        if (GetTag(oItem) == "drowability")DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_drow")))CreateItemOnObject("subrace_drow", oPC);
}

void GiveTieflingAbility(object oPC)
{
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID)
    {
        if (GetTag(oItem) == "tieflingdarkness")DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_tiefling")))CreateItemOnObject("subrace_tiefling", oPC);
}

void GiveAluDemonAbility(object oPC)
{
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID)
    {
        if (GetTag(oItem) == "aludemoncharm")DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_aludemon")))CreateItemOnObject("subrace_aludemon", oPC);
}

void GiveCambionAbility(object oPC)
{
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID)
    {
        if (GetTag(oItem) == "cambionfear")DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_cambion")))CreateItemOnObject("subrace_cambion", oPC);
}

void GiveAasimarAbility(object oPC)
{
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID)
    {
        if (GetTag(oItem) == "aasimarlight")DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    if(!GetIsObjectValid(GetItemPossessedBy(oPC, "subrace_aasimar")))CreateItemOnObject("subrace_aasimar", oPC);
}

void ApplyDrowLightEffects(object oTarget, int nDuration = 0)
{
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectAttackDecrease(2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSavingThrowDecrease(SAVING_THROW_ALL, 2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSkillDecrease(SKILL_ALL_SKILLS, 2)), oTarget, IntToFloat(nDuration));
}

void ApplyDuergarLightEffects(object oTarget, int nDuration = 0)
{
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectAttackDecrease(2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSavingThrowDecrease(SAVING_THROW_ALL, 2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSkillDecrease(SKILL_ALL_SKILLS, 2)), oTarget, IntToFloat(nDuration));
}

void ApplyUndeadLightEffects(object oTarget, int nDuration = 0)
{
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectAttackDecrease(2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSavingThrowDecrease(SAVING_THROW_ALL, 2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSkillDecrease(SKILL_ALL_SKILLS, 2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d6(), DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_FIVE), oTarget);
}

void ApplySvirfneblinDarknessEffects(object oPC, int nDuration)
{
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_HIDE, 2), oPC, IntToFloat(nDuration));
}

void HandleSubRaceLocationEffects()
{
    object oPC = OBJECT_SELF;
    object aPCArea = GetAreaFromLocation(GetLocation(oPC));

    if (!GetLocalInt(oPC, "subraceapplied")) return;

    // If it is daytime, it is light outside
    if (GetLocalInt(aPCArea, "sam_underground"))
    {
        if (IsSvirfneblin(oPC))
        {
            // Svirfneblin effect
            ApplySvirfneblinDarknessEffects(oPC, 11);
        }
    }
    if (GetIsDay()) {
        if (GetLocalInt(aPCArea, "sam_outside"))
        {
            if (IsDrow(oPC))
            {
                // Drow effect
                ApplyDrowLightEffects(oPC, 11);
            }
            else if (IsDuergar(oPC))
            {
                ApplyDuergarLightEffects(oPC, 11);
            }
            else if (IsUndead(oPC))
            {
                ApplyUndeadLightEffects(oPC, 11);
            }
        }
    }
    DelayCommand(10.0, HandleSubRaceLocationEffects());
}

void ApplyHalfYuanTiEffects(object oPC)
{
    SendMessageToPC(oPC, "Half Yuan-Ti effects applied.");
    object enforcer = GetEffectEnforcer("hytenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
}

void ApplyDrowEffects(object oPC)
{
    SendMessageToPC(oPC, "Drow effects applied.");
    object enforcer = GetEffectEnforcer("drowenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectSpellResistanceIncrease(GetHitDice(oPC) + 11)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectSavingThrowIncrease(SAVING_THROW_WILL, 2, SAVING_THROW_TYPE_SPELL)), oPC));
}

void ApplySvirfneblinEffects(object oPC)
{
    SendMessageToPC(oPC, "Svirfneblin effects applied.");
    object enforcer = GetEffectEnforcer("svirfneblinenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectSpellResistanceIncrease(GetHitDice(oPC) + 11)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectSavingThrowIncrease(SAVING_THROW_ALL, 2)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectSkillIncrease(SKILL_HIDE, 2)), oPC));
}

void ApplyHalfRedDragonEffects(object oPC)
{
    SendMessageToPC(oPC, "Half-red dragon effects applied.");
    object enforcer = GetEffectEnforcer("halfreddragonenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamageImmunityIncrease(DAMAGE_TYPE_FIRE, 100)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectSavingThrowIncrease(SAVING_THROW_TYPE_MIND_SPELLS, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamageImmunityDecrease(DAMAGE_TYPE_COLD, 50)), oPC));
}

void ApplyAluDemonEffects(object oPC)
{
    SendMessageToPC(oPC, "Alu-Demon effects applied.");
    object enforcer = GetEffectEnforcer("aludemonenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectUltravision()), oPC));
}

void ApplyCambionEffects(object oPC)
{
    SendMessageToPC(oPC, "Cambion effects applied.");
    object enforcer = GetEffectEnforcer("cambionenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
}

void ApplyAasimarEffects(object oPC)
{
    SendMessageToPC(oPC, "Aasimar effects applied.");
    object enforcer = GetEffectEnforcer("aasimarenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_FIRE, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_COLD, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectSkillIncrease(SKILL_LISTEN, 2)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectSkillIncrease(SKILL_SPOT, 2)), oPC));
}

void ApplyTieflingEffects(object oPC)
{
    SendMessageToPC(oPC, "Tiefling effects applied.");
    object enforcer = GetEffectEnforcer("tieflingenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_FIRE, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_COLD, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectSkillIncrease(SKILL_HIDE, 2)), oPC));
}

void ApplyDuergarEffects(object oPC)
{
    SendMessageToPC(oPC, "Duergar effects applied.");
    object enforcer = GetEffectEnforcer("duergarenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectSkillIncrease(SKILL_MOVE_SILENTLY, 4)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_PARALYSIS)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_POISON)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectSpellImmunity(SPELL_PHANTASMAL_KILLER)), oPC));
}

void ApplyGoldDwarfEffects(object oPC)
{
    SendMessageToPC(oPC, "Gold Dwarf effects applied.");
    object enforcer = GetEffectEnforcer("golddwarfenforcer");
}

void ApplySunElfEffects(object oPC) {
    SendMessageToPC(oPC, "Sun Elf effects applied.");
    object enforcer = GetEffectEnforcer("sunelfenforcer");
}

void ApplyWildElfEffects(object oPC)
{
    SendMessageToPC(oPC, "Wild Elf effects applied.");
    object enforcer = GetEffectEnforcer("wildelfenforcer");
}

void ApplyWoodElfEffects(object oPC)
{
    SendMessageToPC(oPC, "Wood Elf effects applied.");
    object enforcer = GetEffectEnforcer("woodelfenforcer");
}

void ApplyUndeadEffects(object oPC)
{
    SendMessageToPC(oPC, "Undead effects applied");
    object enforcer = GetEffectEnforcer("undeadenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectMovementSpeedDecrease(10)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_MIND_SPELLS)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_DEATH)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_NEGATIVE_LEVEL)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_POISON)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_DISEASE)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectRegenerate(1, 6.0)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectTurnResistanceIncrease(4)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectDamageImmunityDecrease(DAMAGE_TYPE_FIRE, 50)), oPC));
}

// Added by KMdS for the True Minotaur used by me to create the full valid creature
void ApplyTrueMinotaurEffects(object oPC)
{
    SendMessageToPC(oPC, "True Minotaur effects applied.");
    object enforcer = GetEffectEnforcer("trueminoenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectACIncrease(5, AC_NATURAL_BONUS)), oPC));
}

// Added missing monster effects ... KMdS
void ApplyMonsterEffects(object oPC)
{
    SendMessageToPC(oPC, "Monster effects applied.");
    object enforcer = GetEffectEnforcer("monsterenforcer");
    int nTypeOfMonster = IsMonster(oPC);
    if      (nTypeOfMonster == 1)   {//No Effects Applied}
    else if (nTypeOfMonster == 2)   {//No Effects Applied}
    else if (nTypeOfMonster == 3)
        AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectACIncrease(5, AC_NATURAL_BONUS)), oPC));
    else if (nTypeOfMonster == 4)
        AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectACIncrease(5, AC_NATURAL_BONUS)), oPC));
    else if (nTypeOfMonster == 5)
        AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectACIncrease(1, AC_NATURAL_BONUS)), oPC));
    else if (nTypeOfMonster == 6)
        AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectACIncrease(5, AC_NATURAL_BONUS)), oPC));
    else if (nTypeOfMonster == 7)   {//No Effects Applied}
    else if (nTypeOfMonster == 8)
        AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectACIncrease(6, AC_NATURAL_BONUS)), oPC));
    else if (nTypeOfMonster == 9)
        AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_INSTANT, SupernaturalEffect(EffectACIncrease(3, AC_NATURAL_BONUS)), oPC));
}

void ApplySubRaceLightEffects(object oTarget, int nDuration=0)
{
    // Drow elves and Gray Dwarves have some sensitivity to light
    if (GetIsPC(oTarget))
    {
        if (IsDrow(oTarget))
        {
        if(GetLocalInt(oTarget, "lightblind")==0)
        {
            // Drow elves are blinded for 1 round (6 seconds) and then have a -1 on attacks, saves, and checks till its done
            object enforcer = GetObjectByTag("subracegod");
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectBlindness()), oTarget, 6.0);
            AssignCommand(enforcer, ActionDoCommand(ApplyDrowLightEffects(oTarget, nDuration)));
            SetLocalInt(oTarget, "lightblind", 1);
            DelayCommand(IntToFloat(nDuration), SetLocalInt(oTarget, "lightblind", 0));
            }
        }
        if (IsDuergar(oTarget))
        {
            // Duergar just have a penalty for operating in light
            object enforcer = GetObjectByTag("subracegod");
            AssignCommand(enforcer, ActionDoCommand(ApplyDuergarLightEffects(oTarget, nDuration)));
        }
    }
}

int ApplySubRaceEffects(object oPC)
{
    int nValue = 0;
    if (IsUndead(oPC))
    {
        ApplyUndeadEffects(oPC);
        nValue = 1;
    }
    if (IsHalfYuanTi(oPC))
    {
        ApplyHalfYuanTiEffects(oPC);
        nValue = 1;
    }
    if (IsDrow(oPC))
    {
        ApplyDrowEffects(oPC);
        nValue = 1;
    }
    if (IsSvirfneblin(oPC))
    {
        ApplySvirfneblinEffects(oPC);
        nValue = 1;
    }
    if (IsAluDemon(oPC))
    {
        ApplyAluDemonEffects(oPC);
        nValue = 1;
    }
    if (IsCambion(oPC)) {
        ApplyCambionEffects(oPC);
        nValue = 1;
    }
    if (IsHalfRedDragon(oPC))
    {
        ApplyHalfRedDragonEffects(oPC);
        nValue = 1;
    }
    if (IsDuergar(oPC))
    {
        ApplyDuergarEffects(oPC);
        nValue = 1;
    }
    if (IsAasimar(oPC)) {
        ApplyAasimarEffects(oPC);
        nValue = 1;
    }
    if (IsGoldDwarf(oPC))
    {
        ApplyGoldDwarfEffects(oPC);
        nValue = 1;
    }
    if (IsTiefling(oPC))
    {
        ApplyTieflingEffects(oPC);
        nValue = 1;
    }
    if (IsSunElf(oPC))
    {
        ApplySunElfEffects(oPC);
        nValue = 1;
    }
    if (IsWildElf(oPC))
    {
        ApplyWildElfEffects(oPC);
        nValue = 1;
    }
    if (IsWoodElf(oPC))
    {
        ApplyWoodElfEffects(oPC);
        nValue = 1;
    }
// Added by KMdS for the True Minotaur used by me to create the full valid creature
    if (IsTrueMino(oPC))
    {
        ApplyTrueMinotaurEffects(oPC);
        nValue = 1;
    }
    // Added missing monster effects routines ... KMdS
    if (IsMonster(oPC))
    {
        ApplyMonsterEffects(oPC);
        nValue = 1;
    }
    return nValue;


}
*/
//Rebuild for Shayan's Subrace system ELC and Favored Classes
int GetSubRaceXP(int nCharXP, object oPC)
{
    int nLevelAdjustment = GetECL(oPC);
    if (nLevelAdjustment != 0)
    {
        int nCurLvl=GetHitDice(oPC);
        int nActualCharXP = nCharXP * (nCurLvl) / (nCurLvl + nLevelAdjustment) ;
        SendMessageToPC(oPC, "Powerful subrace reduced XP from " + IntToString(nCharXP) + " to " + IntToString(nActualCharXP));
        nActualCharXP = FloatToInt(IntToFloat(nActualCharXP) * GetSubraceXPModifier(oPC));
        return nActualCharXP;
    }
    nCharXP = FloatToInt(IntToFloat(nCharXP) * GetSubraceXPModifier(oPC));
    return nCharXP;
}

/*int use_pc_subrace(object oPC = OBJECT_INVALID)
{
    if (oPC == OBJECT_INVALID)
    {
        oPC = GetEnteringObject();
    }
    if (IsDrow(oPC) || IsDuergar(oPC) || IsUndead(oPC))
    {
        AssignCommand(oPC, DelayCommand(6.0, HandleSubRaceLocationEffects()));
    }
    if (GetLocalInt(oPC, "subraceapplied") == 1)
    {
        return 0;
    }
    else
    {
        SetLocalInt(oPC, "subraceapplied", 1);
    }
    int nValue = 0;
    if (GetIsPC(oPC))
    {
        if (IsUndead(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 5);
            GiveUndeadAbilities(oPC);
        }
        if (IsHalfYuanTi(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 2);
            GiveHalfYuanTiAbilities(oPC);
        }
        if (IsHalfRedDragon(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 30);
            GiveHalfRedDragonAbility(oPC);
        }
        if (IsCambion(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 2);
            GiveCambionAbility(oPC);
        }
        if (IsAluDemon(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 1);
            GiveAluDemonAbility(oPC);
        }
        if (IsTiefling(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 1);
            GiveTieflingAbility(oPC);
        }
        if (IsAasimar(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 1);
            GiveAasimarAbility(oPC);
        }
        if (IsDuergar(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 2);
        }
        if (IsDrow(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 2);
            GiveDrowAbility(oPC);
        }
        if (IsSvirfneblin(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 3);
            GiveDeepGnomeAbility(oPC);
        }
        // Added by KMdS for the True Minotaur used by me to create the full valid creature
        if (IsTrueMino(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 2);
        }
        // Added back missing Monster ECL's ... KMdS
        if (IsMonster(oPC))
        {
            int nTypeOfMonster = IsMonster(oPC);
            if      (nTypeOfMonster == 1)   SetLocalInt(oPC, "SAM_leveladjustment", 0);
            else if (nTypeOfMonster == 2)   SetLocalInt(oPC, "SAM_leveladjustment", 0);
            else if (nTypeOfMonster == 3)   SetLocalInt(oPC, "SAM_leveladjustment", 8);
            else if (nTypeOfMonster == 4)   SetLocalInt(oPC, "SAM_leveladjustment", 6);
            else if (nTypeOfMonster == 5)   SetLocalInt(oPC, "SAM_leveladjustment", 3);
            else if (nTypeOfMonster == 6)   SetLocalInt(oPC, "SAM_leveladjustment", 3);
            else if (nTypeOfMonster == 7)   SetLocalInt(oPC, "SAM_leveladjustment", 2);
            else if (nTypeOfMonster == 8)   SetLocalInt(oPC, "SAM_leveladjustment", 4);
            else if (nTypeOfMonster == 9)   SetLocalInt(oPC, "SAM_leveladjustment", 4);
        }

        nValue = ApplySubRaceEffects(oPC);
    }
    return nValue;
}

void ReapplySubRaceEffects(object oPC)
{
    effect eEffect = GetFirstEffect(oPC);
    while(GetIsEffectValid(eEffect))
    {
        object oCreator = GetEffectCreator(eEffect);
        if (GetTag(oCreator) == "subracegod")
        {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    SetLocalInt(oPC, "subraceapplied", FALSE);
    use_pc_subrace(oPC);
}
*/
//void main () {}

