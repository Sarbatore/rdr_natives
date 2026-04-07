---Outputs the item infos (category, type, flags, model, award)
---@param itemHash integer
---@return boolean success
---@return integer catalogItemCategoryHash
---@return integer itemTypeHash
---@return integer flags
---@return integer modelHash
---@return integer awardHash
function ItemdatabaseFilloutItemInfo(itemHash)
    local outData = DataView.ArrayBuffer(6*8)
    
    local success                 = Citizen.InvokeNative(0xFE90ABBCBFDC13B2, itemHash, outData:Buffer()) == 1
    local catalogItemCategoryHash = outData:GetInt32(1*8)
    local itemTypeHash            = outData:GetInt32(2*8)
    local flags                   = outData:GetInt32(3*8)
    local modelHash               = outData:GetInt32(4*8)
    local awardHash               = outData:GetInt32(5*8)

    return success, catalogItemCategoryHash, itemTypeHash, flags, modelHash, awardHash
end

---
---@param itemHash integer
---@return boolean success
---@return integer catalogItemCategoryHash
---@return integer categoryHash
---@return integer modelHash
function ItemdatabaseFilloutItemByName(itemHash)
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

    local success                 = Citizen.InvokeNative(0x2A610BEE7D341CC4, itemHash, outData:Buffer()) == 1
    local catalogItemCategoryHash = outData:GetInt32(1*8)
    local categoryHash            = outData:GetInt32(2*8)
    local modelHash               = outData:GetInt32(3*8)

    return success, catalogItemCategoryHash, categoryHash, modelHash
end

---
---@param itemHash integer
---@param costHash integer
---@return integer
function ItemdatabaseGetAcquireCostsCountFromCostType(itemHash, costHash)
    return Citizen.InvokeNative(0xDEE7B3C76ED664BE, itemHash, costHash, Citizen.ResultAsInteger())
end

---Fill out item acquire cost.
---@param itemHash integer
---@param costHash integer
---@param index integer
---@return boolean success
---@return integer priceHash
---@return integer amount
function ItemdatabaseFilloutItem(itemHash, costHash, index)
    local outData = DataView.ArrayBuffer(2*8)
    
    local success   = Citizen.InvokeNative(0xAD73B614DF26CF8A, itemHash, costHash, index, outData:Buffer()) == 1
    local priceHash = outData:GetInt32(0*8)
    local amount    = outData:GetInt32(1*8)

    return success, priceHash, amount
end

---Returns a list of effects
---@param itemHash integer
---@return boolean success
---@return table effectsHash
function ItemdatabaseFilloutItemEffectIds(itemHash)
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(1*8, 20)
    
    local success     = Citizen.InvokeNative(0x9379BE60DC55BBE6, itemHash, outData:Buffer()) == 1
    local effectsHash = {}

    local numEffects = outData:GetInt32(0*8)
    if (numEffects > 0) then
        local startOffset = 2
        local endOffset = startOffset + (numEffects - 1)
        for i = startOffset, endOffset do
            table.insert(effectsHash, outData:GetInt32(i*8))
        end
    end

    return success, effectsHash
end

---
---@param effectId number
---@return boolean success
---@return integer effectHash
---@return integer value
---@return integer time
---@return integer timeUnits
---@return number corePercent
---@return integer durationCategoryHash
function ItemdatabaseFilloutItemEffectIdInfo(effectId)
    local outData = DataView.ArrayBuffer(7*8)

    local success              = Citizen.InvokeNative(0xCF2D360D27FD1ABF, effectId, outData:Buffer()) == 1
    local effectHash           = outData:GetInt32(1*8)
    local value                = outData:GetInt32(2*8)
    local time                 = outData:GetInt32(3*8)
    local timeUnits            = outData:GetInt32(4*8)
    local corePercent          = outData:GetFloat32(5*8)
    local durationCategoryHash = outData:GetInt32(6*8)

    return success, effectHash, value, time, timeUnits, corePercent, durationCategoryHash
end

---Return the slot id for the category at the selected index.
---@param categoryHash integer
---@param index integer
---@return boolean success
---@return integer slotIdHash
function ItemdatabaseGetFitsSlotInfo(categoryHash, index)
    local outData = DataView.ArrayBuffer(1*8)

    local success    = Citizen.InvokeNative(0x77210C146CED5261, categoryHash, index, outData:Buffer()) == 1
    local slotIdHash = outData:GetInt32(0)

    return success, slotIdHash
end

