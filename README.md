## Description
This resource is a strong library of discovered native functions by the community.
You can reuse functions with exports or by including files.

## Usages
### With exports
```lua
exports.redm_natives:PlayPedAmbientSpeech(PlayerPedId(), "0083_U_M_O_BlWGeneralStoreOwner_01", "TAKE_YOUR_TIME", 291934926, 0) -- This will make your ped speak.
```
### By including file in fxmanifest
fxmanifest.lua
```lua
client_scripts {
    "@redm_natives/client/audio.lua"
}
```
yourfile.lua
```lua
    PlayPedAmbientSpeech(PlayerPedId(), "0083_U_M_O_BlWGeneralStoreOwner_01", "TAKE_YOUR_TIME", 291934926, 0)
```

## Contributions
I hope you guys will participate to this repository. In order to maintain optimal readability, we keep certain conventions:
- A file for a namespace
- Function name must be the LUA equivalent of the C function name or you invent a name for those who are unknown
- Comment on the functions (short description, parameters and return value)
- Export your function in exports.lua
- Add the function to the references list (alphabetically)

## References:
Audio |
-- |
CanPedSaySpeech(ped, soundName, speechParams, speechLine)
GetAmbientSpeechParamsBuffer(soundRef, soundName, speechParams, speechLine, listenerPed, syncOverNetwork, p6, p7)
GetCurrentAmbientSpeechHash(ped)
GetLastAmbientSpeechHash(ped)
PlayAmbientSpeechFromPosition(x, y, z, soundRef, soundName, speechParams, speechLine, listenerPed, syncOverNetwork, p6, p7)
PlayPedAmbientSpeech(ped, soundRef, soundName, speechParams, speechLine, listenerPed, syncOverNetwork, p6, p7)

Cam |
-- |
SetCameraClosestZoom()
SetCameraGroundLevelZoom(zoom)

Entity |
-- |
AttachEntityToCoordsPhysically(entity, x, y, z, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14)
GetEntityLootingPed(ped)

Fire |
-- |
AddExplosionWithDamageCauser(entity, p1, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
AddExplosionWithUserVfxAndDamageCauser(entity, p1, x, y, z, explosionType, explosionFx, damageScale, isAudible, isInvisible, cameraShake)
DoesFireExistCloseToPlayerAtVolumePos(playerX, playerY, playerZ, volumePosX, volumePosY, volumePosZ, volumeRotX, volumeRotY, volumeRotZ)
IsEntityDamagedByFire(entity)

Hud |
-- |
GetWeaponWheelHighlightedWeaponHash()

Inventory |
-- |
ApplyPedWeaponStatsToStatsEntryId(entryId, weapon, ped)
GetContainerEffectsEntryId(entryId, name, p2, p3)
GetContainerStatsEntryId(entryId, name, p2, playerId)
InventoryGetGuidFromItemid(guid, item, slotId)
InventoryGetInventoryItemInspectionInfo(item)

Itemdatabase |
-- |
ItemdatabaseFilloutItemEffectIdInfo(effectId)
ItemdatabaseFilloutItemEffectIds(key)
ItemdatabaseFilloutItemInfo(key)

Map |
-- |
ClearBlip(blip)
ClearExistingBlipFromLockonEntityPrompt(entity, blipId)
ClearPausemapCoords()
GetWaypointCoordsAsPointers()
IsBlipIconOnLockonEntityPrompt(entity, blipId)
IsGPSActive()
IsGPSRouteOnRoad()
RemoveBlipIconFromEntityLockonPrompt(entity, integer)
SetActiveBlipIconEntityPromptWithoutLockon(entity)
SetBlipIconLockonEntityPrompt(entity, blipHash)
SetExistingBlipLockonEntityPrompt(entity, blipId)

Ped |
-- |
ApplyColdToPed(ped, intensity, p2)
ApplyPedDamagePackToBone(ped, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, damagePack)
GetNumReservedStamina(ped)
GetNumPedsRestrainedFromWeaponBolas(ped)
HasPedBeenShotByPlayerRecently(player, ped, duration)
HasPedInteractedWithPlayerRecently(ped, player, interactionFlag, duration)

Player |
-- |
AddPlayerInteractiveFocusPreset(player, ped, preset, x, y, z, targetEntity, name)
AddPlayerInteractiveFocusPresetAtCoords(player, x, y, z, preset, targetEntity, name)
CanPlayerFocusOnTrackInEagleEye(player)
ClearDeadeyeAuraIntensityWithFlag(player)
DisablePlayerInteractiveFocusPreset(player, name)
EagleEyeAddParticleEffectToEntity(entity, entity2, p2, p3)
EagleEyeAreAllTrailsHidden(player)
EagleEyeClearRegisteredTrails(player)
EagleEyeEnableEntityGlow(entity, enable)
EagleEyeGetTrackedPedId(player)
EagleEyeSetHideAllTrails(player, hideTrails)
EagleEyeSetSprintBehavior(player, disableSprint)
EagleEyeRemoveParticleEffectFromEntity(entity)
GetDeadeyeAbilityDepletionDelay(player)
GetNumDeadEyeMarksOnPed(player, ped)
GetRecentlyAttackedPedsInCombo(player, duration, size)
HasPlayerDamagedRecentlyAttackedPed(player, duration)
IsDeadEyeAbilityEnabled(player)
IsPlayerPromptJumpToActive(player)
IsPlayerSprintingOnHorseOnRoad(player)
ResetDeadeyeAuraEffect(player)
SetDeadEyeEntityGlowIntensityWithFlag(player, param2, param3, param4, glowIntensity, flag)
SetDeadEyeEntityGlowWithFlag(player, flag)
SetPlayerAimWeapon(player, weaponHash, attachSlotId)
SetPlayerDeadEyeAuraByHash(player, auraHash)
SetPlayerHatAccess(player, flag, allow)
SetPlayerLeavePromptText(player, promptText)
SetPlayerMeleePromptText(player, promptText)
SetPlayerPickupPromptVisible(player, isVisible)
SetPlayerSitPromptText(player, promptText)
SetPlayerSurrenderPromptThisFrame(player, targetPed, promptOrder, unknownFlag)
SetPlayerWeaponDrawSpeed(player, weapon, speed)
SpecialAbilitySetActivate(player)

Task |
-- |
GetCoverpointFromEntityWithOffset(entity, xOffset, yOffset, zOffset, heading, p5, p6, p7, p8)
GetScenarioPointsInArea(x, y, z, radius, size)
HasCarriableConfigHashLoaded(carryConfigHash)
LoadCarriableConfigHash(carryConfigHash)

Uievents |
-- |
EventsUiPeekMessage(uiapp)

Vehicle |
-- |
GetTrainTrackInfos(train)

Weapon |
-- |
DoesPedHavePistol(ped, p1)
DoesPedHaveRepeater(ped, p1)
DoesPedHaveRevolver(ped, p1)
DoesPedHaveRifle(ped, p1)
DoesPedHaveShotgun(ped, p1)
DoesPedHaveSniper(ped, p1)
GetDefaultWeaponAttachPoint(weaponHash)
GetWeaponHasMultipleAmmoTypes(weaponHash)
GetWeaponHashFromPedWeapon(pedWeaponCollection, weaponGroupHash)
IsPedHoldingWeapon(ped, weaponHash)
IsWeaponCloseRange(weapon)
SetPedWeaponOnBack(ped, disableAnim)