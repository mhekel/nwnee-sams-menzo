#include "sam_inc"
#include "x0_i0_treasure"

/*int GetGPLevel(int nCR) {
    int nGP = GetLocalInt(GetModule(), "sam_gp_cr" + IntToString(nCR));
    if (nGP != 0) return nGP;
    // Get the average GP value of the treasure and the percentage chance it exists at all
    string sSQL = "SELECT gp, pct FROM treasure_level WHERE cr=" + IntToString(nCR);
    SQLExecDirect(sSQL);
    if (SQLFetch() != SQL_SUCCESS) return 0;
    nGP = StringToInt(SQLGetData(1));
    int nPCT = StringToInt(SQLGetData(2));

    SetLocalInt(GetModule(), "sam_gp_cr" + IntToString(nCR), nGP);
    SetLocalInt(GetModule(), "sam_gp_pct" + IntToString(nCR), nPCT);
    return nGP;
}

int GetPCT(int nCR) {
    return GetLocalInt(GetModule(), "sam_gp_pct" + IntToString(nCR));
}*/
object oSelf = OBJECT_SELF;
int nTreasure;
int nGold;
float fCR;
int nLuck = d100();
int nGetItem = d100();
object oTreasureSpawn;
object oStorage;
int nIncrease;
object oItem;
int nRandom;
int nCount;
object oCopy;
object oCopy2;
object oCopy3;
int nHealRoll = d4();

