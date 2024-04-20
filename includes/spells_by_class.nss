/*//:://////////////////////////////////////////////////////////////////////////
//:: Name: KMdS PNP Hard Core Rule Set 1.0
//:: System: KMdS Spell Systems
//:: FileName Spells_By_Class
//:: Copyright (c) 2001 Bioware Corp.
//::////////////////////////////////////////////////////////////////////////////

    This is a library of spells, by spell id, of all spells known by a character
    class listed by level of spell.

    FILES INCLUDED IN THIS SYSTEM

    Inc_SpellTrack          The main spell tracking file
    Reset_Spells            Execute this script on a successfull rest to delete the
                              waypoint used to store spell use info and clear all
                              stored variables of a players previous spell use.
    Spells_By_Class         Library of spells known by class and level.
    Spell_Router            The pre spell event for all spells
    Strip_Spells            Execute this script from the OnClientEnter event or
                              from the OnPlayerRest event script on any cancelled
                              rest to strip a player of any spells previously used.
                              This will prevent the reloging and cancelled rest
                              exploits on your server.  The script also checks
                              for a clerics use of the any "cure" spells and if
                              found will strip a pc of any spells of the same level
                              as a cure spell cast.  This is to eliminate the cleric
                              spontaneous cure spell exploit.


//::////////////////////////////////////////////////////////////////////////////
//:: Created By: Kilr Mik d Spik aka KMdS
//:: Created On: January 22, 2005
//:://////////////////////////////////////////////////////////////////////////*/


// All Bard spells as of updated NWN version 1.66.
const string BARDSPELLSPERLEVEL = "006¬013¬020¬019¬009¬005¬005";
const string BARDSPELLSLVL0 = "033¬037¬100¬151¬416¬442";
const string BARDSPELLSLVL1 = "016¬032¬066¬086¬094¬102¬155¬165¬174¬321¬436¬456¬544";
const string BARDSPELLSLVL2 = "008¬009¬013¬021¬034¬036¬083¬090¬092¬120¬157¬163¬167¬175¬354¬355¬356¬365¬457¬569";
const string BARDSPELLSLVL3 = "004¬015¬020¬026¬035¬041¬054¬075¬078¬146¬147¬166¬176¬322¬377¬441¬458¬539¬545";
const string BARDSPELLSLVL4 = "031¬040¬045¬082¬088¬126¬177¬373¬376";
const string BARDSPELLSLVL5 = "067¬080¬118¬121¬179";
const string BARDSPELLSLVL6 = "113¬180¬368¬369¬445";

// All Druid spells as of updated NWN version 1.66.
const string DRUIDSPELLSPERLEVEL = "005¬009¬011¬015¬008¬011¬009¬007¬007¬006";
const string DRUIDSPELLSLVL0 = "033¬100¬151¬189¬416";
const string DRUIDSPELLSLVL1 = "032¬050¬053¬066¬165¬174¬365¬421¬452";
const string DRUIDSPELLSLVL2 = "003¬009¬017¬060¬081¬094¬097¬150¬175¬420¬422";
const string DRUIDSPELLSLVL3 = "011¬027¬017¬034¬043¬126¬129¬137¬147¬176¬425¬453¬454¬513¬514";
const string DRUIDSPELLSLVL4 = "035¬041¬061¬062¬082¬172¬177¬455";
const string DRUIDSPELLSLVL5 = "038¬164¬168¬179¬191¬363¬368¬438¬446¬525¬529";
const string DRUIDSPELLSLVL6 = "067¬074¬080¬180¬369¬374¬437¬512¬547";
const string DRUIDSPELLSLVL7 = "057¬077¬079¬181¬186¬364¬372";
const string DRUIDSPELLSLVL8 = "056¬124¬134¬182¬183¬423¬427";
const string DRUIDSPELLSLVL9 = "048¬114¬161¬172¬178¬426";

