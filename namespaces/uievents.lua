---
---@param uiapp hash
---@return boolean, number, number, number, number
function EventsUiPeekMessage(uiapp)
    local struct = DataView.ArrayBuffer(4*8)
    struct:SetInt32(0*8, 0) -- Event type
    struct:SetInt32(1*8, 0) -- Item index
    struct:SetInt32(2*8, 0) -- Unknown
    struct:SetInt32(3*8, 0) -- Item data container

    if (Citizen.InvokeNative(0x90237103F27F7937, uiapp, struct:Buffer()) == 1) then
        local eventTypeHash = struct:GetInt32(0*8)
        local index = struct:GetInt32(1*8)
        local unk = struct:GetInt32(2*8)
        local entryId = struct:GetInt32(3*8)

        return true, eventTypeHash, index, unk, entryId
    end

    return false
end