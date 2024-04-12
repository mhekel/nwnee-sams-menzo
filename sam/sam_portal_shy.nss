#include "sam_portal"
void main()
{
    object oPC = GetPCSpeaker();
    SendPCToPortal(oPC, "Portal_Shyrmess");
}
