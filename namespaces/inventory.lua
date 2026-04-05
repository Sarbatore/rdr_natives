---
---@param itemHash integer
---@return boolean success
---@return integer modelHash
function InventoryGetInventoryItemInspectionInfo(itemHash)
    local struct = DataView.ArrayBuffer(32*8)
    struct:SetInt32(3*8, -1)
    struct:SetInt32(12*8, 4)
    struct:SetInt32(17*8, 4)

    local success   = Citizen.InvokeNative(0x0C093C1787F18519, itemHash, struct:Buffer()) == 1
    local modelHash = struct:GetInt32(0*8)

    return success, modelHash
end

--- Returns the effects entry id for "CatalogItemInspection" container
---@param entryId number
---@param name string
---@param p2 boolean
---@param p3 boolean
---@return number
function InventoryGetCatalogItemInspectionEffectsEntry(entryId, name, p2, p3)
    return Citizen.InvokeNative(0x9D21B185ABC2DBC4, entryId, name, p1, p2, Citizen.ResultAsInteger())
end

--- Returns the stats entry id for "CatalogItemInspection" container
---@param entryId number
---@param name string
---@param p2 number
---@param playerId number
---@return integer
function InventoryGetCatalogItemInspectionStatsEntry(entryId, name, p2, playerId)
    return Citizen.InvokeNative(0x9D21B185ABC2DBC5, entryId, name, p2, playerId, Citizen.ResultAsInteger())
end

--- Applies the weapon stats to the stats entry id
---@param entryId number
---@param weaponHash integer
---@param ped integer
function InventoryApplyWeaponStatsToEntry(entryId, weaponHash, ped)
    Citizen.InvokeNative(0x75CFAC49301E134E, entryId, weaponHash, ped)
end

---Returns a list of compatible SLOTID
---@param itemHash integer
---@param size integer
---@return boolean success
---@return table slotIdsHash
function InventoryGetInventoryItemCompatibleSlots(itemHash, size)
    local outData = DataView.ArrayBuffer((size+1)*8)
    outData:SetInt32(0*8, size)
    
    local success     = Citizen.InvokeNative(0x9AC53CB6907B4428, itemHash, outData:Buffer(), size) == 1
    local slotIdsHash = {}
    local i = 1
    while i <= size and outData:GetInt32(i*8) ~= 0 do
        table.insert(slotIdsHash, outData:GetInt32(i*8))
        i = i + 1
    end

    return success, slotIdsHash
end

---Returns the last creation date of the item for the selected inventory.
---@param inventoryId integer
---@param itemHash integer
---@return boolean, integer, integer, integer, integer, integer, integer
function InventoryGetInventoryItemLastCreation(inventoryId, itemHash)
    local yearOut   = DataView.ArrayBuffer(1*8)
    local monthOut  = DataView.ArrayBuffer(1*8)
    local dayOut    = DataView.ArrayBuffer(1*8)
    local hourOut   = DataView.ArrayBuffer(1*8)
    local minuteOut = DataView.ArrayBuffer(1*8)
    local secondOut = DataView.ArrayBuffer(1*8)

    local res    = Citizen.InvokeNative(0X112BCA290D2EB53C, inventoryId, itemHash, yearOut:Buffer(), monthOut:Buffer(), dayOut:Buffer(), hourOut:Buffer(), minuteOut:Buffer(), secondOut:Buffer()) == 1
    local year   = yearOut:GetInt32(0)
    local month  = monthOut:GetInt32(0)
    local day    = dayOut:GetInt32(0)
    local hour   = hourOut:GetInt32(0)
    local minute = minuteOut:GetInt32(0)
    local second = secondOut:GetInt32(0)
        
    return res, year, month, day, hour, minute, second
end

