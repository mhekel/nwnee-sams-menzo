

//::part 2
//

int SUBRACESYSTEM=1;

int IsUndead(object oPC) {
    if (GetStringLowerCase(GetSubRace(oPC)) == "undead") {
        return TRUE;
    }
    return FALSE;
}

int IsHalfYuanTi(object oPC) {
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "half yuan-ti") {
            return TRUE;
        } else {
            return FALSE;
        }
    return FALSE;
}


int IsDuergar(object oPC) {
    if (GetRacialType(oPC) == RACIAL_TYPE_DWARF) {
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "gray dwarf" || sSubRace == "duergar" || sSubRace == "druegar") {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    return FALSE;
}

int IsDrow(object oPC) {
    if (GetRacialType(oPC) == RACIAL_TYPE_ELF) {
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "drow elf" || sSubRace == "dark elf" || sSubRace == "drow" || sSubRace == "dark") {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    return FALSE;
}

int IsDeepGnome(object oPC) {
    if (GetRacialType(oPC) == RACIAL_TYPE_GNOME) {
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "deep gnome" || sSubRace == "Goblin") {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    return FALSE;
}

int IsHuman(object oPC) {
    return GetRacialType(oPC) == RACIAL_TYPE_HUMAN;
}

int IsElf(object oPC) {
    return GetRacialType(oPC) == RACIAL_TYPE_ELF;
}

int IsWoodElf(object oPC) {
    if (IsElf(oPC)) {
        if (GetSubRace(oPC) == "Wood Elf")  {
            return TRUE;
        } else {
            return FALSE;
        }
    return FALSE;
}
int IsAluFiend(object oPC) {

        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "alu-Fiend") {
            return TRUE;
        } else {
            return FALSE;
        }
    return FALSE;
}
int IsAluDemon(object oPC) {
  
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "alu-Demon")  {
            return TRUE;
        } else {
            return FALSE;
        }
    return FALSE;
}

int IsCambion(object oPC) {
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "Cambion") {
            return TRUE;
        } else {
            return FALSE;
        }
    }
    return FALSE;
}

int IsAasimar(object oPC) {
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "aasimar") {
            return TRUE;
        } else {
            return FALSE;
        }
    return FALSE;
}

int IsTiefling(object oPC) {
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "tiefling") {
            return TRUE;
        } else {
            return FALSE;
        }
    return FALSE;
}

int IsHalfRedDragon(object oPC) {
        string sSubRace = GetStringLowerCase(GetSubRace(oPC));
        if (sSubRace == "half-red dragon") {
            return TRUE;
        } else {
            return FALSE;
        }
    return FALSE;
}

object GetEffectEnforcer(string effectname) {
    object enforcer = GetLocalObject(GetModule(), effectname);
    if (GetIsObjectValid(enforcer)) {
        return enforcer;
    }
    object subracegod = GetObjectByTag("subracegod");
    enforcer = CreateObject(OBJECT_TYPE_CREATURE, "willowisp001", GetLocation(GetObjectByTag("WP_SUBRACES")));
    SetLocalObject(GetModule(), effectname, enforcer);
    return enforcer;
}

void Subraces_SafeRemoveEffect(object oTarget, effect eEffect) {
    object oCreator = GetEffectCreator(eEffect);
    if (GetTag(oCreator) != "subracegod") {
        RemoveEffect(oTarget, eEffect);
    }
}

object GetLightEffectEnforcer() {
    return GetEffectEnforcer("SAM_SUBRACE_ENFORCER_light");
}

void GiveUndeadAbilities(object oPC) {
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "undead_fear") DestroyObject(oItem);
        if (GetTag(oItem) == "undead_touch") DestroyObject(oItem);
        if (GetTag(oItem) == "undead_control") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("undead_fear", oPC);
    CreateItemOnObject("undead_touch", oPC);
    CreateItemOnObject("undead_control", oPC);
}

void GiveHalfYuanTiAbilities(object oPC) {
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "hyt_fear") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("hyt_fear", oPC);
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "hyt_darkness") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("hyt_darkness", oPC);
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "hyt_entangle") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("hyt_entangle", oPC);
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "hyt_neutralize") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("hyt_neutralize", oPC);
}


void GiveHalfRedDragonAbility(object oPC) {
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "halfredbreath") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("halfredbreath", oPC);
}

void GiveDeepGnomeAbility(object oPC) {
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "deepgnomeability") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
   
    }
    CreateItemOnObject("deepgnomeability", oPC);
}

void GiveDrowAbility(object oPC) {
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "drowability") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("drowability", oPC);
}

