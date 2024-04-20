//::///////////////////////////////////////////////
//:: Name   sam_inc
//:: Copyright (c) 2001/ Bioware Corp. 
//:: Created by Sam Pullara
//::Sam's Server- Menzoberranzan
//:://////////////////////////////////////////////
/*
The primary include file   --from 2002
(Ely) TODO: determine which blocks are being used by any 
of the new core files and remove from here. 
*/
//:://////////////////////////////////////////////
//:: Updated By: DM Elysium  03/2024
//:: Created On:
//:://////////////////////////////////////////////

//depot/NeverwinterNights/NWN/modules/savagefrontier/sam_inc.nss#8 - edit change 88 (text)
 // temporary disable because I think it's going away (Ely)
//#include "aps_include"
#include "sam_groovy_inc"
#include "x2_inc_itemprop"
#include "sam_defaults"              //this file i think can be mashed into another

float GetFloatCharacterLevel(object oPC) {
    int nXP = GetXP(oPC);
    float fLevel = (-1.0 + sqrt(1.0 + 8.0*IntToFloat(nXP)/1000))/2;
    return fLevel + 1;
}

int SecondsSinceStart()
{
    // Archaegeo 2002 Aug 9th
    int nConv = FloatToInt(HoursToSeconds(1));

    object oMod = GetModule();
    int nCurYear = GetCalendarYear() - START_YEAR;
    int nCurMonth = GetCalendarMonth();
    int nCurDay = GetCalendarDay();
    int nCurHour = GetTimeHour();
    int nCurMin = GetTimeMinute();
    int nCurSec = GetTimeSecond();

    int nTotal = nCurSec;
    nTotal += nCurMin * 60;
    nTotal += nCurHour * nConv;
    nTotal += nCurDay * 24 * nConv;
    nTotal += nCurMonth * 28 * 24 * nConv;
    nTotal += nCurYear * 12 * 28 * 24 * nConv;

    return nTotal;
}

