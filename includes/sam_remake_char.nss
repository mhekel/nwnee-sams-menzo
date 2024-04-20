void main()
{
    object oPC = GetPCSpeaker();
    int nXP = GetXP(oPC);
    if (nXP > 105000) nXP = 105000;
    SetXP(oPC, 0);
    SetXP(oPC, nXP);
}
