
#include "syr_tg_inc_table"

int GetMajorClass(object oCritter);
object CreateBag();

void EquipGenT(struct Treasure SyGeneratedTreasure, object oBag, int nCr);
 ////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////


void GenerateNPCTreasure()
{
    int TREASURE_STANDARD = 20;
    int TREASURE_RICH = 10;
    int TREASURE_POOR = 2;
    ///////////////////////////////////////
    struct Treasure Scroll;
    object equipment;

    ////////////////////////////////////////
    int nCR = FloatToInt(GetChallengeRating(OBJECT_SELF));
    int nTClass = nCR/4 -1;
        if (nTClass > 4) {nTClass = 4;}
        if (nTClass < 0) {nTClass = 0;}
//////////////////////////////////////////////////////////////////////////////////
//////////Creates a Container to put stuff in//////////////////////////////////////
    object oGem; struct Treasure GeneratedTreasure;
    object oBag = CreateBag();
    SetLocked(oBag,TRUE);
    int nMajorClass = GetMajorClass(OBJECT_SELF);
////////////////////////////////////////////////////////////////////////////////////////
    switch(nMajorClass)
    {
        case CLASS_TYPE_FIGHTER   : /* =  4;*/
        case CLASS_TYPE_PALADIN   : /* =  6;*/
            if (d3() == 1)
                {if (Random(200) < nCR*MagicLevel)
                {
                    CreateItemOnObject(SyCreateHeavyArmor (nTClass), OBJECT_SELF, 1);
                }}
            else if (   (Random(200) < nCR*MagicLevel))
                {
                    CreateItemOnObject(SyCreateMeleeWeapon(nTClass),OBJECT_SELF,1);
                }
            CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF,SyCreateGold(nCR,TREASURE_STANDARD));
            oGem = CreateItemOnObject (SyCreateGem (nCR, TREASURE_STANDARD),OBJECT_SELF, 1); ActionGiveItem(oGem,oBag);
            GeneratedTreasure = SyGenerateTreasure(OBJECT_SELF, nCR, TREASURE_STANDARD);
            break;
        case CLASS_TYPE_CLERIC    : /* =  2;*/
            if (Random(100) < GetLevelByClass(CLASS_TYPE_CLERIC,OBJECT_SELF)*MagicLevel)
                {   Scroll = SyCreateDivineScroll(nCR);Scroll = Itemize(Scroll); }
            if (d3() == 1)
                {
                    if (Random(200) < nCR*MagicLevel)
                    {
                        equipment = CreateItemOnObject(SyCreateAmulet(nTClass),OBJECT_SELF,1);
                    }
                }
            else if (Random(200) < nCR*MagicLevel)
                {
                    equipment =CreateItemOnObject(SyCreateHeavyArmor (nTClass), OBJECT_SELF, 1);
                }
            CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF,SyCreateGold(nCR,TREASURE_STANDARD));
            oGem = CreateItemOnObject (SyCreateGem (nCR, TREASURE_STANDARD),OBJECT_SELF, 1); ActionGiveItem(oGem,oBag);
            GeneratedTreasure = SyGenerateTreasure(OBJECT_SELF, nCR, TREASURE_STANDARD);
            EquipGenT(GeneratedTreasure, oBag, nCR);
            break;
        case CLASS_TYPE_BARBARIAN : /*=  0;*/
        case CLASS_TYPE_BARD      : /* =  1;*/
            if (d3() == 1)
                {
                    if (Random(200) < nCR*MagicLevel)
                    {
                        equipment = CreateItemOnObject(SyCreateMediumArmor(nTClass),OBJECT_SELF,1);
                    }
                }
            else if (   (Random(200) < nCR*MagicLevel))
                    {
                        equipment = CreateItemOnObject(SyCreateMeleeWeapon(nTClass),OBJECT_SELF,1);
                    }
            CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF,SyCreateGold(nCR,TREASURE_STANDARD));
            CreateItemOnObject (SyCreateGem (nCR, TREASURE_STANDARD),OBJECT_SELF, 1);
            GeneratedTreasure = SyGenerateTreasure(OBJECT_SELF, nCR, TREASURE_STANDARD);
            EquipGenT(GeneratedTreasure, oBag, nCR);
            break;
        case CLASS_TYPE_DRUID     : /* =  3;*/
            if (Random(100) < GetLevelByClass(CLASS_TYPE_DRUID, OBJECT_SELF)*MagicLevel)
                {   Scroll = SyCreateDivineScroll(nCR);Scroll = Itemize(Scroll); }
            if (Random(200) < nCR*MagicLevel)
                {
                    equipment = CreateItemOnObject(SyCreateLightArmor(nTClass),OBJECT_SELF,1);
                }
            else if (   (Random(200) < nCR*MagicLevel))
                {
                    equipment = CreateItemOnObject(SyCreateMeleeWeapon(nTClass),OBJECT_SELF,1);
                }
            CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF,SyCreateGold(nCR,TREASURE_STANDARD));
            CreateItemOnObject (SyCreateGem (nCR,TREASURE_STANDARD),OBJECT_SELF, 1);
            GeneratedTreasure = SyGenerateTreasure(OBJECT_SELF, nCR, TREASURE_STANDARD);
            EquipGenT(GeneratedTreasure, oBag, nCR);
            break;
        case CLASS_TYPE_RANGER    : /* =  7;*/
        case CLASS_TYPE_ROGUE     : /* =  8;*/
            if (d3() == 1)
            {
                if (Random(200) < nCR*MagicLevel)
                {
                    equipment = CreateItemOnObject(SyCreateLightArmor(nTClass),OBJECT_SELF,1);
                }
            }
            else if (   (Random(200) < nCR*MagicLevel))
                {
                    equipment = CreateItemOnObject(SyCreateMeleeWeapon(nTClass),OBJECT_SELF,1);
                }
            CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF,SyCreateGold(nCR,TREASURE_STANDARD));
            CreateItemOnObject (SyCreateGem (nCR,TREASURE_STANDARD),OBJECT_SELF, 1);
            GeneratedTreasure = SyGenerateTreasure(OBJECT_SELF, nCR, TREASURE_STANDARD);
            EquipGenT(GeneratedTreasure, oBag, nCR);
            break;
        case CLASS_TYPE_MONK      : /* =  5;*/
                if (d3() == 1)
                {
                    if (Random(200) < nCR*MagicLevel)
                    {
                        equipment = CreateItemOnObject(SyCreateHands(nTClass),OBJECT_SELF,1);
                    }
                }
                else if (Random(200) < nCR*MagicLevel)
                {
                    equipment = CreateItemOnObject(SyCreateRobes(nTClass),OBJECT_SELF,1);
                }
            CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF,SyCreateGold(nCR,TREASURE_STANDARD));
            CreateItemOnObject (SyCreateGem (nCR,TREASURE_STANDARD),OBJECT_SELF, 1);
            GeneratedTreasure = SyGenerateTreasure(OBJECT_SELF, nCR, TREASURE_STANDARD);
            EquipGenT(GeneratedTreasure, oBag, nCR);
            break;
        case CLASS_TYPE_SORCERER  : /* =  9;*/
        case CLASS_TYPE_WIZARD    : /* =  10;*/
                if (Random(100) < GetCasterLevel(OBJECT_SELF)*MagicLevel)
                {   Scroll = SyCreateArcaneScroll(nCR);Scroll = Itemize(Scroll); }
                if (d3() == 1)
                {
                    if (Random(200) < nCR*MagicLevel)
                    {
                        equipment = CreateItemOnObject(SyCreateWand(nTClass),OBJECT_SELF,1);
                        SetIdentified(equipment,FALSE);
                    }
                }
            else if (Random(200) < nCR*MagicLevel)
                {
                    equipment = CreateItemOnObject(SyCreateRobes(nTClass),OBJECT_SELF,1);
                }
            CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF,SyCreateGold(nCR,TREASURE_STANDARD));
            CreateItemOnObject (SyCreateGem (nCR,TREASURE_STANDARD),OBJECT_SELF, 1);
            GeneratedTreasure = SyGenerateTreasure(OBJECT_SELF, nCR, TREASURE_STANDARD);
            EquipGenT(GeneratedTreasure, oBag, nCR);
            break;
        case CLASS_TYPE_DRAGON    : /* =  18;*/
            equipment = CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF,SyCreateGold(nCR,TREASURE_RICH));
                ActionGiveItem(equipment,oBag); equipment = OBJECT_INVALID;
            CreateItemOnObject (SyCreateGem (nCR,TREASURE_RICH),OBJECT_SELF, 1);
                ActionGiveItem(equipment,oBag); equipment = OBJECT_INVALID;
            GeneratedTreasure = SyGenerateTreasure(OBJECT_SELF, nCR, TREASURE_RICH);
            EquipGenT(GeneratedTreasure, oBag, nCR);
            CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF,SyCreateGold(nCR,TREASURE_STANDARD));
            CreateItemOnObject (SyCreateGem (nCR,TREASURE_STANDARD),OBJECT_SELF, 1);
            GeneratedTreasure = SyGenerateTreasure(OBJECT_SELF, nCR, TREASURE_STANDARD);
            EquipGenT(GeneratedTreasure, oBag, nCR);
            SetLocked(oBag,TRUE);
            break;
        case CLASS_TYPE_COMMONER  : /* =  20;*/
            CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF,SyCreateGold(nCR,TREASURE_POOR));
            break;
        case CLASS_TYPE_ABERRATION : /* =  11;*/
        case CLASS_TYPE_MONSTROUS : /* =  15;*/
        case CLASS_TYPE_OUTSIDER  : /* =  24; */
        case CLASS_TYPE_GIANT     : /* =  22;*/
        case CLASS_TYPE_FEY       : /* =  17;*/
        case CLASS_TYPE_SHAPECHANGER : /* =  25;*/
        case CLASS_TYPE_HUMANOID  : /* =  14;*/
            CreateItemOnObject("NW_IT_GOLD001", OBJECT_SELF,SyCreateGold(nCR,TREASURE_STANDARD));
            CreateItemOnObject (SyCreateGem (nCR,TREASURE_STANDARD),OBJECT_SELF, 1);
            GeneratedTreasure = SyGenerateTreasure(OBJECT_SELF, nCR, TREASURE_STANDARD);
            EquipGenT(GeneratedTreasure, oBag, nCR);
            break;
        case CLASS_TYPE_ANIMAL    : /* =  12;*/
        case CLASS_TYPE_CONSTRUCT : /* =  13;*/
        case CLASS_TYPE_ELEMENTAL : /* =  16;*/
        case CLASS_TYPE_UNDEAD    : /* =  19;*/
        case CLASS_TYPE_BEAST     : /* =  21;*/
        case CLASS_TYPE_MAGICAL_BEAST : /* =  23;*/
        case CLASS_TYPE_VERMIN    : /* =  26; */
        default: break;
    }

        if (GetIsObjectValid(oBag))
            {
            int nGold = GetGold(OBJECT_SELF);
            TakeGoldFromCreature(nGold,OBJECT_SELF,TRUE);
            CreateItemOnObject("NW_IT_GOLD001", oBag,nGold);
            }

}
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
object CreateBag()
{   location lWhere = GetLocation(OBJECT_SELF);
    object oBag = GetNearestObjectByTag("SYR_NPC_VIC",OBJECT_SELF,1);
    if  (
            (GetIsObjectValid(oBag)) &
            (GetDistanceToObject(oBag) < 10.0f)
            )
            {return oBag;}
    else if (CreateNPCBag == TRUE)
        {
            int nRace = GetRacialType(OBJECT_SELF);
            switch(nRace)
            {
                case RACIAL_TYPE_DWARF: //                = 0;
                case RACIAL_TYPE_ELF:      //            = 1;
                case RACIAL_TYPE_GNOME:    //             = 2;
                case RACIAL_TYPE_HALFLING: //            = 3;
                case RACIAL_TYPE_HALFELF:  //              = 4;
                case RACIAL_TYPE_HALFORC:  //             = 5;
                case RACIAL_TYPE_HUMAN:    //             = 6;
                case RACIAL_TYPE_DRAGON:   //             = 11;
                case RACIAL_TYPE_OUTSIDER: //            = 20;
                    if (GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE) > 10)
                        {   oBag = CreateObject(OBJECT_TYPE_PLACEABLE, "npcitemvirtualco",lWhere, FALSE);}
                    else if (GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE) > 6)
                        {   oBag = CreateObject(OBJECT_TYPE_PLACEABLE, "npcitemvirtua001",lWhere, FALSE);}
                    else  {   oBag = CreateObject(OBJECT_TYPE_PLACEABLE, "npcitemvirtua002",lWhere, FALSE);}
                    break;
                case RACIAL_TYPE_HUMANOID_GOBLINOID:   //= 12;
                case RACIAL_TYPE_HUMANOID_MONSTROUS:   //= 13;
                case RACIAL_TYPE_HUMANOID_ORC:         //= 14;
                case RACIAL_TYPE_HUMANOID_REPTILIAN:   //= 15;
                case RACIAL_TYPE_GIANT:                //= 18;
                case RACIAL_TYPE_FEY:                  //= 17;
                case RACIAL_TYPE_SHAPECHANGER:         //= 23;
                    if (GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE) > 10)
                        {   oBag = CreateObject(OBJECT_TYPE_PLACEABLE, "npcitemvirtua001",lWhere, FALSE);}
                    else if (GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE) > 6)
                        {   oBag = CreateObject(OBJECT_TYPE_PLACEABLE, "npcitemvirtua002",lWhere, FALSE);}
                    else  {   oBag = CreateObject(OBJECT_TYPE_PLACEABLE, "npcitemvirtua003",lWhere, FALSE);}
                    break;
                case RACIAL_TYPE_ABERRATION:            //= 7;
                case RACIAL_TYPE_ELEMENTAL:             //= 16;
                case RACIAL_TYPE_UNDEAD:                //= 24;
                    if (GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE) > 10)    if (GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE) > 10)
                        {   oBag = CreateObject(OBJECT_TYPE_PLACEABLE, "npcitemvirtua002",lWhere, FALSE);}
                    else if (GetAbilityScore(OBJECT_SELF,ABILITY_INTELLIGENCE) > 6)
                        {   oBag = CreateObject(OBJECT_TYPE_PLACEABLE, "npcitemvirtua003",lWhere, FALSE);}
                    else  oBag = OBJECT_INVALID;
                    break;
                case RACIAL_TYPE_ANIMAL:              // = 8;
                case RACIAL_TYPE_BEAST:               // = 9;
                case RACIAL_TYPE_CONSTRUCT:           // = 10;
                case RACIAL_TYPE_MAGICAL_BEAST:       // = 19;
                case RACIAL_TYPE_VERMIN:              // = 25;
                case RACIAL_TYPE_ALL:                 // = 28;
                    oBag = OBJECT_INVALID; break;
            }
            return oBag;
        }
    else {return OBJECT_INVALID;}
}


