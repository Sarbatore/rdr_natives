---
---@param uiapp Hash
---@return boolean, Hash, integer, integer, integer
function EventsUiPeekMessage(uiapp)
    local struct = DataView.ArrayBuffer(4*8)
    
    local res = Citizen.InvokeNative(0x90237103F27F7937, uiapp, struct:Buffer()) == 1
    local eventType = struct:GetInt32(0*8)
    local itemIndex = struct:GetInt32(1*8)
    local unk       = struct:GetInt32(2*8)
    local entryId   = struct:GetInt32(3*8)

    return res, eventType, itemIndex, unk, entryId
end