---Return the number of items for the bundle
---@param bundleHash integer
---@return integer
function ItemdatabaseGetBundleItemCount(bundleHash)
    local data = DataView.ArrayBuffer(8*8)
    data:SetInt32(0*8, 1)
    return Citizen.InvokeNative(0x3332695B01015DF9, bundleHash, data:Buffer(), Citizen.ResultAsInteger())
end

---Return bundle item info at the selected index (item hash, slot id...)
---@param bundleHash integer
---@param index integer
---@return boolean success
---@return integer itemHash
---@return integer slotIdHash
---@return integer unkNum1
---@return integer unkNum2
function ItemdatabaseGetBundleItemInfo(bundleHash, index)
    local data = DataView.ArrayBuffer(1*8)
    data:SetInt32(0*8, 1)
    local outData = DataView.ArrayBuffer(4*8)
    
    local success    = Citizen.InvokeNative(0x5D48A77E4B668B57, bundleHash, data:Buffer(), index, outData:Buffer()) == 1
    local itemHash   = outData:GetInt32(0*8)
    local slotIdHash = outData:GetInt32(1*8)
    local unkNum1    = outData:GetInt32(2*8)
    local unkNum2    = outData:GetInt32(3*8)

    return success, itemHash, slotIdHash, unkNum1, unkNum2
end

---Create an item collection and return its id and size.
---@param slotIdHash integer
---@param slotId2Hash integer
---@param tagHash integer TAG_ITEM_PROPERTY etc...
---@param catalogItemCategoryHash integer CI_CATEGORY_CAMP_TENT etc...
---@param costHash integer COST_GOLD etc...
---@param sellHash integer SELL_SHOP_DEFAULT etc...
---@param flag integer Number from -1 to 3
---@param itemTypeHash integer WEAPON, ITEM, etc...
---@param catalogItemTagHash integer
---@return integer collectionId
---@return integer size
function ItemdatabaseCreateItemCollection(slotIdHash, slotId2Hash, tagHash, catalogItemCategoryHash, costHash, sellHash, flag, itemTypeHash, catalogItemTagHash)
    local filterData = DataView.ArrayBuffer(15*8)
    filterData:SetInt32(0*8, slotIdHash)
    filterData:SetInt32(1*8, slotId2Hash)
    filterData:SetInt32(2*8, tagHash)
    filterData:SetInt32(3*8, catalogItemCategoryHash)
    filterData:SetInt32(4*8, costHash)
    filterData:SetInt32(5*8, sellHash)
    filterData:SetInt32(6*8, flag)
    filterData:SetInt32(7*8, itemTypeHash)
    filterData:SetInt32(8*8, catalogItemTagHash)
    local sizeData = DataView.ArrayBuffer(1*8)

    local collectionId = Citizen.InvokeNative(0x71EFA7999AE79408, filterData:Buffer(), sizeData:Buffer(), 1, Citizen.ResultAsInteger())
    local size         = sizeData:GetInt32(0)

    return collectionId, size
end

---
---@param itemHash integer
---@return boolean success
---@return table modifiersHash
function ItemdatabaseGetItemPriceModifiers(itemHash)
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(1*8, 10)
    
    local success       = Citizen.InvokeNative(0x4EB37AAB79AB0C48, itemHash, outData:Buffer()) == 1
    local modifiersHash = {}
    
    local numModifiers = outData:GetInt32(0*8)
    if (numModifiers > 0) then
        local startOffset = 2
        local endOffset = startOffset + (numModifiers - 1)
        for i = startOffset, endOffset do
            table.insert(modifiersHash, outData:GetInt32(i*8))
        end
    end

    return success, modifiersHash
end

---
---@param itemHash integer
---@return boolean success
---@return integer unkHash
function ItemdatabaseFilloutPriceModifierByKey(itemHash)
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(3*8, 10)
    outData:SetInt32(15*8, 10)

    local success  = Citizen.InvokeNative(0x40C5D95818823C94, itemHash, outData:Buffer()) == 1
    local unkHash  = outData:GetInt32(1*8) -- can be: -1626069400, -1406468552, -468109055, -416870516, -195968340, -144780764, 381795783, 1632947550

    return success, unkHash
end

---@todo seems to be broken, tested with +3millions hashes
---@param bundleHash integer
---@return boolean success
---@return table modifiersHash
function ItemdatabaseGetBundleAcquireCostModifiers(bundleHash)
    local outData = DataView.ArrayBuffer(1024*8)
    outData:SetInt32(1*8, 10)

    local success       = Citizen.InvokeNative(0xA97EE5E4589FCF5A, bundleHash, outData:Buffer())-- == 1
    local modifiersHash = {}
    
    local numModifiers = outData:GetInt32(0*8)
    if (numModifiers > 0) then
        local startOffset = 2
        local endOffset = startOffset + numModifiers - 1
        for i = startOffset, endOffset do
            table.insert(modifiersHash, outData:GetInt32(i*8))
        end
    end
    
    return success, modifiersHash
