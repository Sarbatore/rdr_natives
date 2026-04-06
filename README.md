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

## References:

## Aicoverpoint

| Function | Parameters |
|----------|------------|
| `ActivateCoverLayer` | `coverLayer` |
| `DeactivateCoverLayer` | `coverLayer` |
| `GetPedCoverPointTransitionState` | `ped` |
| `GetPedFromCoverPoint` | `coverPoint` |
| `RequestWeaponCoverAnimForPed` | `ped, weaponHash` |
| `TaskEnterCover` | `ped, coverPoint, x, y, z` |
| `TaskExitCover` | `ped, p1, x, y, z` |

## Aitransport

| Function | Parameters |
|----------|------------|
| `TaskEnterTransport` | `ped, vehicle, seatIndex, timer, pedSpeed, flags` |
| `TaskExitTransport` | `ped, vehicle, pedSpeed, flags` |

## Audio

| Function | Parameters |
|----------|------------|
| `CanPedSaySpeech` | `ped, soundName, speechParamHash, speechLine` |
| `CreateNewScriptedSpeech` | `ped, speechRef, speechName, speechLine, speechParamHash, pedListener, syncOverNetwork, p7` |
| `GetCurrentAmbientSpeechHash` | `ped` |
| `GetLastAmbientSpeechHash` | `ped` |
| `PlayAmbientSpeechFromPositionNative` | `x, y, z, soundRef, soundName,  speechLine, speechParamHash, pedListener, syncOverNetwork, p9` |
| `PlayPedAmbientSpeechNative` | `ped, speechRef, speechName, speechParamHash, speechLine, pedListener, syncOverNetwork, p7` |
| `PlaySoundFromScriptedSpeech` | `scriptedSpeech` |

## Bounty

| Function | Parameters |
|----------|------------|
| `BountyGetBountyOnPlayer` | `playerId` |

## Cam

| Function | Parameters |
|----------|------------|
| `SetCamDofAndFocalParams` | `cam, dofStrength, dofNear, dofFar, focalLength, minFocal, maxFocal, enableDof, p8, p9, p10` |
| `SetCameraClosestZoom` | `` |
| `SetCameraGroundLevelZoom` | `zoom` |
| `ShakeGameplayCamWithName` | `shakeName, intensity` |

## Databinding

| Function | Parameters |
|----------|------------|
| `DatabindingRemoveUiItemFromListByIndex` | `entryId, index` |

## Entity

| Function | Parameters |
|----------|------------|
| `AttachEntityToCoordsPhysically` | `entity, x, y, z, xOffset, yOffset, zOffset, p7, p8, p9, p10, p11, p12, p13, p14` |
| `DisableStairsStepForVolume` | `volume` |
| `EnableStairsStepForVolume` | `volume` |
| `ForceTrainWagonPopulation` | `trainWagon, toggle` |
| `GetCarcassFromPelt` | `entity` |
| `GetCollisionIntensity` | `entity` |
| `GetEntityAlbedo` | `entity` |
| `GetEntityCollisionIntensity` | `entity1, entity2` |
| `GetEntityLootingPed` | `ped` |
| `GetHeadingOfEntityBone` | `entity, boneId, p2, p3` |
| `GetLastEntityToDamageEntity` | `entity` |
| `GetOffsetFromEntityBone` | `entity, boneIndex` |
| `IsCanModelUseVegModifier` | `modelHash` |
| `IsTrainInteriorLoaded` | `entity` |
| `PinMapEntity` | `entity` |
| `PreloadEntityInterior` | `entity, toggle` |
| `RequestEntityVisibilityTracking` | `entity` |
| `SetAnimalPeltTexture` | `entity, peltAsset, albedoHash, p3` |
| `SetAutoPickup` | `entity, noPickupAnim, autoPickupRange, p3, p4, enablePickupPrompt` |
| `SetCarriablePickupLight` | `entity, toggle` |
| `SetEntityAnimAge` | `entity, alpha` |
| `SetEntityAttachedOffset` | `entity, horizontalMode, x, y, z` |
| `SetEntityDisableFire` | `entity, toggle` |
| `SetEntityLightsAlwaysEnabled` | `entity, toggle` |
| `SetEntityLightsOff` | `entity, toggle` |
| `SetEntityLockonPointOffset` | `entity, offsetX, offsetY, offsetZ` |
| `SetEntityRotationParallelToLine` | `entity, x1, y1, z1, x2, y2, z2, p7` |
| `UnpinMapEntity` | `pinId` |

