
int iSOTS = GetCampaignInt("SOTS", "Guides", oPC);
    if( iSOTS > 0) {
        //must remove the quest entry first before re-adding it, to avoid the invisible entries bug
        RemoveJournalQuestEntry("Guides", oPC, iSOTS, FALSE);
        AddJournalQuestEntry("Events", iSOTS, oPC, FALSE);
    }


int iQuests = GetCampaignInt("SOTS", "Quest_List", oPC);
    if( iQuests > 0) {
        //must remove the quest entry first before re-adding it, to avoid the invisible entries bug
        RemoveJournalQuestEntry("Quests", oPC, iQuests, FALSE);
        AddJournalQuestEntry("Quests", iQuests, oPC, FALSE);
    }

int iSoloQuest = GetCampaignInt("SOTS", "Quest1", oPC);
    if( iSoloQuest > 0) {
        //must remove the quest entry first before re-adding it, to avoid the invisible entries bug
        RemoveJournalQuestEntry("FirstQuest", oPC, iSoloQuest, FALSE);
        AddJournalQuestEntry("FirstQuest", iSoloQuest, oPC, FALSE);
    }

    int iMQ1 = GetCampaignInt("SOTS", "MnQust1", oPC);
    if( iMQ1 > 0) {
        RemoveJournalQuestEntry("MainQuest1", oPC, iMQ1, FALSE);
        AddJournalQuestEntry("MainQuest1", iMQ1, oPC, FALSE);
    }

    int iMQ2 = GetCampaignInt("SOTS", "MnQust2", oPC);
    if( iMQ2 > 0) {
        RemoveJournalQuestEntry("MainQuest2", oPC, iMQ2, FALSE);
        AddJournalQuestEntry("MainQuest2", iMQ2, oPC, FALSE);
    }

    int iMQ3 = GetCampaignInt("SOTS", "MnQust3", oPC);
    if( iMQ3 > 0) {
        RemoveJournalQuestEntry("MainQuest3", oPC, iMQ3, FALSE);
        AddJournalQuestEntry("MainQuest3", iMQ3, oPC, FALSE);
    }

    int iBB = GetCampaignInt("SOTS", "Underdark", oPC);
    if( iBB > 0) {
        RemoveJournalQuestEntry("BigBoss1", oPC, iDP, FALSE);  
        AddJournalQuestEntry("BigBoss1", iDP, oPC, FALSE);
    }