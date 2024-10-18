---Returns whether a ped has been shot by a player recently. [@outsider]
---@param player number
---@param ped number
---@param duration number
---@return boolean
function HasPedBeenShotByPlayerRecently(player, ped, duration)
    return Citizen.InvokeNative(0x9C81338B2E62CE0A, player, ped, duration)
end

---Apply a damagePack to a ped bone index. [@sarbatore]
---@param ped number
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
---@param ped number
---@param intensity number
---@param p2 number
function ApplyColdToPed(ped, intensity, p2)
    Citizen.InvokeNative(0x1F8215D0E446F593, ped, intensity, p2)
end

---Returns the number of reserved stamina. [@outsider]
---@param ped number
---@return number
function GetNumReservedStamina(ped)
    return Citizen.InvokeNative(0xFC3B580C4380B5B7, ped)
end

---Returns the number of peds that were restrained with the weapon thrown bolas. [@outsider]
---@param ped number
---@return number
function GetNumPedsRestrainedFromWeaponBolas(ped)
    return Citizen.InvokeNative(0x46D42883E873C1D7, ped)
end