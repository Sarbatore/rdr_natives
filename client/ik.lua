---
---@param ped number
---@param p1 any
---@param p2 any
---@param p3 any
---@param p4 any
---@param ped2 number
---@param boneId number
---@param p7 number
---@param p8 number
---@param p9 number
function N_0x0B9F7A01EC50448D(ped, p1, p2, p3, p4, ped2, boneId, p7, p8, p9)
    local DataStruct = DataView.ArrayBuffer(9*8)
    DataStruct:SetInt32(0*8, p1)
    DataStruct:SetInt32(1*8, p2)
    --DataStruct:SetInt32(2*8, p3)
    --DataStruct:SetInt32(3*8, p4)
    DataStruct:SetInt32(4*8, ped2)
    DataStruct:SetInt32(5*8, boneId)
    DataStruct:SetInt32(6*8, p7)
    DataStruct:SetInt32(7*8, p8)
    DataStruct:SetInt32(8*8, p9)

    return Citizen.InvokeNative(0x0B9F7A01EC50448D, ped, DataStruct:Buffer())
end
-- Example usage: N_0x0B9F7A01EC50448D(playerPed, 1, -1, -1, -1, playerPed, 37709, 4, 2, 2)

---
---@param ped number
---@param p1 number
---@return boolean
function N_0x6098139150DCC745(ped, p1)
    return Citizen.InvokeNative(0x6098139150DCC745, ped, p1)
end

---
---@param ped number
---@param ped2 number
function N_0x873C792E07A32C8B(ped, ped2)
    return Citizen.InvokeNative(0x873C792E07A32C8B, ped, ped2)
end