void GiveTieflingAbility(object oPC) {
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "tieflingability") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("tieflingabilty", oPC);
}
void GiveAluFiendAbility(object oPC) {
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "alufiendability") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("alufiendability", oPC);
}
void GiveAluDemonAbility(object oPC) {
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "aludemonability") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("aludemonability", oPC);
}

void GiveCambionAbility(object oPC) {
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "cambionability") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("cambionability", oPC);
}

void GiveAasimarAbility(object oPC) {
    object oItem;
    oItem = GetFirstItemInInventory(oPC);
    while (oItem != OBJECT_INVALID) {
        if (GetTag(oItem) == "aasimarability") DestroyObject(oItem);
        oItem = GetNextItemInInventory(oPC);
    }
    CreateItemOnObject("aasimarability", oPC);
}

 
void ApplyDrowLightEffects(object oTarget, int nDuration = 0) {
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectAttackDecrease(1)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSavingThrowDecrease(SAVING_THROW_ALL, 1)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSkillDecrease(SKILL_ALL_SKILLS, 1)), oTarget, IntToFloat(nDuration));
}

void ApplyDuergarLightEffects(object oTarget, int nDuration = 0) {
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectAttackDecrease(2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSavingThrowDecrease(SAVING_THROW_ALL, 2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSkillDecrease(SKILL_ALL_SKILLS, 2)), oTarget, IntToFloat(nDuration));
}

void ApplyUndeadLightEffects(object oTarget, int nDuration = 0) {
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectAttackDecrease(2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSavingThrowDecrease(SAVING_THROW_ALL, 2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSkillDecrease(SKILL_ALL_SKILLS, 2)), oTarget, IntToFloat(nDuration));
    ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectDamage(d6(), DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_FIVE), oTarget);
}

void ApplyDeepGnomeDarknessEffects(object oPC, int nDuration) {
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSkillIncrease(SKILL_HIDE, 2), oPC, IntToFloat(nDuration));
}

void HandleSubRaceLocationEffects() {
    object oPC = OBJECT_SELF;
    object aPCArea = GetAreaFromLocation(GetLocation(oPC));

    if (!GetLocalInt(oPC, "subraceapplied")) return;

    // If it is daytime, it is light outside
    if (GetLocalInt(aPCArea, "sam_underground")) {
        if (IsDeepGnome(oPC)) {
            // Svirfneblin effect
            // ApplySvirfneblinDarknessEffects(oPC, 11);
        }
    }
    if (GetIsDay()) {
        if (GetLocalInt(aPCArea, "sam_outside")) {
            if (IsDrow(oPC)) {
                // Drow effect
                ApplyDrowLightEffects(oPC, 11);
            } else if (IsDuergar(oPC)) {
                ApplyDuergarLightEffects(oPC, 11);
            } else if (IsUndead(oPC)) {
                ApplyUndeadLightEffects(oPC, 11);
            }
        }
    }
    DelayCommand(10.0, HandleSubRaceLocationEffects());
}

void ApplyHalfYuanTiEffects(object oPC) {
    SendMessageToPC(oPC, "Half Yuan-Ti effects applied.");
    object enforcer = GetEffectEnforcer("hytenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
        AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_INTELLIGENCE, 2)), oPC));
        AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_CHARISMA, 2)), oPC));
        AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_WISDOM, 2)), oPC));
        AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CONSTITUTION, 2)), oPC));
        AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_STRENGTH, 2)), oPC));
    }
}

void ApplyDrowEffects(object oPC) {
    SendMessageToPC(oPC, "Drow effects applied.");
    object enforcer = GetEffectEnforcer("drowenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSpellResistanceIncrease(GetHitDice(oPC) + 11)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSavingThrowIncrease(SAVING_THROW_WILL, 2, SAVING_THROW_TYPE_SPELL)), oPC));
    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_INTELLIGENCE, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_CHARISMA, 2)), oPC));
    }
}

void ApplyDeepGnomeEffects(object oPC) {
    SendMessageToPC(oPC, "Deep Gnome effects applied.");
    object enforcer = GetEffectEnforcer("deepgnomeenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSpellResistanceIncrease(GetHitDice(oPC) + 11)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSavingThrowIncrease(SAVING_THROW_ALL, 2)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSkillIncrease(SKILL_HIDE, 2)), oPC));
    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_DEXTERITY, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_WISDOM, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CONSTITUTION, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CHARISMA, 4)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectACIncrease(4)), oPC));
    }
}

