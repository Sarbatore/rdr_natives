---Return the registered crime data for a player at a specific index.
---@param player Player
---@param index integer
---@return boolean, Hash, integer, integer, integer, boolean
function GetPlayerRegisteredCrime(player, index)
    local outData = DataView.ArrayBuffer(16*8)
    
    local res = Citizen.InvokeNative(0x532C5FDDB986EE5C, player, index, outData:Buffer()) == 1
    local crimeType = outData:GetInt32(0*8)
    local bounty = outData:GetInt32(1*8)
    local unk3 = outData:GetInt32(2*8)
    local unk4 = outData:GetInt32(7*8)
    local unk5 = outData:GetInt32(10*8) == 1

    return res, crimeType, bounty, unk3, unk4, unk5
end

---
---@param player Player
---@return
function N_0XCBFB4951F2E3934C(player)
    local outData = DataView.ArrayBuffer(16*8)
    
    Citizen.InvokeNative(0xCBFB4951F2E3934C, player, outData:Buffer())
    local unk0 = outData:GetInt32(10*8)

    return unk0
end

---
---@param player Player
---@return integer
function N_0X148E7AC8141C9E64(player)
    return Citizen.InvokeNative(0x148E7AC8141C9E64, player, Citizen.ResultAsInteger())
end

---
---@param player Player
---@return integer
function N_0XE083BEDA81709891(player)
    return Citizen.InvokeNative(0XE083BEDA81709891, player, Citizen.ResultAsInteger())
end

---
---@param crimeType Hash
---@param p1 any
---@return integer
function N_0XDAEFDFDB2AEECE37(crimeType, p1)
    return Citizen.InvokeNative(0XDAEFDFDB2AEECE37, crimeType, p1, Citizen.ResultAsInteger())
end