//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::: Shayan's Subrace Engine :::::::::::::::::::::::::::::
//:::::::::::::::::File Name: sha_leto_sraces1 ::::::::::::::::::::::::::::::::::::
//::::::::::::::::::::: OnModuleLoad script ::::::::::::::::::::::::::::::::::::
//:: Written By: Shayan.
//:: Contact: mail_shayan@yahoo.com
//
// Description: This script holds the pre-made 'normal' subraces. (By normal I mean,
//              subraces that are often found on persistent worlds. These sub-races
//              are humaniod sub-races... that is subraces like:
//              Drow, Aasimar, Duergar, etc.
//              This script is the Leto equivalent of sha_subraces1.
//              It will give players permanent ability scores,feats, etc rather than
//              as a bonus from skin/creature hide. It may also contain added benefits like
//              wings.


#include "sha_subr_methds"
void main()
{



//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Human - Aasimar :::::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: Aasimar

//Properties from the Skin:
    //Damage Resistance: Acid Resist 5 / -
    //Damage Resistance: Cold Resist 5 / -
    //Damage Resistance: Electrical Resist 5 / -
    //Saving Throw Bonus: Universal +2

//Abilities from the unique item:
    //Cast Spell: Light (5) 1 Use/Per Day

//Must be: Human
//ECL: + 1
     CreateSubrace(RACIAL_TYPE_HUMAN, "aasimar", "sha_pcl_aasimar", "sha_subrace_aasi", FALSE, 0, FALSE, 0, 1);

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

//Alignment Restriction: Good
      CreateSubraceAlignmentRestriction("aasimar", TRUE, FALSE, FALSE);

//Favored Class: Paladin
     AddSubraceFavoredClass("aasimar", CLASS_TYPE_PALADIN, CLASS_TYPE_PALADIN);

//LETO - Add Angel Wings.
     ModifySubraceAppearanceAttachment("aasimar", APPEARANCE_TYPE_ATTACHMENT_WINGS_ANGEL, APPEARANCE_TYPE_ATTACHMENT_WINGS_ANGEL, 0, 0, 1);








//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Human - Tiefling ::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Tiefling

//Properties from the Skin:
    //Damage Resistance: Cold Resist 5 / -
    //Damage Resistance: Electrical Resist 5 / -
    //Damage Resistance: Fire Resist 5 / -


//Abilities from the unique item:
    //Cast Spell: Darkness (3) 1 Use/Per Day


//Must be: Human
//ECL: + 1
     CreateSubrace(RACIAL_TYPE_HUMAN, "tiefling", "sha_pcl_tiefling", "sha_subrace_tief", FALSE, 0, FALSE, 0, 1);

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

    //ModifySubraceSkill("tiefling", SKILL_BLUFF, 2, 1, FALSE);
    ModifySubraceSkill("tiefling", SKILL_HIDE, 2, 1, FALSE);

//Alignment Restriction: Evil
      CreateSubraceAlignmentRestriction("tiefling", FALSE, FALSE, TRUE);

//Favored Class: Rogue
     AddSubraceFavoredClass("tiefling", CLASS_TYPE_ROGUE, CLASS_TYPE_ROGUE);

//LETO - Add Demon Wings and Demon tail.
     ModifySubraceAppearanceAttachment("tiefling", APPEARANCE_TYPE_ATTACHMENT_WINGS_DEMON, APPEARANCE_TYPE_ATTACHMENT_WINGS_DEMON, APPEARANCE_TYPE_ATTACHMENT_TAIL_DEVIL, APPEARANCE_TYPE_ATTACHMENT_TAIL_DEVIL, 1);









//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Human - Air Genasi ::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Air-Genasi

//Properties from the Skin:


//Must be: Human
    CreateSubrace(RACIAL_TYPE_HUMAN, "air-genasi", "");


//LETO - Change ability scores:
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Intelligence +2
    //Decreased Ability Score: Charisma -2
    //Decreased Ability Score: Wisdom -2
    struct SubraceBaseStatsModifier AirGenasiStats = CustomBaseStatsModifiers(0, 2, 0, 2, -2, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("air-genasi", AirGenasiStats, 1);


//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("air-genasi", FEAT_DARKVISION, 1);


//Favored Class: Fighter
     AddSubraceFavoredClass("air-genasi", CLASS_TYPE_FIGHTER, CLASS_TYPE_FIGHTER);









//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Human - Earth Genasi ::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Earth-Genasi

//Properties from the Skin:


//Must be: Human
    CreateSubrace(RACIAL_TYPE_HUMAN, "earth-genasi", "");


//LETO - Change ability scores:
    //Ability Bonus: Constitution +2
    //Ability Bonus: Strength +2
    //Decreased Ability Score: Charisma -2
    //Decreased Ability Score: Wisdom -2
    struct SubraceBaseStatsModifier EarthGenasiStats = CustomBaseStatsModifiers(2, 0, 2, 0, -2, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("earth-genasi", EarthGenasiStats, 1);


//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("earth-genasi", FEAT_DARKVISION, 1);

//Favored Class: Fighter
     AddSubraceFavoredClass("earth-genasi", CLASS_TYPE_FIGHTER, CLASS_TYPE_FIGHTER);










//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Human - Fire Genasi :::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Fire-Genasi

//Properties from the Skin:
    //Ability Bonus: Intelligence +2
    //Darkvision
    //Decreased Ability Score: Charisma -2

//Must be: Human
    CreateSubrace(RACIAL_TYPE_HUMAN, "fire-genasi", "");


//LETO - Change ability scores:
    //Ability Bonus: Intelligence +2
    //Decreased Ability Score: Charisma -2
    struct SubraceBaseStatsModifier FireGenasiStats = CustomBaseStatsModifiers(0, 0, 0, 2, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("fire-genasi", FireGenasiStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("fire-genasi", FEAT_DARKVISION, 1);

//Favored Class: Fighter
     AddSubraceFavoredClass("fire-genasi", CLASS_TYPE_FIGHTER, CLASS_TYPE_FIGHTER);









//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Human - Water Genasi ::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Water-Genasi

//Properties from the Skin:
    //Immunity: Specific Spell Drown

//Must be: Human
    CreateSubrace(RACIAL_TYPE_HUMAN, "water-genasi", "sha_pcl_watergen");

//LETO - Change ability scores:
    //Ability Bonus: Constitution +2
    //Decreased Ability Score: Charisma -2
    struct SubraceBaseStatsModifier WaterGenasiStats = CustomBaseStatsModifiers(0, 0, 2, 0, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("water-genasi", WaterGenasiStats, 1);

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("water-genasi", FEAT_DARKVISION, 1);

//Favored Class: Fighter
     AddSubraceFavoredClass("water-genasi", CLASS_TYPE_FIGHTER, CLASS_TYPE_FIGHTER);








//:::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Dwarf - Artic :::::::::
//:::::::::::::::::::::::::::::::::::::

//Subrace Name: Dwarf-Artic.

//Properties from the Skin:
    //AC Bonus +1
    //Immunity: Damage Type: Cold 100% Immunity Bonus


//Must be: Dwarf.
//ECL: + 1
    CreateSubrace(RACIAL_TYPE_DWARF, "dwarf-artic", "sha_pcl_dwarfart", "", FALSE, 0, FALSE, 0, 1);

//LETO - Change ability scores:
    //Ability Bonus: Strength +4
    //Decreased Ability Score: Dexterity -2
    struct SubraceBaseStatsModifier DwarfArticStats = CustomBaseStatsModifiers(4, -2, 0, 0, 0, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("dwarf-artic", DwarfArticStats, 1);

//LETO - Skills:
    //Skill Bonus: Hide +4
    ModifySubraceSkill("dwarf-artic", SKILL_HIDE, 4, 1, FALSE);

//Favored class: Ranger.
    AddSubraceFavoredClass("dwarf-artic", CLASS_TYPE_RANGER, CLASS_TYPE_RANGER);










//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Dwarf - Duergar :::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Dwarf-Duergar

//Properties from the Skin:
    //Immunity: Miscellaneous: Paralysis
    //Immunity: Miscellaneous: Poison
    //Immunity: Specific Spell Phantasmal Killer
    //Immunity: Specific Spell Weird

//Abilities from the unique item:
    //Cast Spell: Invisibility (3) 1 Use Per/Day.
//Must be: Dwarf. Light sensitive.
//ECL: + 2
    CreateSubrace(RACIAL_TYPE_DWARF, "dwarf-duergar", "sha_pcl_dwarfdue", "sha_subrace_duer", TRUE, 0, FALSE, 0, 2);


//LETO - Change ability scores:
    //Decreased Ability Score: Charisma -2
    struct SubraceBaseStatsModifier DwarfDuergarStats = CustomBaseStatsModifiers(0, 0, 0, 0, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("dwarf-duergar", DwarfDuergarStats, 1);









//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Dwarf - Wild ::::::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Dwarf-Wild.

//Properties from the Skin:
    //AC Bonus +1
    //Damage Resistance: Fire Resist 5 / -
    //Saving Throw Bonus: Disease +4
    //Saving Throw Bonus: Poison +1

//Must be: Dwarf.
   CreateSubrace(RACIAL_TYPE_DWARF, "dwarf-wild", "sha_pcl_dwarfwil", "");

//LETO - Feats:
    //Use Poison
    ModifySubraceFeat("dwarf-wild", FEAT_USE_POISON, 1);

//LETO - Skills:
    //Skill Bonus: Hide +4
    ModifySubraceSkill("dwarf-wild", SKILL_HIDE, 4, 1, FALSE);

//Favored class: Barbarian.
    AddSubraceFavoredClass("dwarf-wild", CLASS_TYPE_BARBARIAN, CLASS_TYPE_BARBARIAN);











//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Elf - Aquatic :::::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Elf-Aquatic

//Properties from the Skin:
    //Immunity: Specific Spell Drown

//Must be: Elf
   CreateSubrace(RACIAL_TYPE_ELF, "elf-aquatic", "sha_pcl_elfaquat", "");

//LETO - Change ability scores:
    //Decreased Ability Score: Intelligence -2
    struct SubraceBaseStatsModifier ElfAquaticStats = CustomBaseStatsModifiers(0, 0, 0, -2, 0, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("elf-aquatic", ElfAquaticStats, 1);

//Favored Class: Fighter
   AddSubraceFavoredClass("elf-aquatic", CLASS_TYPE_FIGHTER, CLASS_TYPE_FIGHTER);










//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE:  Elf - Avariel ::::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Elf-Avariel



//Must be: Elf
    CreateSubrace(RACIAL_TYPE_ELF, "elf-avariel");

//LETO - Change ability scores:
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Intelligence +2
    //Ability Bonus: Wisdom +2
    struct SubraceBaseStatsModifier ElfAvarielStats = CustomBaseStatsModifiers(0, 2, 0, 2, 2, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("elf-avariel", ElfAvarielStats, 1);

//LETO - Skills:
    //Skill Bonus: Spot +2
    ModifySubraceSkill("elf-avariel", SKILL_SPOT, 2, 1, FALSE);

//Favored Class: Cleric
    AddSubraceFavoredClass("elf-avariel", CLASS_TYPE_CLERIC, CLASS_TYPE_CLERIC);

//Leto - Add Bird wings
    ModifySubraceAppearanceAttachment("elf-avariel", APPEARANCE_TYPE_ATTACHMENT_WINGS_BIRD, APPEARANCE_TYPE_ATTACHMENT_WINGS_BIRD, 0, 0, 1);











//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE:    Elf - Wild :::::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Elf-Wild



//Must be: Elf
    CreateSubrace(RACIAL_TYPE_ELF, "elf-wild");

//LETO - Change ability scores:
    //Decreased Ability Score: Intelligence -2
    struct SubraceBaseStatsModifier ElfWildStats = CustomBaseStatsModifiers(0, 0, 0, -2, 0, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("elf-wild", ElfWildStats, 1);

//Favored Class: Sorcerer
    AddSubraceFavoredClass("elf-wild", CLASS_TYPE_SORCERER, CLASS_TYPE_SORCERER);










//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE:    Elf - Wood :::::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Elf-Wood


//Must be: Elf
    CreateSubrace(RACIAL_TYPE_ELF, "elf-wood");

//LETO - Change ability scores:
    //Ability Bonus: Strength +2
    //Decreased Ability Score: Charisma -2
    //Decreased Ability Score: Intelligence -2
    struct SubraceBaseStatsModifier ElfWoodStats = CustomBaseStatsModifiers(2, 0, 0, -2, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("elf-wood", ElfWoodStats, 1);

//Favored Class: Ranger
    AddSubraceFavoredClass("elf-wood", CLASS_TYPE_RANGER, CLASS_TYPE_RANGER);








//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE:    Elf - Drow :::::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Drow

//Properties from the Skin:
    //Saving Throw Bonus: Specific: Will +2

//Abilities from the unique item:
    //Cast Spell: Darkness (5) 1 Use Per Day
    //Cast Spell: Light () 1 Use Per Day

//Must be Elf. Light Sensitive.
//ECL: +2
   CreateSubrace(RACIAL_TYPE_ELF, "drow", "sha_pcl_drow", "sha_subrace_drow", TRUE, 0, FALSE, 0, 2);

//LETO - Change ability scores:
    //Ability Bonus: Charisma +2
    //Ability Bonus: Intelligence +2
    struct SubraceBaseStatsModifier DrowStats = CustomBaseStatsModifiers(0, 0, 0, 2, 0, 2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("drow", DrowStats, 1);


//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("drow", FEAT_DARKVISION, 1);

//LETO - Skills:
    //Skill Bonus: Move Silently +2
    //Skill Bonus: Hide +2
    ModifySubraceSkill("drow", SKILL_MOVE_SILENTLY, 2, 1, FALSE);
    ModifySubraceSkill("drow", SKILL_HIDE, 2, 1, FALSE);

//Favored Class - Male: Wizard, Female: Cleric.
   AddSubraceFavoredClass("drow", CLASS_TYPE_WIZARD, CLASS_TYPE_CLERIC);

//Can only be evil
   CreateSubraceAlignmentRestriction("drow", FALSE, FALSE, TRUE);

//Spell Resistance: Base (at Level 1): 10, Max(at Level 40): 50.
   CreateSubraceSpellResistance("drow", 10, 50);












//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Half-Elf - Half-Drow ::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Half-Drow


//Must be: Half-Elf
    CreateSubrace(RACIAL_TYPE_HALFELF, "half-drow");

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("half-drow", FEAT_DARKVISION, 1);









//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Half-Elf - Shadow :::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Shadow

//Properties from the Skin:

    //AC Bonus vs. Alignment Group: Good +1
    //Damage Vulnerability: Positive Energy 25% Damage Vulnerability
    //Immunity: Damage Type: Negative Energy 10% Immunity Bonus

//Must be: Half-Elf
    CreateSubrace(RACIAL_TYPE_HALFELF, "shadow", "sha_pcl_shadow", "");

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("shadow", FEAT_DARKVISION, 1);

//LETO - Change ability scores:
    //Ability Bonus: Intelligence +2
    //Decreased Ability Score: Charisma -2
    struct SubraceBaseStatsModifier ShadowStats = CustomBaseStatsModifiers(0, 0, 0, 2, 0, -2, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("shadow", ShadowStats, 1);

//Favored Class: Shadow Dancer
    AddSubraceFavoredClass("shadow", CLASS_TYPE_ROGUE, CLASS_TYPE_ROGUE);







//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Half-Elf - Air-Touched ::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Air-Touched

//Properties from the Skin:
    //AC Bonus vs. Alignment Group: Lawful +2
    //Damage Vulnerability: Magical 25% Damage Vulnerability
    //Immunity: Damage Type: Cold 10% Immunity Bonus
    //Immunity: Damage Type: Electrical 10% Immunity Bonus

//Must be: Half-Elf
    CreateSubrace(RACIAL_TYPE_HALFELF, "air-touched", "sha_pcl_airtouch");

//LETO - Change ability scores:
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Intelligence +2
    //Decreased Ability Score: Strength -2
    //Decreased Ability Score: Wisdom -2
    struct SubraceBaseStatsModifier AirTouchedStats = CustomBaseStatsModifiers(-2, 2, 0, 2, -2, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("air-touched", AirTouchedStats, 1);

//Favored Class: Shadow Dancer
    AddSubraceFavoredClass("air-touched", CLASS_TYPE_ROGUE, CLASS_TYPE_ROGUE);







//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Gnome - Svirfneblin :::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Svirfneblin

//Properties from the Skin:
    //Saving Throw Bonus: Universal +2

//Abilities from the unique item:
   //Cast Spell: Blindness/Deafness (3) 1 Use/Day

//Must be: Gnome.
//Light Sensitive.
//ECL: + 2
    CreateSubrace(RACIAL_TYPE_GNOME, "svirfneblin", "sha_pcl_svirfneb", "sha_subrace_svir", TRUE, 0, FALSE, 2);

//LETO - Change ability scores:
    //Ability Bonus: Dexterity +2
    //Ability Bonus: Wisdom +2
    //Decreased Ability Score: Charisma -4
    struct SubraceBaseStatsModifier SvirnStats = CustomBaseStatsModifiers(0, 2, 0, 0, 2, -4, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("svirfneblin", SvirnStats, 1);

//LETO - Feats:
    //Darkvision
    //Bonus Feat: Dodge
    ModifySubraceFeat("svirfneblin", FEAT_DARKVISION, 1);
    ModifySubraceFeat("svirfneblin", FEAT_DODGE, 1);

//LETO - Skills:
    //Skill Bonus: Search +2
    ModifySubraceSkill("svirfneblin", SKILL_SEARCH, 2, 1, FALSE);


//Spell Resistance: 10 + 1 Per Level.
    CreateSubraceSpellResistance("svirfneblin", 10, 50);








//:::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Gnome - Tinker ::::::
//:::::::::::::::::::::::::::::::::::

//Subrace Name: Tinker

//Must be: Gnome.
    CreateSubrace(RACIAL_TYPE_GNOME, "tinker");

//LETO - Change ability scores:
    //Ability Bonus: Intelligence +2
    //Decreased Ability Score: Wisdom -2
    struct SubraceBaseStatsModifier TinkerStats = CustomBaseStatsModifiers(0, 0, 0, 2, -2, 0, MOVEMENT_SPEED_CURRENT);
    CreateBaseStatModifier("tinker", TinkerStats, 1);

//LETO - Skills:
    //Skill Bonus: Appraise +2
    //Skill Bonus: Craft Armor +4
    //Skill Bonus: Craft Trap +4
    //Skill Bonus: Craft Weapon +4
    //Skill Bonus: Disable Trap +2
    //Skill Bonus: Open Lock +2
    //Skill Bonus: Set Trap +2
    //Skill Bonus: Use Magic Device +4

    //ModifySubraceSkill("tinker", SKILL_APPRAISE, 2, 1, FALSE);
    //ModifySubraceSkill("tinker", SKILL_CRAFT_ARMOR, 4, 1, FALSE);
    //ModifySubraceSkill("tinker", SKILL_CRAFT_TRAP, 4, 1, FALSE);
    ModifySubraceSkill("tinker", SKILL_DISABLE_TRAP, 2, 1, FALSE);
    ModifySubraceSkill("tinker", SKILL_OPEN_LOCK, 2, 1, FALSE);
    ModifySubraceSkill("tinker", SKILL_SET_TRAP, 2, 1, FALSE);
    ModifySubraceSkill("tinker", SKILL_USE_MAGIC_DEVICE, 4, 1, FALSE);









//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Halfling - Deep :::::::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Deep


//Must be: Halfling.
     CreateSubrace(RACIAL_TYPE_HALFLING, "deep");

//LETO - Feats:
    //Darkvision
    ModifySubraceFeat("deep", FEAT_DARKVISION, 1);


//LETO - Skills:
    //Skill Bonus: Search +2
    ModifySubraceSkill("deep", SKILL_SEARCH, 2, 1, FALSE);









//:::::::::::::::::::::::::::::::::::::::
//:::: SUBRACE: Halfling - Ghostwise ::::
//:::::::::::::::::::::::::::::::::::::::

//Subrace Name: Ghostwise

//Must be: Halfling.
     CreateSubrace(RACIAL_TYPE_HALFLING, "ghostwise");

//Favored Class: Barbarian.
     AddSubraceFavoredClass("ghostwise", CLASS_TYPE_BARBARIAN, CLASS_TYPE_BARBARIAN);




}
