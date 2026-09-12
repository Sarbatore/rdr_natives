---Outputs the item infos (category, type, flags, model, award)
---@param itemHash integer
---@return boolean success
---@return integer catalogItemCategoryHash
---@return integer itemTypeHash
---@return integer flags
---@return integer modelHash
---@return integer awardHash
function ItemdatabaseFilloutItemInfo(itemHash)
    local outStruct = DataView.ArrayBuffer(6*8)
    
    local success                 = Citizen.InvokeNative(0xFE90ABBCBFDC13B2, itemHash, outStruct:Buffer()) == 1
    local catalogItemCategoryHash = outStruct:GetInt32(1*8)
    local itemTypeHash            = outStruct:GetInt32(2*8)
    local flags                   = outStruct:GetInt32(3*8)
    local modelHash               = outStruct:GetInt32(4*8)
    local awardHash               = outStruct:GetInt32(5*8)

    return success, catalogItemCategoryHash, itemTypeHash, flags, modelHash, awardHash
end

---
---@param itemHash integer
---@return boolean success
---@return integer catalogItemCategoryHash
---@return integer categoryHash
---@return integer modelHash
function ItemdatabaseFilloutItemByName(itemHash)
    local outStruct = DataView.ArrayBuffer(1024*8)
    for i = 0, 15 do
        outStruct:SetInt32((4 + i*48)*8, 15)
        outStruct:SetInt32((36 + i*48)*8, 10)
    end
    for i = 0, 9 do
        outStruct:SetInt32((480 +  i*32)*8, 10)
    end
    outStruct:SetInt32(732*8 + 2*8, 5)
    outStruct:SetInt32(732*8 + 18*8, 8)

    local success                 = Citizen.InvokeNative(0x2A610BEE7D341CC4, itemHash, outStruct:Buffer()) == 1
    local catalogItemCategoryHash = outStruct:GetInt32(1*8)
    local categoryHash            = outStruct:GetInt32(2*8)
    local modelHash               = outStruct:GetInt32(3*8)

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
    local outStruct = DataView.ArrayBuffer(2*8)
    
    local success   = Citizen.InvokeNative(0xAD73B614DF26CF8A, itemHash, costHash, index, outStruct:Buffer()) == 1
    local priceHash = outStruct:GetInt32(0*8)
    local amount    = outStruct:GetInt32(1*8)

    return success, priceHash, amount
end

---Returns a list of effects
---@param itemHash integer
---@return boolean success
---@return table effectsHash
function ItemdatabaseFilloutItemEffectIds(itemHash)
    local outStruct = DataView.ArrayBuffer(32*8)
    outStruct:SetInt32(1*8, 20)
    
    local success     = Citizen.InvokeNative(0x9379BE60DC55BBE6, itemHash, outStruct:Buffer()) == 1
    local effectsHash = {}

    local numEffects = outStruct:GetInt32(0*8)
    if (numEffects > 0) then
        local startOffset = 2
        local endOffset = startOffset + (numEffects - 1)
        for i = startOffset, endOffset do
            table.insert(effectsHash, outStruct:GetInt32(i*8))
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
    local outStruct = DataView.ArrayBuffer(7*8)

    local success              = Citizen.InvokeNative(0xCF2D360D27FD1ABF, effectId, outStruct:Buffer()) == 1
    local effectHash           = outStruct:GetInt32(1*8)
    local value                = outStruct:GetInt32(2*8)
    local time                 = outStruct:GetInt32(3*8)
    local timeUnits            = outStruct:GetInt32(4*8)
    local corePercent          = outStruct:GetFloat32(5*8)
    local durationCategoryHash = outStruct:GetInt32(6*8)

    return success, effectHash, value, time, timeUnits, corePercent, durationCategoryHash
end

