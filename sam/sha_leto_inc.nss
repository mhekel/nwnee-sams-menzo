//::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
//:::::::::::::::::::::::: Shayan's Subrace Engine :::::::::::::::::::::::::::::
//::::::::::::::::::::::: File Name: sha_leto_inc ::::::::::::::::::::::::::::::
//:::::::::::::::::::::::::: LETOScript Include file :::::::::::::::::::::::::::
//:: Written By: Demux (and distributed with DAR package)
//:: Modified by: Shayan
//
// :: This script controls the Leto functions for the Subrace Engine. Most of these
// :: functions were originally written by Demux for his DAR subraces package.
// :: It has been slightly modified for the Subrace Engine.
// :: Thanks to Demux for this wonderful script.

#include "sha_subr_consts"

// Used to check whether NWNX2-Leto is functioning properly.
// Returns TRUE if Leto is working.
int LetoPingPong();

string LetoScript(string script)
{
    // Stores a var in the module which NWNX LETO then takes and works with.
    SetLocalString(GetModule(), "NWNX!LETO!SCRIPT", script);
    // Gets the var now changed by NWNX LETO back from the module and returns it.
    return GetLocalString(GetModule(), "NWNX!LETO!SCRIPT");
}

string LetoOpen(string file, string handler = "")
{
    if(handler == "")
    {
        handler = "TEMP";
    }
    return "%"+handler+" = q<"+file+">;";
}

int LetoPingPong()
{
  string Test = LetoScript("print q<PingPong>;");
  if(Test == "PingPong")
  {
      return TRUE;
  }
  return FALSE;
}

string LetoClose(string handler = "")
{
    if(handler == "")
    {
        handler = "TEMP";
    }
    return "close %"+handler+";";
}

string LetoSave(string file, string handler = "")
{
    if(handler == "")
    {
        handler = "TEMP";
    }
    return "%"+handler+" = q?>"+file+"?;";
}


string LETO_ModifySkinColor(int iSkin_Color) {
   return "/Color_Skin = " + IntToString(iSkin_Color)+";";
}

string LETO_ModifyHairColor(int iHair_Color) {
   return "/Color_Hair = " + IntToString(iHair_Color)+";";
}


string LETO_ModifyProperty(string sProperty, int iModifier, int Set)
{
    if(!Set)
    {
       return "/"+sProperty+" = /"+sProperty+"+"+IntToString(iModifier)+";";
    }
    else
    {
      return "/"+sProperty+" = "+ IntToString(iModifier)+ ";";
    }

}
/* NO need since patch 1.67
string LETO_ModifyWings(int iWing_Number)
{   //"<if:<Wings> ne " + IntToString(iWing_Number) + "><gff:set 'Wings' {value="+IntToString(iWing_Number)+"}></if>"
   return "/Wings = " + IntToString(iWing_Number)+";";
}

string LETO_ModifyTail(int iTail_Number)
{
   return "/Tail = " + IntToString(iTail_Number)+";";
}

string LETO_ModifyPortrait(string sPortrait)
{
    if(sPortrait == "")
    { return "";   }
    return "/Portrait = " + sPortrait +";";
}

 */

string LETO_ModifyFeat(int iFeat, int Remove)
{
    string sScript;
    if(Remove == 0)
    {
        sScript =  "add /FeatList/Feat, type => gffWord, value => " + IntToString(iFeat) + ";" + "add /LvlStatList/[0]/FeatList/Feat, type => gffWord, value => " + IntToString(iFeat) + ";";
    }
    else
    {
       sScript = "replace 'Feat', "+IntToString(iFeat)+", DeleteParent;";
    }
    return sScript;
}



string LETO_ModifySkill(int iSkill, int iModifier, int Set)
{
    if(Set == 0)
    {
      return "/SkillList/["+IntToString(iSkill)+"]/Rank = /SkillList/["+IntToString(iSkill)+"]/Rank+"+IntToString(iModifier)+";" + "/LvlStatList/[0]/SkillList/["+IntToString(iSkill)+"]/Rank = /SkillList/["+IntToString(iSkill)+"]/Rank+"+IntToString(iModifier)+";";
    }
    else
    {
      return "/SkillList/["+IntToString(iSkill)+"]/Rank = " + IntToString(iModifier) + ";" + "/LvlStatList/[0]/SkillList/["+IntToString(iSkill)+"]/Rank = "+IntToString(iModifier)+";";
    }
}


string LETO_SetMovementSpeed(int iSpeed)
{
    if(iSpeed == MOVEMENT_SPEED_CURRENT)
    {
        return "";
    }
    else
    {
       return "/MovementRate = "+IntToString(iSpeed)+";";
    }
}

string LETO_SetSoundSet(int iSoundSetReference)
{
    if(iSoundSetReference == -1)
    {    return ""; }
    return "/SoundSetFile = " + IntToString(iSoundSetReference)+";";
}


string GetBicFileName(object oPC)
{
    string  PlayerName = GetLocalString(oPC, "SUBR_PlayerName");
    string BicFolderPath = "";
    if(!USE_LOCAL_VAULT_CHARACTERS)
    {
         BicFolderPath = NWNPATH+"servervault/"+PlayerName+"/";
    }
    else
    {
         BicFolderPath = NWNPATH+"localvault/";
    }
    string BicFilePath = BicFolderPath + LetoScript("print FindNewestBic('" + BicFolderPath + "');");
    return BicFilePath;

}
string LETO_GetBicPath(object oPC);
string LETO_GetBicPath(object oPC)
{
    string BicFilePath = GetLocalString(oPC, "SUBR_FileName");
    return BicFilePath;
}


string SetDocumentedLevel(int level = 1)
{
    return "/Lootable = "+IntToString(level)+";";
}

int GetDocumentedLevel(object oPC)
{
    return StringToInt(LetoScript(LetoOpen(LETO_GetBicPath(oPC)) + "print /Lootable;" + LetoClose()));
}

void DeleteBicFile(string file)
{
    PrintString(LetoScript("FileDelete q<" + file + ">"));
}

string LETO_SetBicTag(string BicFile)
{
  return "/Tag = " + BicFile+";";
}

string LETO_ModifyHitPoints(int iHP, int Set)
{
    string sScript;
    if(Set == 0)
    {
        sScript += "/HitPoints = /HitPoints+" + IntToString(iHP)+";";
        sScript += "/LvlStatList/[0]/LvlStatHitDie = /LvlStatList/[0]/LvlStatHitDie+" + IntToString(iHP)+";";
        sScript += "/MaxHitPoints = /MaxHitPoints+"+ IntToString(iHP)+";";
        sScript += "/CurrentHitPoints = /CurrentHitPoints+" + IntToString(iHP)+";";
        sScript += "/PregameCurrent = /PregameCurrent+" + IntToString(iHP)+";";
        return sScript;
    }
    else
    {
        string sScript;
        sScript += "/HitPoints = " + IntToString(iHP)+";";
        sScript += "/LvlStatList/[0]/LvlStatHitDie = " + IntToString(iHP)+";";
        sScript += "/MaxHitPoints = "+ IntToString(iHP)+";";
        sScript += "/CurrentHitPoints = " + IntToString(iHP)+";";
        sScript += "/PregameCurrent = " + IntToString(iHP)+";";
        return sScript;

    }
}

