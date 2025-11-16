---Outputs the item infos (category, type, flags, model, award)
---@param item Hash
---@return boolean, Hash, Hash, Hash, Hash, Hash
function ItemdatabaseFilloutItemInfo(item)
    local struct = DataView.ArrayBuffer(6*8)
    
    local res      = Citizen.InvokeNative(0xFE90ABBCBFDC13B2, item, struct:Buffer()) == 1
    local category = struct:GetInt32(1*8)
    local itemType = struct:GetInt32(2*8)
    local flags    = struct:GetInt32(3*8)
    local model    = struct:GetInt32(4*8)
    local award    = struct:GetInt32(5*8)

    return res, category, itemType, flags, model, award
end

---@todo
---@param item Hash
---@return boolean, Hash, Hash, Hash, integer
function ItemdatabaseFilloutItemByName(item)
    local outData = DataView.ArrayBuffer(1024*8)
    for i = 0, 15 do
        outData:SetInt32((4 + i * 48)*8, 15)
        outData:SetInt32((36 + i * 48)*8, 10)
    end
    for i = 0, 9 do
        outData:SetInt32((480 +  i * 32)*8, 10)
    end
    outData:SetInt32(732*8 + 2*8, 5)
    outData:SetInt32(732*8 + 18*8, 8)

    local res         = Citizen.InvokeNative(0x2A610BEE7D341CC4, item, outData:Buffer()) == 1
    local category    = outData:GetInt32(1*8)
    local itemType    = outData:GetInt32(2*8)
    local model       = outData:GetInt32(3*8)
    local numCostType = outData:GetInt32(7*8)

    return res, category, itemType, model, numCostType
end

---Fill out item information for a specific cost type and index.
---@param item Hash
---@param costtype Hash
---@param index integer
---@return boolean, Hash, Hash, Hash, Hash, Hash
function ItemdatabaseFilloutItem(item, costtype, index)
    local struct = DataView.ArrayBuffer(6*8)
    
    local res      = Citizen.InvokeNative(0xAD73B614DF26CF8A, item, costtype, index, struct:Buffer()) == 1
    local category = struct:GetInt32(1*8)
    local itemType = struct:GetInt32(2*8)
    local flags    = struct:GetInt32(3*8)
    local model    = struct:GetInt32(4*8)
    local award    = struct:GetInt32(5*8)

    return res, category, itemType, flags, model, award
end

---Return the effect ids for the given item.
---@param item Hash
---@return boolean, integer, table
function ItemdatabaseFilloutItemEffectIds(item)
    local struct = DataView.ArrayBuffer(32*8)
    struct:SetInt32(1*8, 20)

    local res        = Citizen.InvokeNative(0x9379BE60DC55BBE6, item, struct:Buffer()) == 1
    local numEffects = struct:GetInt32(0*8)
    local effects    = {}
    for i = 2, 2 + numEffects do
        table.insert(effects, struct:GetInt32(i*8))
    end

    return res, numEffects, effects
end

---
---@param effectId number
---@return boolean, Hash, Hash, integer, integer, float, Hash
function ItemdatabaseFilloutItemEffectIdInfo(effectId)
    local struct = DataView.ArrayBuffer(7*8)

    local res              = Citizen.InvokeNative(0xCF2D360D27FD1ABF, effectId, struct:Buffer()) == 1
    local type             = struct:GetInt32(1*8)
    local value            = struct:GetInt32(2*8)
    local time             = struct:GetInt32(3*8)
    local timeUnits        = struct:GetInt32(4*8)
    local corePercent      = struct:GetFloat32(5*8)
    local durationcategory = struct:GetInt32(6*8)

    return res, type, value, time, timeUnits, corePercent, durationcategory
end

---Return bundle item info at the selected index (item hash, slot id...)
---@param bundleId number
---@param index integer
---@return boolean, Hash, Hash, integer, integer
function ItemdatabaseGetBundleItemInfo(bundleId, index)
    local bundleStruct = DataView.ArrayBuffer(1*8)
    bundleStruct:SetInt32(0*8, 1)
    local itemStruct = DataView.ArrayBuffer(4*8)
    
    local res    = Citizen.InvokeNative(0x5D48A77E4B668B57, bundleId, bundleStruct:Buffer(), index, itemStruct:Buffer()) == 1
    local item   = itemStruct:GetInt32(0*8)
    local slotId = itemStruct:GetInt32(1*8)
    local unk2   = itemStruct:GetInt32(2*8)
    local unk3   = itemStruct:GetInt32(3*8)

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

---Return a list of tag data for the given item. [CI_TAG_, TAG_]
---@param item Hash
---@return boolean, integer, table
function ItemdatabaseFilloutTagData(item)
    local size = 20
    local outData = DataView.ArrayBuffer(40*8)
    outData:SetInt32(0*8, size)
    local outSize = DataView.ArrayBuffer(1*8)

    local res   = Citizen.InvokeNative(0x5A11D6EEA17165B0, item, outData:Buffer(), outSize:Buffer(), size) == 1
    local numTags = outSize:GetInt32(0*8)
    local tags = {}
    for i = 1, 1 + numTags, 2 do
        local tag = {}
        tag[1] = outData:GetInt32(i*8)
        tag[2] = outData:GetInt32((i+1)*8)
        table.insert(tags, tag)
    end

    return res, numTags, tags
end

