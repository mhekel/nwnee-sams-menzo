#include "omw_plns"
#include "pqj_inc"
#include "nw_i0_plot"
#include "x2_inc_itemprop"
//#include "zep_inc_craft"

// Added from CEP scripts for anti duping
void ZEP_PurifyAllItems(object oPC, int nIsEntering=FALSE,int nDeleteTempVars=FALSE);
void ZEP_PurifyItem(object oItem, object oPC, int nIsEntering);
//


void main()
{
    object  oPC ;
    oPC  = GetEnteringObject();

    SetLocalInt(oPC, "canrest", 0);
    SetLocalInt(oPC, "canfish", 0);

//
// Remove NoRent items from the PC *********************************************
//

object oItem = GetFirstItemInInventory(oPC);
while (GetIsObjectValid(oItem) == TRUE)
{
string sNoRent = GetStringLeft(GetTag (oItem), 7);
     if(sNoRent == "NORENT_")
     {
     DestroyObject(oItem, 0.0);
     }
oItem = GetNextItemInInventory(oPC);
}

// ****************************************************************************
//
// start declares for enter limiting *******************************************
//
    effect eNoCast;
    effect eEffect;
    int nMaxHP;
    int nNewHP;
    effect eDamage;

// Strip all magical effects on enter //////////////////////////////////////////
        eEffect;
        eEffect = EffectDispelMagicAll(40);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC,0.0);

// *****************************************************************************
//
//
// *****************************************************************************
//
// Check Factions ***********************************************************
//
    if (GetIsPC(oPC))
        {
				   
        // See if they have a bind point set, set it to a default if they don't
        //Persistant
        string sBindPoint = GetCampaignString("SOTS", "Faction", oPC);
        //string sFaction = GetLocalString(oPC, "Faction");

        // Temp until the module stops changing
        sFaction = "";
        // ***
        if (sFaction == "")
            {
            //Persistant
            SetCampaignString("SOTS", "Faction", "Surface", oPC);
            //SetLocalString(oPC, "Faction", "Surface");
            }
        }
//
// *****************************************************************************
//
// Check the PCs Inventory for Duped Item **************************************
//
    ZEP_PurifyAllItems(oPC,TRUE,TRUE);
//
//
// *****************************************************************************
//
// Remove the Nexus stone if the PC has one ************************************
//
    object oNexusStone;
    oNexusStone = GetItemPossessedBy(oPC, "nexusstone");
    if (GetIsObjectValid(oNexusStone))
    DestroyObject(oNexusStone);
//
// *****************************************************************************

// Start Persistant Quest Journal **********************************************
//
    int nClass;
    nClass = GetClassByPosition(1, oPC);
    RebuildJournalQuestEntries(GetEnteringObject());
    DelayCommand(6.0, PLNSLoadNotificationOnClientEnter(GetEnteringObject()));
//
// Strip New PCs ***************************************************************
//

    if(GetXP(oPC) < 1)
    {

        // Gear Stripping
        object oGear = GetItemInSlot(INVENTORY_SLOT_ARMS, oPC);
        if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
        oGear = GetItemInSlot(INVENTORY_SLOT_BELT, oPC);
        if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
        oGear = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
        if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_NECK, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_ARROWS, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);
            oGear = GetItemInSlot(INVENTORY_SLOT_BULLETS, oPC);
            if(GetIsObjectValid(oGear))
                DestroyObject(oGear);


        object oStuff = GetFirstItemInInventory(oPC);
        while(GetIsObjectValid(oStuff))
        {
            DestroyObject(oStuff);
            oStuff = GetNextItemInInventory(oPC);
        }
