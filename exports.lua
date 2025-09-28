-- Audio
exports("CanPedSaySpeech", CanPedSaySpeech)
exports("GetAmbientSpeechBuffer", GetAmbientSpeechBuffer)
exports("GetCurrentAmbientSpeechHash", GetCurrentAmbientSpeechHash)
exports("GetLastAmbientSpeechHash", GetLastAmbientSpeechHash)
exports("PlayAmbientSpeechFromPositionNative", PlayAmbientSpeechFromPositionNative)
exports("PlayPedAmbientSpeechNative", PlayPedAmbientSpeechNative)

-- Cam
exports("SetCamDofParams", SetCamDofParams)
exports("SetCameraClosestZoom", SetCameraClosestZoom)
exports("SetCameraGroundLevelZoom", SetCameraGroundLevelZoom)

-- Entity
exports("AttachEntityToCoordsPhysically", AttachEntityToCoordsPhysically)
exports("GetEntityLootingPed", GetEntityLootingPed)
exports("GetOffsetFromEntityBone", GetOffsetFromEntityBone)

-- Fire
exports("AddExplosionWithDamageCauser", AddExplosionWithDamageCauser)
exports("AddExplosionWithUserVfxAndDamageCauser", AddExplosionWithUserVfxAndDamageCauser)
exports("DoesFireExistCloseToPlayerAtVolumePos", DoesFireExistCloseToPlayerAtVolumePos)
exports("IsEntityDamagedByFire", IsEntityDamagedByFire)

-- Flock
exports("ClearHerd", ClearHerd)
exports("DeleteHerd", DeleteHerd)
exports("IsPedInHerd", IsPedInHerd)
exports("RemoveHerdPed", RemoveHerdPed)

-- Graphics
exports("RemoveVegModifier", RemoveVegModifier)

-- Hud
exports("GetWeaponWheelHighlightedWeaponHash", GetWeaponWheelHighlightedWeaponHash)
exports("RemoveMpGamerTag", RemoveMpGamerTag)
exports("UiPromptHasMashModeJustPressed", UiPromptHasMashModeJustPressed)

-- Inventory
exports("InventoryApplyWeaponStatsToEntry", InventoryApplyWeaponStatsToEntry)
exports("InventoryGetCatalogItemInspectionEffectsEntry", InventoryGetCatalogItemInspectionEffectsEntry)
exports("InventoryGetCatalogItemInspectionStatsEntry", InventoryGetCatalogItemInspectionStatsEntry)
exports("InventoryGetGuidFromItemid", InventoryGetGuidFromItemid)
exports("InventoryGetInventoryItemInspectionInfo", InventoryGetInventoryItemInspectionInfo)

-- Itemdatabase
exports("ItemdatabaseCreateItemCollection", ItemdatabaseCreateItemCollection)
exports("ItemdatabaseFilloutAcquireCost", ItemdatabaseFilloutAcquireCost)
exports("ItemdatabaseFilloutBuyAwardUiData", ItemdatabaseFilloutBuyAwardUiData)
exports("ItemdatabaseFilloutItem", ItemdatabaseFilloutItem)
exports("ItemdatabaseFilloutItemEffectIdInfo", ItemdatabaseFilloutItemEffectIdInfo)
exports("ItemdatabaseFilloutItemEffectIds", ItemdatabaseFilloutItemEffectIds)
exports("ItemdatabaseFilloutItemInfo", ItemdatabaseFilloutItemInfo)
exports("ItemdatabaseFilloutTagData", ItemdatabaseFilloutTagData)
exports("ItemdatabaseGetHasSlotInfo", ItemdatabaseGetHasSlotInfo)

