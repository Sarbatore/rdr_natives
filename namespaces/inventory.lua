---@todo
---
---@param item Hash
---@return boolean, Hash
function InventoryGetInventoryItemInspectionInfo(item)
    local struct = DataView.ArrayBuffer(32*8)
    struct:SetInt32(3*8, -1)
    struct:SetInt32(12*8, 4)
    struct:SetInt32(17*8, 4)

    local res = Citizen.InvokeNative(0x0C093C1787F18519, item, struct:Buffer()) == 1
    local model = struct:GetInt32(0*8)

    return res, model
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
---@param weaponHash Hash
---@param ped Ped
function InventoryApplyWeaponStatsToEntry(entryId, weaponHash, ped)
    Citizen.InvokeNative(0x75CFAC49301E134E, entryId, weaponHash, ped)
end

---Returns a list of compatible SLOTID
---@param item Hash
---@param size integer
---@return boolean, table
function InventoryGetInventoryItemCompatibleSlots(item, size)
    size = size or 1
    local outData = DataView.ArrayBuffer((size+1)*8)
    outData:SetInt32(0*8, size)
    
    local res = Citizen.InvokeNative(0x9AC53CB6907B4428, item, outData:Buffer(), size) == 1
    local slots = {}
    for i = 1, size do
        table.insert(slots, outData:GetInt32(i*8))
    end

    return res, slots
end

---Returns the last creation date of the item for the selected inventory.
---@param inventoryId integer
---@param item Hash
---@return boolean, integer, integer, integer, integer, integer, integer
function InventoryGetInventoryItemLastCreation(inventoryId, item)
    local yearOut   = DataView.ArrayBuffer(1*8)
    local monthOut  = DataView.ArrayBuffer(1*8)
    local dayOut    = DataView.ArrayBuffer(1*8)
    local hourOut   = DataView.ArrayBuffer(1*8)
    local minuteOut = DataView.ArrayBuffer(1*8)
    local secondOut = DataView.ArrayBuffer(1*8)

    local res    = Citizen.InvokeNative(0X112BCA290D2EB53C, inventoryId, item, yearOut:Buffer(), monthOut:Buffer(), dayOut:Buffer(), hourOut:Buffer(), minuteOut:Buffer(), secondOut:Buffer()) == 1
    local year   = yearOut:GetInt32(0)
    local month  = monthOut:GetInt32(0)
    local day    = dayOut:GetInt32(0)
    local hour   = hourOut:GetInt32(0)
    local minute = minuteOut:GetInt32(0)
    local second = secondOut:GetInt32(0)
        
    return res, year, month, day, hour, minute, second
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

function InventoryAddItemWithGuid(inventoryId, guid2, item, itemSlotId, p3, addItemReason)
    local res

    local guid = DataView.ArrayBuffer(64*8)

    res = Citizen.InvokeNative(0xCB5D11F9508A928D, inventoryId, guid:Buffer(), guid2, item, itemSlotId, p3, addItemReason) == 1

    return res
end

---@todo
---
---@param inventoryId any
---@param p1 Hash
---@param slotId Hash
---@return boolean
function InventoryGetGuidFromItemid(inventoryId, p1, slotId)
    local res

    local guid = DataView.ArrayBuffer(64*8)
    local outGuid = DataView.ArrayBuffer(64*8)

    res = Citizen.InvokeNative(0x886DFD3E185C8A89, inventoryId, guid:Buffer(), p1, slotId, outGuid:Buffer()) == 1

    return res, outGuid:GetInt32(0)
end