end

---Return a list of tag data for the given item.
---@param itemHash integer
---@param size integer Number of tags to retrieve
---@return boolean success
---@return table tags 2D array of tag pairs, first value is the CI_TAG_ hash, second value is the TAG_ hash
function ItemdatabaseFilloutTagData(itemHash, size)
    local outData = DataView.ArrayBuffer(40*8)
    outData:SetInt32(0*8, size)
    local outSize = DataView.ArrayBuffer(1*8)

    local success = Citizen.InvokeNative(0x5A11D6EEA17165B0, itemHash, outData:Buffer(), outSize:Buffer(), size) == 1
    local tags    = {}
    
    local numTags = outSize:GetInt32(0)
    if (numTags > 0) then
        local startOffset = 1
        local tblSize = 2
        local endOffset = startOffset + (numTags - 1) * tblSize
        for i = startOffset, endOffset, tblSize do
            table.insert(tags, {
                outData:GetInt32(i*8),
                outData:GetInt32((i+1)*8)
            })
        end
    end

    return success, tags
end

---
---@param shopTypeHash integer
---@param shopInventoryIndex integer
---@return boolean success
---@return integer itemHash
---@return any unk
---@return integer numRequirementGroup
function ItemdatabaseGetShopInventoriesItemInfo(shopTypeHash, shopInventoryIndex)
    local outData = DataView.ArrayBuffer(3*8)

    local success             = Citizen.InvokeNative(0x4A79B41B4EB91F4E, shopTypeHash, shopInventoryIndex, outData:Buffer()) == 1
    local itemHash            = outData:GetInt32(0*8)
    local unk                 = outData:GetInt32(1*8)
    local numRequirementGroup = outData:GetInt32(2*8)

    return success, itemHash, unk, numRequirementGroup
end

---
---@param shopTypeHash integer
---@param itemHash integer
---@return boolean success
---@return any unk
---@return integer numRequirementGroup
function ItemdatabaseGetShopInventoriesItemInfoByKey(shopTypeHash, itemHash)
    local outData = DataView.ArrayBuffer(3*8)

    local success             = Citizen.InvokeNative(0xCFB06801F5099B25, shopTypeHash, itemHash, outData:Buffer()) == 1
    local unk                 = outData:GetInt32(1*8)
    local numRequirementGroup = outData:GetInt32(2*8)

    return success, unk, numRequirementGroup
end

---Return the number of requirements for shop item
---@param shopTypeHash integer
---@param itemHash integer
---@param groupIndex integer
---@return boolean success
---@return integer unkHash
---@return integer numRequirements
function ItemdatabaseGetShopInventoriesRequirementGroupInfo(shopTypeHash, itemHash, groupIndex)
    local outData = DataView.ArrayBuffer(2*8)

    local success         = Citizen.InvokeNative(0x76C752D788A76813, shopTypeHash, itemHash, groupIndex, outData:Buffer()) == 1
    local unkHash         = outData:GetInt32(0*8)
    local numRequirements = outData:GetInt32(1*8)

    return success, unkHash, numRequirements
end

---
---@param shopTypeHash integer
---@param unkHash integer
---@param groupIndex integer
---@param requirementIndex integer
---@return boolean success
---@return integer requirementTypeHash
---@return integer requirementHash
---@return integer num
---@return boolean state
function ItemdatabaseGetShopInventoriesRequirementInfo(shopTypeHash, unkHash, groupIndex, requirementIndex)
    local outData = DataView.ArrayBuffer(4*8)

    local success             = Citizen.InvokeNative(0xE0EA5C031AE5539F, shopTypeHash, unkHash, groupIndex, requirementIndex, outData:Buffer()) == 1
    local requirementTypeHash = outData:GetInt32(0*8)
    local requirementHash     = outData:GetInt32(1*8)
    local num                 = outData:GetInt32(2*8)
    local state               = outData:GetInt32(3*8) == 1

    return success, requirementTypeHash, requirementHash, num, state
end

