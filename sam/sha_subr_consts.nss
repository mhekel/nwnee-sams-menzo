//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::: Shayan's Subrace Engine :::::::::::::::::::::::::::::
//:::::::::::::::::File Name: sha_subr_consts ::::::::::::::::::::::::::::::::::
//::::::::::::::::::::: include script :::::::::::::::::::::::::::::::::::::::::
//:: Written by: Shayan, Moon                                               :://
//:: Contact: mail_shayan@yhaoo.com                                         :://
//:: Forums: http://p2.forumforfree.com/shayan.html
//
// Description: Holds all the constants used in the Subrace System.
//              If you have made a change you must recompile all scripts for
//              changes to take place.



//::--------------------------------------------------------------------------::
//----------------------- Subrace Engine LETO Settings -------------------------
//::::::::---------------------------------------------------------:::::::::::::

//:: Set to TRUE to enable LETO functions.
const int ENABLE_LETO = TRUE;

//:: The path to your NWN folder:
//:: Example: C:/NeverwinterNights/NWN/
const string NWNPATH = "C:/NeverwinterNights/NWN/";

// :: If set to TRUE then players will not have to re-login to the server manually...
// :: it would be a seemless transistion.
const int LETO_ACTIVATE_PORTAL = FALSE;

//****---- You MUST fill in these settings if LETO_ACTIVATE_PORTAL to TRUE -----****

// :: The IP address of your server.
// :: Example: "192.168.0.100:5121"
const string LETO_PORTAL_IP_ADDRESS = "71.177.235.126:5121";

// :: The server's log-in password for the player:
const string LETO_PORAL_SERVER_PASSWORD = "";

// :: If this is set to TRUE, then the character isn't teleported to a different area
// :: instead just will have a superfical area transistion and will end up in the same area
// :: as he/she was in. And will have undergone all the LETO changes necessary.
const int LETO_PORTAL_KEEP_CHARACTER_IN_THE_SAME_PLACE = TRUE;

// :: Number of seconds to wait porting the player.
const int LETO_AUTOMATIC_PORTAL_DELAY = 10;

// :: (You need not fill this is  LETO_PORTAL_KEEP_CHARACTER_IN_THE_SAME_PLACE is set to TRUE)
// :: This is the tag of the waypoint the player 'teleports' to.
// :: The waypoint's tag must be in Captial letters (uppercase letters) for it to work!
// :: Example: "PORTAL_WAYPOINT";
// :: Naming it "portal_waypoint" will NOT work!
const string LETO_PORTAL_WAYPOINT = "PORTAL_WAYPOINT";


//****--------------------------------------------------------------------------****

//****---- Ignore these settings if you have set LETO_ACTIVATE_PORTAL to TRUE -----***
// :: Since Leto needs to make changes to the character file, it cannot do it while the PC
// :: is logged in. There fore the player must log out. The Subrace engine will give a message to the player
// :: but if this is set to TRUE, it will also boot the player from the server in LETO_AUTOMATIC_BOOT_DELAY.
const int LETO_AUTOMATICALLY_BOOT = FALSE;

// :: If you have set to automatic boot, then how long (in seconds) do you want to
// :: wait before kicking the player?
const int LETO_AUTOMATIC_BOOT_DELAY = 20;
//------------------------------------------------------------------------------


// :: Set this to TRUE if you want to use localvault characters instead of servervault.
// :: Use it only if you are using the Subrace Engine's Leto features for single player purposes.
// :: THIS WILL NOT ALWAYS WORK ON A SERVER RUNNING WITH LOCAL VAULT CHARACTERS ENABLED,
// :: AS PLAYERS' NWN INSTALLATION DIRECTORY MAY VARY.
const int USE_LOCAL_VAULT_CHARACTERS = FALSE;


//--------------------------------------------------------------------------------------------
//::::::::::::::::::::::::::::::: Engine Wide Settings :::::::::::::::::::::::::::::::::::::::
//--------------------------------------------------------------------------------------------
//:: The following list of constants are responsible for what I call "Engine Wide settings".
//:: What this means is that these constants control specific settings that apply to ALL the
//:: subraces. IE: The saving throw DC for light sensitivity, etc.
//:: You may change them as you will.
//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

const string SUBRACE_ENGINE_VERSION = "3.0.4";

// :: Engine Name. (It will preceed any sub-race message sent to a player)
// :: '<cÜ>' Is a green color.
const string SUBRACE_ENGINE = "<cÜ>Shayan's Subrace Engine: </c>";

// :: Highest Level achievable by a player in this module
// :: Default value: 40
const int MAXIMUM_PLAYER_LEVEL = 40;

// :: If set to TRUE it will use SQL NWNX databases.
// :: NWNX must be installed for this to work! Refer to sha_subr_methds for more
// :: details.
const int ENABLE_NWNX_DATABASE = FALSE;

// :: Name of the Subrace Database.
// :: Dafult Value: SUBRACE_DB
const string SUBRACE_DATABASE = "SUBRACE_DB";

// :: String stored in the SUBRACE_DATABASE to indicate that changes to character file
// :: have already been done.
const string LETO_CHANGES_MADE_FOR_THIS_LEVEL = "LTO_D";

// :: Tag of the Subrace information storer object.
// :: Default value:  _SUBRACE_STORE         -- Not used by default.
const string SUBRACE_INFO_STORER_TAG = "_SUBRACE_STORE";

//:: An internal tag used as starting name of the Local <Strings, Int and Float>
//:: stored on the PC/Storer.
//:: Dafult Value: SBRCE
const string SUBRACE_TAG = "SBRCE";

//:: Sometimes (very rarely) data corruption occurs during gameplay. For whatever reason NWN might not
//:: apply subrace stats or some subrace feature goes "missing".
//:: Set this to TRUE only if you are running a persistent world
//:: and you wish to reload the subrace information again upon the PC's relogin so
//:: your players' character can get their subrace reapplied on relog.
//:: NOTE: This may lead to necessary burden on the CPU.
const int RELOAD_SUBRACE_INFORMATION_UPON_RELOGIN = TRUE;

// :: Too many subrace related messages going to the PC is not always a good thing...
// :: Set this to TRUE if you want to reduce the number of messages recieved by the players
// :: to just the important ones.
const int MINIMALISE_SUBRACE_MESSAGES_TO_PC = TRUE;

// :: A server running with 'Enforce Legal Characters' automatically destroys creature
// :: skins on PC when they log out. The Subrace Engine does reload information, and skin
// :: on re-entry. But if the PC can't equip the skin (IE: Is paralysed or stunned on entry) then
// :: the skin ends up in their inventory.
// :: Set this value to TRUE if you want the Engine to automatically search PC's inventory
// :: and destroy those skins.
// :: Dafult Value: TRUE
const int SEARCH_AND_DESTROY_SKINS_IN_INVENTORY = FALSE;

// :: Does spell resistance gained from being part of the subrace, stack with PC's
// :: existing spell resistance? (IE: Like Monk Spell resistance or spell resistance
// :: gained from items, etc)
// :: Dafult Value: FALSE
const int SUBRACE_SPELL_RESISTANCE_STACKS = FALSE;