//
// *****************************************************************************
//
// Give the New PC items and Noob Notes ****************************************
//
             // Give new PC's some starting Stuff.
            CreateItemOnObject("bandages", oPC);
            CreateItemOnObject("bandages", oPC);
            CreateItemOnObject("bandages", oPC);
            CreateItemOnObject("destroytool", oPC);
            CreateItemOnObject("emotewand", oPC);
            CreateItemOnObject("godlyfavor", oPC);
            //if (nClass == CLASS_TYPE_BARBARIAN){CreateItemOnObject("BarbarianGuildNote", oPC);}
            //if (nClass == CLASS_TYPE_BARD){CreateItemOnObject("BardGuildNote", oPC);}
            //if (nClass == CLASS_TYPE_CLERIC){CreateItemOnObject("ClericGuildNote", oPC);}
            //if (nClass == CLASS_TYPE_DRUID){CreateItemOnObject("DruidGuildNote", oPC);}
            //if (nClass == CLASS_TYPE_FIGHTER){CreateItemOnObject("FighterGuildNote", oPC);}
            //if (nClass == CLASS_TYPE_MONK){CreateItemOnObject("MonkGuildNote", oPC);}

            //if (nClass == CLASS_TYPE_PALADIN){CreateItemOnObject("PaladinGuildNote", oPC);}
            //if (nClass == CLASS_TYPE_RANGER){CreateItemOnObject("RangerGuildNote", oPC);}
            //if (nClass == CLASS_TYPE_ROGUE){CreateItemOnObject("RogueGuildNote", oPC);}
            //if (nClass == CLASS_TYPE_SORCERER){CreateItemOnObject("SorcerersGuildNote", oPC);}
            //if (nClass == CLASS_TYPE_WIZARD){CreateItemOnObject("WizardGuildNote", oPC);}

            // Add a persistant journal quest for noob notes
            // 1    - The starting message
            // 100 - An intermediate message
            // 200 - A completion message (flagged 'complete' in the Editor)
//            AddPersistentJournalQuestEntry("1001", 1, oPC, FALSE, FALSE, FALSE);

            // Give the noobs a weapon
            if (GetLevelByClass(CLASS_TYPE_BARBARIAN, oPC)){CreateItemOnObject("nw_waxbt001", oPC);}
            if (GetLevelByClass(CLASS_TYPE_BARD, oPC)){CreateItemOnObject("nw_wswls001", oPC);}
            if (GetLevelByClass(CLASS_TYPE_CLERIC, oPC)){CreateItemOnObject("nw_wblml001", oPC);}
            if (GetLevelByClass(CLASS_TYPE_DRUID, oPC)){CreateItemOnObject("nw_wblcl001", oPC);}
            if (GetLevelByClass(CLASS_TYPE_FIGHTER, oPC)){CreateItemOnObject("nw_wswsc001", oPC);}
            if (GetLevelByClass(CLASS_TYPE_MONK, oPC)){CreateItemOnObject("nw_wspka001", oPC);}
            if (GetLevelByClass(CLASS_TYPE_PALADIN, oPC)){CreateItemOnObject("nw_wblhw001", oPC);}
            if (GetLevelByClass(CLASS_TYPE_RANGER, oPC)){CreateItemOnObject("nw_wswss001", oPC);}
            if (GetLevelByClass(CLASS_TYPE_ROGUE, oPC)){CreateItemOnObject("nw_wswrp001", oPC);}
            if (GetLevelByClass(CLASS_TYPE_SORCERER, oPC)){CreateItemOnObject("nw_wswdg001", oPC);}
            if (GetLevelByClass(CLASS_TYPE_WIZARD, oPC)){CreateItemOnObject("nw_wswdg001", oPC);}
            CreateItemOnObject("cloth023", oPC);

            // Sets up the Mana Integet on the PC
            SetCampaignInt("NQ","iMana", 0, oPC);

            // NeverQuest in a nutshell persistant journal entry
            //AddPersistentJournalQuestEntry("0745", 1, oPC, FALSE,FALSE,FALSE);

            // This stops it from happening every entry
            SetXP(oPC, 1);

            }
