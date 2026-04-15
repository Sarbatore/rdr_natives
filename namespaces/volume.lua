---
---@param x number
---@param y number
---@param z number
---@param p3 integer
---@return boolean
function N_0x870E9981ED27C815(x, y, z, p3)
    local data = DataView.ArrayBuffer(10*8)
    data:SetInt32(0*8, 0)
    local data2 = DataView.ArrayBuffer(10*8)
    data2:SetInt32(0*8, 8192)
    data2:SetInt32(1*8, 0)
    
    local res = Citizen.InvokeNative(0x870E9981ED27C815, x, y, z, data:Buffer(), data2:Buffer(), p3) == 1

    return res
end

---
---@param x number
---@param y number
---@param z number
---@param p3 number
---@param p4 integer
---@return boolean
function N_0x51E52C9687FCDEEC(x, y, z, p3, p4)
    local data = DataView.ArrayBuffer(10*8)
    data:SetInt32(0*8, 4)
    local data2 = DataView.ArrayBuffer(10*8)
    data2:SetInt32(0*8, 16384)
    data2:SetInt32(1*8, 0)
    
    local res = Citizen.InvokeNative(0x51E52C9687FCDEEC, x, y, z, p3, data:Buffer(), data2:Buffer(), p4) == 1

    return res
end

