---
---@param uiapp hash
---@return bool, ?number, ?number, ?number, ?number
function EventsUiPeekMessage(uiapp)
    local DataStruct = DataView.ArrayBuffer(4*8)
    DataStruct:SetInt32(0*8, 0) -- Event type
    DataStruct:SetInt32(1*8, 0) -- Item index
    DataStruct:SetInt32(2*8, 0) -- Unknown
    DataStruct:SetInt32(3*8, 0) -- Item data container

    if (Citizen.InvokeNative(0x90237103F27F7937, uiapp, DataStruct:Buffer()) ~= 0) then
        local eventTypeHash = DataStruct:GetInt32(0*8)
        local index = DataStruct:GetInt32(1*8)
        local unk = DataStruct:GetInt32(2*8)
        local entryId = DataStruct:GetInt32(3*8)

        return true, eventTypeHash, index, unk, entryId
    end

    return false
end