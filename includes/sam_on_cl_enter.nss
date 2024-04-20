 /////////////////////////////////////////////::///////////////////////////////////////////////
//:: Default:On Client Enter Control
//:: ely_on_cl_enter
//:://////////////////////////////////////////////
//:: Edited by: Christine Reynolds
//:: Configures most In-Game functions for players
//:://////////////////////////////////////////////
#include "spw_inc"
//*#include "hc_inc_subrace"
#include "sam_timecheck"
//#include "ely_inc_ban"

/*void HCRBoot(object oPC, string sReason)
{
    SendMessageToPC(oPC,sReason);
    WriteTimestampedLogEntry(GetName(oPC) + " was booted off the system: " + sReason);
    DelayCommand(6.0,BootPC(oPC));
}*/

/*void SetECL(object oPC)
{
    string sSubRace = GetStringLowerCase(GetSubRace(oPC));
    if (sSubRace != "")
    {
        string sSQL = "SELECT name FROM subracealias WHERE alias='" + SQLEncodeSpecialChars(sSubRace) + "'";\
        SQLExecDirect(sSQL);
        if (SQLFetch() == SQL_SUCCESS)
        {
            sSubRace = SQLGetData(1);
        }
        sSQL = "SELECT ecl FROM subraces WHERE subrace = '" + SQLEncodeSpecialChars(sSubRace) + "'";
        SQLExecDirect(sSQL);
        if (SQLFetch() == SQL_SUCCESS)
        {
             string sData = SQLGetData(1);
             SetLocalInt(oPC, "SAM_leveladjustment", StringToInt(sData));
        }
    }
}*/

void firsttime(object oPC)
{
    SetLocalInt(oPC, "SAM_first_time", 1);
    /*// Lets determine if they are cheating on their ability scores
    // If the sum > 100 or an individual score is > 20
    int nCheating = FALSE;
    int nStr = GetAbilityScore(oPC, ABILITY_STRENGTH);
    int nInt = GetAbilityScore(oPC, ABILITY_INTELLIGENCE);
    int nCon = GetAbilityScore(oPC, ABILITY_CONSTITUTION);
    int nWis = GetAbilityScore(oPC, ABILITY_WISDOM);
    int nDex = GetAbilityScore(oPC, ABILITY_DEXTERITY);
    int nCha = GetAbilityScore(oPC, ABILITY_CHARISMA);
    if (nStr > 20 ||nInt > 20 ||nDex > 20 ||nCon > 20 ||nWis > 20 ||nCha > 20)
    nCheating = TRUE;
    if (nStr + nInt + nDex + nCon + nWis + nCha > 100) nCheating = TRUE;
    // Now boot them
    if (nCheating)
    {
        SendMessageToAllDMs(GetPCPublicCDKey(oPC) + ":" + GetPCPlayerName(oPC) + ":" + GetName(oPC) + " is a cheater.");
        HCRBoot(oPC, "This server does not allow cheat characters.  Thanks for playing.");
        return;
    }*/
    string  STORE_NAME      = "NewbieMerchant";
    //If you want everyone to have the elye amount of starting gold, modify the
    //lines below
    int     STARTING_GOLD = 10000;
    GiveGoldToCreature(oPC, STARTING_GOLD - GetGold(oPC));

    // Removing PC's equipment...Simplified by KMdS
    int nEquipSlot = 0;
    object oGear = GetItemInSlot(nEquipSlot, oPC);
    do{
        if(GetIsObjectValid(oGear))
            DestroyObject(oGear);
        oGear = GetItemInSlot(++nEquipSlot, oPC);
    }while(nEquipSlot < 14);

    // Removing PC's inventory.
    object oStuff = GetFirstItemInInventory(oPC);
    while(GetIsObjectValid(oStuff))
    {
        DestroyObject(oStuff);
        oStuff = GetNextItemInInventory(oPC);
    }
}

void SetHP(object oPC, int nDamage)
{
    effect eDamage = EffectDamage(nDamage, DAMAGE_TYPE_POSITIVE, DAMAGE_POWER_NORMAL);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);
    SetLocalInt(oPC, "ely_initializing", FALSE);
}

/*int GetPoints(int nScore)
{
    if (nScore < 15)
    {
        return nScore - 8;
    }
    if (nScore < 17)
    {
        return 6 + (nScore - 14) * 2;
    }
    return 10 + (nScore - 16) * 3;
}*/