-- Map
exports("ClearBlip", ClearBlip)
exports("ClearExistingBlipFromLockonEntityPrompt", ClearExistingBlipFromLockonEntityPrompt)
exports("ClearPausemapCoords", ClearPausemapCoords)
exports("GetWaypointPosition", GetWaypointPosition)
exports("IsBlipIconOnLockonEntityPrompt", IsBlipIconOnLockonEntityPrompt)
exports("IsGPSActive", IsGPSActive)
exports("IsGPSRouteOnRoad", IsGPSRouteOnRoad)
exports("RemoveBlipIconFromEntityLockonPrompt", RemoveBlipIconFromEntityLockonPrompt)
exports("SetActiveBlipIconEntityPromptWithoutLockon", SetActiveBlipIconEntityPromptWithoutLockon)
exports("SetBlipIconLockonEntityPrompt", SetBlipIconLockonEntityPrompt)
exports("SetExistingBlipLockonEntityPrompt", SetExistingBlipLockonEntityPrompt)

-- Misc
exports("DisableCompositeEatPromptThisFrame", DisableCompositeEatPromptThisFrame)
exports("DisableCompositePickPromptThisFrame", DisableCompositePickPromptThisFrame)
exports("GetGroundZAndMaterialFor3DCoord", GetGroundZAndMaterialFor3DCoord)

-- Network
exports("NetworkLeaveSession", NetworkLeaveSession)
exports("NetworkUnregisterNetworkedEntity", NetworkUnregisterNetworkedEntity)

-- Object
exports("IsModelAPortablePickup", IsModelAPortablePickup)

-- Ped
exports("ApplyColdToPed", ApplyColdToPed)
exports("ApplyPedDamagePackToBone", ApplyPedDamagePackToBone)
exports("CanPedHearTargetPed", CanPedHearTargetPed)
exports("ComputeLootForPedCarcass", ComputeLootForPedCarcass)
exports("GetNumReservedStamina", GetNumReservedStamina)
exports("HasPedBeenShotByPlayerRecently", HasPedBeenShotByPlayerRecently)
exports("HasPedInteractedWithPlayerRecently", HasPedInteractedWithPlayerRecently)
exports("IsPedAfloat", IsPedAfloat)
exports("RequestCarryingStateForPed", RequestCarryingStateForPed)
exports("SetPedWetness", SetPedWetness)

-- Player
exports("AddAmbientPlayerInteractiveFocusPresetAtCoords", AddAmbientPlayerInteractiveFocusPresetAtCoords)
exports("AddPlayerInteractiveFocusPreset", AddPlayerInteractiveFocusPreset)
exports("ClearDeadeyeAuraIntensityWithFlag", ClearDeadeyeAuraIntensityWithFlag)
exports("DisablePlayerInteractiveFocusPreset", DisablePlayerInteractiveFocusPreset)
exports("EagleEyeAddParticleEffectToEntity", EagleEyeAddParticleEffectToEntity)
exports("EagleEyeAreAllTrailsHidden", EagleEyeAreAllTrailsHidden)
exports("EagleEyeCanPlayerFocusOnTrack", EagleEyeCanPlayerFocusOnTrack)
exports("EagleEyeClearRegisteredTrails", EagleEyeClearRegisteredTrails)
exports("EagleEyeEnableEntityGlow", EagleEyeEnableEntityGlow)
exports("EagleEyeGetTrackedPedId", EagleEyeGetTrackedPedId)
exports("EagleEyeRemoveParticleEffectFromEntity", EagleEyeRemoveParticleEffectFromEntity)
exports("EagleEyeRemoveParticleEffectFromEntity_2", EagleEyeRemoveParticleEffectFromEntity_2)
exports("EagleEyeSetHideAllTrails", EagleEyeSetHideAllTrails)
exports("EagleEyeSetSprintBehavior", EagleEyeSetSprintBehavior)
exports("GetDeadeyeAbilityDepletionDelay", GetDeadeyeAbilityDepletionDelay)
exports("GetNumDeadEyeMarksOnPed", GetNumDeadEyeMarksOnPed)
exports("GetPedsInCombatWithRecently", GetPedsInCombatWithRecently)
exports("GetPlayerInteractionAimEntity", GetPlayerInteractionAimEntity)
exports("HasPlayerDamagedRecentlyAttackedPed", HasPlayerDamagedRecentlyAttackedPed)
exports("IsPlayerPromptJumpToActive", IsPlayerPromptJumpToActive)
exports("IsPlayerSprintingOnHorseOnRoad", IsPlayerSprintingOnHorseOnRoad)
exports("IsSpecialAbilityEnabled", IsSpecialAbilityEnabled)
exports("ResetDeadeyeAuraEffect", ResetDeadeyeAuraEffect)
exports("SetDeadEyeEntityGlowIntensityWithFlag", SetDeadEyeEntityGlowIntensityWithFlag)
exports("SetDeadEyeEntityGlowWithFlag", SetDeadEyeEntityGlowWithFlag)
exports("SetPlayerAimWeapon", SetPlayerAimWeapon)
exports("SetPlayerCanPickupAbility", SetPlayerCanPickupAbility)
exports("SetPlayerCanPickupHat", SetPlayerCanPickupHat)
exports("SetPlayerDeadEyeAuraByHash", SetPlayerDeadEyeAuraByHash)
exports("SetPlayerHatAccess", SetPlayerHatAccess)
exports("SetPlayerPromptLeaveText", SetPlayerPromptLeaveText)
exports("SetPlayerPromptMeleeText", SetPlayerPromptMeleeText)
exports("SetPlayerPromptSitText", SetPlayerPromptSitText)
exports("SetPlayerSurrenderPromptThisFrame", SetPlayerSurrenderPromptThisFrame)
exports("SetPlayerWeaponDrawSpeed", SetPlayerWeaponDrawSpeed)
exports("SpecialAbilitySetActivate", SpecialAbilitySetActivate)

