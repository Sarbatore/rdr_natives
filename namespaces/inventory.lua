---@todo
---
---@param item number
---@param slotId number
---@return boolean, table
function InventoryGetGuidFromItemid(item, slotId)
    local unkStruct = DataView.ArrayBuffer(4*8)
	local struct = DataView.ArrayBuffer(13*8)
    if (Citizen.InvokeNative(0x886DFD3E185C8A89, 1, unkStruct:Buffer(), item, slotId, struct:Buffer()) == 1) then

        return true
    end

    return false
end

---@todo
---
---@param item hash
---@return boolean, hash
function InventoryGetInventoryItemInspectionInfo(item)
    local struct = DataView.ArrayBuffer(32*8)
    struct:SetInt32(3*8, -1)
    struct:SetInt32(12*8, 4)
    struct:SetInt32(17*8, 4)

    if (Citizen.InvokeNative(0x0C093C1787F18519, item, struct:Buffer()) == 1) then
        local model = struct:GetInt32(0*8)

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
    return Citizen.InvokeNative(0x9D21B185ABC2DBC4, entryId, name, p1, p2, Citizen.ResultAsInteger())
end

--- Returns the stats entry id for "CatalogItemInspection" container [@sarbatore]
---@param entryId number
---@param name string
---@param p2 number
---@param playerId number
---@return integer
function InventoryGetCatalogItemInspectionStatsEntry(entryId, name, p2, playerId)
    return Citizen.InvokeNative(0x9D21B185ABC2DBC5, entryId, name, p2, playerId, Citizen.ResultAsInteger())
end

--- Applies the weapon stats to the stats entry id [@sarbatore]
---@param entryId number
---@param weapon hash
---@param ped Ped
function InventoryApplyWeaponStatsToEntry(entryId, weapon, ped)
    Citizen.InvokeNative(0x75CFAC49301E134E, entryId, weapon, ped)
end

---Outputs the slot ids compatible with the item.
---@param item Hash
---@param guid Guid
---@param maxResults integer
---@return boolean
function InventoryGetInventoryItemCompatibleSlots(item, guid, maxResults)
    return Citizen.InvokeNative(0x9AC53CB6907B4428, item, guid, maxResults) == 1
end

---Returns the last creation date of the item for the selected inventory.
---@param inventoryId integer
---@param item Hash
---@return boolean, integer, integer, integer, integer, integer, integer
function InventoryGetInventoryItemLastCreation(inventoryId, item)
    local yearData = DataView.ArrayBuffer(1*8)
    local monthData = DataView.ArrayBuffer(1*8)
    local dayData = DataView.ArrayBuffer(1*8)
    local hourData = DataView.ArrayBuffer(1*8)
    local minuteData = DataView.ArrayBuffer(1*8)
    local secondData = DataView.ArrayBuffer(1*8)

    if (Citizen.InvokeNative(0X112BCA290D2EB53C, inventoryId, item, yearData:Buffer(), monthData:Buffer(), dayData:Buffer(), hourData:Buffer(), minuteData:Buffer(), secondData:Buffer()) == 1) then
        local year = yearData:GetInt32(0)
        local month = monthData:GetInt32(0)
        local day = dayData:GetInt32(0)
        local hour = hourData:GetInt32(0)
        local minute = minuteData:GetInt32(0)
        local second = secondData:GetInt32(0)

        return true, year, month, day, hour, minute, second
    end

    return false
end

---@todo
---
---@param inventoryId integer
---@param p1 integer
---@param slotId Hash
---@param slotId2 Hash
---@param slotId3 Hash
---@param p5 Hash
---@param p6 Hash
---@param p7 Hash
---@param p8 Hash
---@param itemType Hash
---@param p10 Hash
---@param p11 Hash
---@param p12 Hash
---@param p13 Hash
---@param p14 Hash
---@param p15 Hash
---@param p16 Hash
---@param p17 Hash
---@return integer, integer
function InventoryCreateItemCollectionWithFilter(inventoryId, p1, slotId, slotId2, slotId3, p5, p6, p7, p8, itemType, p10, p11, p12, p13, p14, p15, p16, p17)
    local filterStruct = DataView.ArrayBuffer(18*8)
    filterStruct:SetInt32(0*8, -1)
    filterStruct:SetInt32(1*8, slotId)
    filterStruct:SetInt32(2*8, slotId2)
    filterStruct:SetInt32(3*8, slotId3)
    filterStruct:SetInt32(4*8, p5)
    filterStruct:SetInt32(5*8, p6)
    filterStruct:SetInt32(6*8, p7)
    filterStruct:SetInt32(7*8, p8)
    filterStruct:SetInt32(8*8, itemType)
    filterStruct:SetInt32(9*8, p10)
    filterStruct:SetInt32(10*8, p11)
    filterStruct:SetInt32(11*8, p12)
    filterStruct:SetInt32(12*8, p13)
    filterStruct:SetInt32(13*8, p14)
    filterStruct:SetInt32(14*8, p15)
    filterStruct:SetInt32(15*8, p16)
    filterStruct:SetInt32(16*8, p17)
    filterStruct:SetInt32(17*8, p18)
    local sizeStruct = DataView.ArrayBuffer(1*8)

    local collectionId = Citizen.InvokeNative(0x640F890C3E5A3FFD, inventoryId, filterStruct:Buffer(), sizeStruct:Buffer(), Citizen.ResultAsInteger())
    local size = sizeStruct:GetInt32(0)

    return collectionId, size
end