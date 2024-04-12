//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::: Shayan's Subrace Engine :::::::::::::::::::::::::::::
//:::::::::::::::::File Name: sha_leto_planar:::::::::::::::::::::::::::::::::::
//::::::::::::::::::::: OnModuleLoad script ::::::::::::::::::::::::::::::::::::
//:: Written By: Flamecrow for Shayan's Subrace Engine
//
// Description: Scripts holds the planar subraces.


#include "sha_subr_methds"
void main()
{


//-------------------------
//-----PLANAR SUBRACES-----
//-------------------------

//:::::::::::::::::::::::::::::::::::
//:::::::: SUBRACE: Aasimar :::::::::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: Aasimar

//Properties from the Skin:
    //Damage Resistance: Acid Resist 5 / -
    //Damage Resistance: Cold Resist 5 / -
    //Damage Resistance: Electrical Resist 5 / -
    //Saving Throw Bonus: Universal +2

//Abilities from the unique item:
    //Cast Spell: Light 1 Use/Per Day

//Must be: Human
//ECL: + 1
     CreateSubrace(RACIAL_TYPE_HUMAN, "aasimar", "sha_pcl_aasimar", "sha_subrace_aasi", FALSE, 0, FALSE, 0, 1);

//Additional Races
    AddAdditionalBaseRaceToSubrace("aasimar", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("aasimar", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("aasimar", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("aasimar", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("aasimar", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("aasimar", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Charisma +2
    //Ability Bonus: Wisdom +2
    struct SubraceBaseStatsModifier AasimarStats = CustomBaseStatsModifiers(0, 0, 0, 0, 2, 2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("aasimar", AasimarStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("aasimar", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Listen +2
    //Skill Bonus: Spot +2
    ModifySubraceSkill("aasimar", SKILL_SPOT, 2, 1, FALSE);
    ModifySubraceSkill("aasimar", SKILL_LISTEN, 2, 1, FALSE);

//Favored Class: Paladin
     AddSubraceFavoredClass("aasimar", CLASS_TYPE_PALADIN, CLASS_TYPE_PALADIN);



//:::::::::::::::::::::::::::::::::::::::
//::::::::: SUBRACE: Tiefling :::::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Tiefling

//Properties from the Skin:
    //Damage Resistance: Cold Resist 5 / -
    //Damage Resistance: Electrical Resist 5 / -
    //Damage Resistance: Fire Resist 5 / -


//Abilities from the unique item:
    //Cast Spell: Darkness 1 Use/Per Day


//Must be: Human
//ECL: + 1
     CreateSubrace(RACIAL_TYPE_HUMAN, "tiefling", "sha_pcl_tiefling", "sha_subrace_tief", FALSE, 0, FALSE, 0, 1);

//Additional Races
    AddAdditionalBaseRaceToSubrace("tiefling", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("tiefling", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("tiefling", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("tiefling", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("tiefling", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("tiefling", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Charisma +2
    //Ability Bonus: Wisdom +2
    //Decreased Ability Score: Charisma -2
    struct SubraceBaseStatsModifier TieflingStats = CustomBaseStatsModifiers(0, 2, 0, 2, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("tiefling", TieflingStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("tiefling", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Bluff +2
    //Skill Bonus: Hide +2

    ModifySubraceSkill("tiefling", SKILL_BLUFF, 2, 1, FALSE);
    ModifySubraceSkill("tiefling", SKILL_HIDE, 2, 1, FALSE);

//Favored Class: Rogue
     AddSubraceFavoredClass("tiefling", CLASS_TYPE_ROGUE, CLASS_TYPE_ROGUE);



//:::::::::::::::::::::::::::::::::::::::
//::::::::: SUBRACE: cambion ::::::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: cambion

//Properties from the Skin:
    //Damage Resistance: Acid Resist 10 / -
    //Damage Resistance: Cold Resist 10 / -
    //Damage Resistance: Electrical Resist 10 / -
    //Damage Resistance: Fire Resist 10 / -
    //Damage Reduction: 5/+1
    //Immunity to Poison
    //AC +1


//Abilities from the unique item:
    //Cast Spell: Fear 3 Use/Per Day
    //Cast Spell: Contagion 2 Use/Per Day


//Must be: Human
//ECL: + 8
     CreateSubrace(RACIAL_TYPE_HUMAN, "cambion", "sub_cmbn_skn", "sub_cmbn_itm", FALSE, 0, FALSE, 0, 8);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +4
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Constitution +4
    //Ability Bonus: Intelligence +4
    //Ability Bonus: Wisdom +0
    //Ability Bonus: Charisma +2
    struct SubraceBaseStatsModifier CambionStats = CustomBaseStatsModifiers(4, 2, 4, 4, 0, 2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("cambion", CambionStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("cambion", FEAT_DARKVISION, 1);



//:::::::::::::::::::::::::::::::::::::::
//::::::::: SUBRACE: alu-demon ::::::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: alu-demon

//Properties from the Skin:
    //Damage Resistance: Acid Resist 10 / -
    //Damage Resistance: Cold Resist 10 / -
    //Damage Resistance: Electrical Resist 10 / -
    //Damage Resistance: Fire Resist 10 / -
    //Damage Reduction: 5/+1
    //Immunity to Poison
    //AC +1


//Abilities from the unique item:
    //Cast Spell: Charm Person 3 Use/Per Day
    //Cast Spell: Dominate Person 2 Use/Per Day


//Must be: Human
//ECL: + 8
     CreateSubrace(RACIAL_TYPE_HUMAN, "alu-demon", "sub_cmbn_skn", "sub_aludmn_itm", FALSE, 0, FALSE, 0, 8);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +2
    //Ability Bonus: Dexterity +4
    //Ability Bonus: Constitution +2
    //Ability Bonus: Intelligence +4
    //Ability Bonus: Wisdom +0
    //Ability Bonus: Charisma +4
    struct SubraceBaseStatsModifier AluDemonStats = CustomBaseStatsModifiers(2, 4, 2, 4, 0, 4, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("alu-demon", AluDemonStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("alu-demon", FEAT_DARKVISION, 1);



//:::::::::::::::::::::::::::::::::::::::
//::::::::: SUBRACE: half yuan-ti :::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: half yuan-ti

//Properties from the Skin:
    //AC +1


//Abilities from the unique item:
    //Cast Spell: Charm Person/Animal 1 Use/Day
    //Cast Spell: Neutralize Poison 1 Use/Day
    //Cast Spell: Darkness 1 Use/Day
    //Cast Spell: Entangle 1 Use/Day


//Must be: Halfelf
//ECL: + 3
     CreateSubrace(RACIAL_TYPE_HALFELF, "half yuan-ti", "sub_halfyt_skn", "sub_halfyt_itm", FALSE, 0, FALSE, 0, 2);

//LETO - Change ability scores:
    //Ability Bonus: Strenght 0
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Constitution 0
    //Ability Bonus: Intelligence +2
    //Ability Bonus: Wisdom 0
    //Ability Bonus: Charisma +2
    struct SubraceBaseStatsModifier HalfYuanTiStats = CustomBaseStatsModifiers(0, 2, 0, 2, 0, 2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("half yuan-ti", HalfYuanTiStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half yuan-ti", FEAT_DARKVISION, 1);
    ModifySubraceFeat("half yuan-ti", FEAT_WEAPON_PROFICIENCY_CREATURE, 1);
    //Remove base half-elf feats
    ModifySubraceFeat("half yuan-ti", FEAT_IMMUNITY_TO_SLEEP, 1, TRUE);
    ModifySubraceFeat("half yuan-ti", FEAT_HARDINESS_VERSUS_ENCHANTMENTS, 1, TRUE);
    ModifySubraceFeat("half yuan-ti", FEAT_PARTIAL_SKILL_AFFINITY_LISTEN, 1, TRUE);
    ModifySubraceFeat("half yuan-ti", FEAT_PARTIAL_SKILL_AFFINITY_SEARCH, 1, TRUE);
    ModifySubraceFeat("half yuan-ti", FEAT_PARTIAL_SKILL_AFFINITY_SPOT, 1, TRUE);
    ModifySubraceFeat("half yuan-ti", FEAT_LOWLIGHTVISION, 1, TRUE);

//LETO - Add Claws:
    AddClawsToSubrace("half yuan-ti", "x3_it_cobrab1d4", "", 1, TIME_BOTH);

//Spell Resistance: 7 + 1 per 2 levels.
   CreateSubraceSpellResistance("half yuan-ti", 7, 27);
}
