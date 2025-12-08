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

## Aicoverpoint

| Function | Parameters |
|----------|------------|
| `ActivateCoverLayer` | `coverLayer` |
| `DeactivateCoverLayer` | `coverLayer` |
| `GetPedCoverPointTransitionState` | `ped` |
| `GetPedFromCoverPoint` | `coverPoint` |
| `RequestWeaponCoverAnimForPed` | `ped, weaponHash` |

## Aitransport

| Function | Parameters |
|----------|------------|
| `TaskEnterTransport` | `ped, vehicle, seatIndex, timer, pedSpeed, flags` |
| `TaskExitTransport` | `ped, vehicle, pedSpeed, flags` |

## Audio

| Function | Parameters |
|----------|------------|
| `CanPedSaySpeech` | `ped, soundName, speechParam, speechLine` |
| `CreateNewScriptedSpeech` | `ped, speechRef, speechName, speechLine, speechParam, pedListener, syncOverNetwork, p7` |
| `GetCurrentAmbientSpeechHash` | `ped` |
| `GetLastAmbientSpeechHash` | `ped` |
| `PlayAmbientSpeechFromPositionNative` | `x, y, z, soundRef, soundName,  speechLine, speechParam, pedListener, syncOverNetwork, p9` |
| `PlayPedAmbientSpeechNative` | `ped, speechRef, speechName, speechParam, speechLine, pedListener, syncOverNetwork, p7` |
| `PlaySoundFromScriptedSpeech` | `scriptedSpeech` |

## Bounty

| Function | Parameters |
|----------|------------|
| `GetBountyOnPlayer` | `playerId` |

## Cam

| Function | Parameters |
|----------|------------|
| `SetCamDofAndFocalParams` | `cam, dofStrength, dofNear, dofFar, focalLength, minFocal, maxFocal, enableDof, p8, p9, p10` |
| `SetCameraClosestZoom` | `` |
| `SetCameraGroundLevelZoom` | `zoom` |

## Databinding

| Function | Parameters |
|----------|------------|
| `DatabindingRemoveUiItemFromListByIndex` | `entryId, index` |

## Entity

| Function | Parameters |
|----------|------------|
| `AttachEntityToCoordsPhysically` | `entity, x, y, z, xOffset, yOffset, zOffset, p7, p8, p9, p10, p11, p12, p13, p14` |
| `ForceTrainWagonPopulation` | `trainWagon, toggle` |
| `GetEntityLootingPed` | `ped` |
| `GetOffsetFromEntityBone` | `entity, boneIndex` |

## Fire

| Function | Parameters |
|----------|------------|
| `AddExplosionWithDamageCauser` | `entity, p1, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake` |
| `AddExplosionWithUserVfxAndDamageCauser` | `entity, p1, x, y, z, explosionType, explosionFx, damageScale, isAudible, isInvisible, cameraShake` |
| `GetClosestFirePosInVolume` | `xPos, yPos, zPos, xRot, yRot, zRot, xScale, yScale, zScale` |
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
| `GetHudState` | `hudComponent` |
| `GetWeaponWheelHighlightedWeaponHash` | `` |
| `RemoveMpGamerTag` | `gamerTag` |
| `UiPromptHasMashModeJustPressed` | `prompt` |

## Inventory

| Function | Parameters |
|----------|------------|
| `InventoryAddItemWithGuid` | `inventoryId, guid2, item, itemSlotId, p3, addItemReason` |
| `InventoryApplyWeaponStatsToEntry` | `entryId, weaponHash, ped` |
| `InventoryCreateItemCollectionWithFilter` | `inventoryId, item, slotId, slotId2, slotId3, p5, p6, p7, p8, itemType, p10, p11, p12, p13, p14, p15, p16, p17` |
| `InventoryGetCatalogItemInspectionEffectsEntry` | `entryId, name, p2, p3` |
| `InventoryGetCatalogItemInspectionStatsEntry` | `entryId, name, p2, playerId` |
| `InventoryGetGuidFromItemid` | `inventoryId, p1, slotId` |
| `InventoryGetInventoryItemCompatibleSlots` | `item, size` |
| `InventoryGetInventoryItemInspectionInfo` | `item` |
| `InventoryGetInventoryItemLastCreation` | `inventoryId, item` |
| `SetItemPromptInfoRequest` | `p0, item, p2, p3, flags, p5, p6, p7, p8, p9` |

## Itemdatabase

