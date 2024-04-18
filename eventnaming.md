# How to read/name scripts P1


Events for Items.

These are fired by module-level events and/or itemproperties (i think..), using tag-based scripting. For a script to handle a tag-based event, its filename needs to start with "i_" and end with one of the following suffixes:

_aq - OnAcquireItem (module based, player only)
_ua - OnUnacquireItem (module based, player only)

_eq - OnPlayerEquipItem (module based, player only)
_ue - OnPlayerUnequipItem (module based, player only)

_ac - OnActivateItem (module based, player only)

_hc - OnHitCast (hit if a weapon, get hit if armor) (itemproperty based, incl/ NPCs)
_ci - OnCastSpellAt (itemproperty based i guess)

Between the prefix and suffix must be the tag of the item that an event will be handled for. Eg,

script: 'i_tag_ac'

Note that the suffixes are defined with stock values in 'x2_inc_switches', and the prefix is usually defined in the module-level OnModuleLoad event. Additionally, the tag-based scripting mode can be reverted to NwN1-style, also in the OnModuleLoad event (where tag-based scripting can be turned off completely as well).
