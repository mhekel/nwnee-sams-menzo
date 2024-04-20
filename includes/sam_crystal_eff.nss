void main()
{
    // PC
    object oPC = GetLastUsedBy();

    // Generate a random effect
    int nRND = Random(10);
    effect eEffect;
    effect eVisual;
    switch (nRND) {
        case 0:
          eVisual = EffectBeam(VFX_BEAM_HOLY, OBJECT_SELF, BODY_NODE_CHEST);
          eEffect = EffectAbilityIncrease(Random(6), Random(4) + 1);
          break;
        case 1:
          eVisual = EffectBeam(VFX_BEAM_EVIL, OBJECT_SELF, BODY_NODE_CHEST);
          eEffect = EffectAbilityDecrease(Random(6), Random(4) + 1);
          break;
        case 2:
          eVisual = EffectBeam(VFX_BEAM_HOLY, OBJECT_SELF, BODY_NODE_CHEST);
          eEffect = EffectTemporaryHitpoints(d4(GetHitDice(oPC)));
          break;
        case 3:
          eVisual = EffectBeam(VFX_BEAM_FIRE, OBJECT_SELF, BODY_NODE_CHEST);
          eEffect = EffectDamage(d3(GetHitDice(oPC)));
          break;
        case 4:
          eVisual = EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_CHEST);
          eEffect = EffectHaste();
          break;
        case 5:
          eVisual = EffectBeam(VFX_BEAM_ODD, OBJECT_SELF, BODY_NODE_CHEST);
          eEffect = EffectInvisibility(INVISIBILITY_TYPE_NORMAL);
          break;
        case 6:
          eVisual = EffectBeam(VFX_BEAM_FIRE_LASH, OBJECT_SELF, BODY_NODE_CHEST);
          eEffect = EffectKnockdown();
          break;
        case 7:
          eVisual = EffectBeam(VFX_BEAM_MIND, OBJECT_SELF, BODY_NODE_CHEST);
          eEffect = EffectSleep();
          break;
        case 8:
          eVisual = EffectBeam(VFX_BEAM_MIND, OBJECT_SELF, BODY_NODE_CHEST);
          eEffect = EffectUltravision();
          break;
        case 9:
          eVisual = EffectBeam(VFX_BEAM_MIND, OBJECT_SELF, BODY_NODE_CHEST);
          eEffect = EffectTrueSeeing();
          break;

    }
    effect eLink = EffectLinkEffects(eVisual, eEffect);
    ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oPC, 300.0);
}
