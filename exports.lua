if (IsDuplicityVersion()) then

else
    -- Audio
    exports("CanPedSaySpeech", CanPedSaySpeech)
    exports("GetAmbientSpeechParamsBuffer", GetAmbientSpeechParamsBuffer)
    exports("GetCurrentAmbientSpeechHash", GetCurrentAmbientSpeechHash)
    exports("GetLastAmbientSpeechHash", GetLastAmbientSpeechHash)
    exports("PlayPedAmbientSpeech", PlayPedAmbientSpeech)
    exports("PlayAmbientSpeechFromPosition", PlayAmbientSpeechFromPosition)

    -- Cam
    exports("SetCameraClosestZoom", SetCameraClosestZoom)
    exports("SetCameraGroundLevelZoom", SetCameraGroundLevelZoom)

    -- Entity
    exports("AttachEntityToCoordsPhysically", AttachEntityToCoordsPhysically)
    exports("GetEntityLootingPed", GetEntityLootingPed)
    
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

    -- HUD
    exports("GetWeaponWheelHighlightedWeaponHash", GetWeaponWheelHighlightedWeaponHash)

    -- Inventory
    exports("InventoryApplyWeaponStatsToEntry", InventoryApplyWeaponStatsToEntry)
    exports("InventoryGetCatalogItemInspectionEffectsEntry", InventoryGetCatalogItemInspectionEffectsEntry)
    exports("InventoryGetCatalogItemInspectionStatsEntry", InventoryGetCatalogItemInspectionStatsEntry)
    exports("InventoryGetGuidFromItemid", InventoryGetGuidFromItemid)
    exports("InventoryGetInventoryItemInspectionInfo", InventoryGetInventoryItemInspectionInfo)
    exports("GetCharacterInventoryGuid", GetCharacterInventoryGuid) -- Not a native
    exports("GetWardrobeInventoryGuid", GetWardrobeInventoryGuid) -- Not a native
    exports("GetWeaponInventoryGuid", GetWeaponInventoryGuid) -- Not a native
    exports("GetWeaponStatsGuid", GetWeaponStatsGuid) -- Not a native

    -- Itemdatabase
    exports("ItemdatabaseFilloutItemEffectIdInfo", ItemdatabaseFilloutItemEffectIdInfo)
    exports("ItemdatabaseFilloutItemEffectIds", ItemdatabaseFilloutItemEffectIds)
    exports("ItemdatabaseFilloutItemInfo", ItemdatabaseFilloutItemInfo)

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

    -- Network
    exports("NetworkLeaveSession", NetworkLeaveSession)
    exports("NetworkUnregisterNetworkedEntity", NetworkUnregisterNetworkedEntity)

    -- Ped
    exports("ApplyPedDamagePackToBone", ApplyPedDamagePackToBone)
    exports("ApplyColdToPed", ApplyColdToPed)
    exports("GetNumReservedStamina", GetNumReservedStamina)
    exports("HasPedBeenShotByPlayerRecently", HasPedBeenShotByPlayerRecently)
    exports("HasPedInteractedWithPlayerRecently", HasPedInteractedWithPlayerRecently)
    exports("IsPedAfloat", IsPedAfloat)
    exports("SetPedWetness", SetPedWetness)

    -- Player
    exports("AddPlayerInteractiveFocusPreset", AddPlayerInteractiveFocusPreset)
    exports("AddAmbientPlayerInteractiveFocusPresetAtCoords", AddAmbientPlayerInteractiveFocusPresetAtCoords)
    exports("EagleEyeCanPlayerFocusOnTrack", EagleEyeCanPlayerFocusOnTrack)
    exports("ClearDeadeyeAuraIntensityWithFlag", ClearDeadeyeAuraIntensityWithFlag)
    exports("DisablePlayerInteractiveFocusPreset", DisablePlayerInteractiveFocusPreset)
    exports("EagleEyeAreAllTrailsHidden", EagleEyeAreAllTrailsHidden)
    exports("EagleEyeAddParticleEffectToEntity", EagleEyeAddParticleEffectToEntity)
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
    exports("HasPlayerDamagedRecentlyAttackedPed", HasPlayerDamagedRecentlyAttackedPed)
    exports("IsSpecialAbilityEnabled", IsSpecialAbilityEnabled)
    exports("IsPlayerPromptJumpToActive", IsPlayerPromptJumpToActive)
    exports("IsPlayerSprintingOnHorseOnRoad", IsPlayerSprintingOnHorseOnRoad)
    exports("ResetDeadeyeAuraEffect", ResetDeadeyeAuraEffect)
    exports("SetDeadEyeEntityGlowIntensityWithFlag", SetDeadEyeEntityGlowIntensityWithFlag)
    exports("SetDeadEyeEntityGlowWithFlag", SetDeadEyeEntityGlowWithFlag)
    exports("SetPlayerAimWeapon", SetPlayerAimWeapon)
    exports("SetPlayerCanPickupHat", SetPlayerCanPickupHat)
    exports("SetPlayerDeadEyeAuraByHash", SetPlayerDeadEyeAuraByHash)
    exports("SetPlayerHatAccess", SetPlayerHatAccess)
    exports("SetPlayerPromptLeaveText", SetPlayerPromptLeaveText)
    exports("SetPlayerPromptMeleeText", SetPlayerPromptMeleeText)
    exports("SetPlayerCanPickupAbility", SetPlayerCanPickupAbility)
    exports("SetPlayerPromptSitText", SetPlayerPromptSitText)
    exports("SetPlayerSurrenderPromptThisFrame", SetPlayerSurrenderPromptThisFrame)
    exports("SetPlayerWeaponDrawSpeed", SetPlayerWeaponDrawSpeed)
    exports("SpecialAbilitySetActivate", SpecialAbilitySetActivate)

    -- Propset
    exports("ModifyPropSetCoordsAndHeading", ModifyPropSetCoordsAndHeading)

    -- Task
    exports("GetCoverpointFromEntityWithOffset", GetCoverpointFromEntityWithOffset)
    exports("GetScenarioPointsInArea", GetScenarioPointsInArea)
    exports("LoadCarriableConfigHash", LoadCarriableConfigHash)
    exports("HasCarriableConfigHashLoaded", HasCarriableConfigHashLoaded)
    exports("IsScenarioInUse", IsScenarioInUse)

    -- Uievents
    exports("EventsUiPeekMessage", EventsUiPeekMessage)

    -- Vehicle
    exports("AreAnyVehicleWheelsDestroyed", AreAnyVehicleWheelsDestroyed)
    exports("GetTrainTrackInfos", GetTrainTrackInfos)
    exports("SetTrainWhistleEnabled", SetTrainWhistleEnabled)

    -- Weapon
    exports("DoesPedHaveRifle", DoesPedHaveRifle)
    exports("DoesPedHaveSniper", DoesPedHaveSniper)
    exports("DoesPedHaveRepeater", DoesPedHaveRepeater)
    exports("DoesPedHaveShotgun", DoesPedHaveShotgun)
    exports("DoesPedHaveRevolver", DoesPedHaveRevolver)
    exports("DoesPedHavePistol", DoesPedHavePistol)
    exports("GetDefaultWeaponAttachPoint", GetDefaultWeaponAttachPoint)
    exports("GetNumPedsRestrainedFromWeaponBolas", GetNumPedsRestrainedFromWeaponBolas)
    exports("GetWeaponHashFromPedWeapon", GetWeaponHashFromPedWeapon)
    exports("GetWeaponHasMultipleAmmoTypes", GetWeaponHasMultipleAmmoTypes)
    exports("IsPedHoldingWeapon", IsPedHoldingWeapon)
    exports("IsWeaponCloseRange", IsWeaponCloseRange)
    exports("SetPedWeaponOnBack", SetPedWeaponOnBack)
end