void ApplyHalfRedDragonEffects(object oPC) {
    SendMessageToPC(oPC, "Half-red dragon effects applied.");
    object enforcer = GetEffectEnforcer("halfreddragonenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageImmunityIncrease(DAMAGE_TYPE_FIRE, 50)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSavingThrowIncrease(SAVING_THROW_TYPE_MIND_SPELLS, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageImmunityDecrease(DAMAGE_TYPE_COLD, 50)), oPC));
    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectACIncrease(4, AC_NATURAL_BONUS)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_CHARISMA, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_CONSTITUTION, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_INTELLIGENCE, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_STRENGTH, 8)), oPC));
    }
}

void ApplyAluDemonEffects(object oPC) {
    SendMessageToPC(oPC, "Alu-Demon effects applied.");
    object enforcer = GetEffectEnforcer("aludemonenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDarkvision()), oPC));
     AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSkillIncrease(SKILL_PERSUADE, 2)), oPC));
  AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageImmunityDecrease(DAMAGE_TYPE_DIVINE, 25)), oPC));
    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectACIncrease(2, AC_NATURAL_BONUS)), oPC));
       AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_STRENGTH, 1)), oPC));
    }
}
void ApplyAluFiendEffects(object oPC) {
    SendMessageToPC(oPC, "Alu-Fiend effects applied.");
    object enforcer = GetEffectEnforcer("alufiendenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDarkvision()), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_FIRE, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_COLD, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSkillIncrease(SKILL_BLUFF, 2)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSkillIncrease(SKILL_HIDE, 2)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSkillIncrease(SKILL_MOVE_SILENTLY, 2)), oPC));

    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectACIncrease(2, AC_NATURAL_BONUS)), oPC));
AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_DEXTERITY, 1)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CHARISMA, 1)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_WISDOM, 1)), oPC));
    }
}
void ApplyCambionEffects(object oPC) {
    SendMessageToPC(oPC, "Cambion effects applied.");
    object enforcer = GetEffectEnforcer("cambionenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectACIncrease(2, AC_NATURAL_BONUS)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_STRENGTH, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CHARISMA, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_WISDOM, 1)), oPC));
    }
}

void ApplyAasimarEffects(object oPC) {
    SendMessageToPC(oPC, "Aasimar effects applied.");
    object enforcer = GetEffectEnforcer("aasimarenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_FIRE, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_ELECTRICAL, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_COLD, 5)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSkillIncrease(SKILL_LISTEN, 2)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSkillIncrease(SKILL_SPOT, 2)), oPC));
    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_CHARISMA, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_WISDOM, 2)), oPC));
    }
}

void ApplyTieflingEffects(object oPC) {
    SendMessageToPC(oPC, "Tiefling effects applied.");
    object enforcer = GetEffectEnforcer("tieflingenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageResistance(DAMAGE_TYPE_FIRE, 5)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSkillIncrease(SKILL_HIDE, 2)), oPC));
    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CHARISMA, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_DEXTERITY, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_INTELLIGENCE, 2)), oPC));
    }
}

void ApplyDuergarEffects(object oPC) {
    SendMessageToPC(oPC, "Duergar effects applied.");
    object enforcer = GetEffectEnforcer("duergarenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSkillIncrease(SKILL_MOVE_SILENTLY, 4)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_PARALYSIS)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_POISON)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectSpellImmunity(SPELL_PHANTASMAL_KILLER)), oPC));
    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CHARISMA, 2)), oPC));
    }
}


void ApplyWoodElfEffects(object oPC) {
    SendMessageToPC(oPC, "Wood Elf effects applied.");
    object enforcer = GetEffectEnforcer("woodelfenforcer");
    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_STRENGTH, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CHARISMA, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_INTELLIGENCE, 2)), oPC));
    }
}

void ApplyUndeadEffects(object oPC) {
    SendMessageToPC(oPC, "Undead effects applied");
    object enforcer = GetEffectEnforcer("undeadenforcer");
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectMovementSpeedDecrease(10)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_MIND_SPELLS)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_DEATH)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_NEGATIVE_LEVEL)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_POISON)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectImmunity(IMMUNITY_TYPE_DISEASE)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_DARKVISION)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectRegenerate(1, 6.0)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectTurnResistanceIncrease(4)), oPC));
    AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectDamageImmunityDecrease(DAMAGE_TYPE_FIRE, 50)), oPC));
    if (!GetLocalInt(oPC, "sam_subrace_converted")) {
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_STRENGTH, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_CHARISMA, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityDecrease(ABILITY_DEXTERITY, 2)), oPC));
      AssignCommand(enforcer, ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectAbilityIncrease(ABILITY_WISDOM, 2)), oPC));
    }
}