## Fire

| Function | Parameters |
|----------|------------|
| `AddExplosionWithDamageCauser` | `entity, p1, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake` |
| `AddExplosionWithUserVfxAndDamageCauser` | `entity, p1, x, y, z, explosionType, explosionFxHash, damageScale, isAudible, isInvisible, cameraShake` |
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

## Ik

| Function | Parameters |
|----------|------------|
| `InverseKinematicsIsActive` | `ped, ik` |
| `InverseKinematicsRequestLookAt` | `ped, x, y, z, lookAtEntity, flags, p6, duration` |

## Inventory

| Function | Parameters |
|----------|------------|
| `InventoryAddItemWithGuid` | `inventoryId, guid2, itemHash, slotIdHash, p3, addReasonHash` |
| `InventoryApplyWeaponStatsToEntry` | `entryId, weaponHash, ped` |
| `InventoryCreateItemCollectionWithFilter` | `inventoryId, itemHash, slotIdHash, slotId2Hash, slotId3Hash, p5, p6, p7, p8, itemTypeHash, p10, p11, p12, p13, p14, p15, p16, p17` |
| `InventoryGetCatalogItemInspectionEffectsEntry` | `entryId, name, p2, p3` |
| `InventoryGetCatalogItemInspectionStatsEntry` | `entryId, name, p2, playerId` |
| `InventoryGetGuidFromItemid` | `inventoryId, itemHash, slotIdHash` |
| `InventoryGetInventoryItemCompatibleSlots` | `itemHash, size` |
| `InventoryGetInventoryItemInspectionInfo` | `itemHash` |
| `InventoryGetInventoryItemLastCreation` | `inventoryId, itemHash` |
| `SetItemPromptInfoRequest` | `object, itemHash, consumableHash, label, price, modifiedPrice, flags, p5, x, y, z, p9` |

## Itemdatabase

| Function | Parameters |
|----------|------------|
| `ItemdatabaseCreateItemCollection` | `slotIdHash, slotId2Hash, tagHash, catalogItemCategoryHash, costHash, sellHash, flag, itemTypeHash, catalogItemTagHash` |
| `ItemdatabaseFilloutAcquireCost` | `itemHash, costHash` |
| `ItemdatabaseFilloutAwardItemInfo` | `awardHash, index` |
| `ItemdatabaseFilloutAwardUnlockFlag` | `awardHash, index` |
| `ItemdatabaseFilloutBundle` | `bundleHash, costHash, index` |
| `ItemdatabaseFilloutItem` | `itemHash, costHash, index` |
| `ItemdatabaseFilloutItemByName` | `itemHash` |
| `ItemdatabaseFilloutItemEffectIdInfo` | `effectId` |
| `ItemdatabaseFilloutItemEffectIds` | `itemHash` |
| `ItemdatabaseFilloutItemInfo` | `itemHash` |
| `ItemdatabaseFilloutModifier` | `modifierHash, index` |
| `ItemdatabaseFilloutPriceModifierByKey` | `itemHash` |
| `ItemdatabaseFilloutSellPrice` | `itemHash, sellTypeHash` |
| `ItemdatabaseFilloutTagData` | `itemHash, size` |
| `ItemdatabaseFilloutUiData` | `itemHash` |
| `ItemdatabaseGetAcquireCost` | `itemHash, index` |
| `ItemdatabaseGetAcquireCostsCountFromCostType` | `itemHash, costHash` |
| `ItemdatabaseGetAwardAcquireCost` | `awardHash, index` |
| `ItemdatabaseGetAwardCostModifiers` | `awardHash` |
| `ItemdatabaseGetAwardInfo` | `awardHash` |
| `ItemdatabaseGetAwardUnlockFlagCount` | `awardHash` |
| `ItemdatabaseGetBundleAcquireCost` | `bundleHash, index` |
| `ItemdatabaseGetBundleAcquireCostModifiers` | `bundleHash` |
| `ItemdatabaseGetBundleAcquireCostsCount` | `bundleHash` |
| `ItemdatabaseGetBundleAcquireCostsCountFromCost` | `bundleHash, costHash` |
| `ItemdatabaseGetBundleItemCount` | `bundleId` |
| `ItemdatabaseGetBundleItemInfo` | `bundleId, index` |
| `ItemdatabaseGetCatalogItemCategoryPathset` | `ciCategoryHash` |
| `ItemdatabaseGetFitsSlotInfo` | `categoryHash, index` |
| `ItemdatabaseGetItemPriceModifiers` | `itemHash` |
| `ItemdatabaseGetShopInventoriesItemInfo` | `shopTypeHash, shopInventoryIndex` |
| `ItemdatabaseGetShopInventoriesItemInfoByKey` | `shopTypeHash, itemHash` |
| `ItemdatabaseGetShopInventoriesRequirementGroupInfo` | `shopTypeHash, itemHash, groupIndex` |
| `ItemdatabaseGetShopInventoriesRequirementInfo` | `shopTypeHash, unkHash, groupIndex, requirementIndex` |
| `ItemdatabaseGetShopLayoutInfo` | `layoutHash` |
| `ItemdatabaseGetShopLayoutMenuInfoById` | `layoutHash, menuHash` |
| `ItemdatabaseGetShopLayoutMenuInfoByIndex` | `layoutHash, menuHash, index` |
| `ItemdatabaseGetShopLayoutMenuPageKey` | `layoutHash, menuHash, index` |
| `ItemdatabaseGetShopLayoutPageInfoByIndex` | `layoutHash, index` |
| `ItemdatabaseGetShopLayoutPageInfoByKey` | `layoutHash, pageHash` |
| `ItemdatabaseGetShopLayoutPageItemKey` | `layoutHash, pageHash, index` |
| `ItemdatabaseGetShopLayoutRootMenuInfo` | `layoutHash, index` |

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
| `FireSingleBullet` | `xStart, yStart, zStart, xEnd, yEnd, zEnd, weaponHash, damage, p8, investigator, entity2, entity3, p12, p13, p14, p15, p16, p18, p19` |
| `GetGroundZAndMaterialFor3DCoord` | `x, y, z, p1` |

