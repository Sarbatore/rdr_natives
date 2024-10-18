---Returns wether the player has damaged any ped recently [@kadir]
---@param player number
---@param duration number
---@return boolean
function HasPlayerDamagedRecentlyAttackedPed(player, duration)
    return Citizen.InvokeNative(0x72AD59F7B7FB6E24, player, duration)
end

---Returns a list of peds that the player has damaged recently [@kadir]
---@param player number
---@param duration number
---@param size number
---@return boolean, ?table
function GetRecentlyAttackedPedsInCombo(player, duration, size)
    local DataStruct = DataView.ArrayBuffer(size*8)

    if (Citizen.InvokeNative(0x1A6E84F13C952094, player, duration, DataStruct:Buffer())) then
        local peds = {}
        for i=1, size do
            local ped = DataStruct:GetInt32(i*8)
            if (DoesEntityExist(ped)) then
                for _, p in ipairs(peds) do
                    if (p ~= ped) then
                        table.insert(peds, ped)
                    end
                end
            end
        end
        return true, peds
    end

    return false
end

---Activates the special ability for the specified player. [@kadir]
---@param player number
function SpecialAbilitySetActivate(player)
    Citizen.InvokeNative(0xBBA140062B15A8AC, player)
end

---Shows or hides all "Pick Up" prompts for the specified player. [@kadir]
---@param player number
---@param isVisible boolean
function SetPlayerPickupPromptVisible(player, isVisible)
    Citizen.InvokeNative(0xD1A70C1E8D1031FE, player, isVisible)
end

---Sets the player's hat access [@kadir]
---@param player number
---@param flag number
---@param allow boolean
function SetPlayerHatAccess(player, flag, allow)
    Citizen.InvokeNative(0xA0C683284DF027C7, player, flag, allow)
end

--- Sets the player's ability to pick up a hat [@kadir]
---@param player number
---@param canPickup boolean
function SetPlayerCanPickupHat(player, canPickup)
    Citizen.InvokeNative(0xACA45DDCEF6071C4, player, canPickup)
end

---Sets the player's aim weapon [@kadir]
---@param player number
---@param weaponHash number
---@param attachSlotId number
function SetPlayerAimWeapon(player, weaponHash, attachSlotId)
    Citizen.InvokeNative(0xCFFC3ECCD7A5CCEB, player, weaponHash, attachSlotId)
end

---Sets the player's surrender prompt this frame [@kadir]
---@param player number
---@param targetPed number
---@param promptOrder number
---@param unknownFlag boolean
function SetPlayerSurrenderPromptThisFrame(player, targetPed, promptOrder, unknownFlag)
    Citizen.InvokeNative(0xCBB54CC7FFFFAB86, player, targetPed, promptOrder, unknownFlag)
end

---Disables the player's interactive focus preset [@kadir]
---@param player number
---@param name string
function DisablePlayerInteractiveFocusPreset(player, name)
    Citizen.InvokeNative(0xC67A4910425F11F1, player, name)
end

---Sets the player's weapon draw speed
---@param player number
---@param weapon hash
---@param speed number
function SetPlayerWeaponDrawSpeed(player, weapon, speed)
    Citizen.InvokeNative(0x00EB5A760638DB55, player, speed)
end

---Adds a player interactive focus preset [@kadir]
---@param player number
---@param ped number
---@param preset string
---@param x number
---@param y number
---@param z number
---@param targetEntity number
---@param name string
function AddPlayerInteractiveFocusPreset(player, ped, preset, x, y, z, targetEntity, name)
    Citizen.InvokeNative(0x3946FC742AC305CD, player, ped, preset, x, y, z, targetEntity, name)
end

---Gets the tracked ped id for eagle eye [@kadir]
---@param player number
---@return number
function EagleEyeGetTrackedPedId(player)
    return Citizen.InvokeNative(0x3813E11A378958A5, player)
end

---Returns whether all trails are hidden in eagle eye [@kadir]
---@param player number
---@return boolean
function EagleEyeAreAllTrailsHidden(player)
    return Citizen.InvokeNative(0xA62BBAAE67A05BB0, player)
end

---Sets whether all trails are hidden in eagle eye [@kadir]
---@param player number
---@param hideTrails boolean
function EagleEyeSetHideAllTrails(player, hideTrails)
    Citizen.InvokeNative(0x330CA55A3647FA1C, player, hideTrails)
end

---Returns the number of dead eye marks on a ped [@kadir]
---@param player number
---@param ped number
---@return number
function GetNumDeadEyeMarksOnPed(player, ped)
    return Citizen.InvokeNative(0x27AD7162D3FED01E, player, ped)
end

---Returns whether the player can focus on a track in eagle eye [@kadir]
---@param player number
---@return boolean
function CanPlayerFocusOnTrackInEagleEye(player)
    return Citizen.InvokeNative(0x1DA5C5B0923E1B85, player)
end

---Sets the dead eye entity glow intensity with flag [@kadir]
---@param player number
---@param param2 number
---@param param3 number
---@param param4 number
---@param glowIntensity number
---@param flag number
function SetDeadEyeEntityGlowIntensityWithFlag(player, param2, param3, param4, glowIntensity, flag)
    Citizen.InvokeNative(0x131E294EF60160DF, player, param2, param3, param4, glowIntensity, flag)
end

---Sets the dead eye entity glow with flag [@kadir]
---@param player number
---@param flag number
function SetDeadEyeEntityGlowWithFlag(player, flag)
    Citizen.InvokeNative(0x2B12B6FC8B8772AB, player, flag)
end

---Sets the eagle eye sprint behavior [@kadir]
---@param player number
---@param disableSprint boolean
function EagleEyeSetSprintBehavior(player, disableSprint)
    Citizen.InvokeNative(0xCE285A4413B00B7F, player, disableSprint)
end

---Sets the player's melee prompt text [@kadir]
---@param player number
---@param promptText string
function SetPlayerMeleePromptText(player, promptText)
    Citizen.InvokeNative(0x0FAF95D71ED67ADE, player, promptText)
end

---Sets the player's leave prompt text [@kadir]
---@param player number
---@param promptText string
function SetPlayerLeavePromptText(player, promptText)
    Citizen.InvokeNative(0x06C3DB00B69D5435, player, promptText)
end

---Sets the player's sit prompt text [@kadir]
---@param player number
---@param promptText string
function SetPlayerSitPromptText(player, promptText)
    Citizen.InvokeNative(0x988C9045531B9FCE, player, promptText)
end