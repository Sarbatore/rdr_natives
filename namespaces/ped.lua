---Returns whether a ped has been shot by a player recently. [@outsider]
---@param player Player
---@param ped Ped
---@param duration integer
---@return boolean
function HasPedBeenShotByPlayerRecently(player, ped, duration)
    return Citizen.InvokeNative(0x9C81338B2E62CE0A, player, ped, duration) == 1
end

---Apply a damagePack to a ped bone index. [@sarbatore]
---@param ped Ped
---@param boneIndex integer
---@param xOffset float
---@param yOffset float
---@param zOffset float
---@param xRot float
---@param yRot float
---@param zRot float
---@param damagePack string
function ApplyPedDamagePackToBone(ped, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, damagePack)
    Citizen.InvokeNative(0x58D32261AE0F0843, ped, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, damagePack)
end

---Set ped cold from 0.0 to 1.0. [@sarbatore]
---@param ped Ped
---@param intensity float
---@param p2 number
function ApplyColdToPed(ped, intensity, p2)
    Citizen.InvokeNative(0x1F8215D0E446F593, ped, intensity, p2)
end

---Returns the number of reserved stamina. [@outsider]
---@param ped Ped
---@return integer
function GetNumReservedStamina(ped)
    return Citizen.InvokeNative(0xFC3B580C4380B5B7, ped, Citizen.ResultAsInteger())
end

---Return wether a ped has interacted with a player recently. [@sarbatore]
---@param ped Ped
---@param player Player
---@param flag integer
---@param duration integer
---@return boolean
function HasPedInteractedWithPlayerRecently(ped, player, flag, duration)
    return Citizen.InvokeNative(0x947E43F544B6AB34, ped, player, flag, duration) == 1
end

---Returns whether a ped is afloat in water like swimming or in a boat (driving or standing on it). [@outsider]
---@param ped Ped
---@return boolean
function IsPedAfloat(ped)
    return Citizen.InvokeNative(0xDC88D06719070C39, ped) == 1
end

---Only works when you use SET_PED_WETNESS_HEIGHT first , if you do 0.0 or it dries naturally
---@param ped Ped
---@param amount float
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
function RequestCarryingStateForPed(ped, carryingType, unk3, filter)
    local outData = DataView.ArrayBuffer(2*8)
    
    local res = Citizen.InvokeNative(0x4642182A298187D0, ped, carryingType, outData:Buffer(), unk3, filter, Citizen.ResultAsInteger())
    local carriedEntity = outData:GetInt32(0*8)
    local takenFromEntity = outData:GetInt32(1*8)

    return res, carriedEntity, takenFromEntity
end

---Return the number of loot items for a ped carcass of given model, damage cleanliness and skinning quality. The first index of the buffer is required, it's the max size of loot (always 15 in R* scripts) outLoot is an array of loot hash, its size is returned by the native (it starts at the index 1).. [@sarbatore]
---@param model Hash
---@param damageCleanliness integer
---@param skinningQuality integer
---@return integer, table
function ComputeLootForPedCarcass(model, damageCleanliness, skinningQuality, size)
    size = size or 1
    local outData = DataView.ArrayBuffer((size+1)*8)
    outData:SetInt32(0*8, size)
    
    local numLoots = Citizen.InvokeNative(0xB29C553BA582D09E, outData:Buffer(), model, damageCleanliness, skinningQuality, Citizen.ResultAsInteger())
    local loots = {}
    if (numLoots > 0) then
        for i = 1, numLoots do
            table.insert(loots, outData:GetInt32(i*8))
        end
    end

    return numLoots, loots
end

---Return wheter a ped is heard by a target ped. Usually flag is set to false when the ped is in stealth mode. [@sarbatore]
---@param target Ped
---@param ped Ped
---@param flag boolean
---@return boolean
function CanPedHearTargetPed(target, ped, flag)
    return Citizen.InvokeNative(0x0EA9EACBA3B01601, target, ped, flag) == 1
end

---Plays a conditional locomotion animation with an attached prop item. [@sarbatore]
---@param ped Ped
---@param targetEntity Entity
---@param propItemId string
---@param conditionalAnimName string
function PlayConditionalAnimWithPropItem(ped, targetEntity, propItemId, conditionalAnimName)
    Citizen.InvokeNative(0xCE7A6C1D5CDE1F9D, ped, targetEntity, propItemId, conditionalAnimName)
end

---Stops and clears a running conditional locomotion animation previously started by PlayConditionalAnimWithPropItem. [@sarbatore]
---@param ped Ped
---@param propItemId string
function RemovePedPropItemConditionalAnim(ped, propItemId)
    Citizen.InvokeNative(0x3A50753042B6891B, ped, propItemId)
end

