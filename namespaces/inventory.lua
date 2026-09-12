---
---@param itemHash integer
---@return boolean success
---@return integer modelHash
function InventoryGetInventoryItemInspectionInfo(itemHash)
    local outStruct = DataView.ArrayBuffer(22*8)
        :SetInt32(3*8, -1)
        :SetInt32(12*8, 4)
        :SetInt32(17*8, 4)

    local success   = Citizen.InvokeNative(0x0C093C1787F18519, itemHash, outStruct:Buffer()) == 1
    local modelHash = outStruct:GetInt32(0*8)

    return success, modelHash
end

---
---@param collectionId integer
---@param index integer
---@return boolean success
---@return table itemData DataView.ArrayBuffer
function InventoryGetItemFromCollectionIndex(collectionId, index)
    local itemData = DataView.ArrayBuffer(32*8)
    local success  = Citizen.InvokeNative(0x82FA24C3D3FCD9B7, collectionId, index, itemData:Buffer()) == 1

    return success, itemData
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
---@return boolean success
---@return table slotIdsHash
function InventoryGetInventoryItemCompatibleSlots(itemHash)
    local size = 15
    local outStruct = DataView.ArrayBuffer((size+1)*8)
        :SetInt32(0*8, size)
    
    local success     = Citizen.InvokeNative(0x9AC53CB6907B4428, itemHash, outStruct:Buffer(), size) == 1
    local slotIdsHash = {}
    if (success) then
        local i = 1
        while i <= size and outStruct:GetInt32(i*8) ~= 0 do
            table.insert(slotIdsHash, outStruct:GetInt32(i*8))
            i = i + 1
        end
    end

    return success, slotIdsHash
end

---Returns the last creation date of the item for the selected inventory.
---@param inventoryId integer
---@param itemHash integer
---@return boolean success
---@return integer year
---@return integer month
---@return integer day
---@return integer hour
---@return integer minute
---@return integer second
function InventoryGetInventoryItemLastCreation(inventoryId, itemHash)
    local success, year, month, day, hour, minute, second = Citizen.InvokeNative(0x112BCA290D2EB53C, inventoryId, itemHash, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
    return success == 1, year, month, day, hour, minute, second
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
---@param p18 any
---@return integer collectionId
---@return integer collectionSize
function InventoryCreateItemCollectionWithFilter(inventoryId, itemHash, slotIdHash, slotId2Hash, slotId3Hash, p5, p6, p7, p8, itemTypeHash, p10, p11, p12, p13, p14, p15, p16, p17, p18)
    local paramsStruct = DataView.ArrayBuffer(18*8)
        :SetInt32(0*8, itemHash)
        :SetInt32(1*8, slotIdHash)
        :SetInt32(2*8, slotId2Hash)
        :SetInt32(3*8, slotId3Hash)
        :SetInt32(4*8, p5)
        :SetInt32(5*8, p6)
        :SetInt32(6*8, p7)
        :SetInt32(7*8, p8)
        :SetInt32(8*8, itemTypeHash)
        :SetInt32(9*8, p10)
        :SetInt32(10*8, p11)
        :SetInt32(11*8, p12)
        :SetInt32(12*8, p13)
        :SetInt32(13*8, p14)
        :SetInt32(14*8, p15)
        :SetInt32(15*8, p16)
        :SetInt32(16*8, p17)
        :SetInt32(17*8, p18)

    return Citizen.InvokeNative(0x640F890C3E5A3FFD, inventoryId, paramsStruct:Buffer(), Citizen.PointerValueInt(), Citizen.ResultAsInteger())
end

---
---@param entity integer
---@param p1 integer
---@param flags integer
---@param p3 any
---@param p4 any
---@param p5 any
---@param p6 number
function SetCarriableCarryActionPromptOverride(entity, p1, flags, p3, p4, p5, p6)
    local paramsStruct = DataView.ArrayBuffer(16*8)
        :SetInt32(0*8, entity)
        :SetInt32(1*8, p1)
        :SetInt32(2*8, flags)
        :SetInt32(3*8, p3)
        :SetInt32(4*8, p4)
        :SetInt32(5*8, p5)
        :SetFloat32(6*8, p6)
    Citizen.InvokeNative(0xF666EF30F4F0AC4E, paramsStruct:Buffer())
end

---Update item prompt info
---@param object integer
---@param itemHash integer
---@param consumableHash integer
---@param labelVarString integer -- MEAT, FISH, VEGETABLE, FRUIT, DAIRY, CANDY, JERKY, LETTER
---@param price integer
---@param modifiedPrice integer
---@param flags integer -- 1: can take, 2: can examine, 4: unknown, 8: unknown, 16: infinite interaction
---@param p5 integer -- 0, 1, or 2
---@param x number
---@param y number
---@param z number
---@param p9 integer -- 0 or 10
function SetItemPromptInfoRequest(object, itemHash, consumableHash, labelVarString, price, modifiedPrice, flags, p5, x, y, z, p9)
    local paramsStruct = DataView.ArrayBuffer(13*8)
        :SetInt32(0*8, object)
        :SetInt32(1*8, itemHash)
        :SetInt32(2*8, consumableHash)
        :SetInt64(3*8, BigInt(labelVarString))
        :SetInt32(4*8, price)
        :SetInt32(5*8, modifiedPrice)
        :SetInt32(6*8, flags)
        :SetInt32(7*8, p5)
        :SetFloat32(8*8, x)
        :SetFloat32(9*8, y)
        :SetFloat32(10*8, z)
        :SetInt32(11*8, p9)
    Citizen.InvokeNative(0xFD41D1D4350F6413, paramsStruct:Buffer())

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

---
---@param itemHash integer
---@param maxResults integer
---@return boolean success
---@return table slotids A list of slotids hash that the item can fit into, up to maxResults in length
function InventoryGetInventoryItemFitSlot(itemHash, maxResults)
    local outStruct = DataView.ArrayBuffer(32*8)

    local success = Citizen.InvokeNative(0xB991FE166FAF84FD, itemHash, outStruct:Buffer(), maxResults) == 1
    local slotids = {}
    for i = 1, maxResults do
        local slotid = outStruct:GetInt32(i*8)
        if slotid == 0 then break end
        table.insert(slotids, slotid)
    end

    return success, slotids
end