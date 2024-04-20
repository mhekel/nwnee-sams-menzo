/*::///////////////////////////////////////////////
//:: Default:On Client Ban Control
//:: sam_inc_ban
//:://////////////////////////////////////////////
//:: Verified By: Christine Reynolds
//::////////////////////////////////////////////*/
#include "aps_include"
#include "sam_inc_time"
int bootIfBanned(object oPC)
{
    string sCDKey = GetPCPublicCDKey(oPC);
    string sName = GetPCPlayerName(oPC);
    string sSQL = "SELECT cdkey FROM banned WHERE cdkey='" + sCDKey + "' or player='" + sName + "'";
    SQLExecDirect(sSQL);
    if (SQLFetch() == SQL_SUCCESS)
    {
        BootPC(oPC);
        return TRUE;
    }
    return FALSE;
}
void ban(object oPC)
{
    string sCDKey = GetPCPublicCDKey(oPC);
    string sPlayerName = SQLEncodeSpecialChars(GetPCPlayerName(oPC));
    string sName = SQLEncodeSpecialChars(GetName(oPC));
    int nLastBanned = CurrentTimeMillis();
    string sSQL = "INSERT INTO banned (cdkey, player, name, lastbanned) VALUES ('" +sCDKey + "', '" + sPlayerName + "', '" + sName + "', '" + IntToString(nLastBanned) + "')";
    SQLExecDirect(sSQL);
    if (SQLFetch() == SQL_SUCCESS)
    {
        WriteTimestampedLogEntry(sCDKey + " was banned.  " + sPlayerName + " was playing " + sName);
    }
    else
    {
        WriteTimestampedLogEntry(sCDKey + " was not banned.  " + sPlayerName + " was playing " + sName);
    }
    bootIfBanned(oPC);
}
//void main() {}
