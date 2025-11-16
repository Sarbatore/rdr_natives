---Returns wether the player has damaged any ped recently. [@kadir]
---@param player Player
---@param duration integer
---@return boolean
function HasPlayerDamagedRecentlyAttackedPed(player, duration)
    return Citizen.InvokeNative(0x72AD59F7B7FB6E24, player, duration) == 1
end

---Returns a list of peds that the player has damaged recently. [@kadir]
---@param player Player
---@param duration integer
---@param size integer
---@return boolean, table
function GetPedsDamagedByPlayerRecently(player, duration, size)
    local outData = DataView.ArrayBuffer((size+1)*8)
    outData:SetInt32(0*8, size)

    local res = Citizen.InvokeNative(0x1A6E84F13C952094, player, duration, outData:Buffer()) == 1
    local peds = {}
    local i = 1
    while (i <= size and DoesEntityExist(outData:GetInt32(i*8))) do
        table.insert(peds, outData:GetInt32(i*8))
        i = i + 1
    end

    return res, peds
end

---Activates the special ability for the specified player. [@kadir]
---@param player Player
function SpecialAbilitySetActivate(player)
    Citizen.InvokeNative(0xBBA140062B15A8AC, player)
end

---Shows or hides all "Pick Up" prompts for the specified player. [@kadir]
---@param player Player
---@param isVisible boolean
function SetPlayerCanPickupAbility(player, isVisible)
    Citizen.InvokeNative(0xD1A70C1E8D1031FE, player, isVisible)
end

---Sets the player's hat access. [@kadir]
---@param player Player
---@param flag integer
---@param allow boolean
function SetPlayerHatAccess(player, flag, allow)
    Citizen.InvokeNative(0xA0C683284DF027C7, player, flag, allow)
end

--- Sets the player's ability to pick up a hat. [@kadir]
---@param player Player
---@param canPickup boolean
function SetPlayerCanPickupHat(player, canPickup)
    Citizen.InvokeNative(0xACA45DDCEF6071C4, player, canPickup)
end

---Sets the player's aim weapon. [@kadir]
---@param player Player
---@param weaponHash Hash
---@param attachSlotId number
function SetPlayerAimWeapon(player, weaponHash, attachSlotId)
    Citizen.InvokeNative(0xCFFC3ECCD7A5CCEB, player, weaponHash, attachSlotId)
end

---Sets the player's surrender prompt this frame. [@kadir]
---@param player Player
---@param targetped Ped
---@param promptOrder integer
---@param unknownFlag boolean
function SetPlayerSurrenderPromptThisFrame(player, targetPed, promptOrder, unknownFlag)
    Citizen.InvokeNative(0xCBB54CC7FFFFAB86, player, targetPed, promptOrder, unknownFlag)
end

---Disables the player's interactive focus preset. [@kadir]
---@param player Player
---@param name string
function DisablePlayerInteractiveFocusPreset(player, name)
    Citizen.InvokeNative(0xC67A4910425F11F1, player, name)
end

---Sets the player's weapon draw speed.
---@param player Player
---@param weapon Hash
---@param speed float
function SetPlayerWeaponDrawSpeed(player, weapon, speed)
    Citizen.InvokeNative(0x00EB5A760638DB55, player, speed)
end

---Adds a player interactive focus preset. [@kadir]
---@param player Player
---@param ped Ped
---@param preset string
---@param x float
---@param y float
---@param z float
---@param targetEntity Entity
---@param name string
function AddPlayerInteractiveFocusPreset(player, ped, preset, x, y, z, targetEntity, name)
    Citizen.InvokeNative(0x3946FC742AC305CD, player, ped, preset, x, y, z, targetEntity, name)
end

---Gets the tracked ped id for eagle eye. [@kadir]
---@param player Player
---@return Ped
function EagleEyeGetTrackedPedId(player)
    return Citizen.InvokeNative(0x3813E11A378958A5, player, Citizen.ResultAsInteger())
end

