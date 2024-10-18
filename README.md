## Description
Find here and use most of the natives which use DataView structures.

## Usages
### With exports
```lua
exports.redm_natives:PlayPedAmbientSpeech(PlayerPedId(), "0083_U_M_O_BlWGeneralStoreOwner_01", "TAKE_YOUR_TIME", 291934926, 0) -- This will make your ped speak.
```
### By including file in fxmanifest
fxmanifest
```lua
client_scripts {
    "@redm_natives/client/audio.lua"
}
```
Use in your file
```lua
    PlayPedAmbientSpeech(PlayerPedId(), "0083_U_M_O_BlWGeneralStoreOwner_01", "TAKE_YOUR_TIME", 291934926, 0)
```

## Contributions
I hope you guys will participate to this repository. In order to maintain optimal readability, we keep certain conventions:
- A file for a namespace
- Function name must be the LUA equivalent of the C function name or you invent a name for those who are unknown
- Comment on the functions (short description, parameters and return value)

## References:
Audio |
-- |
CanPedSaySpeech(ped, soundName, speechParams, speechLine)
GetLastAmbientSpeechHash(ped)
GetCurrentAmbientSpeechHash(ped)
GetAmbientSpeechParamsBuffer(soundRef, soundName, speechParams, speechLine)
PlayPedAmbientSpeech(ped, soundRef, soundName, speechParams, speechLine)
PlayAmbientSpeechFromPosition(x, y, z, soundRef, soundName, speechParams, speechLine)

Cam |
-- |
SetCameraGroundLevelZoom(zoom)
SetCameraClosestZoom()

Hud |
-- |
GetWeaponWheelHighlightedWeaponHash()

Inventory |
-- |
InventoryGetGuidFromItemid(guid, item, slotId)
InventoryGetInventoryItemInspectionInfo(item)
GetContainerEffectsEntryId(entryId, name, p2, p3)
GetContainerStatsEntryId(entryId, name, p2, playerId)
ApplyPedWeaponStatsToStatsEntryId(entryId, weapon, ped)

Itemdatabase |
-- |
ItemdatabaseFilloutItemEffectIdInfo(effectId)
ItemdatabaseFilloutItemEffectIds(key)
ItemdatabaseFilloutItemInfo(key)

Map |
-- |
SetBlipIconLockonEntityPrompt(entity, blipHash)
ClearExistingBlipFromLockonEntityPrompt(entity, blipId)
SetExistingBlipLockonEntityPrompt(entity, blipId)

Player |
-- |
HasPlayerDamagedRecentlyAttackedPed(player, duration)
GetRecentlyAttackedPedsInCombo(player, duration, size)
SpecialAbilitySetActivate(player)
SetPlayerPickupPromptVisible(player, isVisible)
SetPlayerHatAccess(player, flag, allow)
SetPlayerAimWeapon(player, weaponHash, attachSlotId)
SetPlayerSurrenderPromptThisFrame(player, targetPed, promptOrder, unknownFlag)
DisablePlayerInteractiveFocusPreset(player, name)
SetPlayerWeaponDrawSpeed(player, weapon, speed)
AddPlayerInteractiveFocusPreset(player, ped, preset, x, y, z, targetEntity, name)
EagleEyeGetTrackedPedId(player)
EagleEyeAreAllTrailsHidden(player)
EagleEyeSetHideAllTrails(player, hideTrails)
GetNumDeadEyeMarksOnPed(player, ped)
CanPlayerFocusOnTrackInEagleEye(player)
SetDeadEyeEntityGlowIntensityWithFlag(player, param2, param3, param4, glowIntensity, flag)
SetDeadEyeEntityGlowWithFlag(player, flag)
EagleEyeSetSprintBehavior(player, disableSprint)
SetPlayerMeleePromptText(player, promptText)
SetPlayerLeavePromptText(player, promptText)
SetPlayerSitPromptText(player, promptText)

Task |
-- |
GetScenarioPointsInArea(x, y, z, radius, size)
LoadCarriableConfigHash(carryConfigHash)
HasCarriableConfigHashLoaded(carryConfigHash)

Uievents |
-- |
EventsUiPeekMessage(uiapp)

Vehicle |
-- |
GetTrainTrackInfos(train)