// Find the base type of an object
string GetBaseItemTypeString(object oItem)
{
   string sBaseType = "unknown";
   switch(GetBaseItemType(oItem))
   {
      case BASE_ITEM_AMULET: sBaseType ="Amulet";break;
      case BASE_ITEM_ARMOR: sBaseType ="Armor";break;
      case BASE_ITEM_ARROW: sBaseType ="Arrow";break;
      case BASE_ITEM_BASTARDSWORD: sBaseType ="Bastard Sword";break;
      case BASE_ITEM_BATTLEAXE: sBaseType ="Battle Axe";break;
      case BASE_ITEM_BELT: sBaseType ="Belt";break;
      case BASE_ITEM_BOLT : sBaseType ="Bolt";break;
      case BASE_ITEM_BOOK: sBaseType ="Book";break;
      case BASE_ITEM_BOOTS: sBaseType ="Boots";break;
      case BASE_ITEM_BRACER: sBaseType ="Bracer";break;
      case BASE_ITEM_BULLET: sBaseType ="Bullet";break;
      case BASE_ITEM_CBLUDGWEAPON: sBaseType ="Bludgeoning Weap.";break;
      case BASE_ITEM_CLOAK: sBaseType ="Cloak";break;
      case BASE_ITEM_CLUB: sBaseType ="Club";break;
      case BASE_ITEM_CPIERCWEAPON: sBaseType ="Pierceing Weap.";break;
      case BASE_ITEM_CREATUREITEM: sBaseType ="Creature Item";break;
      case BASE_ITEM_CSLASHWEAPON: sBaseType ="Slash Weap.";break;
      case BASE_ITEM_CSLSHPRCWEAP: sBaseType ="Slash/Pierce Weap.";break;
      case BASE_ITEM_DAGGER: sBaseType ="Dagger";break;
      case BASE_ITEM_DART: sBaseType ="Dart";break;
      case BASE_ITEM_DIREMACE: sBaseType ="Mace";break;
      case BASE_ITEM_DOUBLEAXE: sBaseType ="Double Axe";break;
      case BASE_ITEM_GEM: sBaseType ="Gem";break;
      case BASE_ITEM_GLOVES: sBaseType ="Gloves";break;
      case BASE_ITEM_GOLD: sBaseType ="Gold";break;
      case BASE_ITEM_GREATAXE: sBaseType ="Great Axe";break;
      case BASE_ITEM_GREATSWORD: sBaseType ="Great Sword";break;
      case BASE_ITEM_HALBERD: sBaseType ="Halberd";break;
      case BASE_ITEM_HANDAXE: sBaseType ="Hand Axe";break;
      case BASE_ITEM_HEALERSKIT: sBaseType ="Healers Kit";break;
      case BASE_ITEM_HEAVYCROSSBOW: sBaseType ="Heavy Xbow";break;
      case BASE_ITEM_HEAVYFLAIL: sBaseType ="Heavy Flail";break;
      case BASE_ITEM_HELMET: sBaseType ="Helmet";break;
      case BASE_ITEM_INVALID: sBaseType ="";break;
      case BASE_ITEM_KAMA: sBaseType ="Kama";break;
      case BASE_ITEM_KATANA: sBaseType ="Katana";break;
      case BASE_ITEM_KEY: sBaseType ="Key";break;
      case BASE_ITEM_KUKRI: sBaseType ="Kukri";break;
      case BASE_ITEM_LARGEBOX: sBaseType ="Large Box";break;
      case BASE_ITEM_LARGESHIELD: sBaseType ="Large Shield";break;
      case BASE_ITEM_LIGHTCROSSBOW: sBaseType ="Light Xbow";break;
      case BASE_ITEM_LIGHTFLAIL: sBaseType ="Light Flail";break;
      case BASE_ITEM_LIGHTHAMMER: sBaseType ="Light Hammer";break;
      case BASE_ITEM_LIGHTMACE: sBaseType ="Light Mace";break;
      case BASE_ITEM_LONGBOW: sBaseType ="Long Bow";break;
      case BASE_ITEM_LONGSWORD: sBaseType ="Long Sword";break;
      case BASE_ITEM_MAGICROD: sBaseType ="Magic Rod";break;
      case BASE_ITEM_MAGICSTAFF: sBaseType ="Magic Staff";break;
      case BASE_ITEM_MAGICWAND: sBaseType ="Magic Wand";break;
      case BASE_ITEM_MISCLARGE: sBaseType ="Misc. Large";break;
      case BASE_ITEM_MISCMEDIUM: sBaseType ="Misc. Medium";break;
      case BASE_ITEM_MISCSMALL: sBaseType ="Misc. Small";break;
      case BASE_ITEM_MISCTALL: sBaseType ="Misc. Small";break;
      case BASE_ITEM_MISCTHIN: sBaseType ="Misc. Thin";break;
      case BASE_ITEM_MISCWIDE: sBaseType ="Misc. Wide";break;
      case BASE_ITEM_MORNINGSTAR: sBaseType ="Morningstar";break;
      case BASE_ITEM_POTIONS: sBaseType ="Potion";break;
      case BASE_ITEM_QUARTERSTAFF: sBaseType ="Quarterstaff";break;
      case BASE_ITEM_RAPIER: sBaseType ="Rapier";break;
      case BASE_ITEM_RING: sBaseType ="Ring";break;
      case BASE_ITEM_SCIMITAR: sBaseType ="Scimitar";break;
      case BASE_ITEM_SCROLL: sBaseType ="Scroll";break;
      case BASE_ITEM_SCYTHE: sBaseType ="Scythe";break;
      case BASE_ITEM_SHORTBOW: sBaseType ="Shortbow";break;
      case BASE_ITEM_SHORTSPEAR: sBaseType ="Short Spear";break;
      case BASE_ITEM_SHORTSWORD: sBaseType ="Short Sword";break;
      case BASE_ITEM_SHURIKEN: sBaseType ="Shuriken";break;
      case BASE_ITEM_SICKLE: sBaseType ="Sickle";break;
      case BASE_ITEM_SLING: sBaseType ="Sling";break;
      case BASE_ITEM_SMALLSHIELD: sBaseType ="Small Shield";break;
      case BASE_ITEM_SPELLSCROLL: sBaseType ="Spell Scroll";break;
      case BASE_ITEM_THIEVESTOOLS: sBaseType ="Thieves Tools";break;
      case BASE_ITEM_THROWINGAXE: sBaseType ="Throwing Axe";break;
      case BASE_ITEM_TORCH: sBaseType ="Torch";break;
      case BASE_ITEM_TOWERSHIELD: sBaseType ="Tower Shield";break;
      case BASE_ITEM_TRAPKIT: sBaseType ="Trap Kit";break;
      case BASE_ITEM_TWOBLADEDSWORD: sBaseType ="2 Bladed Sword";break;
      case BASE_ITEM_WARHAMMER: sBaseType ="Warhammer";break;
   }
   return sBaseType;

}