---Outputs the layoutHash page info at the selected index.
---@param layoutHash integer
---@param index integer
---@return boolean success
---@return integer pageHash
---@return integer unkHash
---@return boolean unkBoolean
---@return integer numItems
function ItemdatabaseGetShopLayoutPageInfoByIndex(layoutHash, index)
    local outData = DataView.ArrayBuffer(4*8)

    local success    = Citizen.InvokeNative(0xDBEADA0DF5F9AB9F, layoutHash, index, outData:Buffer()) == 1
    local pageHash   = outData:GetInt32(0*8)
    local unkHash    = outData:GetInt32(1*8)
    local unkBoolean = outData:GetInt32(2*8) == 1
    local numItems   = outData:GetInt32(3*8)

    return success, pageHash, unkHash, unkBoolean, numItems
end

---Outputs the layoutHash page info for the given pageHash.
---@param layoutHash integer
---@param pageHash integer
---@return boolean success
---@return integer unkHash
---@return boolean unkBoolean
---@return integer numItems
function ItemdatabaseGetShopLayoutPageInfoByKey(layoutHash, pageHash)
    local outData = DataView.ArrayBuffer(4*8)
    
    local success    = Citizen.InvokeNative(0xB347C100DF0C9B7F, layoutHash, pageHash, outData:Buffer()) == 1
    local unkHash    = outData:GetInt32(1*8)
    local unkBoolean = outData:GetInt32(2*8) == 1
    local numItems   = outData:GetInt32(3*8)

    return success, unkHash, unkBoolean, numItems
end

---
---@param layoutHash integer
---@param menuHash integer
---@param index integer
---@return boolean success
---@return integer pageHash
function ItemdatabaseGetShopLayoutMenuPageKey(layoutHash, menuHash, index)
    local outData = DataView.ArrayBuffer(1*8)

    local success  = Citizen.InvokeNative(0x9A60570657A7B635, layoutHash, menuHash, index, outData:Buffer()) == 1
    local pageHash = outData:GetInt32(0)

    return success, pageHash
end

---
---@param layoutHash integer
---@param pageHash integer
---@param index integer
---@return boolean success
---@return integer itemHash
---@return integer menu
---@return integer layout
function ItemdatabaseGetShopLayoutPageItemKey(layoutHash, pageHash, index)
    local outData1 = DataView.ArrayBuffer(1*8)
    local outData2 = DataView.ArrayBuffer(1*8)
    local outData3 = DataView.ArrayBuffer(1*8)

    local success  = Citizen.InvokeNative(0xF32BEF578B3DBAE8, layoutHash, pageHash, index, outData1:Buffer(), outData2:Buffer(), outData3:Buffer()) == 1
    local itemHash = outData1:GetInt32(0)
    local menu     = outData3:GetInt32(0)
    local layout   = outData2:GetInt32(0)

    return success, itemHash, menu, layout
end

---
---@param layoutHash integer
---@return boolean success
---@return integer shopTypeHash
---@return integer unk
---@return integer numPages
function ItemdatabaseGetShopLayoutInfo(layoutHash)
    local outData = DataView.ArrayBuffer(4*8)

    local success      = Citizen.InvokeNative(0x66A6D76B6BB999B4, layoutHash, outData:Buffer()) == 1
    local shopTypeHash = outData:GetInt32(1*8)
    local unk          = outData:GetInt32(2*8)
    local numPages     = outData:GetInt32(3*8)

    return success, shopTypeHash, unk, numPages
end

---
---@param layoutHash integer
---@param index integer
---@return boolean success
---@return integer menuHash
---@return integer unkNum
function ItemdatabaseGetShopLayoutRootMenuInfo(layoutHash, index)
    local outData = DataView.ArrayBuffer(7*8)

    local success  = Citizen.InvokeNative(0x86FCB565CCA0CFA7, layoutHash, index, outData:Buffer()) == 1
    local menuHash = outData:GetInt32(0*8)
    local unkNum   = outData:GetInt32(6*8)

    return success, menuHash, unkNum
end

---
---@param layoutHash integer
---@param menuHash integer
---@return boolean success
---@return integer unk1
---@return integer unk3
---@return integer numPages
---@return integer numInfo
function ItemdatabaseGetShopLayoutMenuInfoById(layoutHash, menuHash)
    local outData = DataView.ArrayBuffer(8*8)

    local success  = Citizen.InvokeNative(0xD66114469978B55B, layoutHash, menuHash, outData:Buffer()) == 1
    local unk1     = outData:GetInt32(1*8)
    local unk3     = outData:GetInt32(3*8)
    local numPages = outData:GetInt32(5*8)
    local numInfo  = outData:GetInt32(6*8)

    return success, unk1, unk3, numPages, numInfo
end

