---
---@param effectId number
---@return boolean, ?number, ?number, ?number, ?number, ?number, ?number, ?number
function ItemdatabaseFilloutItemEffectIdInfo(effectId)
    local DataStruct = DataView.ArrayBuffer(256)
    if (Citizen.InvokeNative(0xCF2D360D27FD1ABF, effectId, DataStruct:Buffer())) then
        local id = DataStruct:GetInt32(0*8)
        local type = DataStruct:GetInt32(1*8)
        local value = DataStruct:GetInt32(2*8)
        local time = DataStruct:GetInt32(3*8)
        local timeUnits = DataStruct:GetInt32(4*8)
        local corePercent = DataStruct:GetFloat32(5*8)
        local durationcategory = DataStruct:GetInt32(6*8)
    
        return true, id, type, value, time, timeUnits, corePercent, durationcategory
    end

    return false
end
exports("ItemdatabaseFilloutItemEffectIdInfo", ItemdatabaseFilloutItemEffectIdInfo)

---
---@param key number
---@return boolean, ?table
function ItemdatabaseFilloutItemEffectIds(key)
    local DataStruct = DataView.ArrayBuffer(256)
    DataStruct:SetInt32(1*8, 20)
    
    if (Citizen.InvokeNative(0x9379BE60DC55BBE6, key, DataStruct:Buffer())) then
        local effectIds = {}
    
        local numEffectIds = DataStruct:GetInt32(0)
        if (numEffectIds > 0) then
            for i=0, numEffectIds-1 do
                table.insert(effectIds, DataStruct:GetInt32(i*8 + 16))
            end
        end
    
        return true, effectIds
    end

    return false
end
exports("ItemdatabaseFilloutItemEffectIds", ItemdatabaseFilloutItemEffectIds)

---
---@param key number
---@return boolean, ?number, ?number
function ItemdatabaseFilloutItemInfo(key)
    local DataStruct = DataView.ArrayBuffer(256)
    if (Citizen.InvokeNative(0xFE90ABBCBFDC13B2, key, DataStruct:Buffer())) then
        local category = DataStruct:GetInt32(1*8)
        local group = DataStruct:GetInt32(2*8)
    
        return true, category, group
    end

    return false
end
exports("ItemdatabaseFilloutItemInfo", ItemdatabaseFilloutItemInfo)

---@todo Implement ItemdatabaseFilloutItem
---
---@param key number
---@param costType number
---@param index number
---@return boolean
function ItemdatabaseFilloutItem(key, costType, index)
    local DataStruct = DataView.ArrayBuffer(256)

    if (Citizen.InvokeNative(0xAD73B614DF26CF8A, key, costType, index, DataStruct:Buffer())) then
        local a = DataStruct:GetInt32(0*8)
        local b = DataStruct:GetInt32(1*8)
        local c = DataStruct:GetInt32(2*8)
        local d = DataStruct:GetInt32(3*8)
        local e = DataStruct:GetInt32(4*8)
        print(a, b, c, d, e)
        return true
    end

    return false
end
exports("ItemdatabaseFilloutItem", ItemdatabaseFilloutItem)

---@todo Implement ItemdatabaseFilloutBuyAwardUiData
---
---@param award number
---@return boolean
function ItemdatabaseFilloutBuyAwardUiData(award)
    local DataStruct = DataView.ArrayBuffer(256)

    if (Citizen.InvokeNative(0xAD73B614DF26CF8A, award, DataStruct:Buffer())) then
        
        return true
    end

    return false
end
exports("ItemdatabaseFilloutBuyAwardUiData", ItemdatabaseFilloutBuyAwardUiData)

---@todo Implement ItemdatabaseFilloutAcquireCost
---
---@param key number
---@param costType number
---@return boolean
function ItemdatabaseFilloutAcquireCost(key, costType)
    local DataStruct = DataView.ArrayBuffer(36*8)
    DataStruct:SetInt32(4*8, 15)
    DataStruct:SetInt32(36*8, 10)

    if (Citizen.InvokeNative(0x74F7928816E4E181, key, costType, DataStruct:Buffer())) then
        local unk1 = DataStruct:GetInt32(35*8)
        local unk2 = DataStruct:GetInt32(36*8)

        return true, unk1, unk2
    end

    return false
end
exports("ItemdatabaseFilloutAcquireCost", ItemdatabaseFilloutAcquireCost)

---@todo Implement ItemdatabaseFilloutTagData
---
---@param key number
---@param costType number
---@return boolean
function ItemdatabaseFilloutTagData(key)
    local DataStruct = DataView.ArrayBuffer(256)
    DataStruct:SetInt32(0*8, 20)

    local DataStruct2 = DataView.ArrayBuffer(1*8)

    if (Citizen.InvokeNative(0x74F7928816E4E181, key, DataStruct:Buffer(), DataStruct2:Buffer(), 20)) then
        local index = DataStruct2:GetInt32(0)
        return true, index
    end

    return false
end
exports("ItemdatabaseFilloutTagData", ItemdatabaseFilloutTagData)

---@todo Implement ItemdatabaseGetHasSlotInfo
---
---@param category number
---@param index number
---@return boolean, ?number
function ItemdatabaseGetHasSlotInfo(category, index)
    local DataStruct = DataView.ArrayBuffer(256)
    if (Citizen.InvokeNative(0x8A9BD0DB7E8376CF, category, index, DataStruct:Buffer())) then
        local hasSlot = DataStruct:GetInt32(0*8)
    
        return true, hasSlot
    end

    return false
end
exports("ItemdatabaseGetHasSlotInfo", ItemdatabaseGetHasSlotInfo)

---@todo Implement ItemdatabaseCreateItemCollection
---
---@param size number
---@param comparisonType number
---@return boolean
function ItemdatabaseCreateItemCollection(size, comparisonType)
    local DataStruct = DataView.ArrayBuffer(8*9)

    if (Citizen.InvokeNative(0x71EFA7999AE79408, DataStruct:Buffer(), size, comparisonType, 0)) then

        return true
    end

    return false
end
exports("ItemdatabaseCreateItemCollection", ItemdatabaseCreateItemCollection)