---Returns the carried ped for the specified ped.
---@param ped Ped
---@param p1 integer
---@param p2 boolean
---@return Ped
function RefreshCarriedPedForPed(ped, p1, p2)
    return Citizen.InvokeNative(0X6B67320E0D57856A, ped, Citizen.PointerValueInt(), p1, p2)
end

---Return the ped move blend ratio corresponding to the specified speed.
---@param ped Ped
---@param speed float
---@return float
function ComputeSpeedForPedMoveBlendRatio(ped, speed)
    return Citizen.InvokeNative(0xCA95924C893A0C91, ped, speed, Citizen.ResultAsFloat())
end

---Return an estimated max speed (m/s) for the ped move blend ratio. Move blend ratio is in a range of 0.0-3.0
---@param ped Ped
---@param moveBlendRatio float
---@return float
function ComputePedMoveBlendRatioForMaxSpeed(ped, moveBlendRatio)
    return Citizen.InvokeNative(0x46BF2A810679D6E6, ped, moveBlendRatio, Citizen.ResultAsFloat())
end

---Returns the ped dirt level
---@param ped Ped
---@param p1 integer
---@return float
function GetPedDirtLevel(ped, p1)
    return Citizen.InvokeNative(0x0105FEE8F9091255, ped, p1, Citizen.ResultAsFloat())
end

---Returns information about the carried attached entity for the specified carriable slot.
---@param ped Ped
---@param carriableSlot integer
---@return boolean, Hash, Hash, Entity
function GetCarriedAttachedInfoForSlot(ped, carriableSlot)
    local outData = DataView.ArrayBuffer(4*8)

    local res         = Citizen.InvokeNative(0x608BC6A6AACD5036, outData:Buffer(), ped, carriableSlot, 0) == 1
    local model       = outData:GetInt32(0*8)
    local carryConfig = outData:GetInt32(1*8)
    local entity      = outData:GetInt32(3*8)

    return res, model, carryConfig, entity
end

---
---@param ped Ped
---@param size integer
---@return boolean, table
function GetPedNearbyVehicles(ped, size)
    local outData = DataView.ArrayBuffer(16*8)
    outData:SetInt32(0*8, size or 3)

    local res = Citizen.InvokeNative(0xCFF869CBFA210D82, ped, outData:Buffer()) == 1
    local numVehicles = outData:GetInt32(0*8)
    local vehicles = {}
    if (numVehicles > 0) then
        for i = 1, numVehicles do
            table.insert(vehicles, outData:GetInt32(i*8))
        end
    end

    return res, vehicles
end

--[[

TO DISCOVER:

]]

---
---@param ped Ped
---@return boolean
function N_0X7EE3A8660F38797E(ped)
    return Citizen.InvokeNative(0X7EE3A8660F38797E, ped) == 1
end

---
---@param ped Ped
---@return boolean
function N_0X758F081DB204DDDE(ped)
    return Citizen.InvokeNative(0X758F081DB204DDDE, ped) == 1
end

---
---@param ped Ped
---@param p1 integer
---@return integer
function N_0xE76687023D8C8505(ped, p1)
    return Citizen.InvokeNative(0xE76687023D8C8505, ped, p1, Citizen.ResultAsInteger())
end

---
---@param ped Ped
---@return boolean
function N_0X12EB4E31F092C9B3(ped)
    return Citizen.InvokeNative(0X12EB4E31F092C9B3, ped) == 1
end

---
---@param ped Ped
---@return integer
function N_0XA31D350D66FA1855(ped)
    return Citizen.InvokeNative(0XA31D350D66FA1855, ped, Citizen.ResultAsInteger())
end

---
---@param ped Ped
---@return float
function N_0X900CA00CE703E1E2(ped)
    return Citizen.InvokeNative(0X900CA00CE703E1E2, ped, Citizen.ResultAsFloat())
end

---
---@param ped Ped
---@return float
function N_0X2BA9D7BF629F920C(ped)
    return Citizen.InvokeNative(0X2BA9D7BF629F920C, ped, Citizen.ResultAsFloat())
end

---
---@param ped Ped
---@return Ped
function N_0X4B19F171450E0D4F(ped)
    return Citizen.InvokeNative(0X4B19F171450E0D4F, ped, Citizen.ResultAsInteger())
end

---
---@param ped Ped
---@return boolean
function N_0x88A5564B19C15391(ped)
    return Citizen.InvokeNative(0x88A5564B19C15391, ped) == 1
end

---
---@param ped Ped
---@param p1 Ped
function N_0X34EDDD59364AD74A(ped, p1)
    local data = DataView.ArrayBuffer(1*8)
    data:SetInt32(0*8, p1)
    Citizen.InvokeNative(0X34EDDD59364AD74A, ped, data:Buffer())
end