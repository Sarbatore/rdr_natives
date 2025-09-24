---Returns whether a ped has been shot by a player recently. [@outsider]
---@param player number
---@param ped Ped
---@param duration number
---@return bool
function HasPedBeenShotByPlayerRecently(player, ped, duration)
    return Citizen.InvokeNative(0x9C81338B2E62CE0A, player, ped, duration)
end

---Apply a damagePack to a ped bone index. [@sarbatore]
---@param ped Ped
---@param boneIndex number
---@param x number
---@param y number
---@param z number
---@param xRot number
---@param yRot number
---@param zRot number
---@param damagePack string
function ApplyPedDamagePackToBone(ped, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, damagePack)
    Citizen.InvokeNative(0x58D32261AE0F0843, ped, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, damagePack)
end

---Set ped cold from 0.0 to 1.0. [@sarbatore]
---@param ped Ped
---@param intensity number
---@param p2 number
function ApplyColdToPed(ped, intensity, p2)
    Citizen.InvokeNative(0x1F8215D0E446F593, ped, intensity, p2)
end

---Returns the number of reserved stamina. [@outsider]
---@param ped Ped
---@return number
function GetNumReservedStamina(ped)
    return Citizen.InvokeNative(0xFC3B580C4380B5B7, ped)
end

---Return wether a ped has interacted with a player recently. [@sarbatore]
---@param ped Ped
---@param player number
---@param interactionFlag number
---@param duration number
---@return bool
function HasPedInteractedWithPlayerRecently(ped, player, interactionFlag, duration)
    return Citizen.InvokeNative(0x947E43F544B6AB34, ped, player, interactionFlag, duration)
end

---Returns whether a ped is afloat in water like swimming or in a boat (driving or standing on it). [@outsider]
---@param ped Ped
---@return bool
function IsPedAfloat(ped)
    return Citizen.InvokeNative(0xDC88D06719070C39, ped)
end

---Only works when you use SET_PED_WETNESS_HEIGHT first , if you do 0.0 or it dries naturally
---@param ped Ped
---@param amount number
function SetPedWetness(ped, amount)
    Citizen.InvokeNative(0xF9CFF5BB70E8A2CB, ped, amount)
end