// :: Set this to TRUE if you want the XP system to ignore NWN's default favored class
// :: for a particular race.
// :: IE: Say you have sub-race of Elves called Myra'therendi...
//        And the sub-race's (Myra'therendi's) favored Class is: Sorcerer.
//        Now imagine there was a PC -call him A- part of that sub-race: Wizard(10)/Figher(5)
//           and another PC -call him B- who is also part of that sub-race: Socerer(9)/Cleric(6).
//        Since Elves defaultly have Wizard as their favored Class, with
//        SUBRACE_IGNORE_BASE_RACE_FAVORED_CLASS set to FALSE, PC A will not incur a multiclassing
//        XP penalty. While SUBRACE_IGNORE_BASE_RACE_FAVORED_CLASS set to TRUE, PC A will
//        incur the 20% reduction in XP for multiclassing... while PC B will not.
// :: Dafult Value: TRUE
const int SUBRACE_IGNORE_BASE_RACE_FAVORED_CLASS = TRUE;

// :: Set this to TRUE if you want the PC to scream when their appearance is changing...
// :: Like "AAAARGH! What is happening to me?!", when they 'morph'. (Look below)
const int PC_SCREAMS_WHEN_CHANGING_IN_APPEARANCE = FALSE;

// :: If the PC_SCREAMS_WHEN_CHANGING_IN_APPEARANCE, then what does it scream?
// :: (When changing from default racial appearance to the "monster" appearance.)
const string SUBRACE_WORDS_SPOKEN_ON_APPEARANCE_CHANGE_TO_MONSTER = "AARGH! What is happening to me?!";

// :: (When changing from "monster" appearance to the default racial appearance.)
const string SUBRACE_WORDS_SPOKEN_ON_APPEARANCE_CHANGE_TO_DEFAULT_RACIAL_TYPE = "AARGH!!";

// :: Set to TRUE if you want to disable the visual effects when changing from one
// :: appearance to another.
const int DISABLE_VISUAL_EFFECTS_WHEN_CHANGING_IN_APPEARANCE = FALSE;

// :: Set to TRUE if you want Light sensitive subraces to also get a chance of being
// :: Blinded by light when in open outdoor areas, suring day time.
const int APPLY_LIGHT_BLINDNESS = TRUE;

// :: Does the spell Darkness stop Light sensitivity and Light Damage from being
// :: applied to the PC?
// :: Dafult Value: TRUE
const int SPELL_DARKNESS_STOPS_LIGHT_SENSITIVITY = TRUE;

// :: The Difficulty Check for Light sensitivity. All subraces with Light sensitivity will
// :: have to make a save against this DC or be blinded when in above ground outdoor areas, during daylight.
// :: (It is a Fortitude Saving throw)
// :: Dafult Value: 20
const int LIGHT_SENSITIVE_SAVING_THROW_DC = 20;

// :: How often do you want the PC to be potentially be blinded by 'light' while in
// :: above ground outdoor areas, during daylight?
// :: (How often does the PC have to save against the blindness?)
// :: Dafult Value: Once every 6 rounds.
const int LIGHT_BLINDNESS_STRIKES_EVERY_ROUND = 6;

// :: If the PC fails the saving throw, how long do you want the blindness to last?
// :: Dafult Value: 1
const int LIGHT_STRUCK_BLIND_FOR_ROUNDS = 1;

// :: Set to TRUE if you want Light sensitive subraces to also get an attack bonus,
// :: and saving throw decrease, when in light areas.
// :: (They automatically get the penalty when in Sunlight. They do not have to fail a
// ::  saving throw.)
const int APPLY_AB_AND_SAVING_THROW_DECREASES_IN_LIGHT = TRUE;

// :: Set this to true if you want sub-races that get light damaged to also
// :: "spontaneously" (SUBRACE_SPONTANEOUS_COMBUSTION_PERCENTAGE chance every LIGHT_DAMAGES_EVERY_ROUNDS) to combust
// :: and take d8() fire damage for the number of LIGHT_DAMAGES_EVERY_ROUNDS rounds.
// :: Default value: FALSE.
const int SUBRACE_SPONTANEOUS_COMBUSTION_WHILE_IN_LIGHT = TRUE;

// :: If SUBRACE_SPONTANEOUS_COMBUSTION_WHILE_IN_LIGHT, then
// :: what is the chance that they will catch on fire once every LIGHT_DAMAGES_EVERY_ROUNDS rounds
// :: Default value: 10%.
const int SUBRACE_SPONTANEOUS_COMBUSTION_PERCENTAGE = 10;

// :: If the PC is failed to roll... then what is the DC she/he must roll against to
// :: save?  (It is a reflex saving throw)
// :: Default Value: 20
const int SUBRACE_SPONTANEOUSLY_COMBUST_DC = 20;

// :: The amount of which the PC's attack bonus is decreased by.
const int LIGHT_AB_DECREASE = 2;

// :: The amount of which the PC's saving throws are decreased by.
const int LIGHT_SAVE_DECREASE = 2;

// :: If you have APPLY_AB_AND_SAVING_THROW_DECREASES_IN_LIGHT to TRUE then, how long does the
// :: decreases last?
// :: Remember every LIGHT_CAUSES_AB_AND_SAVES_DECREASE_FOR_ROUNDS, the decreases are applied again.
// :: If the PC is in the sun. (The decreases do not stack)
const int LIGHT_CAUSES_AB_AND_SAVES_DECREASE_FOR_ROUNDS = 4;

// :: The Difficulty check for Dark sensitivity. All subraces with Dark sensitivity will
// :: have to make a save against this DC or be blinded when in Underground areas.
// :: (It is a Fortitude Saving throw)
// :: Dafult Value: 20
const int DARK_SENSITIVE_SAVING_THROW_DC = 20;

// :: How often do you want the PC to be potentially be blinded by 'dark' while
// :: in Underground areas?
// :: (How often does the PC have to save against the blindness)
// :: Dafult Value: Once every 6 rounds.
const int DARK_BLINDNESS_STRIKES_EVERY_ROUND = 6;

// :: If the PC fails the saving throw, how long do you want the blindness to last?
// :: Dafult Value: 1
const int DARK_STRUCK_BLIND_FOR_ROUNDS = 1;

// :: How often does Light Damage the PC when in above ground outdoor areas,
// :: during daylight?
// :: Dafult Value: Once every 1 Round(s).
const int LIGHT_DAMAGES_EVERY_ROUNDS = 1;

// :: How often does Darkness damage the PC when in Underground?
// :: Dafult Value: Once every 1 Round(s).
const int DARKNESS_DAMAGES_EVERY_ROUNDS = 1;



//::--------------------------------------------------------------------------::
//------------------------- Subrace DM Wand ------------------------------------
//::::::::---------------------------------------------------------:::::::::::::

// :: This constant allows you to restrict the DMs ability to receive information from
// :: Leto. Depending on the value you can choose to restrict more or less information:
// ::  0 = No Information at all.
// ::  1 = Server PassWord is hidden. (Portal)
// ::  2 = No Restrictions.
const int SWAND_RESTRICT_LETO = 2;