---Return the slot id for the category at the selected index.
---@param categoryHash integer
---@param index integer
---@return boolean success
---@return integer slotIdHash
function ItemdatabaseGetFitsSlotInfo(categoryHash, index)
    local success, slotIdHash = Citizen.InvokeNative(0x77210C146CED5261, categoryHash, index, Citizen.PointerValueInt(), Citizen.ResultAsInteger())
    return success == 1, slotIdHash
end

---Return the number of items for the bundle
---@param bundleHash integer
---@return integer
function ItemdatabaseGetBundleItemCount(bundleHash)
    local paramsStruct = DataView.ArrayBuffer(8*8)
        :SetInt32(0*8, 1)
    return Citizen.InvokeNative(0x3332695B01015DF9, bundleHash, paramsStruct:Buffer(), Citizen.ResultAsInteger())
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
        :SetInt32(0*8, 1)
    local outStruct = DataView.ArrayBuffer(4*8)
    
    local success    = Citizen.InvokeNative(0x5D48A77E4B668B57, bundleHash, data:Buffer(), index, outStruct:Buffer()) == 1
    local itemHash   = outStruct:GetInt32(0*8)
    local slotIdHash = outStruct:GetInt32(1*8)
    local unkNum1    = outStruct:GetInt32(2*8)
    local unkNum2    = outStruct:GetInt32(3*8)

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
    local paramsStruct = DataView.ArrayBuffer(15*8)
        :SetInt32(0*8, slotIdHash)
        :SetInt32(1*8, slotId2Hash)
        :SetInt32(2*8, tagHash)
        :SetInt32(3*8, catalogItemCategoryHash)
        :SetInt32(4*8, costHash)
        :SetInt32(5*8, sellHash)
        :SetInt32(6*8, flag)
        :SetInt32(7*8, itemTypeHash)
        :SetInt32(8*8, catalogItemTagHash)

    return Citizen.InvokeNative(0x71EFA7999AE79408, paramsStruct:Buffer(), Citizen.PointerValueInt(), 1, Citizen.ResultAsInteger())
end

---
---@param itemHash integer
---@return boolean success
---@return table modifiersHash
function ItemdatabaseGetItemPriceModifiers(itemHash)
    local outStruct = DataView.ArrayBuffer(32*8)
        :SetInt32(1*8, 10)
    
    local success       = Citizen.InvokeNative(0x4EB37AAB79AB0C48, itemHash, outStruct:Buffer()) == 1
    local modifiersHash = {}
    
    local numModifiers = outStruct:GetInt32(0*8)
    if (numModifiers > 0) then
        local startOffset = 2
        local endOffset = startOffset + (numModifiers - 1)
        for i = startOffset, endOffset do
            table.insert(modifiersHash, outStruct:GetInt32(i*8))
        end
    end

    return success, modifiersHash
end

---
---@param itemHash integer
---@return boolean success
---@return integer unkHash
function ItemdatabaseFilloutPriceModifierByKey(itemHash)
    local outStruct = DataView.ArrayBuffer(32*8)
        :SetInt32(3*8, 10)
        :SetInt32(15*8, 10)

    local success  = Citizen.InvokeNative(0x40C5D95818823C94, itemHash, outStruct:Buffer()) == 1
    local unkHash  = outStruct:GetInt32(1*8) -- can be: -1626069400, -1406468552, -468109055, -416870516, -195968340, -144780764, 381795783, 1632947550

    return success, unkHash
end

---@todo seems to be broken, tested with +3millions hashes
---@param bundleHash integer
---@return boolean success
---@return table modifiersHash
function ItemdatabaseGetBundleAcquireCostModifiers(bundleHash)
    local outStruct = DataView.ArrayBuffer(1024*8)
        :SetInt32(1*8, 10)

    local success       = Citizen.InvokeNative(0xA97EE5E4589FCF5A, bundleHash, outStruct:Buffer())-- == 1
    local modifiersHash = {}
    
    local numModifiers = outStruct:GetInt32(0*8)
    if (numModifiers > 0) then
        local startOffset = 2
        local endOffset = startOffset + numModifiers - 1
        for i = startOffset, endOffset do
            table.insert(modifiersHash, outStruct:GetInt32(i*8))
        end
    end
    
    return success, modifiersHash
