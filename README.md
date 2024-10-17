## Description
Find here and use most of the natives which use DataView structures.

## Example
```lua
exports.redm_natives:PlayPedAmbientSpeech(PlayerPedId(), "0083_U_M_O_BlWGeneralStoreOwner_01", "TAKE_YOUR_TIME", 291934926, 0) -- This will make your ped speak.
```
More examples here: [cl_examples.lua](cl_examples.lua)

## Contributions
I hope you guys will participate to this repository. In order to maintain optimal readability, we keep certain conventions:
- A file for a namespace
- Function name must be the LUA equivalent of the C function name or you invent a name for those who are unknown
- Comment on the functions (short description, parameters and return value)

## Functions list:
Audio |
-- |
GetAmbientSpeechParamsBuffer(soundRef, soundName, speechParams, speechLine)
PlayPedAmbientSpeech(ped, soundRef, soundName, speechParams, speechLine)
PlayAmbientSpeechFromPosition(x, y, z, soundRef, soundName, speechParams, speechLine)

Inventory |
-- |
InventoryGetGuidFromItemid(guid, item, slotId)
GetCharacterInventoryGuid()
GetWardrobeInventoryGuid()
GetWeaponInventoryGuid()
GetWeaponStatsGuid(weapon)
InventoryGetInventoryItemInspectionInfo(item)

Itemdatabase |
-- |
ItemdatabaseFilloutItemEffectIdInfo(effectId)
ItemdatabaseFilloutItemEffectIds(key)
ItemdatabaseFilloutItemInfo(key)

Task |
-- |
GetScenarioPointsInArea(x, y, z, radius, size)

Uievents |
-- |
EventsUiPeekMessage(uiapp)