// :: This constant allows you to restrict the DMs and Players ability to change the subrace
// :: of players.
// :: Please give SWAND_RESTRICT_SUBRACE_MODIFICATION the value that fits your need best.
// :: NB: CHANGE Subraces means changing from one Subrace (or lack of same) to another and
// ::     CHANGE does NOT include removing a subrace.
// :: Also: Players are ONLY allowed to modify their OWN Subrace.
// ::
// :: This constant is a little special.
// :: The first digit after the x is the player settings and the second is the DM settings.
// :: To allow DMs to change players' subrace then you must set the second digit to 1 or 3.
// :: To allow DMs to remove players' subrace then you must set the second digit to 2 or 3.
// :: To allow players to change their own subrace then you must set the first digit to 1 or 3.
// :: To allow players to remove their own subrace then you must set the first digit to 2 or 3.
//
// :: Sample: 0x13 would allow players to change their own subrace and DMs to both change and
// ::         remove players' subrace.
// :: NOTE: There is no limit to amount of times you can change subrace. Therefore if you do
// :: allow players to do this, then you should only allow them access to the chooser in
// :: a single area they cannot access more than once!
const int SWAND_RESTRICT_SUBRACE_MODIFICATION = 0x33;


//::--------------------------------------------------------------------------::
//------------------------Subrace Engine's XP system ---------------------------
//::::::::---------------------------------------------------------:::::::::::::

// ::Displays a message, so you can adjust/fine tune the system.
const int XP_DEBUG = TRUE;

// ::Set this the same as you would set in your module properties.
// ::If you set this to 10, for example the maximum XP a PC with no party will get for
// ::monster of extremely high difficulty (relative to the level of the PC) is 600xp.
// ::IE: What ever value you set this multiplied by 60. (as per BioWare standard).
const float XP_SLIDER_VALUE = 0.0;

// ::If set to TRUE, uses Bioware's xp distribution calculations. IE: Two party members, means
// ::50% of XP each, 3 means 33%, 4 means 25% and so on...
// ::If set to false uses World of Rhun XP system, where being in a party will give you more XP
// ::IE: If soloing PC gets 100% of the XP, if with a party of 2, then 50%, if with a party of 3 then 60% and so on..
// ::   (The settings of this system can be adjusted below)
const int USE_BIOWARE_STANDARD_XP_SYSTEM = TRUE;

// ::(This can apply to both XP systems)
// ::The higher this value the more experience points that gets deducted from the reward XP
// ::for every summon or henchmen in the party.
// ::Default: Every NPC reduces overall XP gained by party by 10%.
const float XP_MODIFIER_FOR_NPC = 0.0;

// ::(This can apply to both XP systems)
// ::This is the Maximum Gap between the Average Pary level and level of the Highest level party memeber.
// ::If this value is exceeded the pary is rewarded the same XP as the highest Member.
// ::(Added on 30/03/2005 to stop "Powerleveling")
// ::IE: If a party has a Level 40 Member, Level 8 Member and a Level 2 Member, the Average Party Level is: 16.67
// ::    But since the difference between the highest member and the Average party level (40 - 16.67 = 23.33) is more than 10.0-the default value
// ::    The party will get the same XP as the Level 40. (Which in theory will be much much lower)
// ::If you do not want to this restriction to apply, then set it to 40.0;
const float MAXIMUM_LEVEL_GAP = 40.0;

// ::(This applies to both XP systems)
// ::The maximum distance between the dead Monster and party member
const float MAX_DISTANCE_BETWEEN_PC_AND_MONSTER = 50.0;

// ::(This only applies to the World of Rhun XP system)
// ::Say if there is two PCs partying together. Then this is the percentage of XP they will both
// ::get per kill.
// ::IE: If set to 0.70, then they will recieve 70% of the XP each, where as if there was only one party member
// :: she will get 100%.
const float XP_MODIFIER_FOR_PARTY_OF_TWO = 0.5;

// ::(This only applies to the World of Rhun XP system)
// ::Bonus for partying. If there was more than 2 party members then they group will recieve a bonus percentage per kill.
// ::IE: If set to 0.1 then a party of 3, will recieve 70% party of 4 will get 80%, and so on.
const float XP_MODIFIER_BONUS_PER_PARTY_MEMBER = 0.1;

// ::(This only applies to the World of Rhun XP system)
// ::This is the maximum XP modifier value.
// ::IE: Using the above values say there a party of 10 adventurers... then they will be recieving a HUGE bonus (something like 230%) of the
// ::XP rewarded for a single player. This will cap the XP modifier value.
// ::IE: Here it is capped at 110%.
const float XP_MAXIMUM_MODIFER_VALUE = 1.1;





// :: Messages sent out by the Subrace Engine ::

const string MESSAGE_SUBRACE_APPEARANCE_CHANGED = "Your appearance has been changed to better suit your sub-racial features.";

const string MESSAGE_SUBRACE_APPEARANCE_REVERTED = "Your appearance has been reverted back to your typical racial appearance.";

const string MESSAGE_SUBRACE_CRITERIA_FAILED = "Character has failed to meet the following criteria(s) required to be part of the subrace";

const string MESSAGE_CANNOT_BE_PART_OF_PRESTIGIOUS_SUBRACE = "The sub-race you had chosen was a prestigious sub-race. You cannot become part of this sub-race directly (Contact a DM for more info)!";

const string MESSAGE_FAILED_TO_MEET_PRESTIGIOUS_CLASS_RESTRICTION = "You have failed to meet the prestigious class restrictions!";

const string MESSAGE_SUBRACE_CRITERIA_MET = "You have met all the requirements for your chosen subrace!";

const string MESSAGE_SUBRACE_CRITERIA_CLASS_FAILED = "You have not met the class requirements for your chosen subrace.";

const string MESSAGE_SUBRACE_CRITERIA_ALIGNMENT_FAILED = "You have not met the alignment requirements for your chosen subrace.";

const string MESSGAE_SUBRACE_CRITERIA_BASE_RACE_FAILED = "You are not part of the base race required in order to be part of your chosen sub-race.";

const string MESSAGE_SUBRACE_UNRECOGNISED = "You are part of an unrecognised sub-race: ";

const string MESSAGE_SUBRACE_CLAWS_WAIT_FOR_CLAWS_EQUIPPING = "Please wait... while your sub-racial claws are checked and equipped or unequipped.";

const string MESSAGE_SUBRACE_CLAWS_MISSING_CREATURE_WEAPON_PROFICIENCY = "You do not have creature weapon proficiency... yet your subrace wants to equip a creature claw. Inform a DM!";

const string MESSAGE_SUBRACE_CLAWS_SUCCESSFULLY_EQUIPPED =  "Your new sub-racial claws should have now been properly equipped or unequipped.";

const string MESSAGE_SUBRACE_ACQUIRED_UNIQUE_ITEM1 = "You have acquired <cä)>";

const string MESSAGE_SUBRACE_ACQUIRED_UNIQUE_ITEM2 = "</c>; a sub-racial item.";

const string MESSAGE_SUBRACE_EFFECTS_APPLIED = "Sub-racial effects have been appiled";

const string MESSAGE_SUBRACE_IS_MISSING_FROM_SERVER = "Data for your sub-race is missing or support for your sub-race has been removed from the server! Contact a DM";