end

---Return a list of tag data for the given item.
---@param itemHash integer
---@return boolean success
---@return table tags 2D array of tag pairs, first value is the CI_TAG_ hash, second value is the TAG_ hash
function ItemdatabaseFilloutTagData(itemHash)
    local size = 15
    local outStruct = DataView.ArrayBuffer(40*8)
        :SetInt32(0*8, size)

    local success, numberOfTags = Citizen.InvokeNative(0x5A11D6EEA17165B0, itemHash, outStruct:Buffer(), Citizen.PointerValueInt(), size, Citizen.ResultAsInteger())
    
    local tags = {}
    if (numberOfTags > 0) then
        local startOffset = 1
        local tblSize = 2
        local endOffset = startOffset + (numberOfTags - 1) * tblSize
        for i = startOffset, endOffset, tblSize do
            table.insert(tags, {
                outStruct:GetInt32(i*8),
                outStruct:GetInt32((i+1)*8)
            })
        end
    end

    return success == 1, tags
end

---
---@param shopTypeHash integer
---@param shopInventoryIndex integer
---@return boolean success
---@return integer itemHash
---@return integer bundleHash -- e.g: BUNDLE_CLOTHING_ITEM_F_OFFHAND_001_TINT_003
---@return integer numRequirementGroup
function ItemdatabaseGetShopInventoriesItemInfo(shopTypeHash, shopInventoryIndex)
    local outStruct = DataView.ArrayBuffer(3*8)

    local success             = Citizen.InvokeNative(0x4A79B41B4EB91F4E, shopTypeHash, shopInventoryIndex, outStruct:Buffer()) == 1
    local itemHash            = outStruct:GetInt32(0*8)
    local bundleHash          = outStruct:GetInt32(1*8)
    local numRequirementGroup = outStruct:GetInt32(2*8)

    return success, itemHash, bundleHash, numRequirementGroup
end

---
---@param shopTypeHash integer
---@param itemHash integer
---@return boolean success
---@return any unk
---@return integer numRequirementGroup
function ItemdatabaseGetShopInventoriesItemInfoByKey(shopTypeHash, itemHash)
    local outStruct = DataView.ArrayBuffer(3*8)

    local success             = Citizen.InvokeNative(0xCFB06801F5099B25, shopTypeHash, itemHash, outStruct:Buffer()) == 1
    local unk                 = outStruct:GetInt32(1*8)
    local numRequirementGroup = outStruct:GetInt32(2*8)

    return success, unk, numRequirementGroup
end

---Return the number of requirements for shop item
---@param shopTypeHash integer
---@param itemHash integer
---@param groupIndex integer
---@return boolean success
---@return integer unkInt
---@return integer numRequirements
function ItemdatabaseGetShopInventoriesRequirementGroupInfo(shopTypeHash, itemHash, groupIndex)
    local outStruct = DataView.ArrayBuffer(2*8)

    local success         = Citizen.InvokeNative(0x76C752D788A76813, shopTypeHash, itemHash, groupIndex, outStruct:Buffer()) == 1
    local unkInt          = outStruct:GetInt32(0*8)
    local numRequirements = outStruct:GetInt32(1*8)

    return success, unkInt, numRequirements
end