| Function | Parameters |
|----------|------------|
| `ItemdatabaseCreateItemCollection` | `slotId, slotId2, tag, category, cost, p5, flags, itemType, ciTag` |
| `ItemdatabaseFilloutAcquireCost` | `item, costType` |
| `ItemdatabaseFilloutAwardItemInfo` | `award, index` |
| `ItemdatabaseFilloutBundle` | `bundle, costtype, index` |
| `ItemdatabaseFilloutItem` | `item, costtype, index` |
| `ItemdatabaseFilloutItemByName` | `item` |
| `ItemdatabaseFilloutItemEffectIdInfo` | `effectId` |
| `ItemdatabaseFilloutItemEffectIds` | `item` |
| `ItemdatabaseFilloutItemInfo` | `item` |
| `ItemdatabaseFilloutModifier` | `modifier, index` |
| `ItemdatabaseFilloutPriceModifierByKey` | `key` |
| `ItemdatabaseFilloutSellPrice` | `item, sellType` |
| `ItemdatabaseFilloutTagData` | `item, size` |
| `ItemdatabaseFilloutUiData` | `item` |
| `ItemdatabaseGetAwardAcquireCost` | `award, index` |
| `ItemdatabaseGetAwardCostModifiers` | `award` |
| `ItemdatabaseGetBundleItemCount` | `bundleId` |
| `ItemdatabaseGetBundleItemInfo` | `bundleId, index` |
| `ItemdatabaseGetFitsSlotInfo` | `category, index` |
| `ItemdatabaseGetItemPriceModifiers` | `key` |
| `ItemdatabaseGetShopInventoriesRequirementInfo` | `shopType, key, groupIndex, requirementIndex` |
| `ItemdatabaseGetShopLayoutPageInfoByIndex` | `layout, index` |

## Law

| Function | Parameters |
|----------|------------|
| `GetPlayerRegisteredCrime` | `player, index` |

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
| `RemoveBlipIconFromEntityLockonPrompt` | `entity, p1` |
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
| `NetworkSessionRequestTerminate` | `` |
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
| `ComputeLootForPedCarcass` | `model, damageCleanliness, skinningQuality, size` |
| `ComputePedMoveBlendRatioForMaxSpeed` | `ped, moveBlendRatio` |
| `ComputeSpeedForPedMoveBlendRatio` | `ped, speed` |
| `GetCarriedAttachedInfoForSlot` | `ped, carriableSlot` |
| `GetNumReservedStamina` | `ped` |
| `GetPedDirtLevel` | `ped, p1` |
| `GetPedNearbyVehicles` | `ped, size` |
| `HasPedBeenShotByPlayerRecently` | `player, ped, duration` |
| `HasPedInteractedWithPlayerRecently` | `ped, player, flag, duration` |
| `IsPedAfloat` | `ped` |
| `PlayConditionalAnimWithPropItem` | `ped, targetEntity, propItemId, conditionalAnimName` |
| `RefreshCarriedPedForPed` | `ped, p1, p2` |
| `RemovePedPropItemConditionalAnim` | `ped, propItemId` |
| `RequestCarryingStateForPed` | `ped, carryingType, unk3, filter` |
| `SetPedWetness` | `ped, amount` |

## Player