const string MESSAGE_SUBRACE_LOADING_DATA1 = "Loading your sub-race; ";

const string MESSAGE_SUBRACE_LOADING_DATA2 = "'s data...";

const string MESSAGE_SUBRACE_DATA_LOADED = "Your sub-racial data has been loaded on your character.";

const string MESSAGE_LETO_AUTOPORTAL = "<cä)>Changes need to be made to your character; you are about to be teleported in: ";

const string MESSAGE_LETO_AUTOBOOT1 = "<cä)>You will be automatically booted in: ";

const string MESSAGE_LETO_AUTOBOOT2 = " seconds.</c>";

const string MESSAGE_LETO_DONT_PANIC_JUSTPORTING = "<cä)>Changes need to be made to your character; You are about to undergo an area transition... don't worry you should end up right where you are.";

const string MESSAGE_LETO_PLEASE_RELOG = "Changes need to be made to your character; Please re-log into the sever.";

const string MESSAGE_SUBRACE_PURGING =  "Purging sub-race...";

const string MESSAGE_SUBRACE_PURGED = "Purging sub-race...DONE.";

const string MESSAGE_SUBRACE_SPELL_RESISTANCE_APPLIED = "Your spell resistance has been modified to fit your sub-racial features.";

const string MESSAGE_ABILITY_SCORES_REVERTED = "Your day/night ability scores have been reverted.";

const string MESSAGE_ABILITY_SCORES_CHANGED =  "Your day/night ability scores have changed...";

const string MESSAGE_ABILITY_SCORES_APPEARANCE_TRIGGERED_REVERTED = "Your special appearance ability scores have been reverted.";

const string MESSAGE_ABILITY_SCORES_APPEARANCE_TRIGGERED_CHANGED =  "Your special appearance scores have changed...";

const string MESSAGE_SUBRACE_CANNOT_EQUIP_ITEM = "You cannot equip this item because of your sub-race's limitations.";

const string MESSAGE_SUBRACE_CANNOT_EQUIP_WEAPON = "You cannot equip this weapon because of your sub-race's limitations.";

const string MESSAGE_SUBRACE_CANNOT_EQUIP_ARMOR = "You cannot equip this armor because of your sub-race's limitations.";

const string MESSAGE_SUBRACE_CANNOT_EQUIP_JEWLRY_OR_STUFF = "You cannot equip this jewlery or clothing item because of your sub-race's limitations.";

const string MESSAGE_SUBRACE_SWITCH_CHECKING_REQUIREMENTS1 = "Checking whether your character meets the requirements for the '";

const string MESSAGE_SUBRACE_SWITCH_CHECKING_REQUIREMENTS2 = "' sub-race...";

const string MESSAGE_SUBRACE_FAILED_REQUIREMENTS_ALIGNMENT_FOR_SWITCH = "Your character has failed to meet criteria for the '";

const string MESSAGE_SUBRACE_SWITCHING = "Switching sub-races to: ";

const string MESSAGE_SUBRACE_SWITCHED = "Sub-race was switched!";

const string MESSAGE_SUBRACE_FACTION_ADJUSTED = "Your faction has been adjusted to fit your subrace.";

const string MESSAGE_SUBRACE_MOVE_TO_START_LOCATION1 = "Welcome to ";

const string MESSAGE_SUBRACE_MOVE_TO_START_LOCATION2 = " start location.";

const string MESSAGE_SUBRACE_NEW_WINGS_GAINED = "You have gained new wings.";

const string MESSAGE_SUBRACE_NEW_TAIL_GAINED = "You have gained a new tail";

const string MESSAGE_SUBRACE_NEW_PORTRAIT_GAINED = "Your character portrait has changed";

const string MESSAGE_SUBRACE_SSE_IS_SHUTOFF = "Subrace Engine has been switched off by a DM. Your subrace will not function.";

const string MESSAGE_SUBRACE_SSE_IS_SHUTOFF_IN_AREA = "Subrace Engine is switched off in this area.";

const string MESSAGE_SUBRACE_APPEARANCE_DATA_ERROR = "Appearance data error! Re-login to fix this problem.";

const string MESSAGE_SUBRACE_GENDER_FAILED = "You have not met the gender requirements for the chosen subrace.";

const string MESSAGE_SUBRACE_FAILED_CRITERIA_SO_REMOVED = "Your subrace has been removed because you did not meet the criteria(s).";






// :: XP CONSTANTS --- DO NOT CHANGE UNLESS YOU KNOW WHAT YOU ARE DOING.
// :: These constants taken from xptable.2da
const float BASE_XP = 32.5;

const float XP_LEVEL1 = 5.0;
const float XP_LEVEL2 = 10.0;
const float XP_LEVEL3 = 15.0;
const float XP_LEVEL4 = 17.0;
const float XP_LEVEL5 = 20.0;
const float XP_LEVEL6 = 22.5;
const float XP_LEVEL7 = 25.0;
const float XP_LEVEL8 = 27.5;

const float XP_LEVEL_8 = -32.1;
const float XP_LEVEL_7 = -30.5;
const float XP_LEVEL_6 = -28.5;
const float XP_LEVEL_5 = -27.5;
const float XP_LEVEL_4 = -20.0;
const float XP_LEVEL_3 = -15.0;
const float XP_LEVEL_2 = -10.0;
const float XP_LEVEL_1 = -5.0;


//The following list of constants control the internal settings of the engine.
//Do not change unless you are sure of what you are doing. If you change the values
//you may find the some information will not get stored on a player character....
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//::::::::::::DO NOT CHANGE UNLESS NECESSARY::::::::::::::
//::::::::::::::::::::::::::::::::::::::::::::::::::::::::


// Flag Sets v1.1 by Axe  (Taken from NWVault) -Brilliant stuff!

// Constants
const int FLAG1           = 0x00000001;
const int FLAG2           = 0x00000002;
const int FLAG3           = 0x00000004;
const int FLAG4           = 0x00000008;
const int FLAG5           = 0x00000010;
const int FLAG6           = 0x00000020;
const int FLAG7           = 0x00000040;
const int FLAG8           = 0x00000080;
const int FLAG9           = 0x00000100;
const int FLAG10          = 0x00000200;
const int FLAG11          = 0x00000400;
const int FLAG12          = 0x00000800;
const int FLAG13          = 0x00001000;
const int FLAG14          = 0x00002000;
const int FLAG15          = 0x00004000;
const int FLAG16          = 0x00008000;
const int FLAG17          = 0x00010000;
const int FLAG18          = 0x00020000;
const int FLAG19          = 0x00040000;
const int FLAG20          = 0x00080000;
const int FLAG21          = 0x00100000;
const int FLAG22          = 0x00200000;
const int FLAG23          = 0x00400000;
const int FLAG24          = 0x00800000;
const int FLAG25          = 0x01000000;
const int FLAG26          = 0x02000000;
const int FLAG27          = 0x04000000;
const int FLAG28          = 0x08000000;
const int FLAG29          = 0x10000000;
const int FLAG30          = 0x20000000;
const int FLAG31          = 0x40000000;
const int FLAG32          = 0x80000000;
const int ALLFLAGS        = 0xFFFFFFFF;
const int NOFLAGS         = 0x00000000;


