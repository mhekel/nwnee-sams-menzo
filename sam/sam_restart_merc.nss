//TOCATTATRASH
//::///////////////////////////////////////////////
//:: FileName sam_restart_merc
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 4/13/2003 11:00:18 PM
//:://////////////////////////////////////////////
void main()
{

    // Either open the store with that tag or let the user know that no store exists.
    object oStore = GetNearestObjectByTag("RestartMerchant");
    if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, GetPCSpeaker());
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
