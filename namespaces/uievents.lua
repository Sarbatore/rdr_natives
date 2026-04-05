---
---@param uiappHash integer
---@return boolean success
---@return integer eventHash
---@return integer itemIndex
---@return integer unk
---@return integer entryId
function EventsUiPeekMessage(uiappHash)
    local struct = DataView.ArrayBuffer(4*8)
    
    local success = Citizen.InvokeNative(0x90237103F27F7937, uiappHash, struct:Buffer()) == 1
    local eventHash = struct:GetInt32(0*8)
    local itemIndex = struct:GetInt32(1*8)
    local unk       = struct:GetInt32(2*8)
    local entryId   = struct:GetInt32(3*8)

    return success, eventHash, itemIndex, unk, entryId
end