if (IsDuplicityVersion()) then

else
    -- Audio
    exports("GetAmbientSpeechParamsBuffer", GetAmbientSpeechParamsBuffer)
    exports("PlayPedAmbientSpeech", PlayPedAmbientSpeech)
    exports("PlayAmbientSpeechFromPosition", PlayAmbientSpeechFromPosition)

    -- Inventory
    exports("ApplyPedWeaponStatsToStatsEntryId", ApplyPedWeaponStatsToStatsEntryId)
    exports("GetContainerEffectsEntryId", GetContainerEffectsEntryId)
    exports("GetContainerStatsEntryId", GetContainerStatsEntryId)
    exports("GetCharacterInventoryGuid", GetCharacterInventoryGuid) -- Not a native
    exports("GetWardrobeInventoryGuid", GetWardrobeInventoryGuid) -- Not a native
    exports("GetWeaponInventoryGuid", GetWeaponInventoryGuid) -- Not a native
    exports("GetWeaponStatsGuid", GetWeaponStatsGuid) -- Not a native
    exports("InventoryGetGuidFromItemid", InventoryGetGuidFromItemid)
    exports("InventoryGetInventoryItemInspectionInfo", InventoryGetInventoryItemInspectionInfo)

    -- Itemdatabase
    exports("ItemdatabaseFilloutItemEffectIdInfo", ItemdatabaseFilloutItemEffectIdInfo)
    exports("ItemdatabaseFilloutItemEffectIds", ItemdatabaseFilloutItemEffectIds)
    exports("ItemdatabaseFilloutItemInfo", ItemdatabaseFilloutItemInfo)

    -- Map
    exports("SetBlipIconLockonEntityPrompt", SetBlipIconLockonEntityPrompt)
    exports("ClearExistingBlipFromLockonEntityPrompt", ClearExistingBlipFromLockonEntityPrompt)
    exports("SetExistingBlipLockonEntityPrompt", SetExistingBlipLockonEntityPrompt)

    -- Player
    exports("AddPlayerInteractiveFocusPreset", AddPlayerInteractiveFocusPreset)
    exports("CanPlayerFocusOnTrackInEagleEye", CanPlayerFocusOnTrackInEagleEye)
    exports("DisablePlayerInteractiveFocusPreset", DisablePlayerInteractiveFocusPreset)
    exports("EagleEyeGetTrackedPedId", EagleEyeGetTrackedPedId)
    exports("EagleEyeAreAllTrailsHidden", EagleEyeAreAllTrailsHidden)
    exports("EagleEyeSetHideAllTrails", EagleEyeSetHideAllTrails)
    exports("EagleEyeSetSprintBehavior", EagleEyeSetSprintBehavior)
    exports("GetNumDeadEyeMarksOnPed", GetNumDeadEyeMarksOnPed)
    exports("GetRecentlyAttackedPedsInCombo", GetRecentlyAttackedPedsInCombo)
    exports("HasPlayerDamagedRecentlyAttackedPed", HasPlayerDamagedRecentlyAttackedPed)
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
    exports("GetScenarioPointsInArea", GetScenarioPointsInArea)
    exports("LoadCarriableConfigHash", LoadCarriableConfigHash)
    exports("HasCarriableConfigHashLoaded", HasCarriableConfigHashLoaded)

    -- Uievents
    exports("EventsUiPeekMessage", EventsUiPeekMessage)

    -- Vehicle
    exports("GetTrainTrackInfos", GetTrainTrackInfos)
end