// Makes a res ref from an object
string MakeResRef(object oItem = OBJECT_SELF) {
    string sResRef = GetResRef(oItem);
    if (sResRef == "") {
        sResRef = GetTag(oItem);
    }
    return sResRef;
}

// Makes a script name from a string
string MakeScriptName(string sString, int nMaxLength = 16) {
    sString = GetStringLowerCase(sString);
    int nTotal = 0;
    int length = GetStringLength(sString);
    int index;
    string sResult = "";
    for (index = 0; index < length; index++) {
        string letter = GetSubString(sString, index, 1);
        int code = 0;
        if (letter == "a") { code = 97; } else
        if (letter == "b") { code = 98; } else
        if (letter == "c") { code = 99; } else
        if (letter == "d") { code = 100; } else
        if (letter == "e") { code = 101; } else
        if (letter == "f") { code = 102; } else
        if (letter == "g") { code = 103; } else
        if (letter == "h") { code = 104; } else
        if (letter == "i") { code = 105; } else
        if (letter == "j") { code = 106; } else
        if (letter == "k") { code = 107; } else
        if (letter == "l") { code = 108; } else
        if (letter == "m") { code = 109; } else
        if (letter == "n") { code = 110; } else
        if (letter == "o") { code = 111; } else
        if (letter == "p") { code = 112; } else
        if (letter == "q") { code = 113; } else
        if (letter == "r") { code = 114; } else
        if (letter == "s") { code = 115; } else
        if (letter == "t") { code = 116; } else
        if (letter == "u") { code = 117; } else
        if (letter == "v") { code = 118; } else
        if (letter == "w") { code = 119; } else
        if (letter == "x") { code = 120; } else
        if (letter == "y") { code = 121; } else
        if (letter == "z") { code = 122; } else
        if (letter == "1") { code = 1; } else
        if (letter == "2") { code = 2; } else
        if (letter == "3") { code = 3; } else
        if (letter == "4") { code = 4; } else
        if (letter == "5") { code = 5; } else
        if (letter == "6") { code = 6; } else
        if (letter == "7") { code = 7; } else
        if (letter == "8") { code = 8; } else
        if (letter == "9") { code = 9; } else
        if (letter == "0") { code = 10; }
        if (code != 0) {
            sResult = sResult + letter;
            if (++nTotal == nMaxLength) break;
        }
    }
    return sResult;
}

