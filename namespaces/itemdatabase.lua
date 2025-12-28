---Outputs the item infos (category, type, flags, model, award)
---@param item Hash
---@return boolean, Hash, Hash, Hash, Hash, Hash
function ItemdatabaseFilloutItemInfo(item)
    local outData = DataView.ArrayBuffer(6*8)
    
    local res      = Citizen.InvokeNative(0xFE90ABBCBFDC13B2, item, outData:Buffer()) == 1
    local category = outData:GetInt32(1*8)
    local itemType = outData:GetInt32(2*8)
    local flags    = outData:GetInt32(3*8)
    local model    = outData:GetInt32(4*8)
    local unk      = outData:GetInt32(5*8)

    return res, category, itemType, flags, model, unk
end

---@todo
---@param item Hash
---@return boolean, Hash, Hash, Hash
function ItemdatabaseFilloutItemByName(item)
    local outData = DataView.ArrayBuffer(1024*8)
    for i = 0, 15 do
        outData:SetInt32((4 + i*48)*8, 15)
        outData:SetInt32((36 + i*48)*8, 10)
    end
    for i = 0, 9 do
        outData:SetInt32((480 +  i*32)*8, 10)
    end
    outData:SetInt32(732*8 + 2*8, 5)
    outData:SetInt32(732*8 + 18*8, 8)

    local res         = Citizen.InvokeNative(0x2A610BEE7D341CC4, item, outData:Buffer()) == 1
    local ciCategory  = outData:GetInt32(1*8)
    local category    = outData:GetInt32(2*8)
    local model       = outData:GetInt32(3*8)

    return res, ciCategory, category, model
end

---Fill out item information for a specific cost type and index.
---@param item Hash
---@param costtype Hash
---@param index integer
---@return boolean, Hash, Hash, Hash, Hash, Hash
function ItemdatabaseFilloutItem(item, costtype, index)
    local outData = DataView.ArrayBuffer(6*8)
    
    local res      = Citizen.InvokeNative(0xAD73B614DF26CF8A, item, costtype, index, outData:Buffer()) == 1
    local category = outData:GetInt32(1*8)
    local itemType = outData:GetInt32(2*8)
    local flags    = outData:GetInt32(3*8)
    local model    = outData:GetInt32(4*8)
    local unk      = outData:GetInt32(5*8)

    return res, category, itemType, flags, model, unk
end

---Returns a list of effects
---@param item Hash
---@return boolean, table
function ItemdatabaseFilloutItemEffectIds(item)
    local effects    = {}
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(1*8, 20)

    local res        = Citizen.InvokeNative(0x9379BE60DC55BBE6, item, outData:Buffer()) == 1
    local numEffects = outData:GetInt32(0*8)
    if (numEffects > 0) then
        local startOffset = 2
        for i = startOffset, startOffset + numEffects - 1 do
            table.insert(effects, outData:GetInt32(i*8))
        end
    end

    return res, effects
end

---
---@param effectId number
---@return boolean, Hash, Hash, integer, integer, float, Hash
function ItemdatabaseFilloutItemEffectIdInfo(effectId)
    local outData = DataView.ArrayBuffer(7*8)

    local res              = Citizen.InvokeNative(0xCF2D360D27FD1ABF, effectId, outData:Buffer()) == 1
    local type             = outData:GetInt32(1*8)
    local value            = outData:GetInt32(2*8)
    local time             = outData:GetInt32(3*8)
    local timeUnits        = outData:GetInt32(4*8)
    local corePercent      = outData:GetFloat32(5*8)
    local durationcategory = outData:GetInt32(6*8)

    return res, type, value, time, timeUnits, corePercent, durationcategory
end

---Return bundle item info at the selected index (item hash, slot id...)
---@param bundleId number
---@param index integer
---@return boolean, Hash, Hash, integer, integer
function ItemdatabaseGetBundleItemInfo(bundleId, index)
    local data = DataView.ArrayBuffer(1*8)
    data:SetInt32(0*8, 1)
    local outData = DataView.ArrayBuffer(4*8)
    
    local res    = Citizen.InvokeNative(0x5D48A77E4B668B57, bundleId, data:Buffer(), index, outData:Buffer()) == 1
    local item   = outData:GetInt32(0*8)
    local slotId = outData:GetInt32(1*8)
    local unk2   = outData:GetInt32(2*8)
    local unk3   = outData:GetInt32(3*8)

    return res, item, slotId, unk2, unk3