-- Propset
exports("ModifyPropSetCoordsAndHeading", ModifyPropSetCoordsAndHeading)

-- Streaming
exports("HasClipSetLoaded_2", HasClipSetLoaded_2)
exports("HasScenarioTypeForPedLoaded", HasScenarioTypeForPedLoaded)
exports("RemoveClipSet_2", RemoveClipSet_2)
exports("RemoveScenarioTypeForPed", RemoveScenarioTypeForPed)
exports("RequestClipSet_2", RequestClipSet_2)
exports("RequestScenarioTypeForPed", RequestScenarioTypeForPed)

-- Task
exports("ClearVehicleTasks", ClearVehicleTasks)
exports("GetCoverpointFromEntityWithOffset", GetCoverpointFromEntityWithOffset)
exports("GetDrivingSeat", GetDrivingSeat)
exports("GetPedWritheBreakFreeProgress", GetPedWritheBreakFreeProgress)
exports("GetPedMountLeapProgress", GetPedMountLeapProgress)
exports("GetPedMountLeapState", GetPedMountLeapState)
exports("GetScenarioContainerNumCompartments", GetScenarioContainerNumCompartments)
exports("GetScenarioContainerNumOpenCompartments", GetScenarioContainerNumOpenCompartments)
exports("GetScenarioContainerRemainingLootCount", GetScenarioContainerRemainingLootCount)
exports("GetScenarioPointChained", GetScenarioPointChained)
exports("GetScenarioPointsInArea", GetScenarioPointsInArea)
exports("GetTaskCombatReadyToShoot", GetTaskCombatReadyToShoot)
exports("HasCarriableConfigHashLoaded", HasCarriableConfigHashLoaded)
exports("IsPedBeingLed", IsPedBeingLed)
exports("IsPedLookingAtCoord", IsPedLookingAtCoord)
exports("IsScenarioInUse", IsScenarioInUse)
exports("LoadCarriableConfigHash", LoadCarriableConfigHash)
exports("RemoveCarriableConfigHash", RemoveCarriableConfigHash)
exports("ResetScenarioPointsInArea", ResetScenarioPointsInArea)
exports("SetCarriableConfigPromptEnabled", SetCarriableConfigPromptEnabled)
exports("SetDrivingSeat", SetDrivingSeat)
exports("SetIntimitatedFacingAngle", SetIntimitatedFacingAngle)
exports("TaskForceAimAtCoord", TaskForceAimAtCoord)
exports("TaskPickUpWeapon", TaskPickUpWeapon)
exports("TaskVehicleIsAtDestination", TaskVehicleIsAtDestination)

