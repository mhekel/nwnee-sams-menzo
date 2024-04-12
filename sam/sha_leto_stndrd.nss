//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::: Shayan's Subrace Engine :::::::::::::::::::::::::::::
//:::::::::::::::::File Name: sha_leto_stndrd::::::::::::::::::::::::::::::::::
//::::::::::::::::::::: OnModuleLoad script ::::::::::::::::::::::::::::::::::::
//:: Written By: Flamecrow for Shayan's Subrace Engine
//
// Description: Scripts holds the standard subraces.


#include "sha_subr_methds"
void main()
{

//----------------
//-----GNOME------
//----------------

//:::::::::::::::::::::::::::::::
//:::: SUBRACE: svirfneblin :::::
//:::::::::::::::::::::::::::::::

//Subrace Name: svirfneblin

//Properties from the Skin:
    //Saving Throw Bonus: Universal +2
    //AC +4

//Abilities from the unique item:
   //Cast Spell: Blindness/Deafness 1 Use/Day
   //Cast Spell: Displacement 1 Use/Day

//Must be: Gnome.
//Light Sensitive.
//ECL: + 3
    CreateSubrace(RACIAL_TYPE_GNOME, "svirfneblin", "sub_dpgnm_skn", "sub_dpgnm_itm", TRUE, 0, FALSE, 0, 3);

//LETO - Change ability scores:
    //Ability Bonus: Dexterity +2
    //Constitution -2 to compensate for the normal gnome con bonus.
    //Ability Bonus: Wisdom +2
    //Decreased Ability Score: Charisma -4
    struct SubraceBaseStatsModifier SvirnStats = CustomBaseStatsModifiers(0, 2, -2, 0, 2, -4, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("svirfneblin", SvirnStats, 1);

//LETO - Feats:
    //Darkvision
    //Bonus Feat: Dodge
    ModifySubraceFeat("svirfneblin", FEAT_DARKVISION, 1);
    ModifySubraceFeat("svirfneblin", FEAT_STONECUNNING, 1);

//LETO - Skills:
    //Skill Bonus: Search +2
    ModifySubraceSkill("svirfneblin", SKILL_LISTEN, 2, 1, FALSE);
    ModifySubraceSkill("svirfneblin", SKILL_HIDE, 2, 1, FALSE);


//Spell Resistance: 10 + 1 Per Level.
    CreateSubraceSpellResistance("svirfneblin", 10, 50);

//Favored Class - Rogue
   AddSubraceFavoredClass("svirfneblin", CLASS_TYPE_ROGUE, CLASS_TYPE_ROGUE);


//::::::::::::::::::::::::::::::
//:::: SUBRACE: deep gnome :::::
//::::::::::::::::::::::::::::::

//Subrace Name: deep gnome

//Properties from the Skin:
    //Saving Throw Bonus: Universal +2
    //AC +4

//Abilities from the unique item:
   //Cast Spell: Blindness/Deafness 1 Use/Day
   //Cast Spell: Displacement 1 Use/Day

//Must be: Gnome.
//Light Sensitive.
//ECL: + 3
    CreateSubrace(RACIAL_TYPE_GNOME, "deep gnome", "sub_dpgnm_skn", "sub_dpgnm_itm", TRUE, 0, FALSE, 0, 3);

//LETO - Change ability scores:
    //Ability Bonus: Dexterity +2
    //Constitution -2 to compensate for the normal gnome con bonus.
    //Ability Bonus: Wisdom +2
    //Decreased Ability Score: Charisma -4
    struct SubraceBaseStatsModifier DeepGnomeStats = CustomBaseStatsModifiers(0, 2, -2, 0, 2, -4, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("deep gnome", DeepGnomeStats, 1);

//LETO - Feats:
    //Darkvision
    //Bonus Feat: Stone Cunning
    ModifySubraceFeat("deep gnome", FEAT_DARKVISION, 1);
    ModifySubraceFeat("deep gnome", FEAT_STONECUNNING, 1);

//LETO - Skills:
    //Skill Bonus: Listen +2
    //Skill Bonus: Hide +2
    ModifySubraceSkill("deep gnome", SKILL_LISTEN, 2, 1, FALSE);
    ModifySubraceSkill("deep gnome", SKILL_HIDE, 2, 1, FALSE);


//Spell Resistance: 10 + 1 Per Level.
    CreateSubraceSpellResistance("deep gnome", 10, 50);

//Favored Class - Rogue
   AddSubraceFavoredClass("deep gnome", CLASS_TYPE_ROGUE, CLASS_TYPE_ROGUE);

//------------------------------------------------------------------------------------------------------------------

//----------------
//------ELF-------
//----------------

//::::::::::::::::::::::::::::::
//:::: SUBRACE: drow elf :::::::
//::::::::::::::::::::::::::::::

//Subrace Name: Drow

//Abilities from the unique item:
    //Cast Spell: Darkness 1 Use Per Day

//Must be Elf. Light Sensitive.
//ECL: +2
   CreateSubrace(RACIAL_TYPE_ELF, "drow elf", "", "sub_drow_itm", TRUE, 0, FALSE, 0, 2);

//LETO - Change ability scores:
    //Ability Bonus: Strenght 0
    //Ability Bonus: Dexterity +2 (base elf)
    //Ability Bonus: Constitution -2 (base elf)
    //Ability Bonus: Intelligence +2
    //Ability Bonus: Wisdom 0
    //Ability Bonus: Charisma +2
    struct SubraceBaseStatsModifier DrowStats = CustomBaseStatsModifiers(0, 0, 0, 2, 0, 2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("drow elf", DrowStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("drow elf", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Move Silently +2
    //Skill Bonus: Hide +2
    ModifySubraceSkill("drow elf", SKILL_MOVE_SILENTLY, 2, 1, FALSE);
    ModifySubraceSkill("drow elf", SKILL_HIDE, 2, 1, FALSE);

//Favored Class - Male: Wizard, Female: Cleric.
   AddSubraceFavoredClass("drow elf", CLASS_TYPE_WIZARD, CLASS_TYPE_CLERIC);

//Spell Resistance: Base (at Level 1): 10, Max(at Level 40): 50.
   CreateSubraceSpellResistance("drow elf", 10, 50);


//:::::::::::::::::::::::::::::::
//:::: SUBRACE: sun elf :::::::::
//:::::::::::::::::::::::::::::::

//Subrace Name: sun elf

//Must be: Elf
//ECL: + 0
    CreateSubrace(RACIAL_TYPE_ELF, "sun elf", "", "", FALSE, -1, FALSE, 0, 0);

//LETO - Change ability scores:
    //Ability Bonus: Strenght 0
    //Ability Bonus: Dexterity 0 (+2 base elf, -2 sun elf)
    //Ability Bonus: Constitution -2 (base elf)
    //Ability Bonus: Intelligence +2
    //Ability Bonus: Wisdom 0
    //Ability Bonus: Charisma 0
    struct SubraceBaseStatsModifier SunElfStats = CustomBaseStatsModifiers(0, -2, 0, 2, 0, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("sun elf", SunElfStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("sun elf", FEAT_COURTLY_MAGOCRACY, 1);


//::::::::::::::::::::::::::::::::::
//:::: SUBRACE: wild elf :::::::::::
//::::::::::::::::::::::::::::::::::

//Subrace Name: wild elf

//Must be: Elf
    CreateSubrace(RACIAL_TYPE_ELF, "wild elf", "", "", FALSE, -1, FALSE, 0, 0);

//LETO - Change ability scores:
    //Ability Bonus: Strenght 0
    //Ability Bonus: Dexterity +2 (base elf)
    //Ability Bonus: Constitution 0 (base elf -2, wild elf +2)
    //Ability Bonus: Intelligence -2
    //Ability Bonus: Wisdom 0
    //Ability Bonus: Charisma 0
    struct SubraceBaseStatsModifier WildElfStats = CustomBaseStatsModifiers(0, 0, 2, -2, 0, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("wild elf", WildElfStats, 1);

//Favored Class: Sorcerer
    AddSubraceFavoredClass("wild elf", CLASS_TYPE_SORCERER, CLASS_TYPE_SORCERER);



//::::::::::::::::::::::::::::::::::
//:::: SUBRACE: wood elf :::::::::::
//::::::::::::::::::::::::::::::::::

//Subrace Name: wood elf

//Must be: Elf
//ECL +1
    CreateSubrace(RACIAL_TYPE_ELF, "wood elf", "", "", FALSE, 0, FALSE, 0, 1);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +2
    //Ability Bonus: Dexterity +2 (base elf)
    //Ability Bonus: Constitution -2 (base elf)
    //Ability Bonus: Intelligence -2
    //Ability Bonus: Wisdom -2
    //Ability Bonus: Charisma 0
    struct SubraceBaseStatsModifier WoodElfStats = CustomBaseStatsModifiers(2, 0, 0, -2, -2, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("wood elf", WoodElfStats, 1);

//Favored Class: Ranger
    AddSubraceFavoredClass("wood elf", CLASS_TYPE_RANGER, CLASS_TYPE_RANGER);

//LETO - Feats:
    //Add
    ModifySubraceFeat("sun elf", FEAT_TRACKLESS_STEP, 1);
    ModifySubraceFeat("sun elf", FEAT_NATURE_SENSE, 1);
    ModifySubraceFeat("sun elf", FEAT_RESIST_NATURES_LURE, 1);

//------------------------------------------------------------------------------------------------------------------

//----------------
//-----DWARF------
//----------------

//:::::::::::::::::::::::::::::::
//:::: SUBRACE: duergar :::::::::
//:::::::::::::::::::::::::::::::

//Subrace Name: duergar

//Properties from the Skin:
    //Immunity: Miscellaneous: Paralysis
    //Immunity: Miscellaneous: Poison
    //Immunity: Specific Spell Phantasmal Killer
    //Immunity: Specific Spell Weird

//Abilities from the unique item:
    //Cast Spell: Invisibility 1 Use/Day.

//Must be: Dwarf. Light sensitive.
//ECL: + 2
    CreateSubrace(RACIAL_TYPE_DWARF, "duergar", "sub_grydwrf_skn", "sub_grydwrf_itm", TRUE, 0, FALSE, 0, 2);


//LETO - Change ability scores:
    //Decreased Ability Score: Charisma -2
    struct SubraceBaseStatsModifier DwarfDuergarStats = CustomBaseStatsModifiers(0, 0, 0, 0, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("duergar", DwarfDuergarStats, 1);

//LETO - Feats:
    //Remove
    ModifySubraceFeat("duergar", FEAT_HARDINESS_VERSUS_POISONS, 1, TRUE);

//LETO - Skills:
    //Skill Bonus: Move Silently +4
    //Skill Bonus: Listen +1
    //Skill Bonus: Spot +1
    ModifySubraceSkill("duergar", SKILL_MOVE_SILENTLY, 4, 1, FALSE);
    ModifySubraceSkill("duergar", SKILL_LISTEN, 1, 1, FALSE);
    ModifySubraceSkill("duergar", SKILL_SPOT, 1, 1, FALSE);


//:::::::::::::::::::::::::::::::
//:::: SUBRACE: gray dwarf ::::::
//:::::::::::::::::::::::::::::::

//Subrace Name: gray dwarf

//Properties from the Skin:
    //Immunity: Miscellaneous: Paralysis
    //Immunity: Miscellaneous: Poison
    //Immunity: Specific Spell Phantasmal Killer
    //Immunity: Specific Spell Weird

//Abilities from the unique item:
    //Cast Spell: Invisibility 1 Use/Day.

//Must be: Dwarf. Light sensitive.
//ECL: + 2
    CreateSubrace(RACIAL_TYPE_DWARF, "gray dwarf", "sub_grydwrf_skn", "sub_grydwrf_itm", TRUE, 0, FALSE, 0, 2);


//LETO - Change ability scores:
    //Decreased Ability Score: Charisma -2
    struct SubraceBaseStatsModifier GrayDwarfStats = CustomBaseStatsModifiers(0, 0, 0, 0, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("gray dwarf", GrayDwarfStats, 1);

//LETO - Feats:
    //Remove
    ModifySubraceFeat("gray dwarf", FEAT_HARDINESS_VERSUS_POISONS, 1, TRUE);

//LETO - Skills:
    //Skill Bonus: Move Silently +4
    //Skill Bonus: Listen +1
    //Skill Bonus: Spot +1
    ModifySubraceSkill("gray dwarf", SKILL_MOVE_SILENTLY, 4, 1, FALSE);
    ModifySubraceSkill("gray dwarf", SKILL_LISTEN, 1, 1, FALSE);
    ModifySubraceSkill("gray dwarf", SKILL_SPOT, 1, 1, FALSE);


//::::::::::::::::::::::::::::::::::
//:::: SUBRACE: gold dwarf :::::::::
//::::::::::::::::::::::::::::::::::

//Subrace Name: gold dwarf

//Must be: Dwarf
//ECL: + 0
    CreateSubrace(RACIAL_TYPE_DWARF, "gold dwarf", "", "", FALSE, -1, FALSE, 0, 0);

//LETO - Change ability scores:
    //Ability Bonus: Strenght 0
    //Ability Bonus: Dexterity -2
    //Ability Bonus: Constitution +2 (base dwarf)
    //Ability Bonus: Intelligence 0
    //Ability Bonus: Wisdom 0
    //Ability Bonus: Charisma 0 (-2 dwarf, +2 gold dwarf)
    struct SubraceBaseStatsModifier GoldDwarfStats = CustomBaseStatsModifiers(0, -2, 0, 0, 0, 2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("gold dwarf", GoldDwarfStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("gold dwarf", FEAT_LOWLIGHTVISION, 1);
    ModifySubraceFeat("gold dwarf", FEAT_STRONGSOUL, 1);
    //Remove base Dwarf feats
    ModifySubraceFeat("gold dwarf", FEAT_BATTLE_TRAINING_VERSUS_ORCS, 1, TRUE);
    ModifySubraceFeat("gold dwarf", FEAT_BATTLE_TRAINING_VERSUS_GOBLINS, 1, TRUE);
    ModifySubraceFeat("gold dwarf", FEAT_BATTLE_TRAINING_VERSUS_GIANTS, 1, TRUE);
    ModifySubraceFeat("gold dwarf", FEAT_DARKVISION, 1, TRUE);

//LETO - Skills:
    //Skill Bonus: Lore +5
    //Skill Bonus: Persuade +2
    //Skill Bonus: Bluff +2
    //Skill Bonus: Intimidate +2
    ModifySubraceSkill("gold dwarf", SKILL_LORE, 5, 1, FALSE);
    ModifySubraceSkill("gold dwarf", SKILL_PERSUADE, 2, 1, FALSE);
    ModifySubraceSkill("gold dwarf", SKILL_BLUFF, 2, 1, FALSE);
    ModifySubraceSkill("gold dwarf", SKILL_INTIMIDATE, 2, 1, FALSE);

//Favored Class - Cleric
   AddSubraceFavoredClass("gold dwarf", CLASS_TYPE_CLERIC, CLASS_TYPE_CLERIC);

//------------------------------------------------------------------------------------------------------------------

//-------------------
//-----HALFLING------
//-------------------

//::::::::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: strongheart halfling :::::::::
//::::::::::::::::::::::::::::::::::::::::::::

//Subrace Name: strongheart halfling

//Must be: Halfling
//ECL: + 1
    CreateSubrace(RACIAL_TYPE_HALFLING, "strongheart halfling", "", "", FALSE, 0, FALSE, 0, 1);

//LETO - Change ability scores:
    //Ability Bonus: Strenght 0 (base halfling -2, strongheart +2)
    //Ability Bonus: Dexterity +2 (base halfling)
    //Ability Bonus: Constitution -2
    //Ability Bonus: Intelligence 0
    //Ability Bonus: Wisdom +2
    //Ability Bonus: Charisma 0
    struct SubraceBaseStatsModifier StrongheartStats = CustomBaseStatsModifiers(2, 0, -2, 0, 2, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("strongheart halfling", StrongheartStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("strongheart halfling", FEAT_IMMUNITY_TO_SLEEP, 1);
    ModifySubraceFeat("strongheart halfling", FEAT_LOWLIGHTVISION, 1);

//LETO - Skills:
    //Skill Bonus: Move Silently +2
    //Skill Bonus: Hide +2
    ModifySubraceSkill("strongheart halfling", SKILL_MOVE_SILENTLY, 2, 1, FALSE);
    ModifySubraceSkill("strongheart halfling", SKILL_HIDE, 2, 1, FALSE);

//------------------------------------------------------------------------------------------------------------------

}