| Function | Parameters |
|----------|------------|
| `AddAmbientPlayerInteractiveFocusPresetAtCoords` | `player, p1, p2, p3, preset, x, y, z, targetEntity, name` |
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
| `GetNumDeadeyeMarksOnPed` | `player, ped` |
| `GetPedsDamagedByPlayerRecently` | `player, duration, size` |
| `GetPlayerInteractionAimEntity` | `player` |
| `HasPlayerDamagedRecentlyAttackedPed` | `player, duration` |
| `IsPlayerPromptJumpToActive` | `player` |
| `IsPlayerSprintingOnHorseOnRoad` | `player` |
| `IsSpecialAbilityEnabled` | `player` |
| `ResetDeadeyeAuraEffect` | `player` |
| `SetDeadeyeEntityAuraIntensityWithFlag` | `player, p1, p2, p3, glowIntensity, flag` |
| `SetDeadeyeEntityGlowWithFlag` | `player, flag` |
| `SetPlayerAimWeapon` | `player, weaponHash, attachSlotId` |
| `SetPlayerCanPickupAbility` | `player, isVisible` |
| `SetPlayerCanPickupHat` | `player, canPickup` |
| `SetPlayerDeadeyeAuraByHash` | `player, auraColorHash` |
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
| `ModifyPropSetCoordsAndHeading` | `propSet, x, y, z, onGroundProperly, heading` |

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
| `CalculateWaypointDistanceFromStart` | `waypointName, coords` |
| `CancelPedHogtie` | `ped` |
| `ClearVehicleTasks` | `vehicle` |
| `DoesPedFishingWaitForBite` | `ped` |
| `FindScenarioAllPointsInVolumeOfType` | `volume, itemset, scenarioType, p3, p4, p5, p6` |
| `FindScenarioAtObjectOfType` | `object, xOffset, yOffset, zOffset, scenarioType, radius` |
| `FinishScenarioTransition` | `` |
| `ForceAnimalSampled` | `animal, toggle` |
| `GetCoverpointFromEntityWithOffset` | `entity, xOffset, yOffset, zOffset, heading, p5, p6, p7, p8` |
| `GetDrivingSeat` | `vehicle` |
| `GetHoldToReelSettingEnabled` | `` |
| `GetLinkedScenarioPoints` | `scenario, toggle` |
| `GetPedMountLeapProgress` | `ped` |
| `GetPedMountLeapState` | `ped` |
| `GetPedWritheBreakFreeProgress` | `ped` |
| `GetRevivableHorse` | `` |
| `GetScenarioContainerNumCompartments` | `entity` |
| `GetScenarioContainerNumOpenCompartments` | `entity` |
| `GetScenarioContainerRemainingLootCount` | `entity` |
| `GetScenarioPointsInArea` | `x, y, z, radius, size` |
| `GetTaskCombatReadyToShoot` | `ped` |
| `GetWhistleRangeMaxForBondingLevel` | `bondingLevel` |
| `GetWhistleRangeMinForBondingLevel` | `bondingLevel` |
| `HasCarriableConfigHashLoaded` | `carriableConfig` |
| `HasEntityDirectedTaskActive` | `entity` |
| `HasPedAnimalSampled` | `animal` |
| `IsPedBeingLed` | `mount` |
| `IsPedLookingAtCoord` | `ped, x, y, z, radius` |
| `IsRevivableHorsePromptVisible` | `p0` |
| `IsScenarioInUse` | `scenarioHash` |
| `LoadCarriableConfigHash` | `carriableConfig` |
| `PedApplyFollowRoadSpeedOverride` | `ped, speed` |
| `RemoveCarriableConfigHash` | `carriableConfig` |
| `RemoveTaskCarriable` | `carriable` |
| `RequestCarriableHatEquipToPed` | `hat, ped` |
| `ResetScenarioPointsInArea` | `x, y, z, radius` |
| `SetAboardPedBoatOffset` | `ped, boat, offsetX, offsetY, offsetZ, heading, flags` |
| `SetCarriableConfigPromptEnabled` | `carriableConfig, toggle` |
| `SetCarriablePickupPromptEnabled` | `carriable, enabled` |
| `SetDrivingSeat` | `vehicle, seatIndex` |
| `SetIntimitatedFacingAngle` | `ped, useLimits, minAngle, maxAngle` |
| `SwapReins` | `ped` |
| `SwapVehicleReins` | `vehicle, instant` |
| `TaskFollowWaypointRecording` | `ped, waypointRecording, startIndex, flags, endIndex, patrol, aimWeapon, durationMs` |
| `TaskForceAimAtCoord` | `ped, x, y, z, p4, p5, p6` |
| `TaskForceThrowableAtEntityWhenAiming` | `ped, target, durationMs, p3, p4` |
| `TaskMoveNetworkAdvancedByNameWithInitParams` | `ped, moveNetworkDefName, clipset, eventName, stateName, phaseName, xPos, yPos, zPos, xRot, yRot, zRot, p12, p13, p14, p15, flag, p17` |
| `TaskPickUpWeapon` | `ped, pickup` |
| `TaskPointAtEntity` | `ped, targetEntity, duration` |
| `TaskVehicleAddNextDestination` | `vehicle, x, y, z` |
| `TaskVehicleIsAtDestination` | `vehicle, x, y, z` |
| `TransitionScenarioToConditionalAnim` | `ped, scenarioPoint, clipsetDict, clipsetName, fromConditionalAnim, flags` |
| `UpdateTaskGoToCoordWithOffset` | `ped, x, y, z, offsetX, offsetY, offsetZ, speed, tolerance` |
| `UpdateTaskVehicleShootAtCoord` | `ped, x, y, z` |

## Uievents

| Function | Parameters |
|----------|------------|
| `EventsUiPeekMessage` | `uiapp` |

## Uifeed

