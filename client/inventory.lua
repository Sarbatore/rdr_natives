---
---@param item number
---@param guid
---@param slotId number
---@return boolean, ?table
function InventoryGetGuidFromItemid(guid, item, slotId)
	local DataStruct = DataView.ArrayBuffer(13*8)
    if (Citizen.InvokeNative(0x886DFD3E185C8A89, 1, guid, item, slotId, DataStruct:Buffer())) then
        return true, DataStruct:Buffer()
    end

    return false
end
exports("InventoryGetGuidFromItemid", InventoryGetGuidFromItemid)

---
---@return guid
function GetCharacterInventoryGuid()
    local retval, guid = exports.redm_natives:InventoryGetGuidFromItemid(0, `CHARACTER`, `SLOTID_NONE`)
    return guid
end
exports("GetCharacterInventoryGuid", GetCharacterInventoryGuid)

---
---@return guid
function GetWardrobeInventoryGuid()
    local characterInventoryGuid = exports.redm_natives:GetCharacterInventoryGuid()
    local _, guid = exports.redm_natives:InventoryGetGuidFromItemid(characterInventoryGuid, `WARDROBE`, `SLOTID_WARDROBE`)
    return guid
end
exports("GetWardrobeInventoryGuid", GetWardrobeInventoryGuid)

---
---@return guid
function GetWeaponInventoryGuid()
    local characterInventoryGuid = exports.redm_natives:GetCharacterInventoryGuid()
    local _, guid = exports.redm_natives:InventoryGetGuidFromItemid(characterInventoryGuid, `CARRIED_WEAPONS`, `SLOTID_CARRIED_WEAPONS`)
    return guid
end
exports("GetWeaponInventoryGuid", GetWeaponInventoryGuid)

---
---@param weapon hash
---@return guid
function GetWeaponStatsGuid(weapon)
    local weaponInventoryGuid = exports.redm_natives:GetWeaponInventoryGuid()
    local _, guid = exports.redm_natives:InventoryGetGuidFromItemid(weaponInventoryGuid, weapon, -1591664384)
    return guid
end

---
---@param item hash
---@return boolean, ?hash
function InventoryGetInventoryItemInspectionInfo(item)
    local DataStruct = DataView.ArrayBuffer(256)
    DataStruct:SetInt32(3*8, -1)
    DataStruct:SetInt32(12*8, 4)
    DataStruct:SetInt32(17*8, 4)

    if (Citizen.InvokeNative(0x0C093C1787F18519, item, DataStruct:Buffer())) then
        local model = DataStruct:GetInt32(0*8)

        return true, model
    end

    return false
end
exports("InventoryGetInventoryItemInspectionInfo", InventoryGetInventoryItemInspectionInfo)