void MakeItemSafe(object oItem) {
    if (GetLocalInt(oItem, "sam_safe")) return;
    //ignore creature items -- Flamecrow
    if (GetBaseItemType(oItem) == BASE_ITEM_CBLUDGWEAPON || BASE_ITEM_CSLSHPRCWEAP || BASE_ITEM_CSLASHWEAPON || BASE_ITEM_CREATUREITEM || BASE_ITEM_CPIERCWEAPON) { return;}
    // This script adjusts damage resistance, replaces immunities, and basically balances items so
    // that some classes aren't left out.
    itemproperty ipProperty = GetFirstItemProperty(oItem);
    while (GetIsItemPropertyValid(ipProperty)) {
        if (GetItemPropertyDurationType(ipProperty) == DURATION_TYPE_PERMANENT) {
            int nItemPropertyType = GetItemPropertyType(ipProperty);
            switch (nItemPropertyType) {
                case ITEM_PROPERTY_DAMAGE_REDUCTION:
                {
                    // Damage reduction can be 5/+5, 5/+4, 10/+3, 15/+2, 20/+1 at most
                    int nDamageReductionEnhancement = GetItemPropertySubType(ipProperty);
                    int nDamageReductionSoak = GetItemPropertyCostTableValue(ipProperty);
                    int nTempDRE = nDamageReductionEnhancement;
                    int nTempDRS = nDamageReductionSoak;
                    switch (nDamageReductionEnhancement) {
                        case IP_CONST_DAMAGEREDUCTION_20:
                        case IP_CONST_DAMAGEREDUCTION_19:
                        case IP_CONST_DAMAGEREDUCTION_18:
                        case IP_CONST_DAMAGEREDUCTION_17:
                        case IP_CONST_DAMAGEREDUCTION_16:
                        case IP_CONST_DAMAGEREDUCTION_15:
                        case IP_CONST_DAMAGEREDUCTION_14:
                        case IP_CONST_DAMAGEREDUCTION_13:
                        case IP_CONST_DAMAGEREDUCTION_12:
                        case IP_CONST_DAMAGEREDUCTION_11:
                        case IP_CONST_DAMAGEREDUCTION_10:
                        case IP_CONST_DAMAGEREDUCTION_9:
                        case IP_CONST_DAMAGEREDUCTION_8:
                        case IP_CONST_DAMAGEREDUCTION_7:
                        case IP_CONST_DAMAGEREDUCTION_6:
                            nDamageReductionEnhancement = 5;
                        case IP_CONST_DAMAGEREDUCTION_5:
                        case IP_CONST_DAMAGEREDUCTION_4:
                            nDamageReductionSoak = IP_CONST_DAMAGESOAK_5_HP;
                            break;
                        case IP_CONST_DAMAGEREDUCTION_3:
                            if (nDamageReductionSoak != IP_CONST_DAMAGESOAK_5_HP) {
                                nDamageReductionSoak = IP_CONST_DAMAGESOAK_10_HP;
                            }
                            break;
                        case IP_CONST_DAMAGEREDUCTION_2:
                            if (nDamageReductionSoak != IP_CONST_DAMAGESOAK_5_HP &&
                                nDamageReductionSoak != IP_CONST_DAMAGESOAK_10_HP) {
                                nDamageReductionSoak = IP_CONST_DAMAGESOAK_15_HP;
                            }
                            break;
                        case IP_CONST_DAMAGEREDUCTION_1:
                            if (nDamageReductionSoak != IP_CONST_DAMAGESOAK_5_HP &&
                                nDamageReductionSoak != IP_CONST_DAMAGESOAK_10_HP &&
                                nDamageReductionSoak != IP_CONST_DAMAGESOAK_15_HP) {
                                nDamageReductionSoak = IP_CONST_DAMAGESOAK_20_HP;
                            }
                            break;
                    }
                    if (nTempDRE != nDamageReductionEnhancement ||
                        nTempDRS != nDamageReductionSoak) {
                        RemoveItemProperty(oItem, ipProperty);
                        AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageReduction(nDamageReductionEnhancement, nDamageReductionSoak), oItem);
                        WriteTimestampedLogEntry("Reducing the damage reduction of " + GetName(oItem));
                    }
                    break;
                }
                case ITEM_PROPERTY_DAMAGE_RESISTANCE:
                {
                    // Damage resistance can be 10/- for physical and 20/- for other
                    int nDamageType = GetItemPropertySubType(ipProperty);
                    int nDamageResist = GetItemPropertyCostTableValue(ipProperty);
                    switch (nDamageType) {
                        case IP_CONST_DAMAGETYPE_ACID:
                        case IP_CONST_DAMAGETYPE_COLD:
                        case IP_CONST_DAMAGETYPE_DIVINE:
                        case IP_CONST_DAMAGETYPE_ELECTRICAL:
                        case IP_CONST_DAMAGETYPE_FIRE:
                        case IP_CONST_DAMAGETYPE_MAGICAL:
                        case IP_CONST_DAMAGETYPE_NEGATIVE:
                        case IP_CONST_DAMAGETYPE_SONIC:
                        {
                            if (nDamageResist != IP_CONST_DAMAGERESIST_5 &&
                                nDamageResist != IP_CONST_DAMAGERESIST_10 &&
                                nDamageResist != IP_CONST_DAMAGERESIST_15 &&
                                nDamageResist != IP_CONST_DAMAGERESIST_20) {
                                RemoveItemProperty(oItem, ipProperty);
                                AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageResistance(nDamageType, IP_CONST_DAMAGERESIST_20), oItem);
                                WriteTimestampedLogEntry("Reducing the damage resistance of " + GetName(oItem));
                            }
                            break;
                        }
                        case IP_CONST_DAMAGETYPE_BLUDGEONING:
                        case IP_CONST_DAMAGETYPE_PHYSICAL:
                        case IP_CONST_DAMAGETYPE_PIERCING:
                        case IP_CONST_DAMAGETYPE_SLASHING:
                        case IP_CONST_DAMAGETYPE_SUBDUAL:
                        {
                            if (nDamageResist != IP_CONST_DAMAGERESIST_5 &&
                                nDamageResist != IP_CONST_DAMAGERESIST_10) {
                                RemoveItemProperty(oItem, ipProperty);
                                AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyDamageResistance(nDamageType, IP_CONST_DAMAGERESIST_10), oItem);
                                WriteTimestampedLogEntry("Reducing the damage resistance of " + GetName(oItem));
                            }
                            break;
                        }
                    }
                    break;
                }
                case ITEM_PROPERTY_ENHANCED_CONTAINER_REDUCED_WEIGHT:
                {
                    // Maximum reduction is 80%
                    if (GetItemPropertyCostTableValue(ipProperty) == IP_CONST_CONTAINERWEIGHTRED_100_PERCENT) {
                        RemoveItemProperty(oItem, ipProperty);
                        ipProperty = ItemPropertyContainerReducedWeight(IP_CONST_CONTAINERWEIGHTRED_80_PERCENT);
                        AddItemProperty(DURATION_TYPE_PERMANENT, ipProperty, oItem);
                        WriteTimestampedLogEntry("Reducing the weight reduction of " + GetName(oItem));
                    }
                    break;
                }
                case ITEM_PROPERTY_ENHANCEMENT_BONUS:
                {
                    // Maximum is +6
                    int nEnhancementBonus = GetItemPropertyCostTableValue(ipProperty);
                    if (nEnhancementBonus > 6) {
                        RemoveItemProperty(oItem, ipProperty);
                        AddItemProperty(DURATION_TYPE_PERMANENT, ItemPropertyEnhancementBonus(6), oItem);
                        WriteTimestampedLogEntry("Reducing the enhancement bonus of " + GetName(oItem));
                    }
                    break;
                }
                case ITEM_PROPERTY_HASTE:
                {
                    // This can only be on boots and robes
                    if (GetBaseItemType(oItem) == BASE_ITEM_ARMOR && GetWeight(oItem) > 50) {
                        RemoveItemProperty(oItem, ipProperty);
                        WriteTimestampedLogEntry("Removing haste from an illegal armor: " + GetName(oItem) + " weighs " +
                            IntToString(GetWeight(oItem)));
                    } else if (GetBaseItemType(oItem) != BASE_ITEM_ARMOR && GetBaseItemType(oItem) != BASE_ITEM_BOOTS) {
                        RemoveItemProperty(oItem, ipProperty);
                        WriteTimestampedLogEntry("Removing haste from an illegal item: " + GetName(oItem));
                    }
                    break;
                }
                case ITEM_PROPERTY_IMPROVED_EVASION:
                {
                    RemoveItemProperty(oItem, ipProperty);
                    IPSafeAddItemProperty(oItem, ItemPropertyBonusFeat(FEAT_EVASION));
                    break;
                }
                case ITEM_PROPERTY_IMMUNITY_SPECIFIC_SPELL:
                case ITEM_PROPERTY_IMMUNITY_SPELLS_BY_LEVEL:
                {
                    // These are all just illegal
                    RemoveItemProperty(oItem, ipProperty);
                    WriteTimestampedLogEntry("Removing an immunity from " + GetName(oItem));
                    break;
                }
                case ITEM_PROPERTY_IMMUNITY_DAMAGE_TYPE:
                {
                    // These need to be converted to saving throw bonuses
                    int nDamageType = GetItemPropertySubType(ipProperty);
                    int nImmunityLevel = GetItemPropertyCostTableValue(ipProperty);
                    int nSaveVS = 0;
                    int nSavingBonus = 0;
                    switch (nDamageType) {
                        case IP_CONST_DAMAGETYPE_ACID:
                            nSaveVS = IP_CONST_SAVEVS_ACID;
                            break;
                        case IP_CONST_DAMAGETYPE_COLD:
                            nSaveVS = IP_CONST_SAVEVS_COLD;
                            break;
                        case IP_CONST_DAMAGETYPE_DIVINE:
                            nSaveVS = IP_CONST_SAVEVS_DIVINE;
                            break;
                        case IP_CONST_DAMAGETYPE_ELECTRICAL:
                            nSaveVS = IP_CONST_SAVEVS_ELECTRICAL;
                            break;
                        case IP_CONST_DAMAGETYPE_FIRE:
                            nSaveVS = IP_CONST_SAVEVS_FIRE;
                            break;
                        case IP_CONST_DAMAGETYPE_MAGICAL:
                            // no equivalent
                            break;
                        case IP_CONST_DAMAGETYPE_NEGATIVE:
                            nSaveVS = IP_CONST_SAVEVS_NEGATIVE;
                            break;
                        case IP_CONST_DAMAGETYPE_POSITIVE:
                            nSaveVS = IP_CONST_SAVEVS_POSITIVE;
                            break;
                        case IP_CONST_DAMAGETYPE_SONIC:
                            nSaveVS = IP_CONST_SAVEVS_SONIC;
                            break;
                    }
                    switch (nImmunityLevel) {
                        case IP_CONST_DAMAGEIMMUNITY_5_PERCENT:
                            nSavingBonus = 1;
                            break;
                        case IP_CONST_DAMAGEIMMUNITY_10_PERCENT:
                            nSavingBonus = 2;
                            break;
                        case IP_CONST_DAMAGEIMMUNITY_25_PERCENT:
                            nSavingBonus = 3;
                            break;
                        case IP_CONST_DAMAGEIMMUNITY_50_PERCENT:
                            nSavingBonus = 4;
                            break;
                        case IP_CONST_DAMAGEIMMUNITY_75_PERCENT:
                            nSavingBonus = 5;
                            break;
                        case IP_CONST_DAMAGEIMMUNITY_90_PERCENT:
                            nSavingBonus = 8;
                            break;
                        case IP_CONST_DAMAGEIMMUNITY_100_PERCENT:
                            nSavingBonus = 10;
                            break;
                    }
                    RemoveItemProperty(oItem, ipProperty);
                    if (nSaveVS != 0) {
                        IPSafeAddItemProperty(oItem, ItemPropertyBonusSavingThrowVsX(nSaveVS, nSavingBonus));
                        WriteTimestampedLogEntry("Converted immunity to save bonus on " + GetName(oItem));
                    } else {
                        WriteTimestampedLogEntry("Could not convert immunity to save bonus on " + GetName(oItem));
                    }
                    break;
                }
                case ITEM_PROPERTY_IMMUNITY_SPELL_SCHOOL:
                {
                    // These need to be converted to saving throw bonuses
                    int nSpellSchool = GetItemPropertySubType(ipProperty);
                    int nSave = 0;
                    int nSaveVS = 0;
                    int nSavingBonus = 5;
                    switch (nSpellSchool) {
                        case IP_CONST_SPELLSCHOOL_EVOCATION:
                            nSave = IP_CONST_SAVEBASETYPE_REFLEX;
                            break;
                        case IP_CONST_SPELLSCHOOL_ENCHANTMENT:
                        case IP_CONST_SPELLSCHOOL_ILLUSION:
                            nSaveVS = IP_CONST_SAVEVS_MINDAFFECTING;
                            break;
                        case IP_CONST_SPELLSCHOOL_NECROMANCY:
                            nSaveVS = IP_CONST_SAVEVS_DEATH;
                            break;
                        case IP_CONST_SPELLSCHOOL_DIVINATION:
                            nSaveVS = IP_CONST_SAVEVS_DIVINE;
                            break;
                        case IP_CONST_SPELLSCHOOL_ABJURATION:
                        case IP_CONST_SPELLSCHOOL_CONJURATION:
                        case IP_CONST_SPELLSCHOOL_TRANSMUTATION:
                    }
                    RemoveItemProperty(oItem, ipProperty);
                    if (nSave != 0) {
                        IPSafeAddItemProperty(oItem, ItemPropertyBonusSavingThrow(nSave, nSavingBonus));
                    } else if (nSaveVS != 0) {
                        IPSafeAddItemProperty(oItem, ItemPropertyBonusSavingThrowVsX(nSaveVS, nSavingBonus));
                    }
                    WriteTimestampedLogEntry("Converting spell school immunity to a saving throw bonus for " + GetName(oItem));
                    break;
                }
                case ITEM_PROPERTY_IMMUNITY_MISCELLANEOUS:
                {
                    // These need to be converted to saving throw bonuses
                    int nImmunityType = GetItemPropertySubType(ipProperty);
                    RemoveItemProperty(oItem, ipProperty);
                    switch (nImmunityType) {
                        case IP_CONST_IMMUNITYMISC_BACKSTAB:
                        case IP_CONST_IMMUNITYMISC_CRITICAL_HITS:
                            // we just can't have this
                            break;
                        case IP_CONST_IMMUNITYMISC_DEATH_MAGIC:
                            IPSafeAddItemProperty(oItem, ItemPropertyBonusSavingThrowVsX(IP_CONST_SAVEVS_DEATH, 5));
                            break;
                        case IP_CONST_IMMUNITYMISC_DISEASE:
                            IPSafeAddItemProperty(oItem, ItemPropertyBonusSavingThrowVsX(IP_CONST_SAVEVS_DISEASE, 5));
                            break;
                        case IP_CONST_IMMUNITYMISC_FEAR:
                            IPSafeAddItemProperty(oItem, ItemPropertyBonusSavingThrowVsX(IP_CONST_SAVEVS_FEAR, 5));
                            break;
                        case IP_CONST_IMMUNITYMISC_KNOCKDOWN:
                            IPSafeAddItemProperty(oItem, ItemPropertySkillBonus(SKILL_DISCIPLINE, 10));
                            break;
                        case IP_CONST_IMMUNITYMISC_LEVEL_ABIL_DRAIN:
                            IPSafeAddItemProperty(oItem, ItemPropertyBonusSavingThrowVsX(IP_CONST_SAVEVS_NEGATIVE, 5));
                            break;
                        case IP_CONST_IMMUNITYMISC_MINDSPELLS:
                            IPSafeAddItemProperty(oItem, ItemPropertyBonusSavingThrowVsX(IP_CONST_SAVEVS_MINDAFFECTING, 5));
                            break;
                        case IP_CONST_IMMUNITYMISC_PARALYSIS:
                            IPSafeAddItemProperty(oItem, ItemPropertyBonusSavingThrow(IP_CONST_SAVEBASETYPE_REFLEX, 5));
                            break;
                        case IP_CONST_IMMUNITYMISC_POISON:
                            IPSafeAddItemProperty(oItem, ItemPropertyBonusSavingThrowVsX(IP_CONST_SAVEVS_POISON, 5));
                            break;
                    }
                    WriteTimestampedLogEntry("Converted misc immunity to saving throw bonus for " + GetName(oItem));
                    break;
                }
                case ITEM_PROPERTY_TRUE_SEEING:
                {
                    // This property is just illegal
                    RemoveItemProperty(oItem, ipProperty);
                    WriteTimestampedLogEntry("Removed true seeing from " + GetName(oItem));
                    break;
                }
                // default, just let it ride
            }
            ipProperty = GetNextItemProperty(oItem);
        }
    }
    SetLocalInt(oItem, "sam_safe", TRUE);
}