const int TINYGROUP1      = 0x0000000F; // 4 Flags per group. 8 groups per flagset.
const int TINYGROUP2      = 0x000000F0; // Value range 0-15.
const int TINYGROUP3      = 0x00000F00;
const int TINYGROUP4      = 0x0000F000;
const int TINYGROUP5      = 0x000F0000;
const int TINYGROUP6      = 0x00F00000;
const int TINYGROUP7      = 0x0F000000;
const int TINYGROUP8      = 0xF0000000;
const int ALLTINYGROUPS   = 0xFFFFFFFF;

const int SMALLGROUP1     = 0x0000003F; // 6 Flags per group. 5 groups per flagset plus 1 extra group with only 2 flags.
const int SMALLGROUP2     = 0x00000FC0; // Value range 0-63.
const int SMALLGROUP3     = 0x0003F000;
const int SMALLGROUP4     = 0x00FC0000;
const int SMALLGROUP5     = 0x3F000000;
const int SMALLGROUPX     = 0xC0000000; // Special Group with only 2 flags. Value range 0-3.
const int ALLSMALLGROUPS  = 0x3FFFFFFF;

const int MEDIUMGROUP1    = 0x000000FF; // 8 Flags per group. 4 groups per flagset.
const int MEDIUMGROUP2    = 0x0000FF00; // Value range 0-255.
const int MEDIUMGROUP3    = 0x00FF0000;
const int MEDIUMGROUP4    = 0xFF000000;
const int ALLMEDIUMGROUPS = 0xFFFFFFFF;

const int LARGEGROUP1     = 0x000003FF; // 10 Flags per group. 3 groups per flagset plus 1 extra group with only 2 flags.
const int LARGEGROUP2     = 0x000FFC00; // Value range 0-1023
const int LARGEGROUP3     = 0x3FF00000;
const int LARGEGROUPX     = 0xC0000000; // Special Group with only 2 flags. Value range 0-3.
const int ALLLARGEGROUPS  = 0x3FFFFFFF;

const int HUGEGROUP1      = 0x0000FFFF; // 16 Flags per group. 2 groups per flagset.
const int HUGEGROUP2      = 0xFFFF0000; // Value range 0-65535
const int ALLHUGEGROUPS   = 0xFFFFFFFF;

const int ALLGROUPS       = 0xFFFFFFFF;
const int GROUPVALUE      = 0xFFFFFFFF;
const int NOGROUPS        = 0x00000000;

const int SUBRACE_EFFECT_VALUE1_FLAGSET =  LARGEGROUP1;
const int SUBRACE_EFFECT_VALUE2_FLAGSET =  LARGEGROUP2;
const int SUBRACE_EFFECT_FLAGSET =  LARGEGROUP3;
const int SUBRACE_EFFECT_TIME_FLAGSET = LARGEGROUPX;

//TwentyOneScore's hair skin color constants

const string SUBRACE_COLORS_FLAGS = "SUB_CLR_FS";

const int SUBRACE_COLORS_FLAGS_SKIN_MALE = MEDIUMGROUP1;
const int SUBRACE_COLORS_FLAGS_SKIN_FEMALE = MEDIUMGROUP2;
const int SUBRACE_COLORS_FLAGS_HAIR_MALE = MEDIUMGROUP3;
const int SUBRACE_COLORS_FLAGS_HAIR_FEMALE = MEDIUMGROUP4;

const int SUBRACE_COLORS_FLAGS_SKIN = MEDIUMGROUP1;
const int SUBRACE_COLORS_FLAGS_HAIR = MEDIUMGROUP2;


const string SUBRACE_ALIGNMENT_RESTRICTION = "ALN_RS";

const string MODULE_SUBRACE_COUNT = "SBR_COUNT";

const string MODULE_SUBRACE_NUMBER = "SBR_NUM";

const int SUBRACE_BASE_RACE_FLAGS = MEDIUMGROUP1;

const string SUBRACE_BASE_RACE = "BASE_RACE";

const string SUBRACE_SKIN = "SKN";

const string SUBRACE_RIGHT_CLAW = "RCLAW";

const string SUBRACE_LEFT_CLAW = "LCLAW";

const string SUBRACE_UNIQUEITEM = "UITEM";
const string SUBRACE_UNIQUEITEM_COUNT = "UITEM_C";

const string SUBRACE_BASE_INFORMATION = "SUB_BIN";
const int SUBRACE_BASE_INFORMATION_FLAGS = TINYGROUP1;
const int SUBRACE_BASE_INFORMATION_LIGHT_SENSITIVE = FLAG1;
const int SUBRACE_BASE_INFORMATION_UNDERGROUND_SENSITIVE = FLAG2;
const int SUBRACE_BASE_INFORMATION_UNDEAD = FLAG3;
const int SUBRACE_BASE_INFORMATION_PRESTIGIOUS_SUBRACE = FLAG4;
const int SUBRACE_BASE_INFORMATION_ECL = TINYGROUP2;

const string SUBRACE_HAS_DAY_NIGHT_EFFECTS = "S_DAYNIGHT";

const string DAMAGE_AMOUNT_IN_LIGHT = "DMG_IN_LGHT";

const string DAMAGE_AMOUNT_IN_UNDERGROUND = "DMG_IN_UNDG";


const string SUBRACE_SPELL_RESISTANCE = "SPELL_RES";
const int SUBRACE_SPELL_RESISTANCE_BASE_FLAGS = MEDIUMGROUP1;
const int SUBRACE_SPELL_RESISTANCE_MAX_FLAGS = MEDIUMGROUP2;

const string APPEARANCE_DEFAULT_APPEARANCE = "CRE_DEF";

const string APPEARANCE_CHANGE = "CRE_APP";
const string APPEARANCE_TO_CHANGE = "CRE_APP_X";
const int APPEARANCE_CHANGE_MALE_FLAG = HUGEGROUP1;
const int APPEARANCE_CHANGE_FEMALE_FLAG = HUGEGROUP2;
const int APPEARANCE_CHANGE_APPEARANCE_FLAG = HUGEGROUP1;

const string APPEARANCE_TEMP_CHANGED = "CRE_APP_TC";
const string APPEARANCE_TEMP_UNCHANGED = "CRE_APP_TUNC";

const string SUBRACE_IN_SPELL_DARKNESS = "SBR_DARKNESS";

const string SUBRACE_ECL = "S_ECL";


const string SUBRACE_FAVORED_CLASS = "FAV_CLSS";
const int SUBRACE_FAVORED_CLASS_MALE_FLAG = MEDIUMGROUP1;
const int SUBRACE_FAVORED_CLASS_FEMALE_FLAG = MEDIUMGROUP2;

const int TIME_FLAGS =  TINYGROUP1;

const int TIME_DAY = FLAG1;
const int TIME_NIGHT = FLAG2;
const int TIME_NONE = 4;
const int TIME_BOTH = 3;
//Don't go bonko and start using this... it only works on a certain few functions.
const int TIME_SPECIAL_APPEARANCE_SUBRACE = FLAG10;
const int TIME_SPECIAL_APPEARANCE_NORMAL = FLAG11;

const int CLASS_TYPE_ANY = 78;
const int CLASS_TYPE_NONE = 79;