//
// *****************************************************************************
//
//***** Weapon Debuffing on enter (Exploit Fix) ********************************
//
        object oWeapon;
        oWeapon = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
            if(GetIsObjectValid(oWeapon))
                IPRemoveAllItemProperties( oWeapon, DURATION_TYPE_TEMPORARY );
        oWeapon = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
            if(GetIsObjectValid(oWeapon))
                IPRemoveAllItemProperties( oWeapon, DURATION_TYPE_TEMPORARY );
//
// *****************************************************************************
//
// Give qualifying players these items based on class **************************
//

// All Classes **************************************************

  // Give the player an AFK flag (resrefs)
  if (GetItemPossessedBy(oPC, "afkflag")== OBJECT_INVALID)
   {
   CreateItemOnObject("afkflag", oPC);
   }

   // Give the player the Player handbook (resrefs)
  if (GetItemPossessedBy(oPC, "dh_playbook")== OBJECT_INVALID)
   {
   CreateItemOnObject("dh_playbook", oPC);
   }

   // Give the player the mana checker (resrefs)
  if (GetItemPossessedBy(oPC, "checkmana")== OBJECT_INVALID)
   {
   CreateItemOnObject("checkmana", oPC);
   }

// Horses ******************************************************

    // Give Paladins a horse if level 39 (resrefs)
if((GetLevelByClass(CLASS_TYPE_PALADIN, oPC) >=0) && ( GetHitDice(oPC)>=39))
{

  if (GetItemPossessedBy(oPC, "whtehorsehvy")== OBJECT_INVALID)
   {
    CreateItemOnObject("whtehorsehvy", oPC);
   }
}

// Give Black guards a horse if level 39 (resrefs)
if((GetLevelByClass(CLASS_TYPE_BLACKGUARD, oPC) >=0) && ( GetHitDice(oPC)>=39))
{

  if (GetItemPossessedBy(oPC, "blckhorsehvy")== OBJECT_INVALID)
   {
    CreateItemOnObject("blckhorsehvy", oPC);
   }
}

// End Horses **************************************************


// Specific Classes *********************************************

// Monk Class Items ******

  // Give the monk feigndeath if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_MONK, oPC) && (GetItemPossessedBy(oPC, "feigndeath")== OBJECT_INVALID))
   {
   CreateItemOnObject("feigndeath", oPC);
   }
      // Give the Monks Kick if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_MONK, oPC) && (GetItemPossessedBy(oPC, "kick")== OBJECT_INVALID))
   {
   CreateItemOnObject("kick", oPC);
   }

// PaleMaster Class Items ******

   // Give the PaleMaster feigndeath if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC) && (GetItemPossessedBy(oPC, "feigndeath")== OBJECT_INVALID))
   {
   CreateItemOnObject("feigndeath", oPC);
   }

// BlackGuard Class Items ******

   // Give the BlackGuard feigndeath if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_BLACKGUARD, oPC) && (GetItemPossessedBy(oPC, "feigndeath")== OBJECT_INVALID))
   {
   CreateItemOnObject("feigndeath", oPC);
   }
   // Give the Blackguard harm touch if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_BLACKGUARD, oPC) && (GetItemPossessedBy(oPC, "harmtouch")== OBJECT_INVALID))
   {
   CreateItemOnObject("harmtouch", oPC);
   }
   // Give the Blackguard Bash if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_BLACKGUARD, oPC) && (GetItemPossessedBy(oPC, "bash")== OBJECT_INVALID))
   {
   CreateItemOnObject("bash", oPC);
   }

// Paladin Class Items ******

   // Give the Paladins LOH if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) && (GetItemPossessedBy(oPC, "layonhands")== OBJECT_INVALID))
   {
   CreateItemOnObject("layonhands", oPC);
   }
   // Give the Paladins Bash if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_PALADIN, oPC) && (GetItemPossessedBy(oPC, "bash")== OBJECT_INVALID))
   {
   CreateItemOnObject("bash", oPC);
   }