void main()
{
    // Get the PC and log the event
    object oPC = GetEnteringObject();


    //base bioware horse skin addition
    if ((GetIsPC(oPC)||GetIsDM(oPC))&&!GetHasFeat(FEAT_HORSE_MENU,oPC))
    { // add horse menu
        HorseAddHorseMenu(oPC);
        if (GetLocalInt(GetModule(),"X3_ENABLE_MOUNT_DB"))
        { // restore PC horse status from database
            DelayCommand(5.0,HorseReloadFromDatabase(oPC,X3_HORSE_DATABASE));
        } // restore PC horse status from database
    } // add horse menu


//    ExecuteScript("replacement", oPC);
//    ExecuteScript("itemremoval", oPC);
    // Send banned people packing
   /* if (bootIfBanned(oPC))
    {
        return;
    } */
    // Is this the first login since restart?
    int nLoginSinceRestart = GetLocalInt(oPC, "ely_loginsincerestart");
    // First determine if we need to transfer them to the new persistence system
    if (!GetCampaignInt("SOTS", "ely_player",oPC))
    {
        EnsureObjectLoaded(oPC);
    }
    /*
    // Stop people from exploits
    SetLocalInt(oPC, "ely_initializing", TRUE);
    int nLastRest = GetCampaignInt("SOTS", "ely_lastrest",oPC);
    if (nLoginSinceRestart && nLastRest && !GetIsDM(oPC))
    {
        int nCurrentTime = SecondsSinceStart();
        int nRestTime = GetHitDice(oPC) * 60;
        int nDiff = nCurrentTime - nLastRest;
        if (nDiff < nRestTime)
        {
            HCRBoot(oPC, "Please wait until your rest period expires before logging in again. You have " +
                IntToString(nRestTime-nDiff) + " seconds to go.");
            return;
        }
    }*/
    string LOGINMESSAGE="Updated 3/23/2024.";
    // Debug
    int nDebug = GetLocalInt(GetModule(), "ely_debug");
    // Set the players hit points
    int nCurrentHitPoints = GetCurrentHitPoints(oPC);
    int nHitPoints = GetCampaignInt("SOTS", "ely_hps",oPC);
    if (nHitPoints != 0)
    {
        int nDamage = nCurrentHitPoints - nHitPoints;
        if (nDamage > 0)
        {
            DelayCommand(6.0, SetHP(oPC, nDamage));
        }
    }
    // Mark player as entered and make sure all players are unique
    int nOldPlayer = GetCampaignInt("SOTS", "ely_player",oPC);
    if (!nOldPlayer) {
        SetCampaignInt("SOTS", "ely_player", TRUE ,oPC);
        /*if (GetSubRace(oPC) == "")
        {
            GiveXPToCreature(oPC, 2);
        } else {
            GiveXPToCreature(oPC, 1);
        }*/
        if (!GetIsDM(oPC))
        {
            if(GetHitDice(oPC) <= 2)
            {
            firsttime(oPC);
            SetXP(oPC, 3000);
            }
            else
            {
            SetLocalInt(oPC, "SAM_first_time", 1);
            }
        }
    }
    /*else
    {
        if (GetXP(oPC) == 0 && !GetIsDM(oPC))
        {
            SendMessageToPC(oPC, "This is a duplicate character name.");
            AssignCommand(GetModule(), DelayCommand(6.0, BootPC(oPC)));
            return;
        }
        if (GetXP(oPC) != 2 && GetXP(oPC) < 3000)
        {
            SetXP(oPC, 3000);
        }
    } */



    //Shayan's Subraces
    SubraceOnClientEnter();

    // HCR Items
    object oMod = GetModule();
    int nDM = GetIsDM(oPC);
    // Give Paladins their tools that simulate missing abilities
    if(GetLevelByClass(CLASS_TYPE_PALADIN,oPC)>1 &&
        GetIsObjectValid(GetItemPossessedBy(oPC,"hc_palbadgec"))==FALSE)
           CreateItemOnObject("paladinsbadgeofc", oPC);
    if(GetLevelByClass(CLASS_TYPE_PALADIN,oPC) &&
        GetIsObjectValid(GetItemPossessedBy(oPC,"hc_paladinsymb"))==FALSE)
           CreateItemOnObject("paladinsholysymb", oPC);
    // Give rangers their tracking tool simulating their missing ability
    if(GetLevelByClass(CLASS_TYPE_RANGER,oPC)>1 &&
        GetIsObjectValid(GetItemPossessedBy(oPC,"TrackerTool"))==FALSE)
           CreateItemOnObject("trackertool", oPC);
    // Give PC's a Trap Tool in inventory
    // Give PC's an EmoteWand if using the DMHelper set.
    if(!GetIsObjectValid(GetItemPossessedBy(oPC,"EmoteWand")))
         CreateItemOnObject("emotewand", oPC);

    // Give DM's a DMHelper in inventory
    if(GetIsObjectValid(GetItemPossessedBy(oPC,"dmfi_dmw"))==FALSE &&
       (nDM))
           CreateItemOnObject("dmfi_dmw", oPC);
    // Give DM's a FXWand in inventory
    if(GetIsObjectValid(GetItemPossessedBy(oPC,"dmfi_fx"))==FALSE &&
       (nDM))
           CreateItemOnObject("dmfi_fx", oPC);
    //Give Shayan Subrace Wand
    if(GetIsObjectValid(GetItemPossessedBy(oPC,"_dm_subrace_wand"))==FALSE)
    {
    CreateItemOnObject("dm_subrace_wand", oPC);
    }
    // Send a login message to all players if one exists
    SendMessageToPC(oPC, LOGINMESSAGE);
    SendMessageToPC(oPC, "Welcome to Menzoberranzan.");
    // Apply subraces
    //SetLocalInt(oPC, "ely_subrace_converted", GetCampaignInt("SOTS", "ely_subrace_converted",oPC));
    //ReapplySubRaceEffects(oPC);
    //SetECL(oPC);
    AddJournalQuestEntry("ServerBackground", 1,oPC,TRUE,TRUE,FALSE);
    AddJournalQuestEntry("TheServerRules", 1,oPC,TRUE,TRUE,FALSE);
    AddJournalQuestEntry("TheDMs", 1,oPC,TRUE,TRUE,FALSE);
    AddJournalQuestEntry("Playersguide", 1,oPC,TRUE,TRUE,FALSE);
    AddJournalQuestEntry("itemsneeded", 1,oPC,TRUE,TRUE,FALSE);
}