---
---@param shopType Hash
---@param key Hash
---@param groupIndex integer
---@param requirementIndex integer
---@return boolean, Hash, Hash, Hash
function ItemdatabaseGetShopInventoriesRequirementInfo(shopType, key, groupIndex, requirementIndex)
    local struct = DataView.ArrayBuffer(3*8)

    local res    = Citizen.InvokeNative(0xE0EA5C031AE5539F, shopType, key, groupIndex, requirementIndex, struct:Buffer()) == 1
    local invReq = struct:GetInt32(0*8)
    local unk1   = struct:GetInt32(1*8)
    local unk2   = struct:GetInt32(2*8)

    return res, invReq, unk1, unk2
end

---Outputs the layout page info at the selected index.
---@param layout Hash
---@param index integer
---@return boolean, Hash, Hash, boolean, integer
function ItemdatabaseGetShopLayoutPageInfoByIndex(layout, index)
    local struct = DataView.ArrayBuffer(4*8)
    
    local res      = Citizen.InvokeNative(0xDBEADA0DF5F9AB9F, layout, index, struct:Buffer()) == 1
    local pageKey  = struct:GetInt32(0*8)
    local unk1     = struct:GetInt32(1*8)
    local unk2     = struct:GetInt32(2*8) == 1
    local numItems = struct:GetInt32(3*8)

    return res, pageKey, unk1, unk2, numItems
end

---
---@param item Hash
---@param sellType Hash
---@param size integer
---@return boolean, Hash, Hash, integer, table
function ItemdatabaseFilloutSellPrice(item, sellType, size)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(4*8, size)

    local res = Citizen.InvokeNative(0x7A62A2EEDE1C3766, item, sellType, outData:Buffer()) == 1
    local o0 = outData:GetInt32(1*8)
    local o1 = outData:GetInt32(2*8)
    local numPrices = outData:GetInt32(3*8)
    local prices = {}
    for i = 5, 5 + numPrices, 2 do
        local price = {}
        price[1] = outData:GetInt32(i*8)
        price[2] = outData:GetInt32((i+1)*8)
        table.insert(prices, price)
    end

    return res, o0, o1, numPrices, prices
end

---Return a list of modifiers for the given award.
---@param award Hash
---@return boolean, integer, table
function ItemdatabaseGetAwardCostModifiers(award)
    local struct = DataView.ArrayBuffer(32*8)
    struct:SetInt32(1*8, 10)

    local res          = Citizen.InvokeNative(0xE81D0378A384E755, award, struct:Buffer()) == 1
    local numModifiers = struct:GetInt32(0*8)
    local modifiers    = {}
    for i = 2, 2 + numModifiers do
        table.insert(modifiers, struct:GetInt32(i*8))
    end

    return res, numModifiers, modifiers
end

---Return the modifier currencyType and value at the selected index.
---@param modifier Hash
---@param index integer
---@return boolean, Hash, float
function ItemdatabaseFilloutModifier(modifier, index)
    local struct = DataView.ArrayBuffer(2*8)

    local res          = Citizen.InvokeNative(0x60614A0AB580A2B5, modifier, index, struct:Buffer()) == 1
    local currencyType = struct:GetInt32(0*8)
    local value        = struct:GetFloat32(1*8)

    return res, currencyType, value
end

---Return
---@param item Hash
---@param costType Hash
---@return boolean, Hash, Hash, integer, Hash
function ItemdatabaseFilloutAcquireCost(item, costType)
    local outData = DataView.ArrayBuffer(38*8)
    outData:SetInt32(4*8, 15)
    outData:SetInt32(36*8, 10)

    local res = Citizen.InvokeNative(0x74F7928816E4E181, item, costType, outData:Buffer()) == 1
    local o0 = outData:GetInt32(2*8)
    local currencyType = outData:GetInt32(5*8)
    local amount = outData:GetInt32(6*8)
    local o2 = outData:GetInt32(37*8)

    return res, o0, currencyType, amount, o2
end

---Return item hash
---@param award Hash
---@param index integer
---@return boolean, Hash, integer, Hash
function ItemdatabaseFilloutAwardItemInfo(award, index)
    local outData = DataView.ArrayBuffer(3*8)

    local res  = Citizen.InvokeNative(0x121D2005DD64496B, award, index, outData:Buffer()) == 1
    local item = outData:GetInt32(0*8)
    local o0   = outData:GetInt32(1*8)
    local o1   = outData:GetInt32(2*8)

    return res, item, o0, o1
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
---@param item Hash
---@param costtype Hash
function N_0x388088BFF3681189(item, costtype)
    return Citizen.InvokeNative(0x388088BFF3681189, item, costtype, Citizen.ResultAsInteger())
end

---Return num rewards and rewards data of the hash
---@param p0 Hash
---@param size integer
---@return boolean, Hash, integer, table
function N_0xD076DB9B96FAADF1(p0, size)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(3*8, size)

    local res = Citizen.InvokeNative(0xD076DB9B96FAADF1, p0, outData:Buffer()) == 1
    local o0 = outData:GetInt32(1*8)
    local numRewards = outData:GetInt32(2*8)
    local rewards = {}
    for i = 4, 4 + (numRewards * 2), 2 do
        local reward = {}
        reward[1] = outData:GetInt32(i*8)
        reward[2] = outData:GetFloat32((i+1)*8)
        table.insert(rewards, reward)
    end

    return res, o0, numRewards, rewards
end