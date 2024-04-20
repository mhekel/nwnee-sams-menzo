void CreateTheItem(string sResRef) {
    CreateItemOnObject(sResRef);
    DeleteLocalInt(OBJECT_SELF, "sam_respawning");
    WriteTimestampedLogEntry("Respawning: " + sResRef);
}

void main()
{
    object oObject = GetLastDisturbed();
    int nDisturbType = GetInventoryDisturbType();
    if (nDisturbType == INVENTORY_DISTURB_TYPE_REMOVED && !GetLocalInt(oObject, "sam_respawning")) {
        object oItem = GetInventoryDisturbItem();
        string sResRef = GetResRef(oItem);
        WriteTimestampedLogEntry("Will respawn item in 300s: " + sResRef);
        SetLocalInt(OBJECT_SELF, "sam_respawning", TRUE);
        DelayCommand(300.0, AssignCommand(OBJECT_SELF, CreateTheItem(sResRef)));
    }
}
