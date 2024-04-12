//TOCATTATRASH
void applyEffect() {
    effect eInviso = EffectInvisibility(INVISIBILITY_TYPE_IMPROVED);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, eInviso, OBJECT_SELF);
    DelayCommand(1.0, ExecuteScript("sam_true_invis", OBJECT_SELF));
}

void main()
{
    object oItem = GetItemInSlot(INVENTORY_SLOT_RIGHTRING);
    if (GetTag(oItem) == "TrueRingofInvisibility") {
        applyEffect();
        return;
    } else {
        object oItem = GetItemPossessedBy(OBJECT_SELF, "TrueRingofInvisibility");
        if (GetIsObjectValid(oItem)) {
            ActionEquipItem(oItem, INVENTORY_SLOT_RIGHTRING);
            applyEffect();
            return;
        }
    }
}