// Fighter Class Items ******

   // Give the Fighter Bash if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_FIGHTER, oPC) && (GetItemPossessedBy(oPC, "bash")== OBJECT_INVALID))
   {
   CreateItemOnObject("bash", oPC);
   }
   // Give the Fighter Kick if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_FIGHTER, oPC) && (GetItemPossessedBy(oPC, "kick")== OBJECT_INVALID))
   {
   CreateItemOnObject("kick", oPC);
   }

// Champion of torm Class Items ******

   // Give the Champions of Torm LOH if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_DIVINECHAMPION, oPC) && (GetItemPossessedBy(oPC, "layonhands")== OBJECT_INVALID))
   {
   CreateItemOnObject("layonhands", oPC);
   }

// Shifter Class Items ******

   // Give the Shifter Kick if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_SHIFTER, oPC) && (GetItemPossessedBy(oPC, "kick")== OBJECT_INVALID))
   {
   CreateItemOnObject("kick", oPC);
   }

// Ranger Class Items ******

   // Give the Ranger Kick if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_RANGER, oPC) && (GetItemPossessedBy(oPC, "kick")== OBJECT_INVALID))
   {
   CreateItemOnObject("kick", oPC);
   }
   if (GetLevelByClass(CLASS_TYPE_RANGER, oPC) && (GetItemPossessedBy(oPC, "Forage")== OBJECT_INVALID))
   {
   CreateItemOnObject("forage", oPC);
   }

// Bard Class Items ******

   // Give the Bard Forage if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_BARD, oPC) && (GetItemPossessedBy(oPC, "Forage")== OBJECT_INVALID))
   {
   CreateItemOnObject("forage", oPC);
   }

// Druid Class Items ******

   // Give the Druid Forage if he does not have it (resrefs)
  if (GetLevelByClass(CLASS_TYPE_DRUID, oPC) && (GetItemPossessedBy(oPC, "Forage")== OBJECT_INVALID))
   {
   CreateItemOnObject("forage", oPC);
   }

//
// *****************************************************************************
//
// Kill the player if they hold a deathtoken (Exploit Fix)**********************
//
  object oItemToTake;
  oItemToTake = GetItemPossessedBy(oPC, "deathtoken");
  if(GetIsObjectValid(oItemToTake) != 0)
  {
        DestroyObject(oItemToTake);
        effect eEffect;
        eEffect = EffectDeath();
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC, 0.1f);
  }
//
//******************************************************************************
//
// OnEnter Casting and Hitpoint Removel (Exploit Fix) **************************
//

if(GetXP(oPC) > 1)
  {
    // Start Enter Limiting

//    eNoCast = EffectSpellFailure(100, SPELL_SCHOOL_GENERAL);
    nMaxHP = GetMaxHitPoints(oPC);
    nNewHP = nMaxHP - 10;
    if (nNewHP >= nMaxHP){nNewHP = nNewHP - 10;}

    // No Casting for 30 Seconds
//    eEffect = SupernaturalEffect(eNoCast);
//    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oPC, 30.0f);

    // HP cut to 5
    eDamage = EffectDamage(nNewHP, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_ENERGY);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oPC);

    // Blind and Deaf
    //effect eBlind;
    //eBlind = EffectBlindness();
    //eEffect = SupernaturalEffect(eBlind);
    //ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oPC, 30.0f);

    //effect eDeaf;
    //eDeaf = EffectDeaf();
    //eEffect = SupernaturalEffect(eDeaf);
    //ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oPC, 30.0f);

    // VFX and explaination
//    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_DUR_GLOBE_INVULNERABILITY), oPC, 30.0f);
//    DelayCommand(4.0,SendMessageToPC(oPC, "Your hit points and casting abilities are temporarily reduced to prevent logging exploits. (30 Seconds)"));
    //DelayCommand(7.0,FloatingTextStringOnCreature("Your hit points and casting abilities are temporarily reduced to prevent logging exploits. (30 Seconds)", oPC));
    //AssignCommand(GetModule(),DelayCommand(5.0,StripSpells(oPC)));   //UOAbigail

    // End enter limiting