---Returns whether all trails are hidden in eagle eye. [@kadir]
---@param player Player
---@return boolean
function EagleEyeAreAllTrailsHidden(player)
    return Citizen.InvokeNative(0xA62BBAAE67A05BB0, player) == 1
end

---Sets whether all trails are hidden in eagle eye. [@kadir]
---@param player Player
---@param hideTrails boolean
function EagleEyeSetHideAllTrails(player, hideTrails)
    Citizen.InvokeNative(0x330CA55A3647FA1C, player, hideTrails)
end

---Returns the number of dead eye marks on a ped. [@kadir]
---@param player Player
---@param ped Ped
---@return integer
function GetNumDeadeyeMarksOnPed(player, ped)
    return Citizen.InvokeNative(0x27AD7162D3FED01E, player, ped, Citizen.ResultAsInteger())
end

---Returns whether the player can focus on a track in eagle eye. [@kadir]
---@param player Player
---@return boolean
function EagleEyeCanPlayerFocusOnTrack(player)
    return Citizen.InvokeNative(0x1DA5C5B0923E1B85, player) == 1
end

---Sets the dead eye entity glow intensity with flag. [@kadir]
---@param player Player
---@param p1 float
---@param p2 float
---@param p3 float
---@param glowIntensity float
---@param flag integer
function SetDeadeyeEntityAuraIntensityWithFlag(player, p1, p2, p3, glowIntensity, flag)
    Citizen.InvokeNative(0x131E294EF60160DF, player, p1, p2, p3, glowIntensity, flag)
end

---Sets the dead eye entity glow with flag. [@kadir]
---@param player Player
---@param flag integer
function SetDeadeyeEntityGlowWithFlag(player, flag)
    Citizen.InvokeNative(0x2B12B6FC8B8772AB, player, flag)
end

---Sets the eagle eye sprint behavior. [@kadir]
---@param player Player
---@param disableSprint boolean
function EagleEyeSetSprintBehavior(player, disableSprint)
    Citizen.InvokeNative(0xCE285A4413B00B7F, player, disableSprint)
end

---Sets the player's melee prompt text. [@kadir]
---@param player Player
---@param promptText string
function SetPlayerPromptMeleeText(player, promptText)
    Citizen.InvokeNative(0x0FAF95D71ED67ADE, player, promptText)
end

---Sets the player's leave prompt text. [@kadir]
---@param player Player
---@param promptText string
function SetPlayerPromptLeaveText(player, promptText)
    Citizen.InvokeNative(0x06C3DB00B69D5435, player, promptText)
end

---Sets the player's sit prompt text. [@kadir]
---@param player Player
---@param promptText string
function SetPlayerPromptSitText(player, promptText)
    Citizen.InvokeNative(0x988C9045531B9FCE, player, promptText)
end

---Adds a player interactive focus preset at coordinates. [@kadir]
---@param player Player
---@param p1 float
---@param p2 float
---@param p3 float
---@param preset string
---@param x float
---@param y float
---@param z float
---@param targetEntity Entity
---@param name string
function AddAmbientPlayerInteractiveFocusPresetAtCoords(player, p1, p2, p3, preset, x, y, z, targetEntity, name)
    Citizen.InvokeNative(0xD48227263E3D06AE, player, p1, p2, p3, preset, x, y, z, targetEntity, name)
end

---Returns whether the player has a jump to active prompt. [@kadir]
---@param player Player
---@return boolean
function IsPlayerPromptJumpToActive(player)
    return Citizen.InvokeNative(0x2009F8AB7A5E9D6D, player) == 1
end

---Checks if the player's Deadeye ability is enabled. [@kadir]
---@param player Player
---@return boolean
function IsSpecialAbilityEnabled(player)
    return Citizen.InvokeNative(0xDE6C85975F9D4894, player) == 1
end

---Add yellow particles to the entity. [@sarbatore]
---@param entity Entity
---@param entity2 Entity
---@param p2 number
---@param p3 number
function EagleEyeAddParticleEffectToEntity(entity, entity2, p2, p3)
    Citizen.InvokeNative(0x6ECFC621A168424C, entity, entity2, p2, p3)
