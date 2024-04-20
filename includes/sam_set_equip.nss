#include "sam_inc"

int GetActualValue(object oItem) {
    int nFlag = GetPlotFlag(oItem);
    if (nFlag) SetPlotFlag(oItem, FALSE);
    int nValue = GetGoldPieceValue(oItem);
    if (nFlag) SetPlotFlag(oItem, TRUE);
    return nValue;
}

void EquipItem(int nInventorySlot, object oItem) {
    object oOldItem = GetItemInSlot(nInventorySlot);
    if (oItem != OBJECT_INVALID && oOldItem != oItem && (oOldItem == OBJECT_INVALID || !GetPlotFlag(oOldItem))) {
        ActionEquipItem(oItem, nInventorySlot);
    }
}

void main()
{
    int nHelmet = -1;
    object oHelmet = GetItemInSlot(INVENTORY_SLOT_HEAD);
    if (oHelmet != OBJECT_INVALID) nHelmet = GetGoldPieceValue(oHelmet);
    int nArmor = -1;
    object oArmor = GetItemInSlot(INVENTORY_SLOT_CHEST);
    if (oArmor != OBJECT_INVALID) nArmor = GetGoldPieceValue(oArmor);
    int nWeapon = -1;
    object oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND);
    if (oWeapon != OBJECT_INVALID) nWeapon = GetGoldPieceValue(oWeapon);
    int nShield = -1;
    object oShield = GetItemInSlot(INVENTORY_SLOT_LEFTHAND);
    if (oShield != OBJECT_INVALID) {
        int nShieldType = GetBaseItemType(oShield);
        switch (nShieldType) {
        case BASE_ITEM_LARGESHIELD:
        case BASE_ITEM_SMALLSHIELD:
        case BASE_ITEM_TOWERSHIELD:
            nShield = GetGoldPieceValue(oShield);
            break;
        default:
            oShield = OBJECT_INVALID;
        }
    }
    int nGloves = -1;
    object oGloves = GetItemInSlot(INVENTORY_SLOT_ARMS);
    if (oGloves != OBJECT_INVALID) nGloves = GetGoldPieceValue(oGloves);
    int nBelt = -1;
    object oBelt = GetItemInSlot(INVENTORY_SLOT_BELT);
    if (oBelt != OBJECT_INVALID) nBelt = GetGoldPieceValue(oBelt);
    int nRing1 = -1;
    object oRing1 = GetItemInSlot(INVENTORY_SLOT_LEFTRING);
    if (oRing1 != OBJECT_INVALID) nRing1 = GetGoldPieceValue(oRing1);
    int nRing2 = -1;
    object oRing2 = GetItemInSlot(INVENTORY_SLOT_RIGHTRING);
    if (oRing2 != OBJECT_INVALID) nRing2 = GetGoldPieceValue(oRing2);
    int nCloak = -1;
    object oCloak = GetItemInSlot(INVENTORY_SLOT_CLOAK);
    if (oCloak != OBJECT_INVALID) nCloak = GetGoldPieceValue(oCloak);
    int nAmulet = -1;
    object oAmulet = GetItemInSlot(INVENTORY_SLOT_NECK);
    if (oAmulet != OBJECT_INVALID) nAmulet = GetGoldPieceValue(oAmulet);
    int nBoots = -1;
    object oBoots = GetItemInSlot(INVENTORY_SLOT_BOOTS);
    if (oBoots != OBJECT_INVALID) nBoots = GetGoldPieceValue(oBoots);
    int nArrow = -1;
    object oArrow = GetItemInSlot(INVENTORY_SLOT_ARROWS);
    if (oArrow != OBJECT_INVALID) nArrow = GetGoldPieceValue(oArrow);
    int nBullet = -1;
    object oBullet = GetItemInSlot(INVENTORY_SLOT_BULLETS);
    if (oBullet != OBJECT_INVALID) nBullet = GetGoldPieceValue(oBullet);
    int nBolt = -1;
    object oBolt = GetItemInSlot(INVENTORY_SLOT_BOLTS);
    if (oBolt != OBJECT_INVALID) nBolt = GetGoldPieceValue(oBolt);

    object oCreature = OBJECT_SELF;

    object oItem = GetFirstItemInInventory(oCreature);
    while (oItem != OBJECT_INVALID) {
        switch (GetBaseItemType(oItem)) {
            // Simple Melee Weapons
            case BASE_ITEM_DAGGER:
            case BASE_ITEM_CLUB:
            case BASE_ITEM_LIGHTMACE:
            case BASE_ITEM_MORNINGSTAR:
            case BASE_ITEM_QUARTERSTAFF:
            case BASE_ITEM_SHORTSPEAR:
            case BASE_ITEM_SICKLE:
                if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_SIMPLE)) {
                    int nCost = GetActualValue(oItem);
                    if (nCost > nWeapon) {
                        nWeapon = nCost;
                        oWeapon = oItem;
                    }
                }
                break;
            // Martial Melee Weapons
            case BASE_ITEM_BATTLEAXE:
            case BASE_ITEM_GREATAXE:
            case BASE_ITEM_GREATSWORD:
            case BASE_ITEM_HALBERD:
            case BASE_ITEM_HANDAXE:
            case BASE_ITEM_HEAVYFLAIL:
            case BASE_ITEM_LIGHTFLAIL:
            case BASE_ITEM_LIGHTHAMMER:
            case BASE_ITEM_LONGSWORD:
            case BASE_ITEM_RAPIER:
            case BASE_ITEM_SCIMITAR:
            case BASE_ITEM_SHORTSWORD:
            case BASE_ITEM_WARHAMMER:
                if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_MARTIAL)) {
                    int nCost = GetActualValue(oItem);
                    if (nCost > nWeapon) {
                        nWeapon = nCost;
                        oWeapon = oItem;
                    }
                }
                break;
            // Exotic Melee Weapons
            case BASE_ITEM_BASTARDSWORD:
            case BASE_ITEM_DIREMACE:
            case BASE_ITEM_DOUBLEAXE:
            case BASE_ITEM_DWARVENWARAXE:
            case BASE_ITEM_KAMA:
            case BASE_ITEM_KATANA:
            case BASE_ITEM_KUKRI:
            case BASE_ITEM_SCYTHE:
            case BASE_ITEM_TWOBLADEDSWORD:
            case BASE_ITEM_WHIP:
            {
                if (GetHasFeat(FEAT_WEAPON_PROFICIENCY_EXOTIC)) {
                    int nCost = GetActualValue(oItem);
                    if (nCost > nWeapon) {
                        nWeapon = nCost;
                        oWeapon = oItem;
                    }
                }
                break;
            }
            // Helmets
            case BASE_ITEM_HELMET:
            {
                if (!GetIsEncounterCreature(OBJECT_SELF)) {
                    int nCost = GetActualValue(oItem);
                    if (nCost > nHelmet) {
                        nHelmet = nCost;
                        oHelmet = oItem;
                    }
                }
                break;
            }
            // Gloves
            case BASE_ITEM_GLOVES:
            case BASE_ITEM_BRACER:
            {
                int nCost = GetActualValue(oItem);
                if (nCost > nGloves) {
                    nGloves = nCost;
                    oGloves = oItem;
                }
                break;
            }

            // Cloak
            case BASE_ITEM_CLOAK:
            {
                int nCost = GetActualValue(oItem);
                if (nCost > nCloak) {
                    nCloak = nCost;
                    oCloak = oItem;
                }
                break;
            }

            // Boots
            case BASE_ITEM_BOOTS:
            {
                int nCost = GetActualValue(oItem);
                if (nCost > nBoots) {
                    nBoots = nCost;
                    oBoots = oItem;
                }
                break;
            }

            // Amulet
            case BASE_ITEM_AMULET:
            {
                int nCost = GetActualValue(oItem);
                if (nCost > nAmulet) {
                    nAmulet = nCost;
                    oAmulet = oItem;
                }
                break;
            }

            // Rings
            case BASE_ITEM_RING:
            {
                int nCost = GetActualValue(oItem);
                if (nCost > nRing1) {
                    nRing2 = nRing1;
                    oRing2 = oRing1;
                    nRing1 = nCost;
                    oRing1 = oItem;
                } else if (nCost > nRing2) {
                    nRing2 = nCost;
                    oRing2 = oItem;
                }
                break;
            }

            // Arrow
            case BASE_ITEM_ARROW:
            {
                int nCost = GetActualValue(oItem);
                if (nCost > nArrow) {
                    nArrow = nCost;
                    oArrow = oItem;
                }
                break;
            }

            // Bolt
            case BASE_ITEM_BOLT:
            {
                int nCost = GetActualValue(oItem);
                if (nCost > nBolt) {
                    nBolt = nCost;
                    oBolt = oItem;
                }
                break;
            }

            // Bullet
            case BASE_ITEM_BULLET:
            {
                int nCost = GetActualValue(oItem);
                if (nCost > nBullet) {
                    nBullet = nCost;
                    oBullet = oItem;
                }
                break;
            }

            // Armor
            case BASE_ITEM_ARMOR:
            {
                int nCost = GetActualValue(oItem);
                if (nCost > nArmor) {
                    nArmor = nCost;
                    oArmor = oItem;
                }
                break;
            }

            // Belt
            case BASE_ITEM_BELT:
            {
                int nCost = GetActualValue(oItem);
                if (nCost > nBelt) {
                    nBelt = nCost;
                    oBelt = oItem;
                }
                break;
            }

            // Shield
            case BASE_ITEM_LARGESHIELD:
            case BASE_ITEM_SMALLSHIELD:
            case BASE_ITEM_TOWERSHIELD:
            {
                if (GetHasFeat(FEAT_SHIELD_PROFICIENCY)) {
                    int nCost = GetActualValue(oItem);
                    if (nCost > nShield) {
                        nShield = nCost;
                        oShield = oItem;
                    }
                }
                break;
            }
        }
        oItem = GetNextItemInInventory(oCreature);
    }

    // Equip all that stuff
    EquipItem(INVENTORY_SLOT_CHEST, oArmor);
    EquipItem(INVENTORY_SLOT_HEAD, oHelmet);
    EquipItem(INVENTORY_SLOT_LEFTHAND, oShield);
    EquipItem(INVENTORY_SLOT_RIGHTHAND, oWeapon);
    EquipItem(INVENTORY_SLOT_LEFTRING, oRing1);
    EquipItem(INVENTORY_SLOT_RIGHTRING, oRing2);
    EquipItem(INVENTORY_SLOT_CLOAK, oCloak);
    EquipItem(INVENTORY_SLOT_NECK, oAmulet);
    EquipItem(INVENTORY_SLOT_BOOTS, oBoots);
    EquipItem(INVENTORY_SLOT_ARMS, oGloves);
    EquipItem(INVENTORY_SLOT_ARROWS, oArrow);
    EquipItem(INVENTORY_SLOT_BOLTS, oBolt);
    EquipItem(INVENTORY_SLOT_BULLETS, oBullet);
    EquipItem(INVENTORY_SLOT_BELT, oBelt);
}