// Remove feats and spells onenter *********************************************
//object oRaise = GetItemPossessedBy(oPC, "GodlyFavor");
//SignalEvent(oPC, EventActivateItem(oRaise,GetLocation(oPC),oPC));

int nIdx, nCount;

for( nIdx = 0; nIdx < 806; nIdx++ )
{
nCount = GetHasSpell( nIdx, oPC );
while(nCount > 0)
{
DecrementRemainingSpellUses(oPC, nIdx);
nCount--;
}
}

for( nIdx = 0; nIdx < 480; nIdx++ )
{
nCount = GetHasFeat( nIdx, oPC );
while(nCount > 0)
{
DecrementRemainingFeatUses(oPC, nIdx);
nCount--;
}
}

for( nIdx = 866; nIdx < 1072; nIdx++ )
{
nCount = GetHasFeat( nIdx, oPC );
while(nCount > 0)
{
DecrementRemainingFeatUses(oPC, nIdx);
nCount--;
}
}

if(GetHasFeat(423)) //extra music feat
for(nIdx = 4; nIdx > 0; nIdx--)
DecrementRemainingFeatUses(oPC, 257);
// *****************************************************************************


  }
//
// *****************************************************************************
//
// For Purecasting EQ/NQ Custom Spells *****************************************
//
    if (GetCampaignInt("NQ", "PureCaster", oPC)==1)
    {
        effect eEffect;
        eEffect = EffectSpellFailure(100, SPELL_SCHOOL_GENERAL);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oPC);
    }
//
// *****************************************************************************
//


} // Close entire script
////////////////////////////////////////////////////////////////////////////////
//
// Added from the CEP scipts to purify Duped items broken in 1.67

void ZEP_PurifyAllItems(object oPC, int nIsEntering=FALSE,int nDeleteTempVars=FALSE)
{
  ZEP_PurifyItem(GetItemInSlot(INVENTORY_SLOT_CHEST, oPC),oPC,nIsEntering);
  ZEP_PurifyItem(GetItemInSlot(INVENTORY_SLOT_HEAD, oPC),oPC,nIsEntering);
  ZEP_PurifyItem(GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC),oPC,nIsEntering);
  ZEP_PurifyItem(GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC),oPC,nIsEntering);
  object oItem = GetFirstItemInInventory(oPC);
  while (GetIsObjectValid(oItem))
      {
      ZEP_PurifyItem(oItem,oPC,TRUE);
      oItem = GetNextItemInInventory(oPC);
      }
  if (nDeleteTempVars == FALSE)
      return;
  DeleteLocalInt(oPC, "ZEP_CR_STARTED");
}
void ZEP_PurifyItem(object oItem, object oPC, int nIsEntering)
{
  string sDupeReport;
  if (GetLocalInt(oItem, "ZEP_CR_TEMPITEM"))
      {
      //SendMessageToPC(oPC,("Destroyed: "+GetName(oItem)+"Crafting Duplicate"));
      //Note from Loki: The following block of code checks if
      //the function is being run as part of an "OnEnter"
      //script (as indicated y the function argument "nIsEntering".
      //If so, we note this in the log file.  Otherwise we send a
      //slightly shorter message.

      if (nIsEntering)
          sDupeReport="Crafting Duplicate '"+GetName(oItem)+"' Detected on entering player: "+GetName(oPC)+".  Item Destroyed.";
      else sDupeReport="Crafting Duplicate '"+GetName(oItem)+"' Detected on player: "+GetName(oPC)+".  Item Destroyed.";
      DestroyObject(oItem);
      WriteTimestampedLogEntry(sDupeReport);
      SendMessageToAllDMs(sDupeReport);
      }
}

