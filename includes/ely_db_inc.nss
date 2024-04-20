//::///////////////////////////////////////////////
//:: File Name: Database Inc File sots_inc_db.nss
//:: Copyright (c) 2001 Bioware Corp.
//:: Database FUNCTIONS
//:://////////////////////////////////////////////
/*

*/
//:://////////////////////////////////////////////
//:: Original Created By: 
//:: Updated by:  DM Elysium
//:: 
//:: File Association:
//:://////////////////////////////////////////////




// The name of your database
const string CAMPAIGN_DATABASE = "SOTS"
// possible values for theSavePlayerLocation() function
const string SOTS_DB_PLAYER_DEATH = "PLAYER_LAST_DEATH";       // last place of death
const string SOTS_DB_PLAYER_BIND = "PLAYER_LAST_BIND";        // last savepoint used
const string SOTS_DB_PLAYER_START = "PLAYER_LAST_START";       // start location
// C O N F I G U R A T I O N
// if set to TRUE, the player can only save his last save location at savepoints
const int SOTS_DB_USESAVEPOINTS = TRUE;


// toggle debug messages
const int SOTS_DB_DEBUGMODE = FALSE;
// Message strings
const string SOTS_DB_SAVEPOINT_USED = "";
const string SOTS_DB_SAVEPOINT_OFF = "";
const string SOTS_DB_SAVEPOINT_NOGOLD = "";
const string SOTS_DB_PORTALSCROLL_FAIL = "";
const string SOTS_DB_FORCEDEATH = "";
// Object Tags
const string SOTS_DB_PORTAL = "portaldoor";

// I N T E R F A C E
// returns TRUE if a location is valid
int GetIsLocationValid(location lLoc);
// returns a unique string for each PC
//string GetUniqueCharID(object oPC); //Not used anymore
// saves the current status of the player (hp, location)
voidSavePlayerStatus(object oPC);
// returns the number of time a player has died
int GetPlayerDeathCount(object oPC);
// saves the location of the player into the slot defined in sLocationID
// for easy tracking, use the DB_L_* constants defined in this library for the sLocationID
voidSavePlayerLocation(object oPC, string sLocationID);
// returns a persistent location stored withSavePlayerLocation on the player
// use with the DB_L_* constants to prevent typos errors
location LoadPlayerLocation(object oPC, string sLocationID);
// increase the death count of a player by one
void IncreasePlayerDeathCount(object oPC);

// reset the database
void ResetDatabase();


// I M P L E M E N T A T I O N
int  GetIsLocationValid(location lLoc)
{
    return (GetAreaFromLocation(lLoc)!= OBJECT_INVALID);
}
string GetUniquePlayerID(object oPC)
{
    return  GetPCPublicCDKey(oPC) + GetName(oPC);
}

void  IncreasePlayerDeathCount(object oPC)
{
      // Increment death count only if death was not forced by OnEnter Event
    if (GetLocalInt(oPC, "SOTS_DB_DIE_FORCED"))
    {
        DeleteLocalInt(oPC, "SOTS_DB_DIE_FORCED");
        return;
    }
    SetLocalInt(oPC, "SOTS_DB_DIE_FORCED",TRUE);
    SetCampaignInt(CAMPAIGN_DATABASE,"PLAYER_DEATHCOUNT",GetPlayerDeathCount(oPC)+1,oPC);
}

int GetPlayerDeathCount(object oPC)
{
    return GetCampaignInt(CAMPAIGN_DATABASE,"PLAYER_DEATHCOUNT",oPC);
}

voidSavePlayerLocation(object oPC, string sLocationID)
{
    if (GetIsLocationValid(GetLocation(oPC)))
    {
        SetCampaignLocation(CAMPAIGN_DATABASE, sLocationID , GetLocation(oPC), oPC);
    }
}

location LoadPlayerLocation(object oPC, string sLocationID)
{
    return GetCampaignLocation(CAMPAIGN_DATABASE, sLocationID, oPC);
}



void Die(object oPC = OBJECT_SELF)
{
       SetLocalInt(oPC, "SOTS_DB_DIE_FORCED",TRUE);
       effect eDeath = EffectDeath();
       ApplyEffectToObject(DURATION_TYPE_INSTANT,eDeath,oPC);
       SendMessageToPC(oPC,SOTS_DB_FORCEDEATH);

}

voidSavePlayerStatus(object oPC)
{
    // Save current HP
    SetCampaignInt(CAMPAIGN_DATABASE,"PLAYER_CUR_HP",GetCurrentHitPoints(oPC), oPC);
    // Save current state (dead/alive)
    SetCampaignInt(CAMPAIGN_DATABASE,"PLAYER_IS_DEAD",GetIsDead(oPC),oPC);

    // SendMessageToPC(oPC
    Debug(oPC, "Status Saved");
}

void RestorePlayerStatus(object oPC)
{
    location lLoc;
    int bDead = GetCampaignInt(CAMPAIGN_DATABASE,"PLAYER_IS_DEAD",oPC);

   if (DB_USESAVEPOINTS)
    {
        // load save point
        lLoc =LoadPlayerLocation(oPC, DB_PLAYER_BIND);
    }
    else
    {
        //load last save point
        lLoc =LoadPlayerLocation(oPC,DB_L_PLAYER_START );
    }

    if (GetIsLocationValid(lLoc))
    {
        AssignCommand(oPC, JumpToLocation (lLoc));
    }

    // if player was dead on last save, revert him to that state
    if (bDead)
    {
        AssignCommand(oPC,Die());
    }
    else
    {
        // if player was damage last save, lower his hitpoints
        int nHP = GetCampaignInt(CAMPAIGN_DATABASE,"PLAYER_CUR_HP", oPC);
        int nHPDelta=  GetCurrentHitPoints(oPC)- nHP;
        if (nHPDelta > 0)
        {
            effect eDamage = EffectDamage(nHPDelta , DAMAGE_TYPE_MAGICAL,DAMAGE_POWER_PLUS_FIVE);
            eDamage = SupernaturalEffect(eDamage);
            ApplyEffectToObject (DURATION_TYPE_INSTANT, eDamage,oPC);
        }
    }
}

void ResetDatabase()
{
    DestroyCampaignDatabase(CAMPAIGN_DATABASE);
}