end

---Return the slot id for the category at the selected index.
---@param category Hash
---@param index integer
---@return boolean, integer
function ItemdatabaseGetFitsSlotInfo(category, index)
    local outData = DataView.ArrayBuffer(1*8)

    local res = Citizen.InvokeNative(0x77210C146CED5261, category, index, outData:Buffer()) == 1
    local slotId = outData:GetInt32(0)

    return res, slotId
end

---Return the number of items for the bundle
---@param bundleId integer
---@return integer
function ItemdatabaseGetBundleItemCount(bundleId)
    local data = DataView.ArrayBuffer(8*8)
    data:SetInt32(0*8, 1)

    local itemCount = Citizen.InvokeNative(0x3332695B01015DF9, bundleId, data:Buffer(), Citizen.ResultAsInteger())

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
    local filterData = DataView.ArrayBuffer(15*8)
    filterData:SetInt32(0*8, slotId)
    filterData:SetInt32(1*8, slotId2)
    filterData:SetInt32(2*8, tag)
    filterData:SetInt32(3*8, category)
    filterData:SetInt32(4*8, cost)
    filterData:SetInt64(5*8, p5)
    filterData:SetInt32(6*8, flags)
    filterData:SetInt32(7*8, itemType)
    filterData:SetInt32(8*8, ciTag)
    local sizeData = DataView.ArrayBuffer(1*8)

    local collectionIndex = Citizen.InvokeNative(0x71EFA7999AE79408, filterData:Buffer(), sizeData:Buffer(), 1, Citizen.ResultAsInteger())
    local size = sizeData:GetInt32(0)

    return collectionIndex, size
end

---@todo
---@param key Hash
---@return boolean, table
function ItemdatabaseGetItemPriceModifiers(key)
    local modifiers = {}
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(1*8, 10)

    local res = Citizen.InvokeNative(0x4EB37AAB79AB0C48, key, outData:Buffer()) == 1
    local numModifiers = outData:GetInt32(0*8)
    if (numModifiers > 0) then
        local startOffset = 2
        for i = startOffset, startOffset + (numModifiers - 1) do
            table.insert(modifiers, outData:GetInt32(i*8))
        end
    end

    return res, modifiers
end

---@todo
---@param key Hash
---@return boolean, Hash
function ItemdatabaseFilloutPriceModifierByKey(key)
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(3*8, 10)
    outData:SetInt32(15*8, 10)

    local res = Citizen.InvokeNative(0x40C5D95818823C94, key, outData:Buffer()) == 1
    local hash = outData:GetInt32(1*8) -- can be: -1626069400, -1406468552, -468109055, -416870516, -195968340, -144780764, 381795783, 1632947550

    return res, hash
end

---Return a list of tag data for the given item. [CI_TAG_, TAG_]
---@param item Hash
---@param size integer
---@return boolean, integer, table
function ItemdatabaseFilloutTagData(item, size)
    size = size or 1
    local outData = DataView.ArrayBuffer(40*8)
    outData:SetInt32(0*8, size)
    local outSize = DataView.ArrayBuffer(1*8)

    local res     = Citizen.InvokeNative(0x5A11D6EEA17165B0, item, outData:Buffer(), outSize:Buffer(), size) == 1
    local numTags = outSize:GetInt32(0*8)
    local tags    = {}
    if (numTags > 0) then
        local tblSize = 2
        for i = 1, numTags*tblSize, tblSize do
            local tag = {}
            tag[1] = outData:GetInt32(i*8)
            tag[2] = outData:GetInt32((i+1)*8)
            table.insert(tags, tag)
        end
    end

    return res, numTags, tags
end

---
---@param shopType Hash
---@param shopInventoryIndex integer
---@return boolean, Hash, any, integer
function ItemdatabaseGetShopInventoriesItemInfo(shopType, shopInventoryIndex)
    local outData             = DataView.ArrayBuffer(3*8)
    local res                 = Citizen.InvokeNative(0x4A79B41B4EB91F4E, shopType, shopInventoryIndex, outData:Buffer()) == 1
    local item                = outData:GetInt32(0*8)
    local unk                = outData:GetInt32(1*8)
    local numRequirementGroup = outData:GetInt32(2*8)

    return res, item, unk, numRequirementGroup
