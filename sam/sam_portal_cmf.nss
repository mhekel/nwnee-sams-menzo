#include "sam_portal"
void main()
{
    object oPC = GetPCSpeaker();
    SendPCToPortal(oPC, "citadel_portal");
}