## Network

| Function | Parameters |
|----------|------------|
| `NetworkHandleFromPlayer` | `player` |
| `NetworkSessionRequestTerminate` | `` |
| `NetworkUnregisterNetworkedEntity` | `entity` |

## Object

| Function | Parameters |
|----------|------------|
| `CheckDoorActionFlag` | `doorObject, flag` |
| `DamageObjectFragmentByIndex` | `object, index` |
| `DoorSystemCheckActionFlag` | `doorHash, flag` |
| `DoorSystemClearForcedOpenPlayer` | `doorHash` |
| `DoorSystemSwingOpen` | `doorHash, dirX, dirY, dirZ, reverseDirection` |
| `GetDoorKnockingWhenLocked` | `doorHash` |
| `GetForcedOpenPlayer` | `doorHash` |
| `GetObjectFragmentCount` | `object` |
| `IsModelAPortablePickup` | `modelHash` |
| `IsPickupPickableForTeam` | `object, teamId` |
| `SetDoorKickPromptEnabled` | `doorHash, toggle` |
| `SetDoorKnockingWhenLocked` | `doorHash, toggle` |
| `SetObjectLanternLightDisabled` | `object, toggle` |
| `SetObjectMarkableInDeadEye` | `object, toggle` |

## Ped

| Function | Parameters |
|----------|------------|
| `ApplyColdToPed` | `ped, intensity, p2` |
| `ApplyPedDamagePackToBone` | `ped, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, damagePack` |
| `CanPedHearTargetPed` | `targetPed, ped, flag` |
| `ComputeLootForPedCarcass` | `modelHash, damageCleanliness, skinningQuality, size` |
| `ComputePedMoveBlendRatioForMaxSpeed` | `ped, moveBlendRatio` |
| `ComputeSpeedForPedMoveBlendRatio` | `ped, speed` |
| `GetCarriedAttachedInfoForSlot` | `ped, carriableSlot` |
| `GetNumReservedStamina` | `ped` |
| `GetPedDirtLevel` | `ped, p1` |
| `GetPedNearbyPeds` | `ped, size, ignoredPedType, p3` |
| `GetPedNearbyVehicles` | `ped, size` |
| `HasPedBeenShotByPlayerRecently` | `player, ped, duration` |
| `HasPedInteractedWithPlayerRecently` | `ped, player, flag, duration` |
| `HasPedKnockedOnDoor` | `ped` |
| `HidePedReins` | `ped` |
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
| `SetPlayerWeaponDrawSpeed` | `player, weaponHash, speed` |
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
| `FindScenarioAllPointsInVolumeOfType` | `volume, itemSet, scenarioTypeHash, p3, p4, p5, p6` |
| `FindScenarioAtObjectOfType` | `object, xOffset, yOffset, zOffset, scenarioTypeHash, radius` |
| `FinishScenarioTransition` | `ped, phaseOrDelta` |
| `ForceAnimalSampled` | `animalPed, toggle` |
| `GetCoverpointFromEntityWithOffset` | `entity, xOffset, yOffset, zOffset, heading, p5, p6, p7, p8` |
| `GetDrivingSeat` | `vehicle` |
| `GetHoldToReelSettingEnabled` | `` |
| `GetLinkedScenarioPoints` | `scenarioHash, toggle` |
| `GetPedMountLeapProgress` | `ped` |
| `GetPedMountLeapState` | `ped` |
| `GetPedWritheBreakFreeProgress` | `ped` |
| `GetRevivableHorse` | `` |
| `GetScenarioContainerNumCompartments` | `object` |
| `GetScenarioContainerNumOpenCompartments` | `object` |
| `GetScenarioContainerRemainingLootCount` | `object` |
| `GetScenarioPointsInArea` | `x, y, z, radius, size` |
| `GetTaskCombatReadyToShoot` | `ped` |
| `GetWhistleRangeMaxForBondingLevel` | `bondingLevel` |
| `GetWhistleRangeMinForBondingLevel` | `bondingLevel` |
| `HasCarriableConfigHashLoaded` | `carriableConfigHash` |
| `HasEntityDirectedTaskActive` | `entity` |
| `HasPedAnimalSampled` | `animalPed` |
| `IsPedBeingLed` | `horsePed` |
| `IsPedLookingAtCoord` | `ped, x, y, z, radius` |
| `IsRevivableHorsePromptVisible` | `p0` |
| `IsScenarioInUse` | `scenarioHash` |
| `LoadCarriableConfigHash` | `carriableConfigHash` |
| `PedApplyFollowRoadSpeedOverride` | `ped, speed` |
| `RemoveCarriableConfigHash` | `carriableConfigHash` |
| `RemoveTaskCarriable` | `entity` |
| `RequestCarriableHatEquipToPed` | `hatObject, ped` |
| `ResetScenarioPointsInArea` | `x, y, z, radius` |
| `SetAboardPedBoatOffset` | `ped, boat, offsetX, offsetY, offsetZ, heading, flags` |
| `SetCarriableConfigPromptEnabled` | `carriableConfigHash, toggle` |
| `SetCarriablePickupPromptEnabled` | `carriableObject, enabled` |
| `SetDrivingSeat` | `vehicle, seatIndex` |
| `SetIntimitatedFacingAngle` | `ped, useLimits, minAngle, maxAngle` |
| `SwapReins` | `ped` |
| `SwapVehicleReins` | `vehicle, instant` |
| `TaskFollowWaypointRecording` | `ped, waypointRecording, startIndex, flags, endIndex, patrol, aimWeapon, durationMs` |
| `TaskForceAimAtCoord` | `ped, x, y, z, p4, p5, p6` |
| `TaskForceThrowableAtEntityWhenAiming` | `ped, targetEntity, durationMs, p3, p4` |
| `TaskMoveNetworkAdvancedByNameWithInitParams` | `entity, moveNetworkDefName, params, xPos, yPos, zPos, xRot, yRot, zRot, p12, multiplier, p14, p15, flags, p17` |
| `TaskMoveNetworkAdvancedByNameWithInitParamsAttached` | `entity1, moveNetworkDefName, params, entity2, boneIndex, xPos, yPos, zPos, xRot, yRot, zRot, p12, multiplier, p14, flags, p16, p17, p18` |
| `TaskMoveNetworkByNameWithInitParams` | `entity, moveNetworkDefName, params, multiplier, p4, animDict, flags` |
| `TaskPickUpWeapon` | `ped, pickup` |
| `TaskPointAtEntity` | `ped, targetEntity, duration` |
| `TaskShootWithWeapon` | `ped, targetEntity, x, y, z, duration, firingPattern` |
| `TaskVehicleAddNextDestination` | `vehicle, x, y, z` |
| `TaskVehicleIsAtDestination` | `vehicle, x, y, z` |
| `TransitionScenarioToConditionalAnim` | `ped, scenarioPoint, clipsetDict, clipsetName, fromConditionalAnim, flags` |
| `UpdateTaskGoToCoordWithOffset` | `ped, x, y, z, offsetX, offsetY, offsetZ, speed, tolerance` |
| `UpdateTaskVehicleShootAtCoord` | `ped, x, y, z` |