---
---@param shopTypeHash integer
---@param unkHash integer
---@param groupIndex integer
---@param requirementIndex integer
---@return boolean success
---@return integer requirementTypeHash -- e.g: INV_REQ_TYPE_CAN_CRAFT
---@return integer requirementHash -- The item required
---@return integer num
---@return boolean state
function ItemdatabaseGetShopInventoriesRequirementInfo(shopTypeHash, unkHash, groupIndex, requirementIndex)
    local outStruct = DataView.ArrayBuffer(4*8)

    local success             = Citizen.InvokeNative(0xE0EA5C031AE5539F, shopTypeHash, unkHash, groupIndex, requirementIndex, outStruct:Buffer()) == 1
    local requirementTypeHash = outStruct:GetInt32(0*8)
    local requirementHash     = outStruct:GetInt32(1*8)
    local num                 = outStruct:GetInt32(2*8)
    local state               = outStruct:GetInt32(3*8) == 1

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
    local outStruct = DataView.ArrayBuffer(4*8)

    local success    = Citizen.InvokeNative(0xDBEADA0DF5F9AB9F, layoutHash, index, outStruct:Buffer()) == 1
    local pageHash   = outStruct:GetInt32(0*8)
    local unkHash    = outStruct:GetInt32(1*8)
    local unkBoolean = outStruct:GetInt32(2*8) == 1
    local numItems   = outStruct:GetInt32(3*8)

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
    local outStruct = DataView.ArrayBuffer(4*8)
    
    local success    = Citizen.InvokeNative(0xB347C100DF0C9B7F, layoutHash, pageHash, outStruct:Buffer()) == 1
    local unkHash    = outStruct:GetInt32(1*8)
    local unkBoolean = outStruct:GetInt32(2*8) == 1
    local numItems   = outStruct:GetInt32(3*8)

    return success, unkHash, unkBoolean, numItems
end

---
---@param layoutHash integer
---@param menuHash integer
---@param index integer
---@return boolean success
---@return integer pageHash
function ItemdatabaseGetShopLayoutMenuPageKey(layoutHash, menuHash, index)
    local success, pageHash  = Citizen.InvokeNative(0x9A60570657A7B635, layoutHash, menuHash, index, Citizen.PointerValueInt(), Citizen.ResultAsInteger())
    return success == 1, pageHash
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
    local success, itemHash, menu, layout = Citizen.InvokeNative(0xF32BEF578B3DBAE8, layoutHash, pageHash, index, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.ResultAsInteger())
    return success == 1, itemHash, menu, layout
end

---
---@param layoutHash integer
---@return boolean success
---@return integer shopTypeHash
---@return integer unk
---@return integer numPages
function ItemdatabaseGetShopLayoutInfo(layoutHash)
    local outStruct = DataView.ArrayBuffer(4*8)

    local success      = Citizen.InvokeNative(0x66A6D76B6BB999B4, layoutHash, outStruct:Buffer()) == 1
    local shopTypeHash = outStruct:GetInt32(1*8)
    local unk          = outStruct:GetInt32(2*8)
    local numPages     = outStruct:GetInt32(3*8)

    return success, shopTypeHash, unk, numPages
end

---
---@param layoutHash integer
---@param index integer
---@return boolean success
---@return integer menuHash
---@return integer unkNum
function ItemdatabaseGetShopLayoutRootMenuInfo(layoutHash, index)
    local outStruct = DataView.ArrayBuffer(7*8)

    local success  = Citizen.InvokeNative(0x86FCB565CCA0CFA7, layoutHash, index, outStruct:Buffer()) == 1
    local menuHash = outStruct:GetInt32(0*8)
    local unkNum   = outStruct:GetInt32(6*8)

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
    local outStruct = DataView.ArrayBuffer(8*8)

    local success  = Citizen.InvokeNative(0xD66114469978B55B, layoutHash, menuHash, outStruct:Buffer()) == 1
    local unk1     = outStruct:GetInt32(1*8)
    local unk3     = outStruct:GetInt32(3*8)
    local numPages = outStruct:GetInt32(5*8)
    local numInfo  = outStruct:GetInt32(6*8)

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
    local outStruct = DataView.ArrayBuffer(7*8)

    local success = Citizen.InvokeNative(0xF04247092F193B75, layoutHash, menuHash, index, outStruct:Buffer()) == 1
    local hash1 = outStruct:GetInt32(0*8) -- hash
    local hash2 = outStruct:GetInt32(1*8) -- hash
    local hash3 = outStruct:GetInt32(2*8) -- hash
    local unk4  = outStruct:GetInt32(3*8) -- count
    local unk5  = outStruct:GetInt32(4*8)
    local unk6  = outStruct:GetInt32(5*8) -- count
    local unk7  = outStruct:GetInt32(6*8) -- count

    return success, hash1, hash2, hash3, unk4, unk5, unk6, unk7