const int SUBRACE_XP_BOOST = 98;
const int SUBRACE_XP_DECREASE = 99;
const int SUBRACE_XP_UNCHANGED = 100;

const int SUBRACE_ACCEPTED = 11;
const int SUBRACE_REJECTED = 12;
const int SUBRACE_UNINITIALIZED = FALSE;
const int SUBRACE_UNRECOGNISED = 15;

const string SUBRACE_INFO_LOADED_ON_PC = "SRCE_INIT";
const string SUBRACE_INFO_LOADED_ON_MODULE = "SRCE_MMML";
const string SUBRACE_UNCHANGEABLE_INFO_LOADED_ON_PC = "SBRCE_IMP_INFO";

const string SUBRACE_CLASS_RESTRICTION = "CLASS_RES";
const string SUBRACE_PRESTIGIOUS_CLASS_RESTRICTION = "P_CLASS_RES";
const string SUBRACE_PRESTIGIOUS_CLASS_RESTRICTION_MINIMUM_LEVELS = "P_CLASS_RES_ML";

const string SUBRACE_STATS_STATUS = "BNS_STAT_S";
const int SUBRACE_DAY_STATS_APPLIED = FLAG1;
const int SUBRACE_NIGHT_STATS_APPLIED = FLAG2;
const int SUBRACE_SPECIAL_STATS_APPEARANCE_SUBRACE_APPLIED = FLAG3;
const int SUBRACE_SPECIAL_STATS_APPEARANCE_NORMAL_APPLIED = FLAG4;

const string SUBRACE_EFFECT = "SUB_EFF";
const string SUBRACE_EFFECT_COUNT = "SUB_EFF_C";
const string SUBRACE_EFFECT_VALUE_1 = "SUB_EFFV1";
const string SUBRACE_EFFECT_VALUE_2 = "SUB_EFFV2";
const string SUBRACE_EFFECT_DURATION_TYPE = "SUB_EFF_DT";
const string SUBRACE_EFFECT_DURATION = "SUB_EFF_DF";
const string SUBRACE_EFFECT_APPLY_TIME = "SUB_EFF_APT";

const string SUBRACE_STAT_STR_MODIFIER = "STR_MOD";
const string SUBRACE_STAT_DEX_MODIFIER = "DEX_MOD";
const string SUBRACE_STAT_CON_MODIFIER = "CON_MOD";
const string SUBRACE_STAT_WIS_MODIFIER = "WIS_MOD";
const string SUBRACE_STAT_INT_MODIFIER = "INT_MOD";
const string SUBRACE_STAT_CHA_MODIFIER = "CHA_MOD";

const string SUBRACE_STAT_AB_MODIFIER = "AB_MOD";
const string SUBRACE_STAT_AC_MODIFIER = "AC_MOD";

const string SUBRACE_STAT_MODIFIERS = "STT_MDS";
const string SUBRACE_STAT_MODIFIER_TYPE = "STT_MD_TYPE";

const int SUBRACE_STAT_MODIFIER_TYPE_PERCENTAGE = FLAG1;
const int SUBRACE_STAT_MODIFIER_TYPE_POINTS = FLAG2;

const string SUBRACE_ITEM_RESTRICTION = "I_RES";
/*const string SUBRACE_WEAPON_RESTRICTION = "W_RES";

const string SUBRACE_ARMOUR_RESTRICTION = "A_RES";
const string SUBRACE_ARMOUR_RESTRICTION_VALUE = "A_RES_V";

const int SUBRACE_RESTRICTION_FLAGS = TINYGROUP2;
const int SUBRACE_HAS_RESTRICTION = FLAG1;
const int SUBRACE_ALLOW_ONLY_THIS_TYPE = FLAG2;

const int SUBRACE_RESTRICTION_DEFENSE = MEDIUMGROUP2;
const int SUBRACE_RESTRICTION_DEFENSE_HEAVY = FLAG1;
const int SUBRACE_RESTRICTION_DEFENSE_MEDIUM = FLAG2;
const int SUBRACE_RESTRICTION_DEFENSE_LIGHT = FLAG3;
const int SUBRACE_RESTRICTION_DEFENSE_CLOTHING = FLAG4;
const int SUBRACE_RESTRICTION_DEFENSE_ALL = FLAG5;

const int SUBRACE_RESTRICTION_WEAPON = MEDIUMGROUP2;
const int SUBRACE_RESTRICTION_WEAPON_MELEE = FLAG1;
const int SUBRACE_RESTRICTION_WEAPON_RANGED = FLAG2;
const int SUBRACE_RESTRICTION_WEAPON_TINY = FLAG3;
const int SUBRACE_RESTRICTION_WEAPON_LARGE = FLAG4;
const int SUBRACE_RESTRICTION_WEAPON_SIMPLE = FLAG5;
const int SUBRACE_RESTRICTION_WEAPON_MARTIAL = FLAG6;
const int SUBRACE_RESTRICTION_WEAPON_EXOTIC = FLAG7;
const int SUBRACE_RESTRICTION_WEAPON_ALL = FLAG8;*/

const string SUBRACE_SWITCH_NAME = "SUB_SWCT";
const string SUBRACE_SWITCH_LEVEL = "SUB_SWCT_L";
const string SUBRACE_SWITCH_MUST_MEET_REQUIREMENTS = "SUB_SWCT_R";

const string SUBRACE_ATTACHMENT_FLAGS = "SUB_ATT_FS";

const int SUBRACE_ATTACHMENT_FLAGS_WINGS_MALE = MEDIUMGROUP1;
const int SUBRACE_ATTACHMENT_FLAGS_WINGS_FEMALE = MEDIUMGROUP2;
const int SUBRACE_ATTACHMENT_FLAGS_TAIL_MALE = MEDIUMGROUP3;
const int SUBRACE_ATTACHMENT_FLAGS_TAIL_FEMALE = MEDIUMGROUP4;


const int SUBRACE_ATTACHMENT_FLAGS_WINGS = MEDIUMGROUP1;
const int SUBRACE_ATTACHMENT_FLAGS_TAIL = MEDIUMGROUP3;

const int APPEARANCE_TYPE_ATTACHMENT_WINGS_NONE = 0;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_DEMON = CREATURE_WING_TYPE_DEMON;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_ANGEL = CREATURE_WING_TYPE_ANGEL;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_BAT = CREATURE_WING_TYPE_BAT;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_RED_DRAGON_DISCIPLE = CREATURE_WING_TYPE_DRAGON;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_BUTTERFLY = CREATURE_WING_TYPE_BUTTERFLY;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_BIRD = CREATURE_WING_TYPE_BIRD;

const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_ERINYES_DEMON = 30;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_RED_BIRD = 31;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_DARK_BIRD = 32;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_BLUE_BIRD = 33;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_BLACK_DRAGON = 34;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_BLUE_DRAGON = 35;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_BRASS_DRAGON = 36;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_BRONZE_DRAGON = 37;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_COPPER_DRAGON = 38;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_GOLD_DRAGON = 39;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_GREEN_DRAGON = 40;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_SILVER_DRAGON = 41;
const int APPEARANCE_TYPE_ATTACHMENT_WINGS_CEP_WHITE_DRAGON = 42;