/////////////////////////////////////////////////////////////////////////////////////////////
int GetMajorClass(object oCritter)
{
    int nMajorClass = CLASS_TYPE_INVALID;
    int nLevOne = GetLevelByPosition(1,oCritter);
    int nLevTwo = GetLevelByPosition(2,oCritter);
    int nLevThr = GetLevelByPosition(3,oCritter);
    int nTotal = nLevOne + nLevTwo + nLevThr;
    if (nLevOne*2 >= nTotal) {nMajorClass = GetClassByPosition(1,oCritter);}
    else if (nLevTwo*2 >= nTotal) {nMajorClass = GetClassByPosition(2,oCritter);}
    else if (nLevThr*2 >= nTotal) {nMajorClass = GetClassByPosition(3,oCritter);}
    else
    {
        nMajorClass = GetClassByPosition(1,oCritter);
        if (GetClassByPosition(2,oCritter) >= nMajorClass)
            {nMajorClass = GetClassByPosition(2,oCritter);}
        if (GetClassByPosition(3,oCritter) >= nMajorClass)
            {nMajorClass = GetClassByPosition(3,oCritter);}
    }
    return nMajorClass;
}
/////////////////////////////////////////////////////////////////////////////////////////////



/////////////////////////////////////////////////////////////////////////////////////////////////////
void EquipGenT(struct Treasure GeneratedTreasure, object oBag, int nCr)
{
    object equipment;
    struct Treasure Scroll;
    int nTClass = nCr/4; if (nTClass > 4) {nTClass = 4;}
    if (GeneratedTreasure.ItemOne == "arcanescrollshee")
            {   Scroll = SyCreateArcaneScroll(nCr);Scroll = Itemize(Scroll);
                GeneratedTreasure.ItemOne == "";    }
    else if (GeneratedTreasure.ItemOne == "divinescrollshee")
            {   Scroll = SyCreateDivineScroll(nCr);Scroll = Itemize(Scroll);
                GeneratedTreasure.ItemOne == "";    }
    else
        {
            equipment = CreateItemOnObject(GeneratedTreasure.ItemOne, OBJECT_SELF,1);
            if (IsArrows(equipment))
                {DestroyObject(equipment); equipment = CreateItemOnObject(GeneratedTreasure.ItemOne,OBJECT_SELF,1+d10(3)); }
    }

    if (MagicLevel == SYR_HIGH)
        {
            if (GeneratedTreasure.ItemTwo == "arcanescrollshee")
                {   Scroll = SyCreateArcaneScroll(nCr);Scroll = Itemize(Scroll);
                GeneratedTreasure.ItemTwo == "";    }
            else if (GeneratedTreasure.ItemTwo == "divinescrollshee")
                {   Scroll = SyCreateDivineScroll(nCr);Scroll = Itemize(Scroll);
                    GeneratedTreasure.ItemTwo == "";    }
            else
            {
                equipment = CreateItemOnObject(GeneratedTreasure.ItemTwo, OBJECT_SELF,1);
                if (IsArrows(equipment))
                    {DestroyObject(equipment); equipment = CreateItemOnObject(GeneratedTreasure.ItemTwo,OBJECT_SELF,1+d10(3));}
            }
        }
    if (MagicLevel != SYR_LOW)
        {
            if (GeneratedTreasure.ItemThree == "arcanescrollshee")
                {   Scroll = SyCreateArcaneScroll(nCr);Scroll = Itemize(Scroll);
                    GeneratedTreasure.ItemThree == "";    }
            else if (GeneratedTreasure.ItemThree == "divinescrollshee")
                {   Scroll = SyCreateDivineScroll(nCr);Scroll = Itemize(Scroll);
                    GeneratedTreasure.ItemThree == "";    }
            else
            {
                equipment = CreateItemOnObject(GeneratedTreasure.ItemThree, OBJECT_SELF,1);
                if (IsArrows(equipment))
                    {DestroyObject(equipment); equipment = CreateItemOnObject(GeneratedTreasure.ItemThree,OBJECT_SELF,1+d10(3)); }
            }

            if (GeneratedTreasure.ItemFour == "arcanescrollshee")
                {   Scroll = SyCreateArcaneScroll(nCr);Scroll = Itemize(Scroll);
                    GeneratedTreasure.ItemFour == "";    }
            else if (GeneratedTreasure.ItemFour == "divinescrollshee")
                {   Scroll = SyCreateDivineScroll(nCr);Scroll = Itemize(Scroll);
                    GeneratedTreasure.ItemFour == "";    }
            else
            {
                equipment = CreateItemOnObject(GeneratedTreasure.ItemFour, OBJECT_SELF,1);
                if (IsArrows(equipment))
                    {DestroyObject(equipment); equipment = CreateItemOnObject(GeneratedTreasure.ItemFour,OBJECT_SELF,1+d10(3)); }
            }

            if (GeneratedTreasure.ItemFive == "arcanescrollshee")
                {   Scroll = SyCreateArcaneScroll(nCr);Scroll = Itemize(Scroll);
                    GeneratedTreasure.ItemFive == "";    }
            else if (GeneratedTreasure.ItemFive == "divinescrollshee")
                {   Scroll = SyCreateDivineScroll(nCr);Scroll = Itemize(Scroll);
                    GeneratedTreasure.ItemFive == "";    }
            else
                {
                    equipment = CreateItemOnObject(GeneratedTreasure.ItemFive, OBJECT_SELF,1);
                    if (IsArrows(equipment))
                        {DestroyObject(equipment); equipment = CreateItemOnObject(GeneratedTreasure.ItemFive,OBJECT_SELF,1+d10(3)); }
                }

            if (GeneratedTreasure.ItemSix == "arcanescrollshee")
                {   Scroll = SyCreateArcaneScroll(nCr);Scroll = Itemize(Scroll);
                    GeneratedTreasure.ItemSix == "";    }
            else if (GeneratedTreasure.ItemSix == "divinescrollshee")
                {   Scroll = SyCreateDivineScroll(nCr);Scroll = Itemize(Scroll);
                    GeneratedTreasure.ItemSix == "";    }
            else
                {
                    equipment = CreateItemOnObject(GeneratedTreasure.ItemSix, OBJECT_SELF,1);
                    if (IsArrows(equipment))
                        {DestroyObject(equipment); equipment = CreateItemOnObject(GeneratedTreasure.ItemSix,OBJECT_SELF,1+d10(3)); }
                }
        }
}

