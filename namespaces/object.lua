---Returns true if the model hash is a portable pickup its used before creating a portable pick up for example.
---@param model Hash
---@return boolean
function IsModelAPortablePickup(model)
    return Citizen.InvokeNative(0x20135AF9C10D2A3D, model) == 1
end

---Returns the number of breakable fragments (indexed sections) defined for the specified object.
---@param object integer
---@return integer
function GetObjectFragmentCount(object)
    return Citizen.InvokeNative(0x58DE624FA7FB0E7F, object, Citizen.ResultAsInteger())
end

---Damages or breaks a specific predefined fragment/section of an object using the provided fragment index.
---@param object integer
---@param index integer
function DamageObjectFragmentByIndex(object, index)
    Citizen.InvokeNative(0xAAACF33CBF9B990A, object, index)
end

---
---@param object integer
---@param teamId integer
---@return boolean
function IsPickupPickableForTeam(object, teamId)
    return Citizen.InvokeNative(0x9F52AD67D1A91BAD, object, teamId) == 1
end

---Checks whether a specific door-related action/state flag is active for the given door object.
---Observed behavior:
---- flag 32: returns true when the door is being kicked (kick action event)
---- flag 23: returns true if the door has been previously opened by kicking (post-kick state)
---- flag 8:  returns true when attempting to open the door while it is locked
---@param doorObject integer
---@param flag integer
---@return boolean
function CheckDoorActionFlag(doorObject, flag)
    return Citizen.InvokeNative(0x0943113E02322164, doorObject, flag) == 1
end

---Returns the player who forced the specified door open using physical interaction.
---@param doorHash integer
---@return integer playerId
function GetForcedOpenPlayer(doorHash)
    return Citizen.InvokeNative(0xEBA314768FB35D58, doorHash, Citizen.ResultAsInteger())
end

---Changes the interaction behavior for a locked door.
---@param doorHash integer
---@param toggle boolean
function SetDoorKnockingWhenLocked(doorHash, toggle)
    Citizen.InvokeNative(0xA93F925F1942E434, doorHash, toggle)
end

function GetClosestObjectOfType(x, y, z, radius, modelHash)
    local itemset = CreateItemset(true)

    if (not IsItemsetValid(itemset)) then
        return 0
    end

    local itemSetSize = GetEntitiesNearPoint(x, y, z, radius, itemset, 3)
    local nearestEntity = 0
    local nearestDistance = math.huge

    for i = 0, itemSetSize - 1 do
        local entity = GetObjectFromIndexedItem(GetIndexedItemInItemset(i, itemset))
        if (modelHash == 0 or GetEntityModel(entity) == modelHash) then
            local coords = GetEntityCoords(entity)
            local distance = Vdist(x, y, z, coords.x, coords.y, coords.z)
            if (distance < nearestDistance) then
                nearestDistance = distance
                nearestEntity = entity
            end
        end
    end
    
    if (IsItemsetValid(itemset)) then
        DestroyItemset(itemset)
    end

    return nearestEntity
end

---@param p0 Any
---@return integer
function N_0X08C5825A2932EA7B(p0)
    return Citizen.InvokeNative(0x08C5825A2932EA7B, p0, Citizen.ResultAsInteger())
end

---@param object Object
---@return integer
function N_0X250EBB11E81A10BE(object)
    return Citizen.InvokeNative(0X250EBB11E81A10BE, object, Citizen.ResultAsInteger())
end

---@param p0 Any
---@return boolean
function N_0X2BF1953C0C21AC88(p0)
    return Citizen.InvokeNative(0X2BF1953C0C21AC88, p0) == 1
end

---@param p0 Any
---@return integer
function N_0X7D4411D6736CD295(p0)
    return Citizen.InvokeNative(0X7D4411D6736CD295, p0, Citizen.PointerValueInt())
end

---@param player Player
---@return integer
function N_0X3E2616E7EA539480(player)
    return Citizen.InvokeNative(0X3E2616E7EA539480, player, Citizen.ResultAsInteger())
end

---@param object Object
---@param p1 float
function N_0XCBFBD38F2E0A263B(object, p1)
    return Citizen.InvokeNative(0XCBFBD38F2E0A263B, object, p1)
end