void main()
{
    object oPC = GetLastPerceived();
    int nEvent = GetUserDefinedEventNumber();
    if (nEvent == 1002 && !IsInConversation(OBJECT_SELF) && GetIsPC(oPC)) {
        AssignCommand(OBJECT_SELF, ClearAllActions());
        AssignCommand(OBJECT_SELF, ActionWait(5.0));
        AssignCommand(OBJECT_SELF, ActionMoveToObject(GetLastPerceived(), FALSE));
        AssignCommand(OBJECT_SELF, ActionStartConversation(GetLastPerceived()));
    }
}
