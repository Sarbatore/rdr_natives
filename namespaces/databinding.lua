---
---@param entryId integer
---@param index integer
function DatabindingRemoveUiItemFromListByIndex(entryId, index)
    Citizen.InvokeNative(0x6318FB3BE37E11B3, entryId, index)
end