void main()
{
// Empty before filling to reduce lag
    if (GetObjectType(oSelf) == OBJECT_TYPE_PLACEABLE)
    {
        object oItem = GetFirstItemInInventory(oSelf);
        while (oItem != OBJECT_INVALID)
        {
            DestroyObject(oItem);
            oItem = GetNextItemInInventory(oSelf);
        }
    }

//only fire when the object is not tagged as plot or having no treasure
if (GetObjectType(oSelf) != OBJECT_TYPE_PLACEABLE && (GetPlotFlag(oSelf) || GetLocalInt(oSelf, "sam_notreasure"))) return;

//determine nCR
 fCR = GetChallengeRating(oSelf);

 if(fCR >= 20.0)
 {
 fCR = 20.0;
 }

//determine treasure level based on luck roll and monster CR
 if(fCR <= 3.0)
 {
    if(nLuck >= 91)
    {
    nTreasure = 1;
    }
    else
    {
    nTreasure = 0;
    }
 }
 else if(fCR <= 7.0)
 {
    if(nLuck >= 91)
    {
    nTreasure = 2;
    }
    else
    {
    nTreasure = 1;
    }
 }
 else if(fCR <= 12.0)
 {
    if(nLuck >= 91)
    {
    nTreasure = 3;
    }
    else
    {
    nTreasure = 2;
    }
 }
 else if(fCR <= 16.0)
 {
    if(nLuck >= 91)
    {
    nTreasure = 4;
    }
    else
    {
    nTreasure = 3;
    }
 }
 else if(fCR <= 21.0)
 {
    if(nLuck >= 91)
    {
    nTreasure = 5;
    }
    else
    {
    nTreasure = 4;
    }
 }
 else
 {
    if(nLuck >= 91)
    {
    nTreasure = 6;
    }
    else
    {
    nTreasure = 5;
    }
 }

 //define storage chest
 if(nTreasure == 0)
 {
 oStorage = GetObjectByTag("ST_TREASURE_STORE_0");
 }
 if(nTreasure == 1)
 {
 oStorage = GetObjectByTag("ST_TREASURE_STORE_1");
 }
 if(nTreasure == 2)
 {
 oStorage = GetObjectByTag("ST_TREASURE_STORE_2");
 }
 if(nTreasure == 3)
 {
 oStorage = GetObjectByTag("ST_TREASURE_STORE_3");
 }
 if(nTreasure == 4)
 {
 oStorage = GetObjectByTag("ST_TREASURE_STORE_4");
 }
  if(nTreasure == 5)
 {
 oStorage = GetObjectByTag("ST_TREASURE_STORE_5");
 }
  if(nTreasure == 6)
 {
 oStorage = GetObjectByTag("ST_TREASURE_STORE_6");
 }

 //define gold ammount
 nGold = FloatToInt((fCR*10*(IntToFloat(nLuck)/5))/d6());

 //define if items, gold, or nothing spawns and execute the appropriate commands
 if (nGetItem >= 50)
 {
 return;
 }
 else if (nGetItem >= 30)//gold
 {
 GiveGoldToCreature(oSelf, nGold);
 }
 else if (nGetItem >= 20 && nTreasure != 6)//potions/healkits
 {
    if(nTreasure == 0)
    {
        if(nHealRoll >= 3)
        {
        CreateItemOnObject("it_mpotion002", oSelf, 1);
        }
        else
        {
        CreateItemOnObject("nw_it_medkit001", oSelf, 1);
        }
    }
    if(nTreasure == 1)
    {
        if(nHealRoll >= 3)
        {
        CreateItemOnObject("it_mpotion002", oSelf, d4());
        }
        else
        {
        CreateItemOnObject("nw_it_medkit001", oSelf, d4());
        }
    }
    if(nTreasure == 2)
    {
        if(nHealRoll >= 3)
        {
        CreateItemOnObject("it_mpotion021", oSelf, 1);
        }
        else
        {
        CreateItemOnObject("nw_it_medkit002", oSelf, d4());
        }
    }
    if(nTreasure == 3)
    {
        if(nHealRoll >= 3)
        {
        CreateItemOnObject("it_mpotion003", oSelf, d4());
        }
        else
        {
        CreateItemOnObject("nw_it_medkit002", oSelf, d6());
        }
    }
    if(nTreasure == 4)
    {
        if(nHealRoll >= 3)
        {
        CreateItemOnObject("it_mpotion003", oSelf, d4());
        }
        else
        {
        CreateItemOnObject("nw_it_medkit003", oSelf, d4());
        }
    }
    if(nTreasure == 5)
    {
        if(nHealRoll >= 3)
        {
        CreateItemOnObject("it_mpotion004", oSelf, d4());
        }
        else
        {
        CreateItemOnObject("nw_it_medkit004", oSelf, 1);
        }
    }
 }
 else //items
 {
 //Determine items in chest
     oTreasureSpawn = GetFirstItemInInventory(oStorage);
        while(GetIsObjectValid(oTreasureSpawn))
        {
            nCount = GetLocalInt(oStorage,"VAR_STORAGE_ITEMCOUNT");
            nCount += 1;
            SetLocalInt(oStorage,"VAR_STORAGE_ITEMCOUNT", nCount);
            oTreasureSpawn = GetNextItemInInventory(oStorage);
        }

  //spawn random item
    nRandom = Random(GetLocalInt(oStorage,"VAR_STORAGE_ITEMCOUNT"));
    oTreasureSpawn = GetFirstItemInInventory(oStorage);
        while(GetIsObjectValid(oTreasureSpawn))
        {
            if(nRandom == GetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER"))
            {
            oItem = oTreasureSpawn;
            SetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER", 0);
            oCopy = CopyItem(oItem, oSelf, TRUE);
            DelayCommand(3.0, SetDroppableFlag(oCopy, TRUE));
            break;
            }
            else
            {
            nIncrease = GetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER");
            nIncrease += 1;
            SetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER", nIncrease);
            }
        oTreasureSpawn = GetNextItemInInventory(oStorage);
        }


    if(nLuck > 50) //spawn another random item
    {
    if(nLuck <= 90)
    {
    nRandom = Random(GetLocalInt(oStorage,"VAR_STORAGE_ITEMCOUNT"));
    oTreasureSpawn = GetFirstItemInInventory(oStorage);
        while(GetIsObjectValid(oTreasureSpawn))
        {
            if(nRandom == GetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER"))
            {
            oItem = oTreasureSpawn;
            SetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER", 0);
            oCopy2 = CopyItem(oItem, oSelf, TRUE);
            DelayCommand(3.0, SetDroppableFlag(oCopy2, TRUE));
            break;
            }
            else
            {
            nIncrease = GetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER");
            nIncrease += 1;
            SetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER", nIncrease);
            }
        oTreasureSpawn = GetNextItemInInventory(oStorage);
        }
    }
    }

    if(nLuck > 90)//spawn a third random item
    {
    if(nLuck <= 90)
    {
    nRandom = Random(GetLocalInt(oStorage,"VAR_STORAGE_ITEMCOUNT"));
    oTreasureSpawn = GetFirstItemInInventory(oStorage);
        while(GetIsObjectValid(oTreasureSpawn))
        {
            if(nRandom == GetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER"))
            {
            oItem = oTreasureSpawn;
            SetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER", 0);
            oCopy3 = CopyItem(oItem, oSelf, TRUE);
            DelayCommand(3.0, SetDroppableFlag(oCopy3, TRUE));
            break;
            }
            else
            {
            nIncrease = GetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER");
            nIncrease += 1;
            SetLocalInt(oStorage,"VAR_STORAGE_RANDOMCOUNTER", nIncrease);
            }
        oTreasureSpawn = GetNextItemInInventory(oStorage);
        }
    }
    }
 SetLocalInt(oStorage,"VAR_STORAGE_ITEMCOUNT", 0);
 }





/*
    object oNPC = OBJECT_SELF;
    // Empty before filling to reduce lag
    if (GetObjectType(oNPC) == OBJECT_TYPE_PLACEABLE)
    {
        object oItem = GetFirstItemInInventory(oNPC);
        while (oItem != OBJECT_INVALID)
        {
            DestroyObject(oItem);
            oItem = GetNextItemInInventory(oNPC);
        }
    }
    // If they are not encounter creatures or they have "sam_notreasure" set, return.
    if (GetObjectType(oNPC) != OBJECT_TYPE_PLACEABLE && (GetPlotFlag(oNPC) || GetLocalInt(oNPC, "sam_notreasure"))) return;
    float fCR = GetChallengeRating(oNPC);
    if (GetObjectType(oNPC) == OBJECT_TYPE_PLACEABLE)
    {
        fCR = GetLocalFloat(oNPC, "sam_treasure_cr");
    }
    int nCR;
    if (fCR > 20.0) nCR=20; else if (fCR < 1.0) nCR = 1; else nCR = FloatToInt(fCR);
    int nGP = GetGPLevel(nCR);
    int nPCT = GetPCT(nCR);
    int nBoss = GetLocalInt(oNPC, "sam_boss") + 1;
    // Override with local settings
    int nTemp;
    if (nTemp = GetLocalInt(oNPC, "sam_treasure_gp")) nGP = nTemp;
    if (nTemp = GetLocalInt(oNPC, "sam_treasure_pct")) nPCT = nTemp;
    // The level of treasure is between 1/2 of nGP and 1.5x nGP. Bosses can have higher ranges.
    int nActualGP = nGP/2 + Random(nGP*nBoss);
    // The first type of treasure is gold, then there are 3 other possible treasure results. Gold is calculated separately from the others
    if (Random(101) <= nPCT)
    {
        // Creature has gold, usually 10% of treasure value so as not to dilute too badly
        int nGold = nActualGP/10;
        GiveGoldToCreature(oNPC, nGold);
        nActualGP -= nGold;
    }
    // Now determine how many treasure results we have.
    int nNumTreasures;
    for (nNumTreasures = 0; nNumTreasures < 3; nNumTreasures++)
    {
        if (Random(101) > nPCT * (4 - nNumTreasures) / 2) break;
    }
    // If there is no treasure return
    if (nNumTreasures == 0) return;
    // Get the list of treasure for this creature.
    int nRacialType = GetRacialType(oNPC);
    if (GetObjectType(oNPC) == OBJECT_TYPE_PLACEABLE)
    {
        nRacialType = GetRacialType(GetLocalObject(oNPC, "sam_treasure_opener"));
    }
    string sSQL = "SELECT i.resref FROM items i, treasure t WHERE i.baseitem=t.baseitem AND i.cost > " + IntToString(nActualGP/(nNumTreasures+1)) +
        " AND i.cost < " + IntToString(nActualGP) + " AND (t.racialtype=" + IntToString(nRacialType);
    int nPosition;
    int nClassType;
    object oClassed = oNPC;
    if (GetObjectType(oNPC) == OBJECT_TYPE_PLACEABLE) oClassed = GetLocalObject(oNPC, "sam_treasure_opener");
    for (nPosition = 1; nPosition <= 3; nPosition++)
    {
        if ((nClassType = GetClassByPosition(nPosition, oClassed)) != CLASS_TYPE_INVALID) {
            sSQL += " OR t.classtype=" + IntToString(nClassType);
        }
    }
    sSQL += ") ORDER BY RAND() LIMIT " + IntToString(nNumTreasures);

    // Create the treasure on the creature
    SQLExecDirect(sSQL);
    while (SQLFetch() == SQL_SUCCESS) {
        string sResRef = SQLGetData(1);
        object oTreasure = CreateItemOnObject(sResRef, OBJECT_SELF, 1);
        if (oTreasure != OBJECT_INVALID) {
            // Make lots of arrows, bolts, bullets, shuriken, throwing axes, darts
            switch(GetBaseItemType(oTreasure)) {
                case BASE_ITEM_ARROW:
                case BASE_ITEM_BOLT:
                case BASE_ITEM_BULLET:
                    DestroyObject(oTreasure);
                    oTreasure = CreateItemOnObject(sResRef, oNPC, 99);
                    break;
                case BASE_ITEM_DART:
                case BASE_ITEM_SHURIKEN:
                    DestroyObject(oTreasure);
                    oTreasure = CreateItemOnObject(sResRef, oNPC, 50);
                    break;
                case BASE_ITEM_THROWINGAXE:
                    DestroyObject(oTreasure);
                    oTreasure = CreateItemOnObject(sResRef, oNPC, 25);
                    break;
                default:
            }
        }
        else
        {
            oTreasure = RetrieveCampaignObject("SavageFrontier", sResRef, GetLocation(oNPC), oNPC);
        }
        if (oTreasure != OBJECT_INVALID)
        {
            SetDroppableFlag(oTreasure, TRUE);
        }
    }*/
}
