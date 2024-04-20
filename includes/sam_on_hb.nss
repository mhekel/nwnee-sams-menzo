void main()
{
    object oMod = GetModule();
    
    SetLocalString(oMod, "NWNX!VERSION", "xxxxxxxx");
    int nHeartbeatCount = GetLocalInt(oMod, "sam_hb_count");
    int nSaveCount = GetLocalInt(oMod, "sam_save_count");
    if (nHeartbeatCount >= nSaveCount) {
        ExecuteScript("sam_save_time", oMod);
        SetLocalInt(oMod, "sam_hb_count", 0);
    } else {
        SetLocalInt(oMod, "sam_hb_count", nHeartbeatCount + 1);
    }
}