---
---@param layoutHash integer
---@param menuHash integer
---@return boolean success
---@return integer
---@return integer
---@return integer
---@return integer
---@return integer
---@return integer
---@return integer
function ItemdatabaseGetShopLayoutMenuInfoByIndex(layoutHash, menuHash, index)
    local outData = DataView.ArrayBuffer(7*8)

    local success = Citizen.InvokeNative(0xF04247092F193B75, layoutHash, menuHash, index, outData:Buffer()) == 1
    local hash1 = outData:GetInt32(0*8) -- hash
    local hash2 = outData:GetInt32(1*8) -- hash
    local hash3 = outData:GetInt32(2*8) -- hash
    local unk4  = outData:GetInt32(3*8) -- count
    local unk5  = outData:GetInt32(4*8)
    local unk6  = outData:GetInt32(5*8) -- count
    local unk7  = outData:GetInt32(6*8) -- count

    return success, hash1, hash2, hash3, unk4, unk5, unk6, unk7
end

---
---@param itemHash integer
---@param sellTypeHash integer SELL_SHOP_DEFAULT, etc...
---@return boolean success
---@return integer costTypeHash
---@return table sellPrices 2D array of price pairs, first value is the price hash, second value is the amount
function ItemdatabaseFilloutSellPrice(itemHash, sellTypeHash)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(4*8, 10)

    local success      = Citizen.InvokeNative(0x7A62A2EEDE1C3766, itemHash, sellTypeHash, outData:Buffer()) == 1
    local costTypeHash = outData:GetInt32(2*8)
    local sellPrices   = {}

    local numPrices = outData:GetInt32(3*8)
    if (numPrices > 0) then
        local startOffset = 5
        local tblSize = 2
        local endOffset = startOffset + (numPrices - 1) * tblSize
        for i = startOffset, endOffset, tblSize do
            table.insert(sellPrices, {
                outData:GetInt32(i*8),
                outData:GetInt32((i+1)*8)
            })
        end
    end

    return success, costTypeHash, sellPrices
end

---
---@param itemHash integer
---@param index integer
---@return boolean success
---@return integer costHash
---@return integer costTypeHash
---@return table costs 2D array of cost pairs, first value is the price hash, second value is the amount
function ItemdatabaseGetAcquireCost(itemHash, index)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(4*8, 15)
    outData:SetInt32(36*8, 10)

    local success      = Citizen.InvokeNative(0x6772A83C67A25775, itemHash, index, outData:Buffer()) == 1
    local costHash     = outData:GetInt32(0*8)
    local costTypeHash = outData:GetInt32(2*8)
    local costs        = {}

    local numCosts = outData:GetInt32(3*8)
    if (numCosts > 0) then
        local startOffset = 5
        local tableSize = 2
        local endOffset = startOffset + (numCosts - 1) * tableSize
        for i = startOffset, endOffset, tableSize do
            table.insert(costs, {
                outData:GetInt32(i*8),
                outData:GetInt32((i + 1)*8)
            })
        end
    end
    
    return success, costHash, costTypeHash, costs
end

---
---@param itemHash integer
---@param costHash integer
---@return boolean success
---@return integer costTypeHash
---@return table costs 2D array of cost pairs, first value is the price hash, second value is the amount
---@return integer unknown
function ItemdatabaseFilloutAcquireCost(itemHash, costHash)
    local outData = DataView.ArrayBuffer(38*8)
    outData:SetInt32(4*8, 15)
    outData:SetInt32(36*8, 10)

    local success      = Citizen.InvokeNative(0x74F7928816E4E181, itemHash, costHash, outData:Buffer()) == 1
    local costTypeHash = outData:GetInt32(2*8)
    local costs        = {}
    local unknown      = outData:GetInt32(37*8)

    local numCosts = outData:GetInt32(3*8)
    if (numCosts > 0) then
        local startOffset = 5
        local tableSize = 2
        local endOffset = startOffset + (numCosts - 1) * tableSize
        for i = startOffset, endOffset, tableSize do
            table.insert(costs, {
                outData:GetInt32(i*8),
                outData:GetInt32((i + 1)*8)
            })
        end
    end

    return success, costTypeHash, costs, unknown
end

---
---@param awardHash integer
---@param index integer
---@return boolean success
---@return integer acquireCostHash
function ItemdatabaseGetAwardAcquireCost(awardHash, index)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(4*8, 15)
    outData:SetInt32(36*8, 10)

    local success         = Citizen.InvokeNative(0x1FC25AEB5F76B38D, awardHash, index, outData:Buffer()) == 1
    local acquireCostHash = outData:GetInt32(2*8)
   
    return success, acquireCostHash
