---
---@param item number
---@param guid
---@param slotId number
---@return boolean, ?table
function InventoryGetGuidFromItemid(guid, item, slotId)
	local DataStruct = DataView.ArrayBuffer(13*8)
    if (Citizen.InvokeNative(0x886DFD3E185C8A89, 1, guid, item, slotId, DataStruct:Buffer())) then
        return true, DataStruct:Buffer()
    end

    return false
end

---
---@param item hash
---@return boolean, ?hash
function InventoryGetInventoryItemInspectionInfo(item)
    local DataStruct = DataView.ArrayBuffer(256)
    DataStruct:SetInt32(3*8, -1)
    DataStruct:SetInt32(12*8, 4)
    DataStruct:SetInt32(17*8, 4)

    if (Citizen.InvokeNative(0x0C093C1787F18519, item, DataStruct:Buffer())) then
        local model = DataStruct:GetInt32(0*8)

        return true, model
    end

    return false
end

--- Returns the effects entry id for "CatalogItemInspection" container [@sarbatore]
---@param entryId number
---@param name string
---@param p2 boolean
---@param p3 boolean
---@return number
function InventoryGetCatalogItemInspectionEffectsEntry(entryId, name, p2, p3)
    return Citizen.InvokeNative(0x9D21B185ABC2DBC4, entryId, name, p1, p2)
end

--- Returns the stats entry id for "CatalogItemInspection" container [@sarbatore]
---@param entryId number
---@param name string
---@param p2 number
---@param playerId number
---@return number
function InventoryGetCatalogItemInspectionStatsEntry(entryId, name, p2, playerId)
    return Citizen.InvokeNative(0x9D21B185ABC2DBC5, entryId, name, p2, playerId)
end

--- Applies the weapon stats to the stats entry id [@sarbatore]
---@param entryId number
---@param weapon hash
---@param ped Ped
function InventoryApplyWeaponStatsToEntry(entryId, weapon, ped)
    Citizen.InvokeNative(0x75CFAC49301E134E, entryId, weapon, ped)
end