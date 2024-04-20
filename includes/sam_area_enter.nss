#include "sam_inc"

// This script executes the area entering script for the area.
void main() {
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) && !GetIsDM(oPC))

    {
        object oArea = GetArea(oPC);
        string sScript = "sae_" + MakeScriptName(GetTag(oArea), 12);
        ExecuteScript(sScript, oPC);
             }

}