---
---@param inventoryId integer
---@param itemHash integer
---@param slotIdHash integer
---@param slotId2Hash integer
---@param slotId3Hash integer
---@param p5 any
---@param p6 any
---@param p7 any
---@param p8 any
---@param itemTypeHash integer
---@param p10 any
---@param p11 any
---@param p12 any
---@param p13 any
---@param p14 any
---@param p15 any
---@param p16 any
---@param p17 any
---@return integer collectionId
---@return integer size
function InventoryCreateItemCollectionWithFilter(inventoryId, itemHash, slotIdHash, slotId2Hash, slotId3Hash, p5, p6, p7, p8, itemTypeHash, p10, p11, p12, p13, p14, p15, p16, p17)
    local filterStruct = DataView.ArrayBuffer(18*8)
    filterStruct:SetInt32(0*8, itemHash)
    filterStruct:SetInt32(1*8, slotIdHash)
    filterStruct:SetInt32(2*8, slotId2Hash)
    filterStruct:SetInt32(3*8, slotId3Hash)
    filterStruct:SetInt32(4*8, p5)
    filterStruct:SetInt32(5*8, p6)
    filterStruct:SetInt32(6*8, p7)
    filterStruct:SetInt32(7*8, p8)
    filterStruct:SetInt32(8*8, itemTypeHash)
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

---Update item prompt info
---@param object integer
---@param itemHash integer
---@param consumableHash integer
---@param label string -- MEAT, FISH, VEGETABLE, FRUIT, DAIRY, CANDY, JERKY, LETTER
---@param price integer
---@param modifiedPrice integer
---@param flags integer -- 1: can take, 2: can examine, 4: unknown, 8: unknown, 16: infinite interaction
---@param p5 integer -- 0, 1, or 2
---@param x number
---@param y number
---@param z number
---@param p9 integer -- 0 or 10
function SetItemPromptInfoRequest(object, itemHash, consumableHash, label, price, modifiedPrice, flags, p5, x, y, z, p9)
    local data = DataView.ArrayBuffer(13*8)
    data:SetInt32(0*8, object)
    data:SetInt32(1*8, itemHash)
    data:SetInt32(2*8, consumableHash)
    if (label ~= "") then
        data:SetInt64(3*8, VarString(10, "LITERAL_STRING", label, Citizen.ResultAsLong()))
    end
    data:SetInt32(4*8, price)
    data:SetInt32(5*8, modifiedPrice)
    data:SetInt32(6*8, flags)
    data:SetInt32(7*8, p5)
    data:SetFloat32(8*8, x)
    data:SetFloat32(9*8, y)
    data:SetFloat32(10*8, z)
    data:SetInt32(11*8, p9)
    Citizen.InvokeNative(0xFD41D1D4350F6413, data:Buffer())

    --[[
    AddEventHandler("gameEventTriggered", function(eventName, args)
        if (eventName == "EventItemPromptInfoRequest") then
            SetItemPromptInfoRequest(args[1], args[2], args[2], "", 0, 0, 2 | 16, 0, 0.0, 0.0, 0.0, 0)
        end
    end)
    ]]
end

---
---@param inventoryId integer
---@param guid2 table
---@param itemHash integer
---@param slotIdHash integer
---@param p3 any
---@param addReasonHash integer
---@return boolean success
function InventoryAddItemWithGuid(inventoryId, guid2, itemHash, slotIdHash, p3, addReasonHash)
    local guid = DataView.ArrayBuffer(64*8)

    local success = Citizen.InvokeNative(0xCB5D11F9508A928D, inventoryId, guid:Buffer(), guid2, itemHash, slotIdHash, p3, addReasonHash) == 1

    return success
end

---
---@param inventoryId integer
---@param itemHash integer
---@param slotIdHash integer
---@return boolean success
function InventoryGetGuidFromItemid(inventoryId, itemHash, slotIdHash)
    local guid = DataView.ArrayBuffer(64*8)
    local outGuid = DataView.ArrayBuffer(64*8)

    local success = Citizen.InvokeNative(0x886DFD3E185C8A89, inventoryId, guid:Buffer(), itemHash, slotIdHash, outGuid:Buffer()) == 1

    return success, outGuid:GetInt32(0)
end