// DestroyAll .. Reviewed KMdS
void DestroyAll(object oDead = OBJECT_SELF) {

    // for testing ... KMdS
    object oMod = GetModule();
    object oKMdS = GetLocalObject(oMod, "KMdS");
    int bDEBUG = GetLocalInt(oMod, "DEBUG");
    if(bDEBUG && GetIsObjectValid(oKMdS))
        SendMessageToPC(oKMdS, "DestroyAll function fired in area "+GetTag(GetArea(oDead)));

    // Destroy weapons that might be on the ground
    object oRightWeapon = GetLocalObject(oDead, "sam_right_weapon");
    if (oRightWeapon != OBJECT_INVALID && GetItemPossessor(oRightWeapon) == OBJECT_INVALID) {
        DestroyObject(oRightWeapon);
        DeleteLocalObject(oDead, "sam_right_weapon");
    }
    object oLeftWeapon = GetLocalObject(oDead, "sam_left_weapon");
    if (oLeftWeapon != OBJECT_INVALID && GetItemPossessor(oLeftWeapon) == OBJECT_INVALID) {
        DestroyObject(oLeftWeapon);
        DeleteLocalObject(oDead, "sam_left_weapon");
    }

    // Destroy all equipment
    int i;
    for (i = 0; i < NUM_INVENTORY_SLOTS; i++) {
        object oItem = GetItemInSlot(i);
        if (oItem != OBJECT_INVALID) DestroyObject(oItem);
    }

    // Destroy all inventory
    object oItem = GetFirstItemInInventory(oDead);
    while (oItem != OBJECT_INVALID) {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oDead);
    }

    // Destroy the inventory in the corpse
    object oCorpse = GetLocalObject(oDead, "sam_corpse");
    if (oCorpse != OBJECT_INVALID) {
        DeleteLocalObject(oDead, "sam_corpse");
        oItem = GetFirstItemInInventory(oCorpse);
        while (oItem != OBJECT_INVALID) {
            DestroyObject(oItem);
            oItem = GetNextItemInInventory(oCorpse);
        }
        DestroyObject(oCorpse);
    }

    // Destroy the blood stain
    object oBlood = GetLocalObject(oDead, "sam_blood");
    if (oBlood != OBJECT_INVALID) DestroyObject(oBlood);

    // Destroy the dead guy
    SetIsDestroyable(TRUE, FALSE, FALSE);
    DestroyObject(oDead);
}