const int APPEARANCE_TYPE_ATTACHMENT_TAIL_NONE = 0;
const int APPEARANCE_TYPE_ATTACHMENT_TAIL_LIZARD = 1;
const int APPEARANCE_TYPE_ATTACHMENT_TAIL_BONE = 2;
const int APPEARANCE_TYPE_ATTACHMENT_TAIL_DEVIL = 3;

const int APPEARANCE_TYPE_ATTACHMENT_TAIL_CEP_CAT = 30;

const string SUBRACE_HAS_BASE_STAT_MODIFIERS = "H_BSTAT_M";
const string SUBRACE_BASE_STAT_MODIFIERS_REPLACE = "H_BSTAT_R";
const string SUBRACE_BASE_STAT_STR_MODIFIER = "BSTR_MOD";
const string SUBRACE_BASE_STAT_DEX_MODIFIER = "BDEX_MOD";
const string SUBRACE_BASE_STAT_CON_MODIFIER = "BCON_MOD";
const string SUBRACE_BASE_STAT_WIS_MODIFIER = "BWIS_MOD";
const string SUBRACE_BASE_STAT_INT_MODIFIER = "BINT_MOD";
const string SUBRACE_BASE_STAT_CHA_MODIFIER = "BCHA_MOD";
const string SUBRACE_BASE_STAT_HP_MODIFIER = "BHP_MOD";

//const string SUBRACE_BASE_STAT_AB_MODIFIER = "BAB_MOD";
const string SUBRACE_BASE_STAT_SPD_MODIFIER = "BSPD_MOD";

const string SUBRACE_BONUS_FEAT_FLAGS = "BFEATS";
const string SUBRACE_BONUS_FEAT_COUNT= "BFEAT_C";
const int SUBRACE_BONUS_FEAT_FLAG = HUGEGROUP1;
const int SUBRACE_BONUS_FEAT_REMOVE_FLAG = HUGEGROUP2;


const string SUBRACE_BONUS_SKILL_FLAGS = "BSKILLS";
const string SUBRACE_BONUS_SKILL_COUNT= "BSKILLS_C";
const int SUBRACE_BONUS_SKILL_FLAG = LARGEGROUP1;
const int SUBRACE_BONUS_SKILL_MODIFIER_FLAG = LARGEGROUP2;
const int SUBRACE_BONUS_SKILL_REMOVE_FLAG = LARGEGROUP3;

const string SUBRACE_PORTRAIT_MALE = "SPORT_M";
const string SUBRACE_PORTRAIT_FEMALE = "SPORT_F";
const string SUBRACE_PORTRAIT= "SPORT_P";

const string SUBRACE_SOUNDSET_FLAGS = "SSOUNDS";
const int SUBRACE_SOUNDSET_MALE_FLAG = LARGEGROUP1;
const int SUBRACE_SOUNDSET_FEMALE_FLAG = LARGEGROUP2;

const int MOVEMENT_SPEED_PC = 0;
const int MOVEMENT_SPEED_IMMOBILE = 1;
const int MOVEMENT_SPEED_VERY_SLOW = 2;
const int MOVEMENT_SPEED_SLOW = 3;
const int MOVEMENT_SPEED_NORMAL = 4;
const int MOVEMENT_SPEED_FAST = 5;
const int MOVEMENT_SPEED_VERY_FAST = 6;
const int MOVEMENT_SPEED_DEFAULT = 7;
const int MOVEMENT_SPEED_DMSPEED = 8;
const int MOVEMENT_SPEED_CURRENT = 9;

const int SUBRACE_FACTION_REPUTATION_FRIENDLY = 0;
const int SUBRACE_FACTION_REPUTATION_NEUTRAL = -50;
const int SUBRACE_FACTION_REPUTATION_HOSTILE = -100;

const string SUBRACE_FACTION_CREATURE = "S_FACC";
const string SUBRACE_FACTION_REPUTATION = "S_FACR";
const string SUBRACE_FACTION_COUNT = "S_FACCOU";

const string SUBRACE_START_LOCATION  = "S_SLOC";

const string SUBRACE_GENDER_RES = "GEN_RES";


//MOON: DM WAND  -- CONTS LINE 825
//Error constants
const int SUBRACE_ERROR_ALIGNMENT = FLAG1;
const int SUBRACE_ERROR_RACE = FLAG2;
const int SUBRACE_ERROR_CLASS = FLAG3;
const int SUBRACE_ERROR_PRESTIGE_FAILURE = FLAG4;
const int SUBRACE_ERROR_PRESTIGE_NOT_MET = FLAG5;
const int SUBRACE_ERROR_UNRECOGNISED = FLAG6;
const int SUBRACE_ERROR_GENDER = FLAG7;

// Engine const for the Wand
const string SWAND_PREFIX = "SWAND_";
const string SWAND_TARGET = "TARGETED_OBJECT";
const string SWAND_SPECIAL_START = "SPEC_CONVO_EVENT";
const string SWAND_CHANGE_SUBRACE = "SWAND_SUBRACE_CHANGE";

//Custom Token number.
int SWAND_START_CUSTOM_TOKEN = 8110;





//::------------------ Item sorting constants and ints -------------------------
//:: Written by: Moon

//Requirement based Flags
const int ITEM_TYPE_REQ_ALL               =  FLAG1; //All requirements must be fulfilled
const int ITEM_TYPE_REQ_DO_NOT_ALLOW      =  FLAG2; //Reversed (You can use all BUT the restrictions set)
const int ITEM_TYPE_REQ_ONLY_ALLOW        =  3; //FLAG1 | FLAG2 You can only use the restrictions set
const int ITEM_TYPE_REQ_ANY               =  NOFLAGS; //Just 1 requirement must be met



//MELEE WEAPON
const int ITEM_TYPE_WEAPON_MELEE           = FLAG3; //NOTE: Gloves (Monk Melee Weapon) DOES Respond to this one (but Bracers do not)
//RANGED OR THROWING WEAPON
const int ITEM_TYPE_WEAPON_RANGED_THROWING = FLAG4;  //Ammo is not Flagged as Ranged/Throwing.


//FLAG SIZE OF THE WEAPON (Note that only weapons have sizes)
const int ITEM_TYPE_WEAPON_SIZE_TINY       = FLAG5;
const int ITEM_TYPE_WEAPON_SIZE_SMALL      = FLAG6;
const int ITEM_TYPE_WEAPON_SIZE_MEDIUM     = FLAG7;
const int ITEM_TYPE_WEAPON_SIZE_LARGE      = FLAG8;


//FLAG AS NONE BIOWARE STANDARD ITEM
const int ITEM_TYPE_NONE_BIOWARE_ITEM      = FLAG9;

//FLAG WEAPON BY PROF. FEAT REQUIRED TO USE
const int ITEM_TYPE_WEAPON_PROF_SIMPLE     = FLAG10;
const int ITEM_TYPE_WEAPON_PROF_MARTIAL    = FLAG11;
const int ITEM_TYPE_WEAPON_PROF_EXOTIC     = FLAG12;

//FLAG AS ARMORS/HELMS
const int ITEM_TYPE_ARMOR                  = FLAG13; //Only (Torso) Armor (incls zero AC Clothing)
const int ITEM_TYPE_HELM                   = FLAG14; //Only Helms