end

---
---@param itemHash integer
---@param sellTypeHash integer SELL_SHOP_DEFAULT, etc...
---@return boolean success
---@return integer costTypeHash
---@return table sellPrices 2D array of price pairs, first value is the price hash, second value is the amount
function ItemdatabaseFilloutSellPrice(itemHash, sellTypeHash)
    local outStruct = DataView.ArrayBuffer(64*8)
        :SetInt32(4*8, 10)

    local success      = Citizen.InvokeNative(0x7A62A2EEDE1C3766, itemHash, sellTypeHash, outStruct:Buffer()) == 1
    local costTypeHash = outStruct:GetInt32(2*8)
    local sellPrices   = {}

    local numPrices = outStruct:GetInt32(3*8)
    if (numPrices > 0) then
        local startOffset = 5
        local tblSize = 2
        local endOffset = startOffset + (numPrices - 1) * tblSize
        for i = startOffset, endOffset, tblSize do
            table.insert(sellPrices, {
                outStruct:GetInt32(i*8),
                outStruct:GetInt32((i+1)*8)
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
    local outStruct = DataView.ArrayBuffer(64*8)
        :SetInt32(4*8, 15)
        :SetInt32(36*8, 10)

    local success      = Citizen.InvokeNative(0x6772A83C67A25775, itemHash, index, outStruct:Buffer()) == 1
    local costHash     = outStruct:GetInt32(0*8)
    local costTypeHash = outStruct:GetInt32(2*8)
    local costs        = {}

    local numCosts = outStruct:GetInt32(3*8)
    if (numCosts > 0) then
        local startOffset = 5
        local tableSize = 2
        local endOffset = startOffset + (numCosts - 1) * tableSize
        for i = startOffset, endOffset, tableSize do
            table.insert(costs, {
                outStruct:GetInt32(i*8),
                outStruct:GetInt32((i + 1)*8)
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
    local outStruct = DataView.ArrayBuffer(38*8)
        :SetInt32(4*8, 15)
        :SetInt32(36*8, 10)

    local success      = Citizen.InvokeNative(0x74F7928816E4E181, itemHash, costHash, outStruct:Buffer()) == 1
    local costTypeHash = outStruct:GetInt32(2*8)
    local costs        = {}
    local unknown      = outStruct:GetInt32(37*8)

    local numCosts = outStruct:GetInt32(3*8)
    if (numCosts > 0) then
        local startOffset = 5
        local tableSize = 2
        local endOffset = startOffset + (numCosts - 1) * tableSize
        for i = startOffset, endOffset, tableSize do
            table.insert(costs, {
                outStruct:GetInt32(i*8),
                outStruct:GetInt32((i + 1)*8)
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
    local outStruct = DataView.ArrayBuffer(64*8)
        :SetInt32(4*8, 15)
        :SetInt32(36*8, 10)

    local success         = Citizen.InvokeNative(0x1FC25AEB5F76B38D, awardHash, index, outStruct:Buffer()) == 1
    local acquireCostHash = outStruct:GetInt32(2*8)
   
    return success, acquireCostHash
end

---Return a list of modifiers for the given award.
---@param awardHash integer
---@return boolean success
---@return table modifiersHash
function ItemdatabaseGetAwardCostModifiers(awardHash)
    local outStruct = DataView.ArrayBuffer(32*8)
        :SetInt32(1*8, 10)
    
    local success       = Citizen.InvokeNative(0xE81D0378A384E755, awardHash, outStruct:Buffer()) == 1
    local modifiersHash = {}

    local numModifiers = outStruct:GetInt32(0*8)
    if (numModifiers > 0) then
        local startOffset = 2
        local endOffset = startOffset + (numModifiers - 1)
        for i = startOffset, endOffset do
            table.insert(modifiersHash, outStruct:GetInt32(i*8))
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
    local outStruct = DataView.ArrayBuffer(2*8)

    local success          = Citizen.InvokeNative(0x60614A0AB580A2B5, modifierHash, index, outStruct:Buffer()) == 1
    local currencyTypeHash = outStruct:GetInt32(0*8)
    local multiplier       = outStruct:GetFloat32(1*8)

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
    local outStruct = DataView.ArrayBuffer(3*8)

    local success  = Citizen.InvokeNative(0x121D2005DD64496B, awardHash, index, outStruct:Buffer()) == 1
    local itemHash = outStruct:GetInt32(0*8)
    local unk      = outStruct:GetInt32(1*8)
    local unkHash  = outStruct:GetInt32(2*8)

    return success, itemHash, unk, unkHash
end

---Returns a first table of data composed of 2 varstrings and a hash, and a second table of 1 labelHash and unk value.
---@param itemHash integer
---@return boolean, table, table
function ItemdatabaseFilloutUiData(itemHash)
    local outStruct = DataView.ArrayBuffer(64*8)
        :SetInt32(2*8, 5)
        :SetInt32(18*8, 8)

    local res = Citizen.InvokeNative(0xB86F7CC2DC67AC60, itemHash, outStruct:Buffer()) == 1
    local tbl = {}
    local tbl2 = {}

    local startOffset = 3
    local tblSize = 3
    local i = startOffset
    while (i < startOffset + 5*tblSize and outStruct:GetInt64(i*8) ~= 0) do
        table.insert(tbl, {
            outStruct:GetInt64(i*8), -- 
            outStruct:GetInt64((i+1)*8), -- 
            outStruct:GetInt32((i+2)*8) -- hash
        })
        i = i + tblSize
    end
    
    local startOffset = 19
    local tblSize = 2
    local i = startOffset
    while (i < startOffset + 8*tblSize and outStruct:GetInt32(i*8) ~= 0) do
        table.insert(tbl2, {
            outStruct:GetInt32(i*8), -- label hash
            outStruct:GetInt32((i+1)*8) -- unknown
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
    local outStruct = DataView.ArrayBuffer(64*8)
        :SetInt32(2*8, 5)
        :SetInt32(18*8, 8)

    local success    = Citizen.InvokeNative(0xF8D09EF8CE61D7BF, awardHash, outStruct:Buffer()) == 1
    local hash       = outStruct:GetInt32(0*8)
    local hashString = outStruct:GetInt32(1*8)
    local tbl        = {}

    for i = 3, 63, 3 do
        local label1 = outStruct:GetInt64(i*8)
        if (label1 == 0) then break end
        local label2 = outStruct:GetInt64((i+1)*8)
        local hash = outStruct:GetInt32((i+2)*8)
        table.insert(tbl, {label1, label2, hash})
    end

    return success, hash, hashString, tbl
end

---Retrieve acquire costs for a buy award.
---@param awardHash integer
---@return boolean success
---@return table acquireCosts 2D array of cost data. e.g: ` {-1571233163, 1400824947, { {-595319816, 1}, {773203532, 500} }} `
function ItemdatabaseFilloutBuyAwardAcquireCosts(awardHash)
    local outStruct = DataView.ArrayBuffer(1024*8)
        :SetInt32(0, 10)
    local baseOffset = 1 * 8
    for i = 0, 9 do
        local currentNodeOffset = baseOffset + (i * 47 * 8)

        local offset_f4 = currentNodeOffset + (4 * 8)
        outStruct:SetInt32(offset_f4, 15)

        local offset_f36 = currentNodeOffset + (36 * 8)
        outStruct:SetInt32(offset_f36, 10)
    end
    
    local success, numAcquireCosts = Citizen.InvokeNative(0xB52E20F6767A09A2, awardHash, outStruct:Buffer(), Citizen.PointerValueInt(), 10, Citizen.ResultAsInteger())
    local acquireCosts = {}
    for i = 0, numAcquireCosts - 1 do
        local currentNodeOffset = baseOffset + (i * 47) * 8
        local costHash = outStruct:GetInt32(currentNodeOffset + (0 * 8))
        local costTypeHash = outStruct:GetInt32(currentNodeOffset + (2 * 8))
        local numPrices = outStruct:GetInt32(currentNodeOffset + (3 * 8))
        local prices = {}
        for j = 0, numPrices - 1 do
            local priceHash = outStruct:GetInt32(currentNodeOffset + ((5 + (j * 2)) * 8))
            local amount = outStruct:GetInt32(currentNodeOffset + ((5 + (j * 2) + 1) * 8))
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

    return success == 1, acquireCosts
end

---
---@param awardHash integer
---@param costHash integer
---@return integer count
function ItemdatabaseGetAwardAcquireCostCountFromCostType(awardHash, costHash)
    return Citizen.InvokeNative(0xF540239F9937033B, awardHash, costHash, Citizen.ResultAsInteger())
end

---
---@param awardHash integer
---@param costHash integer
---@param index integer
---@return boolean
---@return integer priceHash `CURRENCY_GOLD_BAR`, etc...
---@return integer priceAmount
function ItemdatabaseFilloutAwardAcquireCost(awardHash, costHash, index)
    local outStruct = DataView.ArrayBuffer(2*8)
    outStruct:SetInt32(0*8, 15)

    local success     = Citizen.InvokeNative(0xF27F01BBF5ACD3F3, awardHash, costHash, index, outStruct:Buffer()) == 1
    local priceHash   = outStruct:GetInt32(0*8)
    local priceAmount = outStruct:GetInt32(1*8)

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
    local outStruct = DataView.ArrayBuffer(64*8)
        :SetInt32(4*8, 15)
        :SetInt32(36*8, 10)

    local success      = Citizen.InvokeNative(0x3A0B667ABFF87F6E, bundleHash, index, outStruct:Buffer()) == 1
    local costHash     = outStruct:GetInt32(0*8)
    local costTypeHash = outStruct:GetInt32(2*8)
    local costs        = {}

    local numCosts = outStruct:GetInt32(3*8)
    if (numCosts > 0) then
        local startOffset = 5
        local tableSize = 2
        local endOffset = startOffset + (numCosts - 1) * tableSize
        for i = startOffset, endOffset, tableSize do
            table.insert(costs, {
                outStruct:GetInt32(i*8),
                outStruct:GetInt32((i + 1)*8)
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
    local outStruct = DataView.ArrayBuffer(2*8)
        :SetInt32(0, 15)

    local success   = Citizen.InvokeNative(0xB542632693D53408, bundleHash, costHash, index, outStruct:Buffer()) == 1
    local priceHash = outStruct:GetInt32(0*8)
    local amount    = outStruct:GetInt32(1*8)

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
---@return table unlockFlags 2D array of pairs, first value is the hash of the flag (UF_VISIBLE...), second value is the expected state of the flag (true/false)
function ItemdatabaseFilloutAwardUnlockFlag(awardHash, index)
    local size = 10
    local outStruct = DataView.ArrayBuffer(64*8)
        :SetInt32(1*8, size)

    local success     = Citizen.InvokeNative(0x8D029948CA29409B, awardHash, index, outStruct:Buffer()) == 1
    local itemHash    = outStruct:GetInt32(0*8)
    local unlockFlags = {}

    local tblSize = 2
    local startOffset = 2
    local endOffset = startOffset + (size - 1) * tblSize
    for i = startOffset, endOffset, tblSize do
        local unlockFlagHash = outStruct:GetInt32(i*8)
        if (unlockFlagHash == 0) then break end
        table.insert(unlockFlags, {
            unlockFlagHash,
            outStruct:GetInt32((i+1)*8) == 1
        })
    end

    return success, itemHash, unlockFlags
end

---Return num rewards and rewards data of the hash
---@param awardHash integer
---@return boolean success
---@return integer unkHash
---@return table rewards 2D array of reward pairs, first value is the item hash, second value is the value
function ItemdatabaseGetAwardInfo(awardHash)
    local outStruct = DataView.ArrayBuffer(64*8)
        :SetInt32(3*8, 10)

    local success = Citizen.InvokeNative(0xD076DB9B96FAADF1, awardHash, outStruct:Buffer()) == 1
    local unkHash = outStruct:GetInt32(1*8)
    local rewards = {}

    local numRewards = outStruct:GetInt32(2*8)
    if (numRewards > 0) then
        local startOffset = 4
        local tblSize = 2
        local endOffset = startOffset + (numRewards - 1) * tblSize
        for i = startOffset, endOffset, tblSize do
            table.insert(rewards, {
                outStruct:GetInt32(i*8),
                outStruct:GetFloat32((i+1)*8)
            })
        end
    end

    return success, unkHash, rewards
end

---
---@param itemHash integer
---@param tagHash integer TAG_ITEM_PROPERTY, etc...
---@param size integer Number of tags to return
---@return integer numberOfTags
---@return table catalogItemTags List of CI_TAG_ hashes
function ItemdatabaseGetItemTagCatalogItemTags(itemHash, tagHash, size)
    local outStruct = DataView.ArrayBuffer(32*8)
        :SetInt32(0*8, size)

    local numberOfTags    = Citizen.InvokeNative(0x8870895BA5ED9385, itemHash, tagHash, outStruct:Buffer(), Citizen.ResultAsInteger())
    local catalogItemTags = {}
    for i = 1, numberOfTags do
        table.insert(catalogItemTags, outStruct:GetInt32(i*8))
    end

    return numberOfTags, catalogItemTags
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
        :SetInt32(0*8, 1)
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
        :SetInt32(0*8, 1)
    local outStruct = DataView.ArrayBuffer(16*8)

    local success    = Citizen.InvokeNative(0xC4146375D8A0B374, bundleHash, data:Buffer(), index, outStruct:Buffer()) == 1
    local itemHash   = outStruct:GetInt32(0*8)
    local slotIdHash = outStruct:GetInt32(1*8)
    local unkNum1    = outStruct:GetInt32(2*8)
    local unkNum2    = outStruct:GetInt32(3*8)
    local unkNum3    = outStruct:GetInt32(4*8)
    
    return success, itemHash, slotIdHash, unkNum1, unkNum2, unkNum3
end

---
---@param shopTypeHash integer ST_GUNSMITH, ST_GENERAL...
---@param itemHash integer
---@return boolean success
---@return integer unkInt2
function N_0x17721003A66C72BF(shopTypeHash, itemHash) -- ItemdatabaseGetShopInventories
    local outStruct = DataView.ArrayBuffer(3*8)

    local success = Citizen.InvokeNative(0x17721003A66C72BF, shopTypeHash, itemHash, outStruct:Buffer()) == 1
    --local _itemHash = outStruct:GetInt32(0*8)
    --local unk   = outStruct:GetInt32(1*8) -- always 0
    local unkInt2 = outStruct:GetInt32(2*8)

    return success, unkInt2
end

---
---@param voucherHash integer
---@return boolean
function N_0x537A0555F62CA01A(voucherHash)
    return Citizen.InvokeNative(0x537A0555F62CA01A, voucherHash, 0) == 1
end