// All Cleric spells as of updated NWN version 1.66.
const string CLERICSPELLSPERLEVEL = "005¬015¬021¬022¬012¬010¬011¬006¬007¬006";
const string CLERICSPELLSLVL0 = "033¬100¬151¬189¬431";
const string CLERICSPELLSLVL1 = "006¬032¬046¬050¬148¬154¬155¬174¬321¬414¬418¬432¬449¬450¬544";
const string CLERICSPELLSLVL2 = "001¬009¬034¬036¬049¬083¬094¬097¬149¬150¬163¬167¬175¬354¬355¬356¬365¬371¬377¬433¬527";
const string CLERICSPELLSLVL3 = "002¬004¬008¬021¬027¬035¬041¬091¬125¬133¬137¬145¬146¬147¬156¬176¬322¬419¬434¬546¬548¬549";
const string CLERICSPELLSLVL4 = "031¬038¬040¬042¬062¬076¬126¬129¬152¬177¬435¬545";
const string CLERICSPELLSLVL5 = "019¬061¬080¬142¬164¬168¬179¬186¬517¬525";
const string CLERICSPELLSLVL6 = "005¬028¬030¬067¬077¬079¬180¬430¬443¬451¬528";
const string CLERICSPELLSLVL7 = "070¬153¬181¬194¬366¬374";
const string CLERICSPELLSLVL8 = "029¬057¬114¬182¬183¬323¬429";
const string CLERICSPELLSLVL9 = "051¬063¬087¬173¬178¬444";

// All Paladin spells as of updated NWN version 1.66.
const string PALADINSPELLSPERLEVEL = "010¬006¬006¬005";
const string PALADINSPELLSLVL1 = "006¬032¬050¬151¬189¬321¬414¬536¬537¬544";
const string PALADINSPELLSLVL2 = "001¬009¬149¬150¬354¬429";
const string PALADINSPELLSLVL3 = "034¬041¬133¬145¬322¬545";
const string PALADINSPELLSLVL4 = "035¬038¬062¬126¬538";

// All Ranger spells as of updated NWN version 1.66.
const string RANGERSPELLSPERLEVEL = "008¬006¬008¬005";
const string RANGERSPELLSLVL1 = "032¬053¬066¬150¬174¬365¬421¬452";
const string RANGERSPELLSLVL2 = "013¬081¬137¬165¬175¬420";
const string RANGERSPELLSLVL3 = "001¬034¬091¬126¬147¬176¬453¬535";
const string RANGERSPELLSLVL4 = "035¬062¬130¬177¬455";

// All Cleric spells as of updated NWN version 1.66.
const string MAGESPELLSPERLEVEL = "008¬020¬028¬022¬021¬018¬020¬013¬013¬014";
const string MAGESPELLSLVL0 = "024¬037¬100¬144¬151¬416¬424¬439";
const string MAGESPELLSLVL1 = "010¬016¬050¬066¬086¬102¬107¬143¬155¬165¬174¬321¬371¬415¬417¬456¬521¬522¬543¬544";
const string MAGESPELLSLVL2 = "008¬009¬013¬036¬049¬064¬090¬093¬094¬115¬120¬150¬157¬175¬192¬354¬355¬356¬365¬419¬436¬457¬518¬519¬520¬527¬542¬569";
const string MAGESPELLSLVL3 = "020¬021¬041¬058¬059¬075¬078¬083¬092¬101¬137¬166¬171¬176¬188¬322¬370¬377¬458¬523¬526¬545";
const string MAGESPELLSLVL4 = "004¬015¬026¬027¬047¬052¬054¬088¬098¬119¬127¬130¬145¬146¬159¬172¬177¬191¬368¬375¬447";
const string MAGESPELLSLVL5 = "002¬023¬025¬040¬045¬055¬071¬082¬095¬096¬099¬118¬179¬369¬440¬459¬516¬524";
const string MAGESPELLSLVL6 = "000¬014¬018¬065¬067¬072¬074¬113¬121¬128¬158¬180¬184¬186¬376¬448¬460¬485¬486¬528";
const string MAGESPELLSLVL7 = "028¬039¬056¬123¬132¬135¬141¬160¬169¬181¬430¬461¬515";
const string MAGESPELLSLVL8 = "030¬069¬089¬110¬111¬117¬134¬182¬367¬427¬443¬462¬541";
const string MAGESPELLSLVL9 = "044¬051¬063¬073¬116¬122¬131¬161¬178¬185¬190¬193¬463¬533";
