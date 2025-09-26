---Returns whether a ped has been shot by a player recently. [@outsider]
---@param player Player
---@param ped Ped
---@param duration number
---@return boolean
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
---@param player Player
---@param interactionFlag number
---@param duration number
---@return boolean
function HasPedInteractedWithPlayerRecently(ped, player, interactionFlag, duration)
    return Citizen.InvokeNative(0x947E43F544B6AB34, ped, player, interactionFlag, duration)
end

---Returns whether a ped is afloat in water like swimming or in a boat (driving or standing on it). [@outsider]
---@param ped Ped
---@return boolean
function IsPedAfloat(ped)
    return Citizen.InvokeNative(0xDC88D06719070C39, ped)
end

---Only works when you use SET_PED_WETNESS_HEIGHT first , if you do 0.0 or it dries naturally
---@param ped Ped
---@param amount number
function SetPedWetness(ped, amount)
    Citizen.InvokeNative(0xF9CFF5BB70E8A2CB, ped, amount)
end

---Requests the carrying state of a ped, unk3 is usually 4. [@sarbatore]
--[[
Status:
INVALID = 0,
STARTING = 1,
PROGRESSING = 2,
FINISHING = 3

CARRYING TYPES:
UNK_0 = -1,
UNK_1 = 0,
UNK_2 = 1,
UNK_3 = 2,
UNK_4 = 3,
CARRYING_FROM_GROUND = 4,
CARRYING_FROM_MOUNT = 5,
PUTTING_DOWN_GROUND = 6,
PUTTING_DOWN_MOUNT = 7,
UNK_9 = 8,
UNK_10 = 9,
UNK_11 = 10

Filters:
ENTITY_ONLY = 0,
NOTHING = 1,
ENTITY_AND_TAKEN_FROM_ENTITY = 2
]]
---@param ped Ped
---@param carryingType integer
---@param unk3 integer
---@param filter integer
---@return integer, Entity, Entity
function RequestPedCarryingState(ped, carryingType, unk3, filter)
    local struct = DataView.ArrayBuffer(2*8)
    local res = Citizen.InvokeNative(0x4642182A298187D0, ped, carryingType, struct:Buffer(), unk3, filter, Citizen.ResultAsInteger())
    local carriedEntity = struct:GetInt32(0*8)
    local takenFromEntity = struct:GetInt32(1*8)

    return res, carriedEntity, takenFromEntity
end

---Return the number of loot items for a ped carcass of given model, damage cleanliness and skinning quality. The first index of the buffer is required, it's the max size of loot (always 15 in R* scripts) outLoot is an array of loot hash, its size is returned by the native (it starts at the index 1).. [@sarbatore]
---@param struct DataView.ArrayBuffer
---@param model Hash
---@param damageCleanliness integer
---@param skinningQuality integer
---@return integer
function ComputeLootForPedCarcass(struct, model, damageCleanliness, skinningQuality)
    return Citizen.InvokeNative(0xB29C553BA582D09E, struct:Buffer(), model, damageCleanliness, skinningQuality, Citizen.ResultAsInteger())
end

---Return wheter a ped is heard by a target ped. Usually flag is set to false when the ped is in stealth mode. [@sarbatore]
---@param ped Ped
---@param target Ped
---@param flag boolean
---@return boolean
function CanPedBeHeard(ped, target, flag)
    return Citizen.InvokeNative(0x0EA9EACBA3B01601, ped, target, flag, Citizen.ResultAsInteger()) == 1
end