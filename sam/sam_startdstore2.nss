//TOCATTATRASH
//::///////////////////////////////////////////////
//:: FileName sam_startgstore
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Script Wizard
//:: Created On: 8/28/2002 12:02:23 AM
//:://////////////////////////////////////////////
void main()
{

    // Either open the store with that tag or let the user know that no store exists.
    object oStore = GetNearestObjectByTag("sam_drow_store2");
    if(GetObjectType(oStore) == OBJECT_TYPE_STORE)
        OpenStore(oStore, GetPCSpeaker());
    else
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
}
