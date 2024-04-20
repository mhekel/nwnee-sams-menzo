void main()
{
    object oPC = GetEnteringObject();
    if (GetLevelByClass(CLASS_TYPE_ROGUE, oPC) >= 3)
    {
        SendMessageToPC(oPC, "You are at least a 3rd level Rogue: now going into Guild");
        AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag("GUILD_WAYPOINT")));
    }
    else
    if (GetLevelByClass(CLASS_TYPE_ASSASSIN, oPC) >= 3)
    {
        SendMessageToPC(oPC, "You are at least a 3rd level Assassin: now going into Guild");
        AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag("GUILD_WAYPOINT")));
    }
    else
    if (GetLevelByClass(CLASS_TYPE_SHADOWDANCER, oPC) >= 3)
    {
        SendMessageToPC(oPC, "You are at least a 3rd level Shadow Dancer: now going into Guild");
        AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag("GUILD_WAYPOINT")));
    }
    else
    if (GetLevelByClass(CLASS_TYPE_BARD, oPC) >= 5)
    {
        SendMessageToPC(oPC, "You are at least a 5th level Bard: now going into Guild");
        AssignCommand(oPC, ActionJumpToObject(GetWaypointByTag("GUILD_WAYPOINT")));
    }
    else {
        SendMessageToPC(oPC, "You must be a 3rd level Rogue, Shadow Dancer, or Assassin, or a 5th level Bard to enter the Guild");
    }
}