## Uievents

| Function | Parameters |
|----------|------------|
| `EventsUiPeekMessage` | `uiappHash` |

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
| `UiFeedPostSampleToastWithAppLink` | `duration, title, text, textureDictHash, textureNameHash, subCategoryToastAppId, p6, p7, extraText` |
| `UiFeedPostThreeTextShard` | `data` |
| `UiFeedPostTwoTextShard` | `data` |
| `UiFeedPostVoiceChatFeed` | `data` |
| `UiStickyFeedCreateDeathFailMessage` | `data` |
| `UiStickyFeedCreateErrorMessage` | `data` |
| `UiStickyFeedCreateWarningMessage` | `data` |

## Uilog

| Function | Parameters |
|----------|------------|
| `UilogPostNotification` | `toast, body, p2, p3, p4, p5` |

## Vehicle

| Function | Parameters |
|----------|------------|
| `AreAnyVehicleWheelsDestroyed` | `vehicle` |
| `BreakVehicleStraps` | `vehicle, coords` |
| `DeleteMissionTrain` | `trainVehicle` |
| `DetermineVehicleCompartmentState` | `vehicle, ped` |
| `GetAllWagonPassengers` | `wagon, itemSet` |
| `GetBalloonObjectFromVehicle` | `vehicle` |
| `GetClosestVehicle` | `x, y, z, radius, modelHash` |
| `GetJunctionCoordsForTrainTrack` | `trackHash, junctionIndex` |
| `GetNumDraftVehicleLogs` | `vehicle` |
| `GetNumDraftVehicleStraps` | `vehicle` |
| `GetStationFromTrainStationData` | `trackIndex, stationIndex` |
| `IsPositionValidForTrain` | `trainConfig, x, y, z, direction, p5` |
| `RecoverDraftVehicleFallingLog` | `vehicle` |
| `ReturnTrainInfoFromHandle` | `trainVehicle` |
| `SetBalloonRoute` | `balloonVehicle, x, y, z, autoPower, speed` |
| `SetOarsRowingSpeed` | `boatVehicle, speed` |
| `SetTrainCarriageInteriorCollisionAvoidance` | `trainCarriage, enable` |
| `SetTrainCollisionAvoidanceEnabled` | `trainVehicle, enable` |
| `SetTrainReverseEnabled` | `missionTrain, enable` |
| `SetTrainWhistleEnabled` | `trainVehicle, enable` |