end

---Return a list of modifiers for the given award.
---@param awardHash integer
---@return boolean success
---@return table modifiersHash
function ItemdatabaseGetAwardCostModifiers(awardHash)
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(1*8, 10)
    
    local success       = Citizen.InvokeNative(0xE81D0378A384E755, awardHash, outData:Buffer()) == 1
    local modifiersHash = {}

    local numModifiers = outData:GetInt32(0*8)
    if (numModifiers > 0) then
        local startOffset = 2
        local endOffset = startOffset + (numModifiers - 1)
        for i = startOffset, endOffset do
            table.insert(modifiersHash, outData:GetInt32(i*8))
        end
    end

    return success, modifiersHash
end

---Return the modifier currencyType and multiplier at the selected index.
---@param modifierHash integer
---@param index integer
---@return boolean success
---@return integer currencyTypeHash
---@return number multiplier
function ItemdatabaseFilloutModifier(modifierHash, index)
    local outData = DataView.ArrayBuffer(2*8)

    local success          = Citizen.InvokeNative(0x60614A0AB580A2B5, modifierHash, index, outData:Buffer()) == 1
    local currencyTypeHash = outData:GetInt32(0*8)
    local multiplier       = outData:GetFloat32(1*8)

    return success, currencyTypeHash, multiplier
end

---
---@param awardHash integer
---@param index integer
---@return boolean success
---@return integer itemHash
---@return integer unk
---@return integer unkHash
function ItemdatabaseFilloutAwardItemInfo(awardHash, index)
    local outData = DataView.ArrayBuffer(3*8)

    local success  = Citizen.InvokeNative(0x121D2005DD64496B, awardHash, index, outData:Buffer()) == 1
    local itemHash = outData:GetInt32(0*8)
    local unk      = outData:GetInt32(1*8)
    local unkHash  = outData:GetInt32(2*8)

    return success, itemHash, unk, unkHash
end

---Returns a first table of data composed of 2 varstrings and a hash, and a second table of 1 labelHash and unk value.
---@param itemHash integer
---@return boolean, table, table
function ItemdatabaseFilloutUiData(itemHash)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(2*8, 5)
    outData:SetInt32(18*8, 8)

    local res = Citizen.InvokeNative(0xB86F7CC2DC67AC60, itemHash, outData:Buffer()) == 1
    local tbl = {}
    local tbl2 = {}

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

---
---@param awardHash integer
---@return boolean success
---@return integer hash
---@return integer hashString
---@return table tbl 2D array of label1, label2, hash
function ItemdatabaseFilloutBuyAwardUiData(awardHash)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(2*8, 5)
    outData:SetInt32(18*8, 8)

    local success    = Citizen.InvokeNative(0xF8D09EF8CE61D7BF, awardHash, outData:Buffer()) == 1
    local hash       = outData:GetInt32(0*8)
    local hashString = outData:GetInt32(1*8)
    local tbl        = {}

    for i = 3, 63, 3 do
        local label1 = outData:GetInt64(i*8)
        if (label1 == 0) then break end
        local label2 = outData:GetInt64((i+1)*8)
        local hash = outData:GetInt32((i+2)*8)
        table.insert(tbl, {label1, label2, hash})
    end

    return success, hash, hashString, tbl
end

---Retrieve acquire costs for a buy award.
---@param awardHash integer
---@return boolean success
---@return table acquireCosts 2D array of cost data. e.g: ` {-1571233163, 1400824947, { {-595319816, 1}, {773203532, 500} }} `
function ItemdatabaseFilloutBuyAwardAcquireCosts(awardHash)
    local outData = DataView.ArrayBuffer(1024*8)
    outData:SetInt32(0, 10)
    local baseOffset = 1 * 8
    for i = 0, 9 do
        local currentNodeOffset = baseOffset + (i * 47 * 8)

        local offset_f4 = currentNodeOffset + (4 * 8)
        outData:SetInt32(offset_f4, 15)

        local offset_f36 = currentNodeOffset + (36 * 8)
        outData:SetInt32(offset_f36, 10)
    end
    local outSize = DataView.ArrayBuffer(1*8)

    local success = Citizen.InvokeNative(0xB52E20F6767A09A2, awardHash, outData:Buffer(), outSize:Buffer(), 10) == 1
    local acquireCosts = {}
    
    local numAcquireCosts = outSize:GetInt32(0)
    for i = 0, numAcquireCosts - 1 do
        local currentNodeOffset = baseOffset + (i * 47) * 8
        local costHash = outData:GetInt32(currentNodeOffset + (0 * 8))
        local costTypeHash = outData:GetInt32(currentNodeOffset + (2 * 8))
        local numPrices = outData:GetInt32(currentNodeOffset + (3 * 8))
        local prices = {}
        for j = 0, numPrices - 1 do
            local priceHash = outData:GetInt32(currentNodeOffset + ((5 + (j * 2)) * 8))
            local amount = outData:GetInt32(currentNodeOffset + ((5 + (j * 2) + 1) * 8))
            table.insert(prices, {
                priceHash,
                amount
            })
        end
        table.insert(acquireCosts, {
            costHash,
            costTypeHash,
            prices
        })
    end

    return success, acquireCosts