-- Uievents
exports("EventsUiPeekMessage", EventsUiPeekMessage)

-- Uifeed
exports("N_0x18D6869FBFFEC0F8", N_0x18D6869FBFFEC0F8)
exports("N_0xAFF5BE9BA496CE40", N_0xAFF5BE9BA496CE40)
exports("UiFeedPostFeedTicker", UiFeedPostFeedTicker)
exports("UiFeedPostHelpText", UiFeedPostHelpText)
exports("UiFeedPostLocationShard", UiFeedPostLocationShard)
exports("UiFeedPostMissionName", UiFeedPostMissionName)
exports("UiFeedPostObjective", UiFeedPostObjective)
exports("UiFeedPostOneTextShard", UiFeedPostOneTextShard)
exports("UiFeedPostRankupToast", UiFeedPostRankupToast)
exports("UiFeedPostReticleMessage", UiFeedPostReticleMessage)
exports("UiFeedPostSampleNotification", UiFeedPostSampleNotification)
exports("UiFeedPostSampleToast", UiFeedPostSampleToast)
exports("UiFeedPostSampleToastRight", UiFeedPostSampleToastRight)
exports("UiFeedPostSampleToastWithAppLink", UiFeedPostSampleToastWithAppLink)
exports("UiFeedPostThreeTextShard", UiFeedPostThreeTextShard)
exports("UiFeedPostTwoTextShard", UiFeedPostTwoTextShard)
exports("UiFeedPostVoiceChatFeed", UiFeedPostVoiceChatFeed)
exports("UiStickyFeedCreateDeathFailMessage", UiStickyFeedCreateDeathFailMessage)
exports("UiStickyFeedCreateErrorMessage", UiStickyFeedCreateErrorMessage)
exports("UiStickyFeedCreateWarningMessage", UiStickyFeedCreateWarningMessage)

-- Vehicle
exports("AreAnyVehicleWheelsDestroyed", AreAnyVehicleWheelsDestroyed)
exports("BreakVehicleStraps", BreakVehicleStraps)
exports("DeleteMissionTrain", DeleteMissionTrain)
exports("GetDraftVehicleFallingLog", GetDraftVehicleFallingLog)
exports("GetNumDraftVehicleLogs", GetNumDraftVehicleLogs)
exports("GetNumDraftVehicleStraps", GetNumDraftVehicleStraps)
exports("GetTrainTrackCoordAtJunctionIndex", GetTrainTrackCoordAtJunctionIndex)
exports("GetTrainTrackInfos", GetTrainTrackInfos)
exports("SetTrainWhistleEnabled", SetTrainWhistleEnabled)

-- Weapon
exports("DoesPedHavePistol", DoesPedHavePistol)
exports("DoesPedHaveRepeater", DoesPedHaveRepeater)
exports("DoesPedHaveRevolver", DoesPedHaveRevolver)
exports("DoesPedHaveRifle", DoesPedHaveRifle)
exports("DoesPedHaveShotgun", DoesPedHaveShotgun)
exports("DoesPedHaveSniper", DoesPedHaveSniper)
exports("GetAmmoInPedWeaponFromGuid", GetAmmoInPedWeaponFromGuid)
exports("GetAmmoTypeForWeapon_2", GetAmmoTypeForWeapon_2)
exports("GetDefaultWeaponAttachPoint", GetDefaultWeaponAttachPoint)
exports("GetNumPedsRestrainedFromWeaponBolas", GetNumPedsRestrainedFromWeaponBolas)
exports("GetWeaponHasMultipleAmmoTypes", GetWeaponHasMultipleAmmoTypes)
exports("GetWeaponHashFromPedWeapon", GetWeaponHashFromPedWeapon)
exports("IsPedHoldingWeapon", IsPedHoldingWeapon)
exports("IsWeaponCloseRange", IsWeaponCloseRange)
exports("N_0x14FF0C2545527F9B", N_0x14FF0C2545527F9B)
exports("SetPedWeaponOnBack", SetPedWeaponOnBack)

