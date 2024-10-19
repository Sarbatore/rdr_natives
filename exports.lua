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
    exports("SetBlipIconLockonEntityPrompt", SetBlipIconLockonEntityPrompt)
    exports("ClearExistingBlipFromLockonEntityPrompt", ClearExistingBlipFromLockonEntityPrompt)
    exports("SetExistingBlipLockonEntityPrompt", SetExistingBlipLockonEntityPrompt)

    -- Ped
    exports("ApplyPedDamagePackToBone", ApplyPedDamagePackToBone)
    exports("ApplyColdToPed", ApplyColdToPed)
    exports("GetNumReservedStamina", GetNumReservedStamina)
    exports("HasPedBeenShotByPlayerRecently", HasPedBeenShotByPlayerRecently)
    exports("HasPedInteractedWithPlayerRecently", HasPedInteractedWithPlayerRecently)

    -- Player
    exports("AddPlayerInteractiveFocusPreset", AddPlayerInteractiveFocusPreset)
    exports("AddPlayerInteractiveFocusPresetAtCoords", AddPlayerInteractiveFocusPresetAtCoords)
    exports("CanPlayerFocusOnTrackInEagleEye", CanPlayerFocusOnTrackInEagleEye)
    exports("DisablePlayerInteractiveFocusPreset", DisablePlayerInteractiveFocusPreset)
    exports("EagleEyeAreAllTrailsHidden", EagleEyeAreAllTrailsHidden)
    exports("EagleEyeAddParticleEffectToEntity", EagleEyeAddParticleEffectToEntity)
    exports("EagleEyeGetTrackedPedId", EagleEyeGetTrackedPedId)
    exports("EagleEyeRemoveParticleEffectFromEntity", EagleEyeRemoveParticleEffectFromEntity)
    exports("EagleEyeSetHideAllTrails", EagleEyeSetHideAllTrails)
    exports("EagleEyeSetRegisteredEntityGlow", EagleEyeSetRegisteredEntityGlow)
    exports("EagleEyeSetSprintBehavior", EagleEyeSetSprintBehavior)
    exports("GetNumDeadEyeMarksOnPed", GetNumDeadEyeMarksOnPed)
    exports("GetRecentlyAttackedPedsInCombo", GetRecentlyAttackedPedsInCombo)
    exports("HasPlayerDamagedRecentlyAttackedPed", HasPlayerDamagedRecentlyAttackedPed)
    exports("IsDeadEyeAbilityEnabled", IsDeadEyeAbilityEnabled)
    exports("IsPlayerPromptJumpToActive", IsPlayerPromptJumpToActive)
    exports("SetDeadEyeEntityGlowIntensityWithFlag", SetDeadEyeEntityGlowIntensityWithFlag)
    exports("SetDeadEyeEntityGlowWithFlag", SetDeadEyeEntityGlowWithFlag)
    exports("SetPlayerAimWeapon", SetPlayerAimWeapon)
    exports("SetPlayerCanPickupHat", SetPlayerCanPickupHat)
    exports("SetPlayerHatAccess", SetPlayerHatAccess)
    exports("SetPlayerLeavePromptText", SetPlayerLeavePromptText)
    exports("SetPlayerMeleePromptText", SetPlayerMeleePromptText)
    exports("SetPlayerPickupPromptVisible", SetPlayerPickupPromptVisible)
    exports("SetPlayerSitPromptText", SetPlayerSitPromptText)
    exports("SetPlayerSurrenderPromptThisFrame", SetPlayerSurrenderPromptThisFrame)
    exports("SetPlayerWeaponDrawSpeed", SetPlayerWeaponDrawSpeed)
    exports("SpecialAbilitySetActivate", SpecialAbilitySetActivate)

    -- Task
    exports("GetCoverpointFromEntityWithOffset", GetCoverpointFromEntityWithOffset)
    exports("GetScenarioPointsInArea", GetScenarioPointsInArea)
    exports("LoadCarriableConfigHash", LoadCarriableConfigHash)
    exports("HasCarriableConfigHashLoaded", HasCarriableConfigHashLoaded)

    -- Uievents
    exports("EventsUiPeekMessage", EventsUiPeekMessage)

    -- Vehicle
    exports("GetTrainTrackInfos", GetTrainTrackInfos)

    -- Weapon
    exports("GetNumPedsRestrainedFromWeaponBolas", GetNumPedsRestrainedFromWeaponBolas)
    exports("GetWeaponHashFromPedWeapon", GetWeaponHashFromPedWeapon)
    exports("IsWeaponCloseRange", IsWeaponCloseRange)
    exports("SetPedWeaponOnBack", SetPedWeaponOnBack)
end