void ApplySubRaceLightEffects(object oTarget, int nDuration=0)
{
    // Drow elves and Gray Dwarves have some sensitivity to light
    if (GetIsPC(oTarget)) {
        if (IsDrow(oTarget)) {
            // Drow elves are blinded for 1 round (6 seconds) and then have a -1 on attacks, saves, and checks till its done
            object enforcer = GetObjectByTag("subracegod");
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectBlindness()), oTarget, 6.0);
            AssignCommand(enforcer, ActionDoCommand(ApplyDrowLightEffects(oTarget, nDuration)));
        }
        if (IsDuergar(oTarget)) {
            // Duergar just have a penalty for operating in light
            object enforcer = GetObjectByTag("subracegod");
            AssignCommand(enforcer, ActionDoCommand(ApplyDuergarLightEffects(oTarget, nDuration)));
        }
    }
}

int ApplySubRaceEffects(object oPC) {
    int nValue = 0;
    if (IsUndead(oPC)) {
        ApplyUndeadEffects(oPC);
        nValue = 1;
    }
    if (IsHalfYuanTi(oPC)) {
        ApplyHalfYuanTiEffects(oPC);
        nValue = 1;
    }
    if (IsDrow(oPC)) {
        ApplyDrowEffects(oPC);
        nValue = 1;
    }
    if (IsDeepGnome(oPC)) {
        ApplyDeepGnomeEffects(oPC);
        nValue = 1;
    }
    if (IsAluDemon(oPC)) {
        ApplyAluDemonEffects(oPC);
        nValue = 1;
    }
      if (IsAluFiend(oPC)) {
        ApplyAluFiendEffects(oPC);
        nValue = 1;
    }
    if (IsCambion(oPC)) {
        ApplyCambionEffects(oPC);
        nValue = 1;
    }
    if (IsHalfRedDragon(oPC)) {
        ApplyHalfRedDragonEffects(oPC);
        nValue = 1;
    }
    if (IsDuergar(oPC)) {
        ApplyDuergarEffects(oPC);
        nValue = 1;
    }
    if (IsAasimar(oPC)) {
        ApplyAasimarEffects(oPC);
        nValue = 1;
    }
  
    if (IsTiefling(oPC)) {
        ApplyTieflingEffects(oPC);
        nValue = 1;
    
  
    }
    if (IsWoodElf(oPC)) {
        ApplyWoodElfEffects(oPC);
        nValue = 1;
    }
    return nValue;
}


void DeepGnomeBlindActivated(object oPC, object oTarget) {
    AssignCommand(oPC, ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBlindness(), oTarget, 6.0 * GetHitDice(oPC))));
}

void DeepGnomeBlurActivated(object oPC, object oTarget) {
    AssignCommand(oPC, ActionDoCommand(ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectConcealment(20), oPC, 6.0 * GetHitDice(oPC))));
}

void DrowDarknessActivated(object oPC, location lLocation) {
    AssignCommand(oPC, ActionCastSpellAtLocation(SPELL_DARKNESS, lLocation, METAMAGIC_NONE, TRUE));
}

void HalfRedDragonBreathActivated(object oPC, location lLocation) {
    AssignCommand(oPC, ActionCastSpellAtLocation(SPELLABILITY_DRAGON_BREATH_FIRE, lLocation, METAMAGIC_NONE, TRUE));
}

void TieflingDarknessActivated(object oPC, location lLocation) {
    AssignCommand(oPC, ActionCastSpellAtLocation(SPELL_DARKNESS, lLocation, METAMAGIC_NONE, TRUE));
}

void AluDemonTouchActivated(object oPC, object oTarget) {
    AssignCommand(oPC, ActionCastSpellAtObject(SPELL_VAMPIRIC_TOUCH, oTarget, METAMAGIC_NONE, TRUE));
}
void AluFiendCharmActivated(object oPC, object oTarget) {
    AssignCommand(oPC, ActionCastSpellAtObject(SPELL_CHARM_PERSON, oTarget, METAMAGIC_NONE, TRUE));
}


void CambionFearActivated(object oPC, location lLocation) {
    AssignCommand(oPC, ActionCastSpellAtLocation(SPELL_FEAR, lLocation, METAMAGIC_NONE, TRUE));
}

void AasimarLightActivated(object oPC, object oTarget) {
    AssignCommand(oPC, ActionCastSpellAtObject(SPELL_LIGHT, oTarget, METAMAGIC_NONE, TRUE));
}