## Weapon

| Function | Parameters |
|----------|------------|
| `AttachWeaponToHorseHolster` | `horsePed, weaponHash, ped` |
| `CanPedAccessMountWeapons` | `ped` |
| `DeleteWeaponObjectsOnHorse` | `horsePed` |
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
| `GetWeaponFromDefaultPedWeaponCollection` | `weaponCollection, weaponGroupHash` |
| `GetWeaponFromHorseHolster` | `horsePed` |
| `GetWeaponHasMultipleAmmoTypes` | `weaponHash` |
| `GetWeaponReplacedHash` | `p0` |
| `GiveWeaponToPedWithOptions` | `ped, weaponHash, slotIdHash, attachPoint, addReasonHash, p4, p5, forceInHand, forceInHolster, p8` |
| `IsPedCarryingWeaponSniperAtAttachPoint` | `ped, attachPoint` |
| `IsPedHoldingWeapon` | `ped, weaponHash` |
| `IsPedTakingPoisonGasDamage` | `ped` |
| `IsWeaponCloseRange` | `weaponHash` |
| `RegisterWeaponObjectForIgnition` | `weaponObject` |
| `SetArrowTrail` | `ped, trailHash` |
| `SetPedWeaponOnBack` | `ped, disableAnim` |
| `SetProjectileEffectRadius` | `projectile, radius` |
| `SetProjectileFuseTime` | `projectile, time` |
| `SetVehicleWeaponReloadMode` | `vehicle, disableReload, p2` |