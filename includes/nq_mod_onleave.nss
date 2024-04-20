void main()
{
object oPC = GetExitingObject();
    object oHorse = GetHenchman(oPC,1);
    int nMaxHenchmen = GetMaxHenchmen();
    object oHench, oItem;
    int i;

    for(i=1; i<= nMaxHenchmen; i++)
    {
        oHench = GetHenchman(oPC,i);
        if(oHench == oHorse)
        {
            RemoveHenchman(oPC,oHorse);
            AssignCommand(oHorse,SetIsDestroyable(TRUE,FALSE,FALSE));
            DestroyObject(oHorse);

            DeleteLocalInt(oPC,"HorseSummon");

            object oBag = GetLocalObject(oPC,"PC_Bag");
            if(oBag != OBJECT_INVALID)
            {
                DeleteLocalInt(oPC, "PC_Saddle");

                object oItem = GetFirstItemInInventory(oBag);
                while( oItem != OBJECT_INVALID )
                {
                    DestroyObject(oItem);

                    oItem = GetNextItemInInventory(oBag);
                }

                DestroyObject(oBag);
            }
        } // end if
    } // end for
}
