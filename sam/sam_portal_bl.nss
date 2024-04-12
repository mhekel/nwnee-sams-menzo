#include "sam_portal"
void main()
{
    object oPC = GetPCSpeaker();
    SendPCToPortal(oPC, "blingdenstone_portal");
}
