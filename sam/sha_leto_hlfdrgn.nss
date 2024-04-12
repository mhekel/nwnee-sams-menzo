//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::: Shayan's Subrace Engine :::::::::::::::::::::::::::::
//:::::::::::::::::File Name: sha_leto_hlfdrgn::::::::::::::::::::::::::::::::::
//::::::::::::::::::::: OnModuleLoad script ::::::::::::::::::::::::::::::::::::
//:: Written By: Flamecrow for Shayan's Subrace Engine
//
// Description: Scripts holds the half dragon subraces.


#include "sha_subr_methds"
void main()
{

//-----------------------------------
//--------CHROMATIC DRAGONS----------
//-----------------------------------

//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: half-red dragon :::::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: half-red dragon

//Properties from the Skin:
    //50% immunity to Fire
    //50%  vulnerability to Cold
    //Save Increase + 3
    //AC + 3

//Abilities from the unique item:
    //Cast Spell: Fire Breath Weapon 5 Use/Per Day

//Must be: Any
//ECL: + 15
     CreateSubrace(RACIAL_TYPE_HUMAN, "half-red dragon", "sub_rddrgn_skn", "sub_rddrgn_itm", FALSE, 0, FALSE, 0, 15);

//Additional Races
    AddAdditionalBaseRaceToSubrace("half-red dragon", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("half-red dragon", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("half-red dragon", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("half-red dragon", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("half-red dragon", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("half-red dragon", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +8
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Constitution +2
    //Ability Bonus: Intelligence +2
    //Ability Bonus: Wisdom +2
    //Ability Bonus: Charisma +2
    struct SubraceBaseStatsModifier HalfRedDragonStats = CustomBaseStatsModifiers(8, 2, 2, 2, 2, 2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("half-red dragon", HalfRedDragonStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half-red dragon", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Listen +10
    //Skill Bonus: Spot +10
    ModifySubraceSkill("half-red dragon", SKILL_SPOT, 10, 1, FALSE);
    ModifySubraceSkill("half-red dragon", SKILL_LISTEN, 10, 1, FALSE);

//Favored Class: Any
     AddSubraceFavoredClass("half-red dragon", CLASS_TYPE_ANY, CLASS_TYPE_ANY);






//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: half-blue dragon ::::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: half-blue dragon

//Properties from the Skin:
    //50% immunity to Electrical
    //50% vulnerability to acid
    //AC + 3

//Abilities from the unique item:
    //Cast Spell: Electrical Breath Weapon 5 Use/Per Day

//Must be: Any
//ECL: + 15
     CreateSubrace(RACIAL_TYPE_HUMAN, "half-blue dragon", "sub_bldrgn_skn", "sub_bldrgn_itm", FALSE, 0, FALSE, 0, 15);

//Additional Races
    AddAdditionalBaseRaceToSubrace("half-blue dragon", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("half-blue dragon", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("half-blue dragon", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("half-blue dragon", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("half-blue dragon", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("half-blue dragon", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +5
    //Ability Bonus: Dexterity +3
    //Ability Bonus: Constitution +4
    //Ability Bonus: Intelligence +2
    //Ability Bonus: Wisdom +2
    //Ability Bonus: Charisma +2
    struct SubraceBaseStatsModifier HalfBlueDragonStats = CustomBaseStatsModifiers(5, 2, 4, 4, 2, 2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("half-blue dragon", HalfBlueDragonStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half-blue dragon", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Listen +10
    //Skill Bonus: Spot +10
    ModifySubraceSkill("half-blue dragon", SKILL_SPOT, 10, 1, FALSE);
    ModifySubraceSkill("half-blue dragon", SKILL_LISTEN, 10, 1, FALSE);

//Favored Class: Any
     AddSubraceFavoredClass("half-blue dragon", CLASS_TYPE_ANY, CLASS_TYPE_ANY);






//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: half-black dragon :::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: half-black dragon

//Properties from the Skin:
    //50% immunity to acid
    //50% vulnerability to divine
    //AC + 3

//Abilities from the unique item:
    //Cast Spell: Acid Breath Weapon 5 Use/Per Day

//Must be: Any
//ECL: + 15
     CreateSubrace(RACIAL_TYPE_HUMAN, "half-black dragon", "sub_blkdrgn_skn", "sub_blkdrgn_itm", FALSE, 0, FALSE, 0, 15);

//Additional Races
    AddAdditionalBaseRaceToSubrace("half-black dragon", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("half-black dragon", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("half-black dragon", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("half-black dragon", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("half-black dragon", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("half-black dragon", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +4
    //Ability Bonus: Dexterity +0
    //Ability Bonus: Constitution +6
    //Ability Bonus: Intelligence +3
    //Ability Bonus: Wisdom +3
    //Ability Bonus: Charisma +3
    struct SubraceBaseStatsModifier HalfBlackDragonStats = CustomBaseStatsModifiers(4, 0, 6, 3, 3, 3, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("half-black dragon", HalfBlackDragonStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half-black dragon", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Listen +10
    //Skill Bonus: Spot +10
    ModifySubraceSkill("half-black dragon", SKILL_SPOT, 10, 1, FALSE);
    ModifySubraceSkill("half-black dragon", SKILL_LISTEN, 10, 1, FALSE);

//Favored Class: Any
     AddSubraceFavoredClass("half-black dragon", CLASS_TYPE_ANY, CLASS_TYPE_ANY);




/*//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: half-green dragon :::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: half-green dragon

//Properties from the Skin:
    //50% immunity to acid
    //50% vulnerability to fire
    //AC + 3

//Abilities from the unique item:
    //Cast Spell: Gas Breath Weapon 5 Use/Per Day

//Must be: Any
//ECL: + 15
     CreateSubrace(RACIAL_TYPE_HUMAN, "half-green dragon", "sub_grndrgn_skn", "sub_grndrgn_itm", FALSE, 0, FALSE, 0, 15);

//Additional Races
    AddAdditionalBaseRaceToSubrace("half-green dragon", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("half-green dragon", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("half-green dragon", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("half-green dragon", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("half-green dragon", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("half-green dragon", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +7
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Constitution +2
    //Ability Bonus: Intelligence +2
    //Ability Bonus: Wisdom +3
    //Ability Bonus: Charisma +2
    struct SubraceBaseStatsModifier HalfGreenDragonStats = CustomBaseStatsModifiers(7, 2, 2, 2, 3, 2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("half-green dragon", HalfGreenDragonStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half-green dragon", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Listen +10
    //Skill Bonus: Spot +10
    ModifySubraceSkill("half-green dragon", SKILL_SPOT, 10, 1, FALSE);
    ModifySubraceSkill("half-green dragon", SKILL_LISTEN, 10, 1, FALSE);

//Favored Class: Any
     AddSubraceFavoredClass("half-green dragon", CLASS_TYPE_ANY, CLASS_TYPE_ANY); */




//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: half-white dragon :::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: half-white dragon
//Properties from the Skin:
    //50% immunity to Cold
    //50% vulnerability to Fire
    //Save Increase + 3
    //AC + 3

//Abilities from the unique item:
    //Cast Spell: Ice Breath Weapon 5 Use/Per Day

//Must be: Any
//ECL: + 15
     CreateSubrace(RACIAL_TYPE_HUMAN, "half-white dragon", "sub_whtdrgn_skn", "sub_whtdrgn_itm", FALSE, 0, FALSE, 0, 15);

//Additional Races
    AddAdditionalBaseRaceToSubrace("half-white dragon", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("half-white dragon", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("half-white dragon", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("half-white dragon", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("half-white dragon", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("half-white dragon", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +6
    //Ability Bonus: Dexterity +4
    //Ability Bonus: Constitution +6
    //Ability Bonus: Intelligence +0
    //Ability Bonus: Wisdom +0
    //Ability Bonus: Charisma +0
    struct SubraceBaseStatsModifier HalfWhiteDragonStats = CustomBaseStatsModifiers(6, 6, 6, 0, 0, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("half-white dragon", HalfWhiteDragonStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half-white dragon", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Listen +10
    //Skill Bonus: Spot +10
    ModifySubraceSkill("half-white dragon", SKILL_SPOT, 10, 1, FALSE);
    ModifySubraceSkill("half-white dragon", SKILL_LISTEN, 10, 1, FALSE);

//Favored Class: Any
     AddSubraceFavoredClass("half-white dragon", CLASS_TYPE_ANY, CLASS_TYPE_ANY);





//-----------------------------------
//----------METALIC DRAGONS----------
//-----------------------------------


/*//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: half-brass dragon :::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: half-brass dragon

//Properties from the Skin:
    //50% immunity to Fire
    //50%  vulnerability to Cold
    //Save Increase + 3
    //AC + 3

//Abilities from the unique item:
    //Cast Spell: Sleep Breath Weapon 5 Use/Per Day

//Must be: Any
//ECL: + 15
     CreateSubrace(RACIAL_TYPE_HUMAN, "half-brass dragon", "sub_brssdrgn_skn", "sub_brssdrgn_itm", FALSE, 0, FALSE, 0, 15);

//Additional Races
    AddAdditionalBaseRaceToSubrace("half-brass dragon", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("half-brass dragon", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("half-brass dragon", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("half-brass dragon", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("half-brass dragon", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("half-brass dragon", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +6
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Constitution +2
    //Ability Bonus: Intelligence +2
    //Ability Bonus: Wisdom +2
    //Ability Bonus: Charisma +3
    struct SubraceBaseStatsModifier HalfBrassDragonStats = CustomBaseStatsModifiers(6, 2, 3, 2, 2, 3, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("half-brass dragon", HalfBrassDragonStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half-brass dragon", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Listen +10
    //Skill Bonus: Spot +10
    ModifySubraceSkill("half-brass dragon", SKILL_SPOT, 10, 1, FALSE);
    ModifySubraceSkill("half-brass dragon", SKILL_LISTEN, 10, 1, FALSE);

//Favored Class: Any
     AddSubraceFavoredClass("half-brass dragon", CLASS_TYPE_ANY, CLASS_TYPE_ANY);




//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: half-bronze dragon ::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: half-bronze dragon

//Properties from the Skin:
    //50% immunity to Electrical
    //50% vulnerability to Cold
    //AC + 3

//Abilities from the unique item:
    //Cast Spell: Fear Breath Weapon 5 Use/Per Day

//Must be: Any
//ECL: + 15
     CreateSubrace(RACIAL_TYPE_HUMAN, "half-bronze dragon", "sub_brnzdrgn_skn", "sub_brnzdrgn_itm", FALSE, 0, FALSE, 0, 15);

//Additional Races
    AddAdditionalBaseRaceToSubrace("half-bronze dragon", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("half-bronze dragon", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("half-bronze dragon", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("half-bronze dragon", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("half-bronze dragon", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("half-bronze dragon", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +6
    //Ability Bonus: Dexterity +0
    //Ability Bonus: Constitution +4
    //Ability Bonus: Intelligence +4
    //Ability Bonus: Wisdom +4
    //Ability Bonus: Charisma +2
    struct SubraceBaseStatsModifier HalfBronzeDragonStats = CustomBaseStatsModifiers(6, 0, 4, 4, 4, 2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("half-bronze dragon", HalfBronzeDragonStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half-bronze dragon", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Listen +10
    //Skill Bonus: Spot +10
    ModifySubraceSkill("half-bronze dragon", SKILL_SPOT, 10, 1, FALSE);
    ModifySubraceSkill("half-bronze dragon", SKILL_LISTEN, 10, 1, FALSE);

//Favored Class: Any
     AddSubraceFavoredClass("half-bronze dragon", CLASS_TYPE_ANY, CLASS_TYPE_ANY);
*/




//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: half-copper dragon ::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: half-copper dragon

//Properties from the Skin:
    //50% immunity to Acid
    //50% vulnerability to fire
    //AC + 3

//Abilities from the unique item:
    //Cast Spell: Slow Breath Weapon 5 Use/Per Day

//Must be: Any
//ECL: + 15
     CreateSubrace(RACIAL_TYPE_HUMAN, "half-copper dragon", "sub_cpprdrgn_skn", "sub_cpprdrgn_itm", FALSE, 0, FALSE, 0, 15);

//Additional Races
    AddAdditionalBaseRaceToSubrace("half-copper dragon", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("half-copper dragon", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("half-copper dragon", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("half-copper dragon", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("half-copper dragon", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("half-copper dragon", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +6
    //Ability Bonus: Dexterity +0
    //Ability Bonus: Constitution +6
    //Ability Bonus: Intelligence +2
    //Ability Bonus: Wisdom +2
    //Ability Bonus: Charisma +2
    struct SubraceBaseStatsModifier HalfCopperDragonStats = CustomBaseStatsModifiers(6, 0, 6, 2, 2, 2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("half-copper dragon", HalfCopperDragonStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half-copper dragon", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Listen +10
    //Skill Bonus: Spot +10
    ModifySubraceSkill("half-copper dragon", SKILL_SPOT, 10, 1, FALSE);
    ModifySubraceSkill("half-copper dragon", SKILL_LISTEN, 10, 1, FALSE);

//Favored Class: Any
     AddSubraceFavoredClass("half-copper dragon", CLASS_TYPE_ANY, CLASS_TYPE_ANY);




//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: half-gold dragon ::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: half-gold dragon

//Properties from the Skin:
    //50% immunity to Fire
    //50% vulnerability to Cold
    //Saving Throws +3
    //AC + 3

//Abilities from the unique item:
    //Cast Spell: Weakening Breath Weapon 5 Use/Per Day

//Must be: Any
//ECL: + 15
     CreateSubrace(RACIAL_TYPE_HUMAN, "half-gold dragon", "sub_glddrgn_skn", "sub_glddrgn_itm", FALSE, 0, FALSE, 0, 15);

//Additional Races
    AddAdditionalBaseRaceToSubrace("half-gold dragon", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("half-gold dragon", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("half-gold dragon", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("half-gold dragon", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("half-gold dragon", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("half-gold dragon", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +4
    //Ability Bonus: Dexterity +0
    //Ability Bonus: Constitution +4
    //Ability Bonus: Intelligence +4
    //Ability Bonus: Wisdom +4
    //Ability Bonus: Charisma +6
    struct SubraceBaseStatsModifier HalfGoldDragonStats = CustomBaseStatsModifiers(4, 0, 4, 4, 4, 6, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("half-gold dragon", HalfGoldDragonStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half-gold dragon", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Listen +10
    //Skill Bonus: Spot +10
    ModifySubraceSkill("half-gold dragon", SKILL_SPOT, 10, 1, FALSE);
    ModifySubraceSkill("half-gold dragon", SKILL_LISTEN, 10, 1, FALSE);

//Favored Class: Any
     AddSubraceFavoredClass("half-gold dragon", CLASS_TYPE_ANY, CLASS_TYPE_ANY);




//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: half-silver dragon ::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: half-silver dragon

//Properties from the Skin:
    //50% immunity to Cold
    //50% vulnerability to Fire
    //AC + 3

//Abilities from the unique item:
    //Cast Spell: Paralyzing Breath Weapon 5 Use/Per Day

//Must be: Any
//ECL: + 15
     CreateSubrace(RACIAL_TYPE_HUMAN, "half-silver dragon", "sub_slvrdrgn_skn", "sub_slvrdrgn_itm", FALSE, 0, FALSE, 0, 15);

//Additional Races
    AddAdditionalBaseRaceToSubrace("half-silver dragon", RACIAL_TYPE_ELF);
    AddAdditionalBaseRaceToSubrace("half-silver dragon", RACIAL_TYPE_GNOME);
    AddAdditionalBaseRaceToSubrace("half-silver dragon", RACIAL_TYPE_HALFELF);
    AddAdditionalBaseRaceToSubrace("half-silver dragon", RACIAL_TYPE_HALFLING);
    AddAdditionalBaseRaceToSubrace("half-silver dragon", RACIAL_TYPE_HALFORC);
    AddAdditionalBaseRaceToSubrace("half-silver dragon", RACIAL_TYPE_DWARF);

//LETO - Change ability scores:
    //Ability Bonus: Strenght +5
    //Ability Bonus: Dexterity +1
    //Ability Bonus: Constitution +3
    //Ability Bonus: Intelligence +3
    //Ability Bonus: Wisdom +3
    //Ability Bonus: Charisma +4
    struct SubraceBaseStatsModifier HalfSilverDragonStats = CustomBaseStatsModifiers(5, 1, 3, 3, 3, 4, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("half-silver dragon", HalfSilverDragonStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half-silver dragon", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Listen +10
    //Skill Bonus: Spot +10
    ModifySubraceSkill("half-silver dragon", SKILL_SPOT, 10, 1, FALSE);
    ModifySubraceSkill("half-silver dragon", SKILL_LISTEN, 10, 1, FALSE);

//Favored Class: Any
     AddSubraceFavoredClass("half-silver dragon", CLASS_TYPE_ANY, CLASS_TYPE_ANY);


}
