//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::: Shayan's Subrace Engine :::::::::::::::::::::::::::::
//:::::::::::::::::File Name: sha_leto_monster::::::::::::::::::::::::::::::::::
//::::::::::::::::::::: OnModuleLoad script ::::::::::::::::::::::::::::::::::::
//:: Written By: Flamecrow for Shayan's Subrace Engine
//
// Description: Scripts holds the undead and monster races.


#include "sha_subr_methds"
void main()
{

//::::::::::::::::::::::
//:::SUBRACE: Undead :::
//::::::::::::::::::::::

//Subrace Name: Undead

//Properties from the Skin:

    //Level 1:
        //Regeneration +1
        //Gains - Immunity: Miscellaneous: Paralysis
        //Vulnerability to Fire 50%

    //Level 4:
        //Gains - Immunity: Miscellaneous: Poison
        //Gains - Immunity: Miscellaneous: Disease

    //Level 8:
        //Gains - Immunity: Miscellaneous: Level/Ability Drain

    //Level 12:
        //Gains - Immunity: Miscellaneous: Death Magic

    //Level 16
        //Gains - Immunity: Miscellaneous: Mind-Affecting Spells
        //Gains - Immunity: Miscellaneous: Sneak Attack

    //Level 20:
        //Gains - Immunity: Miscellaneous: Critical Hits

//Abilities from the unique item:
    //Cast Spell: Control Undead 1 use/day
    //Cast Spell: Fear 1 use/day
    //Cast Spell: Ghoul Touch 1 use/day

//Human or Elf or Half-Elf, Light Sensitive, Takes 2 Divine Damage while in Sunlight.
//ECL: + 3
//Undead
   CreateSubrace(RACIAL_TYPE_HUMAN, "undead", "sub_undead_skn", "sub_undead_itm", TRUE, 2, FALSE, 0, 5, TRUE);


//LETO - Change ability scores:
        //Increased Ability Score: Strenght +2
        //Decreased Ability Score: Charisma -2
    struct SubraceBaseStatsModifier UndeadStats = CustomBaseStatsModifiers(2, 0, 0, 0, 0, -2, MOVEMENT_SPEED_SLOW);
    CreateBaseStatModifier("undead", UndeadStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("undead", FEAT_DARKVISION, 1);

//Can also be Elf
   AddAdditionalBaseRaceToSubrace("undead", RACIAL_TYPE_ELF);

//Can also be Half-Elf
   AddAdditionalBaseRaceToSubrace("undead", RACIAL_TYPE_HALFELF);

//Skins that are equipped at certain levels...
   AddAdditionalSkinsToSubrace("undead", "sub_undead_skn2", 4);
   AddAdditionalSkinsToSubrace("undead", "sub_undead_skn3", 8);
   AddAdditionalSkinsToSubrace("undead", "sub_undead_skn4", 12);
   AddAdditionalSkinsToSubrace("undead", "sub_undead_skn5", 16);
   AddAdditionalSkinsToSubrace("undead", "sub_undead_skn6", 20);

//Temporary Stats: Bonuses at Night time.
//Increase Strength by 6 points, Dexterity by 4 points, Consitution by 4, and AC by 5 and AB 10 during the Night.
   struct SubraceStats UndeadStats1 =  CreateCustomStats(SUBRACE_STAT_MODIFIER_TYPE_POINTS, 6.0, 4.0, 4.0, 0.0, 0.0, 0.0, 5.0, 10.0);
   CreateTemporaryStatModifier("undead", UndeadStats1, TIME_NIGHT);


//-------------------------------------------------------------------------------------------------------------------

//---------------------
//----MONSTER RACES----
//---------------------

//:::::::::::::::::::::::::::::::::::
//:::::::: SUBRACE: bugbear :::::::::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: bugbear

//Properties from the Skin:
    //AC + 3

//Must be: Halfelf
//ECL: + 5
     CreateSubrace(RACIAL_TYPE_HALFELF, "bugbear", "sub_bgbr_skn", "", FALSE, 0, FALSE, 0, 5);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +4
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Constitution +2
    //Ability Bonus: Intelligence +0
    //Ability Bonus: Wisdom +0
    //Ability Bonus: Charisma -2
    struct SubraceBaseStatsModifier BugbearStats = CustomBaseStatsModifiers(4, 2, 2, 0, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("bugbear", BugbearStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("bugbear", FEAT_DARKVISION, 1);
    ModifySubraceFeat("bugbear", FEAT_SKILL_FOCUS_MOVE_SILENTLY, 1);
    //Remove base half-elf feats
    ModifySubraceFeat("bugbear", FEAT_IMMUNITY_TO_SLEEP, 1, TRUE);
    ModifySubraceFeat("bugbear", FEAT_HARDINESS_VERSUS_ENCHANTMENTS, 1, TRUE);
    ModifySubraceFeat("bugbear", FEAT_PARTIAL_SKILL_AFFINITY_LISTEN, 1, TRUE);
    ModifySubraceFeat("bugbear", FEAT_PARTIAL_SKILL_AFFINITY_SEARCH, 1, TRUE);
    ModifySubraceFeat("bugbear", FEAT_PARTIAL_SKILL_AFFINITY_SPOT, 1, TRUE);
    ModifySubraceFeat("bugbear", FEAT_LOWLIGHTVISION, 1, TRUE);

//LETO - Skills:
    //Skill Bonus: Listen +2
    //Skill Bonus: Spot +2
    //Skill Bonus: Search +2
    ModifySubraceSkill("bugbear", SKILL_SPOT, 2, 1, FALSE);
    ModifySubraceSkill("bugbear", SKILL_LISTEN, 2, 1, FALSE);
    ModifySubraceSkill("bugbear", SKILL_SEARCH, 2, 1, FALSE);

//Favored Class: Rogue
     AddSubraceFavoredClass("bugbear", CLASS_TYPE_ROGUE, CLASS_TYPE_ROGUE);

//Appearance: Gnoll - Permanent.
     CreateSubraceAppearance("bugbear", TIME_BOTH, APPEARANCE_TYPE_BUGBEAR_CHIEFTAIN_A, APPEARANCE_TYPE_BUGBEAR_SHAMAN_A);

//:::::::::::::::::::::::::::::::::::
//::::::::: SUBRACE: gnoll ::::::::::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: gnoll

//Properties from the Skin:
    //AC + 1

//Must be: Halfelf
//ECL: + 2
     CreateSubrace(RACIAL_TYPE_HALFELF, "gnoll", "sub_gnll_skn", "", FALSE, 0, FALSE, 0, 2);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +4
    //Ability Bonus: Dexterity 0
    //Ability Bonus: Constitution +2
    //Ability Bonus: Intelligence -2
    //Ability Bonus: Wisdom +0
    //Ability Bonus: Charisma -2
    struct SubraceBaseStatsModifier GnollStats = CustomBaseStatsModifiers(4, 0, 2, -2, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("gnoll", GnollStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("gnoll", FEAT_DARKVISION, 1);
    ModifySubraceFeat("gnoll", FEAT_KEEN_SENSE, 1);
    //Remove base half-elf feats
    ModifySubraceFeat("gnoll", FEAT_IMMUNITY_TO_SLEEP, 1, TRUE);
    ModifySubraceFeat("gnoll", FEAT_HARDINESS_VERSUS_ENCHANTMENTS, 1, TRUE);
    ModifySubraceFeat("gnoll", FEAT_PARTIAL_SKILL_AFFINITY_LISTEN, 1, TRUE);
    ModifySubraceFeat("gnoll", FEAT_PARTIAL_SKILL_AFFINITY_SEARCH, 1, TRUE);
    ModifySubraceFeat("gnoll", FEAT_PARTIAL_SKILL_AFFINITY_SPOT, 1, TRUE);
    ModifySubraceFeat("gnoll", FEAT_LOWLIGHTVISION, 1, TRUE);

//LETO - Skills:
    //Skill Bonus: Listen +2
    //Skill Bonus: Spot +2
    //Skill Bonus: Search +2
    ModifySubraceSkill("gnoll", SKILL_SPOT, 2, 1, FALSE);
    ModifySubraceSkill("gnoll", SKILL_LISTEN, 2, 1, FALSE);
    ModifySubraceSkill("gnoll", SKILL_SEARCH, 2, 1, FALSE);

//Favored Class: Rogue
     AddSubraceFavoredClass("gnoll", CLASS_TYPE_RANGER, CLASS_TYPE_RANGER);

//Appearance: Gnoll - Permanent.
     CreateSubraceAppearance("gnoll", TIME_BOTH, 1552, 1553);



//:::::::::::::::::::::::::::::::::::
//::::::::: SUBRACE: goblin :::::::::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: goblin

//Properties from the Skin:
    //AC + 1

//Must be: Halfelf
//ECL: + 1
     CreateSubrace(RACIAL_TYPE_HALFELF, "goblin", "sub_gbln_skn", "", FALSE, 0, FALSE, 0, 1);

//LETO - Change ability scores:
    //Ability Bonus: Strenght -2
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Constitution 0
    //Ability Bonus: Intelligence 0
    //Ability Bonus: Wisdom +0
    //Ability Bonus: Charisma -2
    struct SubraceBaseStatsModifier GoblinStats = CustomBaseStatsModifiers(-2, 2, 0, 0, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("goblin", GoblinStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("goblin", FEAT_DARKVISION, 1);
    ModifySubraceFeat("goblin", 375, 1);
    ModifySubraceFeat("goblin", FEAT_SKILL_FOCUS_MOVE_SILENTLY, 1);
    ModifySubraceFeat("goblin", FEAT_SKILL_FOCUS_HIDE, 1);
    //Remove base half-elf feats
    ModifySubraceFeat("goblin", FEAT_IMMUNITY_TO_SLEEP, 1, TRUE);
    ModifySubraceFeat("goblin", FEAT_HARDINESS_VERSUS_ENCHANTMENTS, 1, TRUE);
    ModifySubraceFeat("goblin", FEAT_PARTIAL_SKILL_AFFINITY_LISTEN, 1, TRUE);
    ModifySubraceFeat("goblin", FEAT_PARTIAL_SKILL_AFFINITY_SEARCH, 1, TRUE);
    ModifySubraceFeat("goblin", FEAT_PARTIAL_SKILL_AFFINITY_SPOT, 1, TRUE);
    ModifySubraceFeat("goblin", FEAT_LOWLIGHTVISION, 1, TRUE);

//Favored Class: Rogue
     AddSubraceFavoredClass("goblin", CLASS_TYPE_ROGUE, CLASS_TYPE_ROGUE);

//Appearance: Goblin - Permanent.
     CreateSubraceAppearance("goblin", TIME_BOTH, APPEARANCE_TYPE_GOBLIN_CHIEF_B, APPEARANCE_TYPE_GOBLIN_SHAMAN_B);


//:::::::::::::::::::::::::::::::::::
//::::::::: SUBRACE: kobold :::::::::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: kobold

//Properties from the Skin:
    //AC + 1
    //Damage Reduction 5/+3

//Must be: Halfelf
//ECL: + 0


     CreateSubrace(RACIAL_TYPE_HALFELF, "kobold", "sub_kbld_skn", "", TRUE, 0, FALSE, 0, 0);

//LETO - Change ability scores:
    //Ability Bonus: Strenght -4
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Constitution -2
    //Ability Bonus: Intelligence 0
    //Ability Bonus: Wisdom 0
    //Ability Bonus: Charisma 0
    struct SubraceBaseStatsModifier KoboldStats = CustomBaseStatsModifiers(-4, 2, -2, 0, 0, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("kobold", KoboldStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("kobold", FEAT_DARKVISION, 1);
    ModifySubraceFeat("kobold", 375, 1);
    ModifySubraceFeat("kobold", FEAT_SKILL_FOCUS_MOVE_SILENTLY, 1);
    ModifySubraceFeat("kobold", FEAT_SKILL_FOCUS_HIDE, 1);
    //Remove base half-elf feats
    ModifySubraceFeat("kobold", FEAT_IMMUNITY_TO_SLEEP, 1, TRUE);
    ModifySubraceFeat("kobold", FEAT_HARDINESS_VERSUS_ENCHANTMENTS, 1, TRUE);
    ModifySubraceFeat("kobold", FEAT_PARTIAL_SKILL_AFFINITY_LISTEN, 1, TRUE);
    ModifySubraceFeat("kobold", FEAT_PARTIAL_SKILL_AFFINITY_SEARCH, 1, TRUE);
    ModifySubraceFeat("kobold", FEAT_PARTIAL_SKILL_AFFINITY_SPOT, 1, TRUE);
    ModifySubraceFeat("kobold", FEAT_LOWLIGHTVISION, 1, TRUE);

//LETO - Skills:
    //Skill Bonus: Craft Trap +2
    //Skill Bonus: Search +2
    ModifySubraceSkill("kobold", SKILL_CRAFT_TRAP, 2, 1, FALSE);
    ModifySubraceSkill("kobold", SKILL_SEARCH, 2, 1, FALSE);

//Favored Class: Rogue
     AddSubraceFavoredClass("kobold", CLASS_TYPE_SORCERER, CLASS_TYPE_SORCERER);

//Appearance: Gnoll - Permanent.
     CreateSubraceAppearance("kobold", TIME_BOTH, APPEARANCE_TYPE_KOBOLD_CHIEF_B, APPEARANCE_TYPE_KOBOLD_SHAMAN_B);



/*//:::::::::::::::::::::::::::::::::::
//::::::::: SUBRACE: kuo-toa :::::::::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: kuo-toa

//Properties from the Skin:
    //AC + 6
    //Damage Resistance Electrical 10/-
    //Immunity to Poison
    //Immunity to Paralysis
    //Freedom of Movement
    //Immunity to Drown Spell

//Abilities from the unique item:
    //Cast Spell: Lightning Bolt 2 Use/Day

//Must be: Halfelf
//ECL: + 2


     CreateSubrace(RACIAL_TYPE_HALFELF, "kuo-toa", "sub_kuotoa_skn", "sub_kuotoa_itm", TRUE, 0, FALSE, 0,2);

//LETO - Change ability scores:
    //Ability Bonus: Strenght 0
    //Ability Bonus: Dexterity +4
    //Ability Bonus: Constitution +4
    //Ability Bonus: Intelligence 0
    //Ability Bonus: Wisdom 0
    //Ability Bonus: Charisma 0
    struct SubraceBaseStatsModifier KuoToaStats = CustomBaseStatsModifiers(0, 4, 4, 0, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("kuo-toa", KuoToaStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("kuo-toa", FEAT_GREAT_FORTITUDE, 1);
    ModifySubraceFeat("kuo-toa", FEAT_ALERTNESS, 1);
    ModifySubraceFeat("kuo-toa", FEAT_WEAPON_PROFICIENCY_MARTIAL, 1);
    ModifySubraceFeat("kuo-toa", FEAT_DARKVISION, 1);
    //Remove base half-elf feats
    ModifySubraceFeat("kuo-toa", FEAT_IMMUNITY_TO_SLEEP, 1, TRUE);
    ModifySubraceFeat("kuo-toa", FEAT_HARDINESS_VERSUS_ENCHANTMENTS, 1, TRUE);
    ModifySubraceFeat("kuo-toa", FEAT_PARTIAL_SKILL_AFFINITY_LISTEN, 1, TRUE);
    ModifySubraceFeat("kuo-toa", FEAT_PARTIAL_SKILL_AFFINITY_SEARCH, 1, TRUE);
    ModifySubraceFeat("kuo-toa", FEAT_PARTIAL_SKILL_AFFINITY_SPOT, 1, TRUE);
    ModifySubraceFeat("kuo-toa", FEAT_LOWLIGHTVISION, 1, TRUE);

//LETO - Skills:
    //Skill Bonus: Tumble +8
    //Skill Bonus: Spot +4
    //Skill Bonus: Search +4
    ModifySubraceSkill("kuo-toa", SKILL_TUMBLE, 8, 1, FALSE);
    ModifySubraceSkill("kuo-toa", SKILL_SPOT, 4, 1, FALSE);
    ModifySubraceSkill("kuo-toa", SKILL_SEARCH, 4, 1, FALSE);

//Favored Class: Rogue (male), Cleric (female)
     AddSubraceFavoredClass("kuo-toa", CLASS_TYPE_ROGUE, CLASS_TYPE_CLERIC);

//Appearance: Gnoll - Permanent.
     CreateSubraceAppearance("kuo-toa", TIME_BOTH, 1522, 1523);

//Can't use any Heavy or Medium Armor or Helmets (they don't fit into them)
    SubraceRestrictUseOfItems("kuo-toa", ITEM_TYPE_HELM | ITEM_TYPE_ARMOR_AC_5 | ITEM_TYPE_ARMOR_AC_6 | ITEM_TYPE_ARMOR_AC_7 | ITEM_TYPE_ARMOR_AC_8, TIME_BOTH);*/


//:::::::::::::::::::::::::::::::::::
//::::::::: SUBRACE: lizardfolk :::::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: lizardfolk

//Properties from the Skin:
    //AC + 5
    //Immunity to Drown Spell

//Must be: Halfelf
//ECL: + 1


     CreateSubrace(RACIAL_TYPE_HALFELF, "lizardfolk", "sub_lzrd_skn", "", FALSE, 0, FALSE, 0, 1);

//LETO - Change ability scores:
    //Ability Bonus: Strenght 2
    //Ability Bonus: Dexterity 0
    //Ability Bonus: Constitution 2
    //Ability Bonus: Intelligence -2
    //Ability Bonus: Wisdom 0
    //Ability Bonus: Charisma 0
    struct SubraceBaseStatsModifier LizardStats = CustomBaseStatsModifiers(2, 0, 2, -2, 0, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("lizardfolk", LizardStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("lizardfolk", FEAT_CLEAVE, 1);
    //Remove base half-elf feats
    ModifySubraceFeat("lizardfolk", FEAT_IMMUNITY_TO_SLEEP, 1, TRUE);
    ModifySubraceFeat("lizardfolk", FEAT_HARDINESS_VERSUS_ENCHANTMENTS, 1, TRUE);
    ModifySubraceFeat("lizardfolk", FEAT_PARTIAL_SKILL_AFFINITY_LISTEN, 1, TRUE);
    ModifySubraceFeat("lizardfolk", FEAT_PARTIAL_SKILL_AFFINITY_SEARCH, 1, TRUE);
    ModifySubraceFeat("lizardfolk", FEAT_PARTIAL_SKILL_AFFINITY_SPOT, 1, TRUE);
    ModifySubraceFeat("lizardfolk", FEAT_LOWLIGHTVISION, 1, TRUE);

//LETO - Skills:
    //Skill Bonus: Tumble +5
    ModifySubraceSkill("lizardfolk", SKILL_TUMBLE, 5, 1, FALSE);

//Favored Class: Druid
     AddSubraceFavoredClass("lizardfolk", CLASS_TYPE_DRUID, CLASS_TYPE_DRUID);

//Appearance: Gnoll - Permanent.
     CreateSubraceAppearance("lizardfolk", TIME_BOTH, APPEARANCE_TYPE_LIZARDFOLK_WARRIOR_A, APPEARANCE_TYPE_LIZARDFOLK_SHAMAN_A);

//Add tail to lizard
    ModifySubraceAppearanceAttachment("lizardfolk", 0, 0, APPEARANCE_TYPE_ATTACHMENT_TAIL_LIZARD, APPEARANCE_TYPE_ATTACHMENT_TAIL_LIZARD, 1);


//:::::::::::::::::::::::::::::::::::::::
//::::::::::: SUBRACE: ogre :::::::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: ogre

//Properties from the Skin:
    //AC Bonus +5

//Must be:  Halfelf
//ECL: + 5
     CreateSubrace(RACIAL_TYPE_HALFELF, "ogre", "sub_ogre_skn", "", FALSE, 0, FALSE, 0, 5);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +10
    //Ability Bonus: Dexterity -2
    //Ability Bonus: Constitution +4
    //Ability Bonus: Intelligence -4
    //Ability Bonus: Wisdom 0
    //Ability Bonus: Charisma -4
    struct SubraceBaseStatsModifier OgreStats = CustomBaseStatsModifiers(10, -2, 4, -4, 0, -4, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("ogre", OgreStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("ogre", FEAT_DARKVISION, 1);
    ModifySubraceFeat("ogre", FEAT_ARMOR_PROFICIENCY_LIGHT, 1);
    ModifySubraceFeat("ogre", FEAT_ARMOR_PROFICIENCY_MEDIUM, 1);
    ModifySubraceFeat("ogre", FEAT_SHIELD_PROFICIENCY, 1);
    ModifySubraceFeat("ogre", FEAT_WEAPON_PROFICIENCY_MARTIAL, 1);
    ModifySubraceFeat("ogre", FEAT_WEAPON_PROFICIENCY_SIMPLE, 1);
    //Remove base half-elf feats
    ModifySubraceFeat("ogre", FEAT_IMMUNITY_TO_SLEEP, 1, TRUE);
    ModifySubraceFeat("ogre", FEAT_HARDINESS_VERSUS_ENCHANTMENTS, 1, TRUE);
    ModifySubraceFeat("ogre", FEAT_PARTIAL_SKILL_AFFINITY_LISTEN, 1, TRUE);
    ModifySubraceFeat("ogre", FEAT_PARTIAL_SKILL_AFFINITY_SEARCH, 1, TRUE);
    ModifySubraceFeat("ogre", FEAT_PARTIAL_SKILL_AFFINITY_SPOT, 1, TRUE);
    ModifySubraceFeat("ogre", FEAT_LOWLIGHTVISION, 1, TRUE);

//LETO - Skills:
    //Decreased Skill Modifier: Move Silently -5
    //Decreased Skill Modifier: Hide -8
    ModifySubraceSkill("ogre", SKILL_HIDE, -8, 1, FALSE);
    ModifySubraceSkill("ogre", SKILL_MOVE_SILENTLY, -5, 1, FALSE);

//Appearance: Ogre - Permanent.
     CreateSubraceAppearance("ogre", TIME_BOTH, APPEARANCE_TYPE_OGRE_CHIEFTAIN, APPEARANCE_TYPE_OGREB);

//Can't use any Tiny weapons (Too big to hold them!!)
    SubraceRestrictUseOfItems("ogre", ITEM_TYPE_WEAPON_SIZE_TINY, TIME_BOTH);

//Favored Class: Barbarian
     AddSubraceFavoredClass("ogre", CLASS_TYPE_BARBARIAN, CLASS_TYPE_BARBARIAN);



//:::::::::::::::::::::::::::::::::::::::
//::::::::::: SUBRACE: orc ::::::::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: orc

//Must be:  Halfelf
//ECL: + 1
     CreateSubrace(RACIAL_TYPE_HALFELF, "orc", "", "", FALSE, 0, FALSE, 0, 1);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +4
    //Ability Bonus: Dexterity -2
    //Ability Bonus: Constitution +4
    //Ability Bonus: Intelligence -4
    //Ability Bonus: Wisdom 0
    //Ability Bonus: Charisma -4
    struct SubraceBaseStatsModifier OrcStats = CustomBaseStatsModifiers(4, 0, 0, -2, -2, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("orc", OrcStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("orc", FEAT_DARKVISION, 1);
    ModifySubraceFeat("orc", FEAT_ARMOR_PROFICIENCY_MEDIUM, 1);
    ModifySubraceFeat("orc", FEAT_WEAPON_PROFICIENCY_MARTIAL, 1);
    //Remove base half-elf feats
    ModifySubraceFeat("orc", FEAT_IMMUNITY_TO_SLEEP, 1, TRUE);
    ModifySubraceFeat("orc", FEAT_HARDINESS_VERSUS_ENCHANTMENTS, 1, TRUE);
    ModifySubraceFeat("orc", FEAT_PARTIAL_SKILL_AFFINITY_LISTEN, 1, TRUE);
    ModifySubraceFeat("orc", FEAT_PARTIAL_SKILL_AFFINITY_SEARCH, 1, TRUE);
    ModifySubraceFeat("orc", FEAT_PARTIAL_SKILL_AFFINITY_SPOT, 1, TRUE);
    ModifySubraceFeat("orc", FEAT_LOWLIGHTVISION, 1, TRUE);


//Appearance: Ogre - Permanent.
     CreateSubraceAppearance("orc", TIME_BOTH, APPEARANCE_TYPE_ORC_CHIEFTAIN_A, APPEARANCE_TYPE_ORC_SHAMAN_A);

//Favored Class: Barbarian
     AddSubraceFavoredClass("orc", CLASS_TYPE_BARBARIAN, CLASS_TYPE_BARBARIAN);


//:::::::::::::::::::::::::::::::::::::::
//::::::::::: SUBRACE: minotaur :::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: minotaur

//Properties from the Skin:
    //AC Bonus +5

//Must be:  Halfelf
//ECL: + 5
     CreateSubrace(RACIAL_TYPE_HALFELF, "minotaur", "sub_mino_skin", "", FALSE, 0, FALSE, 0, 5);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +8
    //Ability Bonus: Dexterity 0
    //Ability Bonus: Constitution +4
    //Ability Bonus: Intelligence -4
    //Ability Bonus: Wisdom 0
    //Ability Bonus: Charisma -2
    struct SubraceBaseStatsModifier MinotaurStats = CustomBaseStatsModifiers(8, 0, 4, -4, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("minotaur", MinotaurStats, 1);

//LETO - Feats:
    //Add
    ModifySubraceFeat("minotaur", FEAT_DARKVISION, 1);
    ModifySubraceFeat("minotaur", FEAT_WEAPON_PROFICIENCY_SIMPLE, 1);
    ModifySubraceFeat("minotaur", FEAT_WEAPON_PROFICIENCY_MARTIAL, 1);
    //Remove base half-elf feats
    ModifySubraceFeat("minotaur", FEAT_IMMUNITY_TO_SLEEP, 1, TRUE);
    ModifySubraceFeat("minotaur", FEAT_HARDINESS_VERSUS_ENCHANTMENTS, 1, TRUE);
    ModifySubraceFeat("minotaur", FEAT_PARTIAL_SKILL_AFFINITY_LISTEN, 1, TRUE);
    ModifySubraceFeat("minotaur", FEAT_PARTIAL_SKILL_AFFINITY_SEARCH, 1, TRUE);
    ModifySubraceFeat("minotaur", FEAT_PARTIAL_SKILL_AFFINITY_SPOT, 1, TRUE);
    ModifySubraceFeat("minotaur", FEAT_LOWLIGHTVISION, 1, TRUE);

//LETO - Skills:
    //Decreased Skill Modifier: Move Silently -4
    //Skill Bonus: Listen +4
    //Skill Bonus: Spot +4
    //Skill Bonus: Search +4
    ModifySubraceSkill("minotaur", SKILL_SPOT, 4, 1, FALSE);
    ModifySubraceSkill("minotaur", SKILL_LISTEN, 4, 1, FALSE);
    ModifySubraceSkill("minotaur", SKILL_SEARCH, 4, 1, FALSE);
    ModifySubraceSkill("minotaur", SKILL_HIDE, -4, 1, FALSE);

//Appearance: Ogre - Permanent.
     CreateSubraceAppearance("minotaur", TIME_BOTH, APPEARANCE_TYPE_MINOTAUR_CHIEFTAIN, APPEARANCE_TYPE_MINOTAUR_SHAMAN);

//Favored Class: Barbarian
     AddSubraceFavoredClass("minotaur", CLASS_TYPE_BARBARIAN, CLASS_TYPE_BARBARIAN);

//Can't use any Tiny weapons (Too big to hold them!!)
    SubraceRestrictUseOfItems("minotaur", ITEM_TYPE_WEAPON_SIZE_TINY, TIME_BOTH);

}