end

---
---@param shopType Hash
---@param item Hash
---@return boolean, any, integer
function ItemdatabaseGetShopInventoriesItemInfoByKey(shopType, item)
    local outData             = DataView.ArrayBuffer(3*8)
    local res                 = Citizen.InvokeNative(0xCFB06801F5099B25, shopType, item, outData:Buffer()) == 1
    local unk                = outData:GetInt32(1*8)
    local numRequirementGroup = outData:GetInt32(2*8)

    return res, unk, numRequirementGroup
end

---Return the number of requirements for shop item
---@param shopType Hash
---@param item Hash
---@param groupIndex integer
---@return boolean, integer, integer
function ItemdatabaseGetShopInventoriesRequirementGroupInfo(shopType, item, groupIndex)
    local outData         = DataView.ArrayBuffer(2*8)
    local res             = Citizen.InvokeNative(0x76C752D788A76813, shopType, item, groupIndex, outData:Buffer()) == 1
    local unk             = outData:GetInt32(0*8)
    local numRequirements = outData:GetInt32(1*8)

    return res, unk, numRequirements
end

---
---@param shopType Hash
---@param key Hash
---@param groupIndex integer
---@param requirementIndex integer
---@return boolean, Hash, Hash, integer, boolean
function ItemdatabaseGetShopInventoriesRequirementInfo(shopType, key, groupIndex, requirementIndex)
    local outData         = DataView.ArrayBuffer(4*8)
    local res             = Citizen.InvokeNative(0xE0EA5C031AE5539F, shopType, key, groupIndex, requirementIndex, outData:Buffer()) == 1
    local requirementType = outData:GetInt32(0*8)
    local requirement     = outData:GetInt32(1*8)
    local num             = outData:GetInt32(2*8)
    local state           = outData:GetInt32(3*8) == 1

    return res, requirementType, requirement, num, state
end

---Outputs the layoutHash page info at the selected index.
---@param layoutHash Hash
---@param index integer
---@return boolean, Hash, Hash, boolean, integer
function ItemdatabaseGetShopLayoutPageInfoByIndex(layoutHash, index)
    local outData  = DataView.ArrayBuffer(4*8)
    local res      = Citizen.InvokeNative(0xDBEADA0DF5F9AB9F, layoutHash, index, outData:Buffer()) == 1
    local pageKey  = outData:GetInt32(0*8)
    local unk1     = outData:GetInt32(1*8)
    local unk2     = outData:GetInt32(2*8) == 1
    local numItems = outData:GetInt32(3*8)

    return res, pageKey, unk1, unk2, numItems
end

---
---@param layoutHash integer
---@return boolean, integer, integer
function ItemdatabaseGetShopLayoutInfo(layoutHash)
    local outData = DataView.ArrayBuffer(4*8)
    local res     = Citizen.InvokeNative(0x66A6D76B6BB999B4, layoutHash, outData:Buffer()) == 1
    local numMenu = outData:GetInt32(2*8)
    local unk2    = outData:GetInt32(3*8)

    return res, numMenu, unk2
end

---
---@param layoutHash integer
---@param index integer
---@return boolean, integer, integer
function ItemdatabaseGetShopLayoutRootMenuInfo(layoutHash, index)
    local outData = DataView.ArrayBuffer(7*8)

    local res = Citizen.InvokeNative(0x86FCB565CCA0CFA7, layoutHash, index, outData:Buffer()) == 1
    local menu = outData:GetInt32(0*8)
    local unk1 = outData:GetInt32(6*8)

    return res, menu, unk1
end

---
---@param layoutHash integer
---@param menuHash integer
---@return 
function ItemdatabaseGetShopLayoutMenuInfoById(layoutHash, menuHash)
    local outData = DataView.ArrayBuffer(8*8)

    local res = Citizen.InvokeNative(0xD66114469978B55B, layoutHash, menuHash, outData:Buffer()) == 1
    local unk1 = outData:GetInt32(1*8)
    local unk3 = outData:GetInt32(3*8)
    local numPage = outData:GetInt32(5*8)
    local numInfo = outData:GetInt32(6*8)

    return res, unk1, unk3, numPage, numInfo
end

