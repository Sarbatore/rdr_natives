---Outputs the item infos (category, type, model, award)
---@param item Hash
---@return boolean, Hash, Hash, Hash, Hash, Hash
function ItemdatabaseFilloutItemInfo(item)
    local res, category, itemType, unk, model, award

    local struct = DataView.ArrayBuffer(6*8)
    
    res      = Citizen.InvokeNative(0xFE90ABBCBFDC13B2, item, struct:Buffer()) == 1
    category = struct:GetInt32(1*8)
    itemType = struct:GetInt32(2*8)
    unk      = struct:GetInt32(3*8)
    model    = struct:GetInt32(4*8)
    award    = struct:GetInt32(5*8)

    return res, category, itemType, unk, model, award
end

---
---@param effectId number
---@return boolean, Hash, Hash, integer, integer, float, Hash
function ItemdatabaseFilloutItemEffectIdInfo(effectId)
    local res, type, value, time, timeUnits, corePercent, durationcategory
    
    local struct = DataView.ArrayBuffer(7*8)

    res              = Citizen.InvokeNative(0xCF2D360D27FD1ABF, effectId, struct:Buffer()) == 1
    type             = struct:GetInt32(1*8)
    value            = struct:GetInt32(2*8)
    time             = struct:GetInt32(3*8)
    timeUnits        = struct:GetInt32(4*8)
    corePercent      = struct:GetFloat32(5*8)
    durationcategory = struct:GetInt32(6*8) 

    return res, type, value, time, timeUnits, corePercent, durationcategory
end

---Return bundle item info at the selected index (item hash, slot id...)
---@param bundleId number
---@param index integer
---@return boolean, Hash, Hash, integer, integer
function ItemdatabaseGetBundleItemInfo(bundleId, index)
    local res, item, slotId, unk2, unk3

    local bundleStruct = DataView.ArrayBuffer(1*8)
    bundleStruct:SetInt32(0*8, 1)
    local itemStruct = DataView.ArrayBuffer(4*8)
    
    res    = Citizen.InvokeNative(0x5D48A77E4B668B57, bundleId, bundleStruct:Buffer(), index, itemStruct:Buffer()) == 1
    item   = itemStruct:GetInt32(0*8)
    slotId = itemStruct:GetInt32(1*8)
    unk2   = itemStruct:GetInt32(2*8)
    unk3   = itemStruct:GetInt32(3*8)

    return res, item, slotId, unk2, unk3
end

---Return the slot id for the category at the selected index.
---@param category Hash
---@param index integer
---@return Hash
function ItemdatabaseGetFitsSlotInfo(category, index)
    return Citizen.InvokeNative(0x77210C146CED5261, category, index, Citizen.PointerValueInt())
end

---Return the number of items for the bundle
---@param bundleId integer
---@return integer
function ItemdatabaseGetBundleItemCount(bundleId)
    local itemCount

    local struct = DataView.ArrayBuffer(8*8)
    struct:SetInt32(0*8, 1)

    itemCount = Citizen.InvokeNative(0x3332695B01015DF9, bundleId, struct:Buffer(), Citizen.ResultAsInteger())

    return itemCount
end

---@todo
---
---@param bundle Hash
---@param costtype Hash
function N_0x388088BFF3681189(bundle, costtype)
    return Citizen.InvokeNative(0x388088BFF3681189, bundle, costtype, Citizen.ResultAsInteger())
end

---@todo
---
---@param bundle Hash
---@param costtype Hash
---@param index integer
---@return boolean, 
function ItemdatabaseFilloutBundle(bundle, costtype, index)
    local res

    local struct = DataView.ArrayBuffer(20*8)
    struct:SetInt32(0, 15)

    res = Citizen.InvokeNative(0xB542632693D53408, bundle, costtype, index, struct:Buffer()) == 1

    return res
end

---@todo
---
---@param modifier Hash
---@param index integer
---@return boolean, 
function ItemdatabaseFilloutModifier(modifier, index)
    local struct = DataView.ArrayBuffer(5*8)

    if (Citizen.InvokeNative(0x60614A0AB580A2B5, modifier, index, struct:Buffer()) == 1) then
        local a = struct:GetInt32(0*8)
        local b = struct:GetInt32(1*8)
        local c = struct:GetInt32(2*8)
        local d = struct:GetInt32(3*8)
        local e = struct:GetInt32(4*8)

        return true, a, b, c, d, e
    end

    return false
end

---Create an item collection and return its id and size.
---@param slotId Hash
---@param slotId2 Hash
---@param tag Hash
---@param category Hash
---@param cost Hash
---@param p5 Hash
---@param flags integer
---@param itemType Hash
---@param ciTag Hash
---@return integer, integer
function ItemdatabaseCreateItemCollection(slotId, slotId2, tag, category, cost, p5, flags, itemType, ciTag)
    local collectionIndex, size

    local filterStruct = DataView.ArrayBuffer(15*8)
    filterStruct:SetInt32(0*8, slotId)
    filterStruct:SetInt32(1*8, slotId2)
    filterStruct:SetInt32(2*8, tag)
    filterStruct:SetInt32(3*8, category)
    filterStruct:SetInt32(4*8, cost)
    filterStruct:SetInt64(5*8, p5)
    filterStruct:SetInt32(6*8, flags)
    filterStruct:SetInt32(7*8, itemType)
    filterStruct:SetInt32(8*8, ciTag)
    local sizeStruct = DataView.ArrayBuffer(1*8)

    collectionIndex = Citizen.InvokeNative(0x71EFA7999AE79408, filterStruct:Buffer(), sizeStruct:Buffer(), 1, Citizen.ResultAsInteger())
    size = sizeStruct:GetInt32(0*8)

    return collectionIndex, size
end

--[[
tables:
- ItemdatabaseFilloutTagData
- ItemdatabaseFilloutItemEffectIds
]]

---@todo
---
---@param shopType Hash
---@param key Hash
---@param groupIndex integer
---@param requirementIndex integer
---@return boolean, Hash, Hash, Hash
function ItemdatabaseGetShopInventoriesRequirementInfo(shopType, key, groupIndex, requirementIndex)
    local res, inventoryRequirement, unk1, unk2

    local struct = DataView.ArrayBuffer(3*8)

    res = Citizen.InvokeNative(0xE0EA5C031AE5539F, shopType, key, groupIndex, requirementIndex, struct:Buffer()) == 1
    inventoryRequirement = struct:GetInt32(0*8)
    unk1                 = struct:GetInt32(1*8)
    unk2                 = struct:GetInt32(2*8)

    return res, inventoryRequirement, unk1, unk2
end

---Outputs the layout page info at the selected index.
---@param layout Hash
---@param index integer
---@return boolean, Hash, Hash, boolean, integer
function ItemdatabaseGetShopLayoutPageInfoByIndex(layout, index)
    local res, pageKey, unk1, unk2, numItems

    local struct = DataView.ArrayBuffer(4*8)
    
    res = Citizen.InvokeNative(0xDBEADA0DF5F9AB9F, layout, index, struct:Buffer()) == 1
    pageKey  = struct:GetInt32(0*8)
    unk1     = struct:GetInt32(1*8)
    unk2     = struct:GetInt32(2*8) == 1
    numItems = struct:GetInt32(3*8)

    return res, pageKey, unk1, unk2, numItems
end