void HalfYuanTiEntangleActivated(object oPC, location lLoc) {
    AssignCommand(oPC, ActionCastSpellAtLocation(SPELL_ENTANGLE, lLoc));
}

void HalfYuanTiNeutralizePoisonActivated(object oPC, object oTarget) {
    AssignCommand(oPC, ActionCastSpellAtObject(SPELL_NEUTRALIZE_POISON, oTarget));
}

void UndeadFearActivated(object oPC, location lLocation) {
    AssignCommand(oPC, ActionCastSpellAtLocation(SPELL_FEAR, lLocation, METAMAGIC_NONE, TRUE));
}

void UndeadControlActivated(object oPC, object oTarget) {
    AssignCommand(oPC, ActionCastSpellAtObject(SPELL_CONTROL_UNDEAD, oTarget, METAMAGIC_NONE, TRUE));
}

void UndeadTouchActivated(object oPC, object oTarget) {
    AssignCommand(oPC, ActionCastSpellAtObject(SPELL_VAMPIRIC_TOUCH, oTarget, METAMAGIC_NONE, TRUE));
}

int GetSubRaceXP(int nCharXP, object oPC) {
    int nLevelAdjustment = GetLocalInt(oPC, "SAM_leveladjustment");
    if (nLevelAdjustment != 0) {
        int nCurLvl=GetHitDice(oPC);
        int nActualCharXP = nCharXP * (nCurLvl) / (nCurLvl + nLevelAdjustment) ;
        SendMessageToPC(oPC, "Powerful subrace reduced XP from " + IntToString(nCharXP) + " to " + IntToString(nActualCharXP));
        return nActualCharXP;
    }
    return nCharXP;
}

int use_pc_subrace(object oPC = OBJECT_INVALID)
{
    if (oPC == OBJECT_INVALID) {
        oPC = GetEnteringObject();
    }
    if (IsDrow(oPC) || IsDuergar(oPC) || IsUndead(oPC)) {
        AssignCommand(oPC, DelayCommand(6.0, HandleSubRaceLocationEffects()));
    }
    if (GetLocalInt(oPC, "subraceapplied") == 1) {
        return 0;
    } else {
        SetLocalInt(oPC, "subraceapplied", 1);
    }
    int nValue = 0;
    if (GetIsPC(oPC))
    {
        if (IsUndead(oPC)) {
            SetLocalInt(oPC, "SAM_leveladjustment", 5);
            GiveUndeadAbilities(oPC);
        }
        if (IsHalfYuanTi(oPC)) {
            SetLocalInt(oPC, "SAM_leveladjustment", 2);
            GiveHalfYuanTiAbilities(oPC);
        }
        if (IsHalfRedDragon(oPC)) {
            SetLocalInt(oPC, "SAM_leveladjustment", 30);
            GiveHalfRedDragonAbility(oPC);
        }
        if (IsCambion(oPC)) {
            SetLocalInt(oPC, "SAM_leveladjustment", 2);
            GiveCambionAbility(oPC);
        }
        if (IsAluDemon(oPC)) {
            SetLocalInt(oPC, "SAM_leveladjustment", 1);
            GiveAluDemonAbility(oPC);
        }
       if (IsAluFiend(oPC)) {
            SetLocalInt(oPC, "SAM_leveladjustment", 1);
            GiveAluFiendAbility(oPC);
        }
        if (IsTiefling(oPC)) {
            SetLocalInt(oPC, "SAM_leveladjustment", 1);
            GiveTieflingAbility(oPC);
        }
        if (IsAasimar(oPC)) {
            SetLocalInt(oPC, "SAM_leveladjustment", 1);
            GiveAasimarAbility(oPC);
        }
        if (IsDuergar(oPC)){
            SetLocalInt(oPC, "SAM_leveladjustment", 2);
            GiveDuergarAbility(oPC);
        }
        if (IsDrow(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 2);
            GiveDrowAbility(oPC);
        }
        if (IsDeepGnome(oPC))
        {
            SetLocalInt(oPC, "SAM_leveladjustment", 3);
            GiveDeepGnomeAbility(oPC);
        }
        nValue = ApplySubRaceEffects(oPC);
    }
    return nValue;
}

void ReapplySubRaceEffects(object oPC) {
    effect eEffect = GetFirstEffect(oPC);
    while(GetIsEffectValid(eEffect)) {
        object oCreator = GetEffectCreator(eEffect);
        if (GetTag(oCreator) == "subracegod") {
            RemoveEffect(oPC, eEffect);
        }
        eEffect = GetNextEffect(oPC);
    }
    SetLocalInt(oPC, "subraceapplied", FALSE);
    use_pc_subrace(oPC);
}