end

---
---@param awardHash integer
---@param costHash integer
---@param index integer
---@return boolean
---@return integer priceHash `CURRENCY_GOLD_BAR`, etc...
---@return integer priceAmount
function ItemdatabaseFilloutAwardAcquireCost(awardHash, costHash, index)
    local outData = DataView.ArrayBuffer(2*8)
    outData:SetInt32(0*8, 15)

    local success = Citizen.InvokeNative(0xF27F01BBF5ACD3F3, awardHash, costHash, index, outData:Buffer()) == 1
    local priceHash = success and outData:GetInt32(0*8) or 0
    local priceAmount = outData:GetInt32(1*8)

    return success, priceHash, priceAmount
end

---
---@param bundleHash integer
---@param costHash integer
function ItemdatabaseGetBundleAcquireCostsCountFromCost(bundleHash, costHash)
    return Citizen.InvokeNative(0x388088BFF3681189, bundleHash, costHash, Citizen.ResultAsInteger())
end

---Return the number of items in the bundle for the given bundle hash to use with N_0x3A0B667ABFF87F6E to get item info.
---@param bundleHash integer
---@return integer count
function ItemdatabaseGetBundleAcquireCostsCount(bundleHash)
    return Citizen.InvokeNative(0x7A35A72A692BE9DB, bundleHash, Citizen.ResultAsInteger())
end

---Fillout some bundle cost related data, to use with N_0x7A35A72A692BE9DB to get count.
---@param bundleHash integer
---@param index integer
---@return boolean success
---@return integer costHash
---@return integer costTypeHash
---@return table costs 2D array of cost pairs, first value is the price hash, second value is the amount
function ItemdatabaseGetBundleAcquireCost(bundleHash, index)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(4*8, 15)
    outData:SetInt32(36*8, 10)

    local success      = Citizen.InvokeNative(0x3A0B667ABFF87F6E, bundleHash, index, outData:Buffer()) == 1
    local costHash     = outData:GetInt32(0*8)
    local costTypeHash = outData:GetInt32(2*8)
    local costs        = {}

    local numCosts = outData:GetInt32(3*8)
    if (numCosts > 0) then
        local startOffset = 5
        local tableSize = 2
        local endOffset = startOffset + (numCosts - 1) * tableSize
        for i = startOffset, endOffset, tableSize do
            table.insert(costs, {
                outData:GetInt32(i*8),
                outData:GetInt32((i + 1)*8)
            })
        end
    end

    return success, costHash, costTypeHash, costs
end

---Return bundle cost
---@param bundleHash integer
---@param costHash integer
---@param index integer
---@return boolean success
---@return integer priceHash `CURRENCY_GOLD_BAR`, etc...
---@return integer amount
function ItemdatabaseFilloutBundle(bundleHash, costHash, index)
    local outData = DataView.ArrayBuffer(2*8)
    outData:SetInt32(0, 15)

    local success   = Citizen.InvokeNative(0xB542632693D53408, bundleHash, costHash, index, outData:Buffer()) == 1
    local priceHash = outData:GetInt32(0*8)
    local amount    = outData:GetInt32(1*8)

    return success, priceHash, amount
end

---Number of N_0x8D029948CA29409B entries for the given hash
---@param awardHash integer
---@return integer
function ItemdatabaseGetAwardUnlockFlagCount(awardHash)
    return Citizen.InvokeNative(0x48229CE0C7938237, awardHash, Citizen.ResultAsInteger())
end

---
---@param awardHash integer AWARD_DEBUG_HIDE_LEGENDARY_BOUNTY_00...
---@param index integer
---@return boolean success
---@return integer itemHash
---@return integer unlockFlagHash UF_VISIBLE...
function ItemdatabaseFilloutAwardUnlockFlag(awardHash, index)
    local outData = DataView.ArrayBuffer(3*8)
    outData:SetInt32(1*8, 10)

    local success        = Citizen.InvokeNative(0x8D029948CA29409B, awardHash, index, outData:Buffer()) == 1
    local itemHash       = outData:GetInt32(0*8)
    local unlockFlagHash = outData:GetInt32(2*8)

    return success, itemHash, unlockFlagHash