| Function | Parameters |
|----------|------------|
| `UiFeedPostCollectorToast` | `duration, title, text, textureDict, textureName, collectableCategory, extraText, p7` |
| `UiFeedPostFeedTicker` | `data` |
| `UiFeedPostHelpText` | `data` |
| `UiFeedPostInteractiveToast` | `` |
| `UiFeedPostLocationShard` | `data` |
| `UiFeedPostMissionName` | `data` |
| `UiFeedPostObjective` | `data` |
| `UiFeedPostOneTextShard` | `data` |
| `UiFeedPostRankupToast` | `duration, title, text, textureDict, textureName, textureColor, subCategoryToastAppId, extraText, p8, p9, p10, p11, p12, p13, p14, p15` |
| `UiFeedPostReticleMessage` | `data` |
| `UiFeedPostSampleNotification` | `` |
| `UiFeedPostSampleToast` | `` |
| `UiFeedPostSampleToastRight` | `data` |
| `UiFeedPostSampleToastWithAppLink` | `duration, title, text, textureDict, textureName, subCategoryToastAppId, p6, p7, extraText` |
| `UiFeedPostThreeTextShard` | `data` |
| `UiFeedPostTwoTextShard` | `data` |
| `UiFeedPostVoiceChatFeed` | `data` |
| `UiStickyFeedCreateDeathFailMessage` | `data` |
| `UiStickyFeedCreateErrorMessage` | `data` |
| `UiStickyFeedCreateWarningMessage` | `data` |

## Vehicle

| Function | Parameters |
|----------|------------|
| `AreAnyVehicleWheelsDestroyed` | `vehicle` |
| `BreakVehicleStraps` | `vehicle, coords` |
| `DeleteMissionTrain` | `trainVehicle` |
| `GetAllWagonPassengers` | `wagon, itemSet` |
| `GetBalloonObjectFromVehicle` | `vehicle` |
| `GetNumDraftVehicleLogs` | `vehicle` |
| `GetNumDraftVehicleStraps` | `vehicle` |
| `GetStationFromTrainStationData` | `trackIndex, stationIndex` |
| `GetTrainTrackCoordAtJunctionIndex` | `trackConfig, index, p2` |
| `RecoverDraftVehicleFallingLog` | `vehicle` |
| `ReturnTrainInfoFromHandle` | `trainVehicle` |
| `SetTrainWhistleEnabled` | `trainVehicle, enable` |

## Weapon

| Function | Parameters |
|----------|------------|
| `AttachWeaponToHorseHolster` | `horsePed, weaponHash, ped` |
| `CanPedAccessMountWeapons` | `ped` |
| `DeleteWeaponObjectsOnHorse` | `horse` |
| `DisableAllSpecialAmmoForPed` | `ped, weaponHash` |
| `DoesPedHavePistol` | `ped, p1` |
| `DoesPedHaveRepeater` | `ped, p1` |
| `DoesPedHaveRevolver` | `ped, p1` |
| `DoesPedHaveRifle` | `ped, p1` |
| `DoesPedHaveShotgun` | `ped, p1` |
| `DoesPedHaveSniper` | `ped, p1` |
| `EnableAllSpecialAmmoForPed` | `ped, weaponHash` |
| `ExplodePedAmmoType` | `ped, ammoHash` |
| `GetAmmoInPedWeaponFromGuid` | `ped, guid` |
| `GetAmmoTypeForWeapon_2` | `weaponHash` |
| `GetCanSwitchWeapon` | `ped` |
| `GetDefaultWeaponAttachPoint` | `weaponHash` |
| `GetIgnitedProjectileInVolume` | `volume` |
| `GetLockonRangeCurrentWeapon` | `ped` |
| `GetLongarmStoreOnDismountState` | `ped, p1` |
| `GetNumPedsRestrainedFromWeaponBolas` | `ped` |
| `GetProjectileInVolume` | `volume` |
| `GetWeaponFromDefaultPedWeaponCollection` | `weaponCollection, weaponGroup` |
| `GetWeaponFromHorseHolster` | `horse` |
| `GetWeaponHasMultipleAmmoTypes` | `weaponHash` |
| `GetWeaponReplacedHash` | `p0` |
| `GiveWeaponToPedWithOptions` | `ped, weapon, slotId, attachPoint, addReason, p4, p5, forceInHand, forceInHolster, p8` |
| `IsPedCarryingWeaponSniperAtAttachPoint` | `ped, attachPoint` |
| `IsPedHoldingWeapon` | `ped, weaponHash` |
| `IsPedTakingPoisonGasDamage` | `ped` |
| `IsWeaponCloseRange` | `weapon` |
| `RegisterWeaponObjectForIgnition` | `weaponObject` |
| `SetArrowTrail` | `ped, trailHash` |
| `SetPedWeaponOnBack` | `ped, disableAnim` |
| `SetProjectileEffectRadius` | `projectile, radius` |
| `SetProjectileFuseTime` | `projectile, time` |
| `SetVehicleWeaponReloadMode` | `vehicle, disableReload, p2` |