end

---Remove yellow particles from the entity. [@sarbatore]
---@param entity Entity
function EagleEyeRemoveParticleEffectFromEntity(entity)
    Citizen.InvokeNative(0x00B156AFEBCC5AE0, entity)
end

---Remove yellow particles from the entity. [@sarbatore]
---@param entity Entity
---@param entity2 Entity
---@param p2 number
function EagleEyeRemoveParticleEffectFromEntity_2(entity, entity2, p2)
    Citizen.InvokeNative(0xDC5E09D012D759C4, entity, entity2, p2)
end

---Enable/disable a color on the entity in eagle eye mode. [@sarbatore]
---@param entity Entity
---@param enable boolean
function EagleEyeEnableEntityGlow(entity, enable)
    Citizen.InvokeNative(0xBC02B3D151D3859F, entity, enable)
end

---Clears all Eagle Eye trails that were registered for entities associated with the specified player. [@kadir]
---@param player Player
function EagleEyeClearRegisteredTrails(player)
    Citizen.InvokeNative(0xE5D3EB37ABC1EB03, player)
end

---Return wether the player is sprinting on a road while riding a horse. [@kadir]
---@param player Player
---@return boolean
function IsPlayerSprintingOnHorseOnRoad(player)
    return Citizen.InvokeNative(0xE631EAF35828FA67, player) == 1
end


---Returns the depletion delay value for the Deadeye ability that was previously set using SetDeadeyeAbilityDepletionDelay - 0x870634493CB4372C. Provides a float value representing the delay, allowing the game to retrieve the current Deadeye depletion setting for a specific player. [@kadir]
---@param player Player
---@return number
function GetDeadeyeAbilityDepletionDelay(player)
    return Citizen.InvokeNative(0xE92261BD28C0878F, player)
end

---Clears the intensity of aura effects applied to entities for a specific player in Deadeye mode based on a flag parameter. Used to reset any intensity modifications set by _SET_DEADEYE_ENTITY_AURA_INTENSITY_WITH_FLAG - 0x131E294EF60160DF, restoring affected entities' aura intensity to their default state. [@kadir]
---@param player Player
function ClearDeadeyeAuraIntensityWithFlag(player)
    Citizen.InvokeNative(0x0E9057A9DA78D0F8, player)
end

---Resets any aura effects applied to entities for a specific player in Deadeye mode, returning all aura-related visuals to their default state. Primarily used to remove any highlighting or aura effects set by _SET_DEADEYE_ENTITY_AURA_WITH_FLAG - 0x2B12B6FC8B8772AB and _SET_DEADEYE_ENTITY_AURA_INTENSITY_WITH_FLAG - 0x131E294EF60160DF. [@kadir]
---@param player Player
function ResetDeadeyeAuraEffect(player)
    Citizen.InvokeNative(0xE910932F4B30BE23, player)
end

---Sets the aura color for entities that the player can target in Deadeye mode, based on a specific hash value. [@kadir]
---@param player Player
---@param auraColorHash Hash
function SetPlayerDeadeyeAuraByHash(player, auraColorHash)
    Citizen.InvokeNative(0x768E81AE285A4B67, player, auraColorHash)
end

---Gets the entity the player is aiming at with/without weapon. [@sarbatore]
---@param player Player
---@return Entity
function GetPlayerInteractionAimEntity(player)
    return Citizen.InvokeNative(0xBEA3A6E5F5F79A6F, player, Citizen.PointerValueInt())
end

---
---@param player Player
---@return boolean, Entity
function N_0X7AE93C45EC14A166(player)
    local outEntity = DataView.ArrayBuffer(1*8)

    local res = Citizen.InvokeNative(0x7AE93C45EC14A166, player, outEntity:Buffer()) == 1
    local entity = outEntity:GetInt32(0)

    return res, entity
end