end

---Return num rewards and rewards data of the hash
---@param awardHash integer
---@return boolean success
---@return integer unkHash
---@return table rewards 2D array of reward pairs, first value is the item hash, second value is the value
function ItemdatabaseGetAwardInfo(awardHash)
    local outData = DataView.ArrayBuffer(64*8)
    outData:SetInt32(3*8, 10)

    local success = Citizen.InvokeNative(0xD076DB9B96FAADF1, awardHash, outData:Buffer()) == 1
    local unkHash = outData:GetInt32(1*8)
    local rewards = {}

    local numRewards = outData:GetInt32(2*8)
    if (numRewards > 0) then
        local startOffset = 4
        local tblSize = 2
        local endOffset = startOffset + (numRewards - 1) * tblSize
        for i = startOffset, endOffset, tblSize do
            table.insert(rewards, {
                outData:GetInt32(i*8),
                outData:GetFloat32((i+1)*8)
            })
        end
    end

    return success, unkHash, rewards
end

---
---@param itemHash integer
---@param tagHash integer TAG_ITEM_PROPERTY, etc...
---@param size integer Number of tags to return
---@return table catalogItemTags List of CI_TAG_ hashes
function ItemdatabaseGetItemTagCatalogItemTags(itemHash, tagHash, size)
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(0*8, size)

    local numTags = Citizen.InvokeNative(0x8870895BA5ED9385, itemHash, tagHash, outData:Buffer(), Citizen.ResultAsInteger())
    
    local catalogItemTags = {}
    for i = 1, numTags do
        table.insert(catalogItemTags, outData:GetInt32(i*8))
    end

    return catalogItemTags
end

---
---@param ciCategoryHash integer
---@return integer pathsetHash
function ItemdatabaseGetCatalogItemCategoryPathset(ciCategoryHash)
    return Citizen.InvokeNative(0xAA29A5F13B2C20B2, ciCategoryHash, `DEFAULT`, Citizen.ResultAsInteger())
end

---Return the number of items in the bundle for the given bundle hash to use with N_0xC4146375D8A0B374.
---@param bundleHash integer
---@return integer num
function N_0x799FCD53358ED5FA(bundleHash) -- ItemdatabaseGetBundleAccessory*
    local data = DataView.ArrayBuffer(16*8)
    data:SetInt32(0*8, 1)
    return Citizen.InvokeNative(0x799FCD53358ED5FA, bundleHash, data:Buffer(), Citizen.ResultAsInteger())
end

---To use with N_0x799FCD53358ED5FA
---@param bundleHash integer
---@param index integer
---@return boolean success
---@return integer itemHash
---@return integer slotIdHash
---@return integer unkNum1
---@return integer unkNum2
---@return integer unkNum3
function N_0xC4146375D8A0B374(bundleHash, index) -- ItemdatabaseGetBundleAccessory*
    local data = DataView.ArrayBuffer(16*8)
    data:SetInt32(0*8, 1)
    local outData = DataView.ArrayBuffer(16*8)

    local success    = Citizen.InvokeNative(0xC4146375D8A0B374, bundleHash, data:Buffer(), index, outData:Buffer()) == 1
    local itemHash   = outData:GetInt32(0*8)
    local slotIdHash = outData:GetInt32(1*8)
    local unkNum1    = outData:GetInt32(2*8)
    local unkNum2    = outData:GetInt32(3*8)
    local unkNum3    = outData:GetInt32(4*8)
    
    return success, itemHash, slotIdHash, unkNum1, unkNum2, unkNum3
end

---
---@param shopTypeHash integer ST_GUNSMITH, ST_GENERAL...
---@param itemHash integer
---@return boolean success
---@return integer num
function N_0x17721003A66C72BF(shopTypeHash, itemHash) -- ItemdatabaseGetShopInventories
    local outData = DataView.ArrayBuffer(3*8)

    local success = Citizen.InvokeNative(0x17721003A66C72BF, shopTypeHash, itemHash, outData:Buffer()) == 1
    local num = outData:GetInt32(2*8)

    return success, num
end

---
---@param voucherHash integer
---@return boolean
function N_0x537A0555F62CA01A(voucherHash)
    return Citizen.InvokeNative(0x537A0555F62CA01A, voucherHash, 0) == 1
end