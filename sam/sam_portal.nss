void SendPCToLocation(location lLocation) {
    DelayCommand(0.0, ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_UNSUMMON), GetLocation(OBJECT_SELF))));
    DelayCommand(0.0, ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), lLocation)));
    DelayCommand(1.0, ActionJumpToLocation(lLocation));
}
void SendPCToPortal(object oPC, string sPortal)
{
    object oDestination = GetObjectByTag(sPortal);
    if (oDestination == OBJECT_INVALID)
    {
        SendMessageToPC(oPC, "The portal " + sPortal + " does not exist.  Notify the DM.");
    }
    else
    {
        SendMessageToPC(oPC, "Portal found.");
    }
    location lLocation =  GetLocation(oDestination);
    AssignCommand(oPC, ActionDoCommand(SendPCToLocation(lLocation)));
}
