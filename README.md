## Description
This resource is a strong library of discovered native functions by the community.
You can reuse functions with exports or by including files.

## Links
- [Github](https://github.com/Sarbatore/rdr_natives)

## Usages
### With exports
myscript/client.lua
```lua
exports.redm_natives:PlayPedAmbientSpeechNative(PlayerPedId(), "0083_U_M_O_BlWGeneralStoreOwner_01", "TAKE_YOUR_TIME", 291934926, 0) -- This will make your ped speak.
```
### With include
myscript/fxmanifest.lua
```lua
client_scripts {
    "@redm_natives/namespaces/audio.lua"
}
```
myscript/client.lua
```lua
    PlayPedAmbientSpeechNative(PlayerPedId(), "0083_U_M_O_BlWGeneralStoreOwner_01", "TAKE_YOUR_TIME", 291934926, 0)
```

## Contributions
I hope you guys will participate to this repository. In order to maintain optimal readability, we keep certain conventions:
- A file for a namespace
- Function name must be the LUA equivalent of the C function name or you invent a name for those who are unknown
- Comment on the functions (short description, parameters and return value)
- Export your function in exports.lua
- Add the function to the references list (alphabetically)

## References:

## Audio

| Function | Parameters |
|----------|------------|
| `CanPedSaySpeech` | `ped, soundName, speechParam, speechLine` |
| `GetAmbientSpeechBuffer` | `speechRef, speechName, speechLine, speechParam, pedListener, syncOverNetwork` |
| `GetCurrentAmbientSpeechHash` | `ped` |
| `GetLastAmbientSpeechHash` | `ped` |
| `PlayAmbientSpeechFromPositionNative` | `soundRef, soundName, x, y, z, speechLine, speechParam, pedListener, syncOverNetwork` |
| `PlayPedAmbientSpeechNative` | `ped, speechRef, speechName, speechParam, speechLine, pedListener, syncOverNetwork` |

## Cam

| Function | Parameters |
|----------|------------|
| `SetCamDofParams` | `cam, params` |
| `SetCameraClosestZoom` | `` |
| `SetCameraGroundLevelZoom` | `zoom` |

## Entity

| Function | Parameters |
|----------|------------|
| `AttachEntityToCoordsPhysically` | `entity, x, y, z, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14` |
| `GetEntityLootingPed` | `ped` |
| `GetOffsetFromEntityBone` | `entity, boneIndex` |

## Fire

| Function | Parameters |
|----------|------------|
| `AddExplosionWithDamageCauser` | `entity, p1, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake` |
| `AddExplosionWithUserVfxAndDamageCauser` | `entity, p1, x, y, z, explosionType, explosionFx, damageScale, isAudible, isInvisible, cameraShake` |
| `DoesFireExistCloseToPlayerAtVolumePos` | `playerX, playerY, playerZ, volumePosX, volumePosY, volumePosZ, volumeRotX, volumeRotY, volumeRotZ` |
| `IsEntityDamagedByFire` | `entity` |

## Flock

| Function | Parameters |
|----------|------------|
| `ClearHerd` | `herd` |
| `DeleteHerd` | `herd` |
| `IsPedInHerd` | `herd, ped` |
| `RemoveHerdPed` | `herd, ped` |

## Graphics

| Function | Parameters |
|----------|------------|
| `RemoveVegModifier` | `vegModifier` |

## Hud

| Function | Parameters |
|----------|------------|
| `GetWeaponWheelHighlightedWeaponHash` | `` |
| `RemoveMpGamerTag` | `gamerTag` |
| `UiPromptHasMashModeJustPressed` | `prompt` |

## Inventory

| Function | Parameters |
|----------|------------|
| `InventoryApplyWeaponStatsToEntry` | `entryId, weapon, ped` |
| `InventoryGetCatalogItemInspectionEffectsEntry` | `entryId, name, p2, p3` |
| `InventoryGetCatalogItemInspectionStatsEntry` | `entryId, name, p2, playerId` |
| `InventoryGetGuidFromItemid` | `guid, item, slotId` |
| `InventoryGetInventoryItemInspectionInfo` | `item` |

## Itemdatabase

| Function | Parameters |
|----------|------------|
| `ItemdatabaseCreateItemCollection` | `size, comparisonType` |
| `ItemdatabaseFilloutAcquireCost` | `key, costType` |
| `ItemdatabaseFilloutBuyAwardUiData` | `award` |
| `ItemdatabaseFilloutItem` | `key, costType, index` |
| `ItemdatabaseFilloutItemEffectIdInfo` | `effectId` |
| `ItemdatabaseFilloutItemEffectIds` | `key` |
| `ItemdatabaseFilloutItemInfo` | `key` |
| `ItemdatabaseFilloutTagData` | `key` |
| `ItemdatabaseGetHasSlotInfo` | `category, index` |

## Map

| Function | Parameters |
|----------|------------|
| `ClearBlip` | `blip` |
| `ClearExistingBlipFromLockonEntityPrompt` | `entity, blipId` |
| `ClearPausemapCoords` | `` |
| `GetWaypointPosition` | `` |
| `IsBlipIconOnLockonEntityPrompt` | `entity, blipId` |
| `IsGPSActive` | `` |
| `IsGPSRouteOnRoad` | `` |
| `RemoveBlipIconFromEntityLockonPrompt` | `entity, integer` |
| `SetActiveBlipIconEntityPromptWithoutLockon` | `entity` |
| `SetBlipIconLockonEntityPrompt` | `entity, blipHash` |
| `SetExistingBlipLockonEntityPrompt` | `entity, blipId` |

## Misc

| Function | Parameters |
|----------|------------|
| `DisableCompositeEatPromptThisFrame` | `composite, disable` |
| `DisableCompositePickPromptThisFrame` | `composite, disable` |
| `GetGroundZAndMaterialFor3DCoord` | `x, y, z, p1` |

## Network

| Function | Parameters |
|----------|------------|
| `NetworkLeaveSession` | `` |
| `NetworkUnregisterNetworkedEntity` | `entity` |

## Object

| Function | Parameters |
|----------|------------|
| `IsModelAPortablePickup` | `model` |

## Ped

| Function | Parameters |
|----------|------------|
| `ApplyColdToPed` | `ped, intensity, p2` |
| `ApplyPedDamagePackToBone` | `ped, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, damagePack` |
| `CanPedHearTargetPed` | `target, ped, flag` |
| `ComputeLootForPedCarcass` | `struct, model, damageCleanliness, skinningQuality` |
| `GetNumReservedStamina` | `ped` |
| `HasPedBeenShotByPlayerRecently` | `player, ped, duration` |
| `HasPedInteractedWithPlayerRecently` | `ped, player, interactionFlag, duration` |
| `IsPedAfloat` | `ped` |
| `RequestCarryingStateForPed` | `ped, carryingType, unk3, filter` |
| `SetPedWetness` | `ped, amount` |

## Player

| Function | Parameters |
|----------|------------|
| `AddAmbientPlayerInteractiveFocusPresetAtCoords` | `player, x, y, z, preset, targetEntity, name` |
| `AddPlayerInteractiveFocusPreset` | `player, ped, preset, x, y, z, targetEntity, name` |
| `ClearDeadeyeAuraIntensityWithFlag` | `player` |
| `DisablePlayerInteractiveFocusPreset` | `player, name` |
| `EagleEyeAddParticleEffectToEntity` | `entity, entity2, p2, p3` |
| `EagleEyeAreAllTrailsHidden` | `player` |
| `EagleEyeCanPlayerFocusOnTrack` | `player` |
| `EagleEyeClearRegisteredTrails` | `player` |
| `EagleEyeEnableEntityGlow` | `entity, enable` |
| `EagleEyeGetTrackedPedId` | `player` |
| `EagleEyeRemoveParticleEffectFromEntity` | `entity` |
| `EagleEyeRemoveParticleEffectFromEntity_2` | `entity, entity2, p2` |
| `EagleEyeSetHideAllTrails` | `player, hideTrails` |
| `EagleEyeSetSprintBehavior` | `player, disableSprint` |
| `GetDeadeyeAbilityDepletionDelay` | `player` |
| `GetNumDeadEyeMarksOnPed` | `player, ped` |
| `GetPedsInCombatWithRecently` | `player, duration, size` |
| `GetPlayerInteractionAimEntity` | `player` |
| `HasPlayerDamagedRecentlyAttackedPed` | `player, duration` |
| `IsPlayerPromptJumpToActive` | `player` |
| `IsPlayerSprintingOnHorseOnRoad` | `player` |
| `IsSpecialAbilityEnabled` | `player` |
| `ResetDeadeyeAuraEffect` | `player` |
| `SetDeadEyeEntityGlowIntensityWithFlag` | `player, param2, param3, param4, glowIntensity, flag` |
| `SetDeadEyeEntityGlowWithFlag` | `player, flag` |
| `SetPlayerAimWeapon` | `player, weaponHash, attachSlotId` |
| `SetPlayerCanPickupAbility` | `player, isVisible` |
| `SetPlayerCanPickupHat` | `player, canPickup` |
| `SetPlayerDeadEyeAuraByHash` | `player, auraHash` |
| `SetPlayerHatAccess` | `player, flag, allow` |
| `SetPlayerPromptLeaveText` | `player, promptText` |
| `SetPlayerPromptMeleeText` | `player, promptText` |
| `SetPlayerPromptSitText` | `player, promptText` |
| `SetPlayerSurrenderPromptThisFrame` | `player, targetPed, promptOrder, unknownFlag` |
| `SetPlayerWeaponDrawSpeed` | `player, weapon, speed` |
| `SpecialAbilitySetActivate` | `player` |

## Propset

| Function | Parameters |
|----------|------------|
| `ModifyPropSetCoordsAndHeading` | `propSet, coordsX, coordsY, coordsZ, onGroundProperly, heading` |

## Streaming

| Function | Parameters |
|----------|------------|
| `HasClipSetLoaded_2` | `clipSet` |
| `HasScenarioTypeForPedLoaded` | `scenarioTypeId` |
| `RemoveClipSet_2` | `clipSet` |
| `RemoveScenarioTypeForPed` | `scenarioTypeId` |
| `RequestClipSet_2` | `clipSet` |
| `RequestScenarioTypeForPed` | `ped, scenarioType, flag, conditionalScenario` |

## Task

| Function | Parameters |
|----------|------------|
| `ClearVehicleTasks` | `vehicle` |
| `GetCoverpointFromEntityWithOffset` | `entity, xOffset, yOffset, zOffset, heading, p5, p6, p7, p8` |
| `GetDrivingSeat` | `vehicle` |
| `GetPedWritheBreakFreeProgress` | `ped` |
| `GetPedMountLeapProgress` | `ped` |
| `GetPedMountLeapState` | `ped` |
| `GetScenarioContainerNumCompartments` | `entity` |
| `GetScenarioContainerNumOpenCompartments` | `entity` |
| `GetScenarioContainerRemainingLootCount` | `entity` |
| `GetScenarioPointChained` | `scenario, buffer, toggle` |
| `GetScenarioPointsInArea` | `x, y, z, radius, size` |
| `GetTaskCombatReadyToShoot` | `ped` |
| `HasCarriableConfigHashLoaded` | `carriableConfig` |
| `IsPedBeingLed` | `mount` |
| `IsPedLookingAtCoord` | `ped, x, y, z, radius` |
| `IsScenarioInUse` | `scenarioHash` |
| `LoadCarriableConfigHash` | `carriableConfig` |
| `RemoveCarriableConfigHash` | `carriableConfig` |
| `ResetScenarioPointsInArea` | `x, y, z, radius` |
| `SetCarriableConfigPromptEnabled` | `carriableConfig, toggle` |
| `SetDrivingSeat` | `vehicle, seatIndex` |
| `SetIntimitatedFacingAngle` | `ped, useLimits, minAngle, maxAngle` |
| `TaskForceAimAtCoord` | `ped, x, y, z, p4, p5, p6` |
| `TaskPickUpWeapon` | `ped, pickup` |
| `TaskVehicleIsAtDestination` | `vehicle, x, y, z` |

## Uievents

| Function | Parameters |
|----------|------------|
| `EventsUiPeekMessage` | `uiapp` |

## Uifeed

| Function | Parameters |
|----------|------------|
| `N_0x18D6869FBFFEC0F8` | `data` |
| `N_0xAFF5BE9BA496CE40` | `data` |
| `UiFeedPostFeedTicker` | `data` |
| `UiFeedPostHelpText` | `data` |
| `UiFeedPostLocationShard` | `data` |
| `UiFeedPostMissionName` | `data` |
| `UiFeedPostObjective` | `data` |
| `UiFeedPostOneTextShard` | `data` |
| `UiFeedPostOptionsBuffer` | `data` |
| `UiFeedPostRankupToast` | `data` |
| `UiFeedPostReticleMessage` | `data` |
| `UiFeedPostSampleNotification` | `data` |
| `UiFeedPostSampleToast` | `data` |
| `UiFeedPostSampleToastRight` | `data` |
| `UiFeedPostSampleToastWithAppLink` | `data` |
| `UiFeedPostThreeTextShard` | `data` |
| `UiFeedPostTwoTextShard` | `data` |
| `UiFeedPostVoiceChatFeed` | `data` |
| `UiFeedToastBuffer` | `data` |
| `UiShardFeedBuffer` | `data` |
| `UiStickyFeedCreateDeathFailMessage` | `data` |
| `UiStickyFeedCreateErrorMessage` | `data` |
| `UiStickyFeedCreateWarningMessage` | `data` |
| `UiStickyFeedOptionsBuffer` | `sound, firstButtonTextHash, isFirstButtonHold, secondButtonTextHash, isSecondButtonHold, thirdButtonTextHash, isThirdButtonHold, fourthButtonTextHash, isFourthButtonHold` |

## Vehicle

| Function | Parameters |
|----------|------------|
| `AreAnyVehicleWheelsDestroyed` | `vehicle` |
| `BreakVehicleStraps` | `vehicle, coords` |
| `DeleteMissionTrain` | `trainVehicle` |
| `GetDraftVehicleFallingLog` | `vehicle` |
| `GetNumDraftVehicleLogs` | `vehicle` |
| `GetNumDraftVehicleStraps` | `vehicle` |
| `GetTrainTrackCoordAtJunctionIndex` | `trackConfig, index, p2` |
| `GetTrainTrackInfos` | `trainVehicle` |
| `SetTrainWhistleEnabled` | `trainVehicle, enable` |

## Weapon

| Function | Parameters |
|----------|------------|
| `DoesPedHavePistol` | `ped, p1` |
| `DoesPedHaveRepeater` | `ped, p1` |
| `DoesPedHaveRevolver` | `ped, p1` |
| `DoesPedHaveRifle` | `ped, p1` |
| `DoesPedHaveShotgun` | `ped, p1` |
| `DoesPedHaveSniper` | `ped, p1` |
| `GetAmmoInPedWeaponFromGuid` | `ped, guid` |
| `GetAmmoTypeForWeapon_2` | `weaponHash` |
| `GetDefaultWeaponAttachPoint` | `weaponHash` |
| `GetNumPedsRestrainedFromWeaponBolas` | `ped` |
| `GetWeaponHasMultipleAmmoTypes` | `weaponHash` |
| `GetWeaponHashFromPedWeapon` | `pedWeaponCollection, weaponGroupHash` |
| `IsPedHoldingWeapon` | `ped, weaponHash` |
| `IsWeaponCloseRange` | `weapon` |
| `N_0x14FF0C2545527F9B` | `horsePed, weaponHash, ped` |
| `SetPedWeaponOnBack` | `ped, disableAnim` |