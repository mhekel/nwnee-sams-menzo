void main()
{
    object oPC = GetLastUsedBy();
    AssignCommand(oPC, JumpToLocation(GetLocation(GetObjectByTag("LOWER_RUINS"))));
}