---
---@param layoutHash integer
---@param menuHash integer
---@return boolean, integer, integer, integer, integer, integer, integer, integer
function ItemdatabaseGetShopLayoutMenuInfoByIndex(layoutHash, menuHash, index)
    local outData = DataView.ArrayBuffer(7*8)

    local res = Citizen.InvokeNative(0xF04247092F193B75, layoutHash, menuHash, index, outData:Buffer()) == 1
    local hash1 = outData:GetInt32(0*8) -- hash
    local hash2 = outData:GetInt32(1*8) -- hash
    local hash3 = outData:GetInt32(2*8) -- hash
    local unk4 = outData:GetInt32(3*8) -- count
    local unk5 = outData:GetInt32(4*8)
    local unk6 = outData:GetInt32(5*8) -- count
    local unk7 = outData:GetInt32(6*8) -- count

    return res, hash1, hash2, hash3, unk4, unk5, unk6, unk7
end

---
---@param layoutHash integer
---@param menuHash integer
---@param index integer
---@return integer
function ItemdatabaseGetShopLayoutMenuPageKey(layoutHash, menuHash, index)
    return Citizen.InvokeNative(0x9A60570657A7B635, layoutHash, menuHash, index, Citizen.PointerValueInt())
end

---
---@param layoutHash integer
---@param pageHash integer
---@param index integer
---@return integer
function ItemdatabaseGetShopLayoutPageItemKey(layoutHash, pageHash, index)
    return Citizen.InvokeNative(0xF32BEF578B3DBAE8, layoutHash, pageHash, index, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
end

---
---@param layoutHash integer
---@param pageHash integer
---@return boolean, integer, integer, integer
function ItemdatabaseGetShopLayoutPageInfoByKey(layoutHash, pageHash)
    local outData = DataView.ArrayBuffer(4*8)
    local res = Citizen.InvokeNative(0xB347C100DF0C9B7F, layoutHash, pageHash, outData:Buffer()) == 1
    local unk1 = outData:GetInt32(1*8)
    local unk2 = outData:GetInt32(2*8)
    local unk3 = outData:GetInt32(3*8)

    return res, unk1, unk2, unk3
end

---
---@param itemHash integer
---@param sellType integer
---@return boolean, Hash, table
function ItemdatabaseFilloutSellPrice(itemHash, sellType)
    local prices = {}

    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(4*8, 10)

    local res = Citizen.InvokeNative(0x7A62A2EEDE1C3766, itemHash, sellType, outData:Buffer()) == 1
    local o1 = outData:GetInt32(2*8)
    local numPrices = outData:GetInt32(3*8)
    if (numPrices > 0) then
        local startOffset = 5
        local tblSize = 2
        for i = startOffset, startOffset + (numPrices-1)*tblSize, tblSize do
            local price = {}
            price[1] = outData:GetInt32(i*8) -- currency type
            price[2] = outData:GetInt32((i+1)*8) -- amount
            table.insert(prices, price)
        end
    end

    return res, o1, prices
end

---
---@param itemHash integer
---@param index integer
---@return boolean, integer, integer, integer, integer
function ItemdatabaseGetAcquireCost(itemHash, index)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(4*8, 15)
    outData:SetInt32(36*8, 10)

    local res            = Citizen.InvokeNative(0x6772A83C67A25775, itemHash, index, outData:Buffer()) == 1
    local cost           = outData:GetInt32(0*8)
    local costType       = outData:GetInt32(2*8)
    local currency       = outData:GetInt32(5*8)
    local currencyAmount = outData:GetInt32(6*8)
    
    return res, cost, costType, currency, currencyAmount
end

---@todo
---@param award Hash
---@param index integer
---@return boolean, Hash
function ItemdatabaseGetAwardAcquireCost(award, index)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(4*8, 15)
    outData:SetInt32(36*8, 10)

    local res = Citizen.InvokeNative(0x1FC25AEB5F76B38D, award, index, outData:Buffer()) == 1
    local hash = outData:GetInt32(2*8)
   
    return res, hash
end

---Return a list of modifiers for the given award.
---@param award Hash
---@return boolean, table
function ItemdatabaseGetAwardCostModifiers(award)
    local modifiers    = {}
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(1*8, 10)

    local res          = Citizen.InvokeNative(0xE81D0378A384E755, award, outData:Buffer()) == 1
    local numModifiers = outData:GetInt32(0*8)
    if (numModifiers > 0) then
        local startOffset = 2
        for i = startOffset, startOffset + (numModifiers-1) do
            table.insert(modifiers, outData:GetInt32(i*8))
        end
    end

    return res, modifiers
end

---Return the modifier currencyType and value at the selected index.
---@param modifier Hash
---@param index integer
---@return boolean, Hash, float
function ItemdatabaseFilloutModifier(modifier, index)
    local outData = DataView.ArrayBuffer(2*8)

    local res          = Citizen.InvokeNative(0x60614A0AB580A2B5, modifier, index, outData:Buffer()) == 1
    local currencyType = outData:GetInt32(0*8)
    local value        = outData:GetFloat32(1*8)

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
    local o0 = outData:GetInt32(2*8) -- same as ItemdatabaseFilloutSellPrice offset 2
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

---Returns a first table of data composed of 2 varstrings and a hash, and a second table of 1 labelHash and unk value.
---@param item Hash
---@return boolean, table, table
function ItemdatabaseFilloutUiData(item)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(2*8, 5)
    outData:SetInt32(18*8, 8)

    local res = Citizen.InvokeNative(0xB86F7CC2DC67AC60, item, outData:Buffer()) == 1
    
    local tbl = {}
    local startOffset = 3
    local tblSize = 3
    local i = startOffset
    while (i < startOffset + 5*tblSize and outData:GetInt64(i*8) ~= 0) do
        table.insert(tbl, {
            outData:GetInt64(i*8), -- 
            outData:GetInt64((i+1)*8), -- 
            outData:GetInt32((i+2)*8) -- hash
        })
        i = i + tblSize
    end
    
    local tbl2 = {}
    local startOffset = 19
    local tblSize = 2
    local i = startOffset
    while (i < startOffset + 8*tblSize and outData:GetInt32(i*8) ~= 0) do
        table.insert(tbl2, {
            outData:GetInt32(i*8), -- label hash
            outData:GetInt32((i+1)*8) -- unknown
        })
        i = i + tblSize
    end

    return res, tbl, tbl2
end

---@todo
---
---@param bundle Hash
---@param costtype Hash
---@param index integer
---@return boolean, 
function ItemdatabaseFilloutBundle(bundle, costtype, index)
    local outData = DataView.ArrayBuffer(20*8)
    outData:SetInt32(0, 15)

    local res = Citizen.InvokeNative(0xB542632693D53408, bundle, costtype, index, outData:Buffer()) == 1

    return res
end

---Number of N_0x8D029948CA29409B entries for the given hash
---@param award integer
---@return integer
function ItemdatabaseGetAwardUnlockFlagCount(award)
    return Citizen.InvokeNative(0x48229CE0C7938237, award, Citizen.ResultAsInteger())
end
exports("ItemdatabaseGetAwardUnlockFlagCount", ItemdatabaseGetAwardUnlockFlagCount)

---
---@param award integer
---@param index integer
---@return boolean, integer, table
function ItemdatabaseFilloutAwardUnlockFlag(award, index)
    local tbl = {}
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(1*8, 10)

    local res  = Citizen.InvokeNative(0x8D029948CA29409B, award, index, outData:Buffer()) == 1
    local item = outData:GetInt32(0*8)
    
    local i = 2
    while (outData:GetInt32(i*8) ~= 0) do
        table.insert(tbl, {
            outData:GetInt32(i*8), -- Flag hash
            outData:GetInt32((i+1)*8) == 1 -- boolean value
        })
        i = i + 2
    end

    return res, item, tbl
end
exports("ItemdatabaseFilloutAwardUnlockFlag", ItemdatabaseFilloutAwardUnlockFlag)

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
function N_0xD076DB9B96FAADF1(p0)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(3*8, 10)

    local res = Citizen.InvokeNative(0xD076DB9B96FAADF1, p0, outData:Buffer()) == 1
    local o0 = outData:GetInt32(1*8)
    local numRewards = outData:GetInt32(2*8)

    local rewards = {}
    if (numRewards > 0) then
        local startOffset = 4
        local tblSize = 2
        for i = startOffset, startOffset + (numRewards - 1)*tblSize, tblSize do
            local reward = {}
            reward[1] = outData:GetInt32(i*8)
            reward[2] = outData:GetFloat32((i+1)*8)
            table.insert(rewards, reward)
        end
    end

    return res, o0, numRewards, rewards
end