//FLAGS TORSO ARMOR BY AC
const int ITEM_TYPE_ARMOR_AC_0              = FLAG15; //Same Value for ITEM_TYPE_ARMOR_AC_0 and ITEM_TYPE_ARMOR_CLOTH

const int ITEM_TYPE_ARMOR_AC_1             = FLAG16;
const int ITEM_TYPE_ARMOR_AC_2             = FLAG17;
const int ITEM_TYPE_ARMOR_AC_3             = FLAG18;
const int ITEM_TYPE_ARMOR_AC_4             = FLAG19;
const int ITEM_TYPE_ARMOR_AC_5             = FLAG20;
const int ITEM_TYPE_ARMOR_AC_6             = FLAG21;
const int ITEM_TYPE_ARMOR_AC_7             = FLAG22;
const int ITEM_TYPE_ARMOR_AC_8             = FLAG23;

//FLAGS SHIELDS BY TYPE
const int ITEM_TYPE_SHIELD_SMALL           = FLAG24; //Small Shields
const int ITEM_TYPE_SHIELD_LARGE           = FLAG25; //Large Shields
const int ITEM_TYPE_SHIELD_TOWER           = FLAG26; //Tower Shields


//FLAG MISC TYPES
const int ITEM_TYPE_JEWLERY                = FLAG27; //Rings and Amulets
const int ITEM_TYPE_MISC_CLOTHING          = FLAG28; //None Armors, none Jewlery equipment (Cloak, belt, etc.)
const int ITEM_TYPE_AMMO                   = FLAG29; //Arrows, bolts and bullets
const int ITEM_TYPE_MAGICAL_ITEM           = FLAG30; //Magical items (Staves [None Quarter Staves], scrolls, wands)

//FLAG TIME RESTRICTION (Does not follow TIME_* Standards)
const int ITEM_TYPE_REQ_DAY                = FLAG31; //Restriction is active during Day-Time
const int ITEM_TYPE_REQ_NIGHT              = FLAG32; //Restriction is active during Night-Time

//SPECIAL FLAGS
const int ITEM_TYPE_ALL                    = ALLFLAGS; //All of the above (incl. the restrictions)
const int ITEM_TYPE_INVALID                = NOFLAGS;  //Invalid or Undefined Type (Also used as "None of the above")



//Group Flags.
//WEAPONS (Both MELEE and RANGED/THROWING respond to this)
int ITEM_TYPE_WEAPON                 = ITEM_TYPE_WEAPON_MELEE | ITEM_TYPE_WEAPON_RANGED_THROWING;

//All Small and Tiny Weapons will respond to this.
int ITEM_TYPE_WEAPON_SIZE_SMALL_DOWN = ITEM_TYPE_WEAPON_SIZE_SMALL | ITEM_TYPE_WEAPON_SIZE_TINY;
//All Medium and Large Weapons will respond to this.
int ITEM_TYPE_WEAPON_SIZE_MEDIUM_UP  = ITEM_TYPE_WEAPON_SIZE_MEDIUM | ITEM_TYPE_WEAPON_SIZE_LARGE;
//Any Size Respond to this. (For Size Testing)
int ITEM_TYPE_WEAPON_SIZE_ANY        = ITEM_TYPE_WEAPON_SIZE_SMALL_DOWN | ITEM_TYPE_WEAPON_SIZE_MEDIUM_UP;

//Any Prof Respond to this. (For Prof Testing)
int ITEM_TYPE_WEAPON_PROF_ANY        = ITEM_TYPE_WEAPON_PROF_EXOTIC | ITEM_TYPE_WEAPON_PROF_SIMPLE | ITEM_TYPE_WEAPON_PROF_MARTIAL;

//All Shields
int ITEM_TYPE_SHIELD_ANY             = ITEM_TYPE_SHIELD_LARGE | ITEM_TYPE_SHIELD_TOWER | ITEM_TYPE_SHIELD_SMALL;

//All armors/helms and shields should respond to this
int ITEM_TYPE_FULL_ARMOR_SET         = ITEM_TYPE_SHIELD_ANY | ITEM_TYPE_ARMOR | ITEM_TYPE_HELM; //All Armors, Shields and Helmet



//ARMOR SORTED BY TYPE
int ITEM_TYPE_ARMOR_TYPE_CLOTH       = ITEM_TYPE_ARMOR_AC_0; // AC 0  (See ITEM_TYPE_ARMOR_AC_0)
int ITEM_TYPE_ARMOR_TYPE_LIGHT       = ITEM_TYPE_ARMOR_AC_1 | ITEM_TYPE_ARMOR_AC_2 | ITEM_TYPE_ARMOR_AC_3;// AC 1 - 3
int ITEM_TYPE_ARMOR_TYPE_MEDIUM      = ITEM_TYPE_ARMOR_AC_4 | ITEM_TYPE_ARMOR_AC_5 | ITEM_TYPE_ARMOR_AC_6;// AC 4 - 6
int ITEM_TYPE_ARMOR_TYPE_HEAVY       = ITEM_TYPE_ARMOR_AC_7 | ITEM_TYPE_ARMOR_AC_8;// AC 7 - 8


struct Subrace
{
    int BaseRace;
    string Name;
    string SkinResRef;
    string UniqueItemResRef;
    int IsLightSensitive;
    int DamageTakenWhileInLight;
    int IsUndergroundSensitive;
    int DamageTakenWhileInUnderground;
    int ECL;
    int IsUndead;
    int PrestigiousSubrace;
};

struct SubraceAlignmentRestriction
{
    string subraceName;
    int CanBeAlignment_Good;
    int CanBeAlignment_Neutral1;
    int CanBeAlignment_Evil;
    int CanBeAlignment_Lawful;
    int CanBeAlignment_Neutral2;
    int CanBeAlignment_Chaotic;
};

struct SubraceClassRestriction
{
    string subraceName;
    int CanBe_Barbarian;
    int CanBe_Bard;
    int CanBe_Cleric;
    int CanBe_Druid;
    int CanBe_Fighter;
    int CanBe_Monk;
    int CanBe_Paladin;
    int CanBe_Ranger;
    int CanBe_Rogue;
    int CanBe_Sorcerer;
    int CanBe_Wizard;
};

struct SubraceSpellResistance
{
    string subraceName;
    int SpellResistanceBase;
    int SpellResistanceMax;
};

struct SubraceDifferentAppearance
{
    string subraceName;
    int ChangeAppearanceTime;
    int MaleAppearance;
    int FemaleAppearance;
    int Level;
};

struct SubraceStats
{
   int ModType;
   float StrengthModifier;
   float DexterityModifier;
   float ConstitutionModifier;
   float IntelligenceModifier;
   float WisdomModifier;
   float CharismaModifier;
   float ACModifier;
   float ABModifier;

};


struct SubraceBaseStatsModifier
{
   int StrengthModifier;
   int DexterityModifier;
   int ConstitutionModifier;
   int IntelligenceModifier;
   int WisdomModifier;
   int CharismaModifier;
   int SpdModifier;
//   int HPModifier;
};




//void main() {}
