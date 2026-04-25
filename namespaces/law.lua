---Return the registered crime data for a player at a specific index.
---@param player integer
---@param index integer
---@return boolean success
---@return integer crimeTypeHash
---@return integer bounty
---@return integer unk3
---@return integer unk4
---@return boolean unk5
function GetPlayerRegisteredCrime(player, index)
    local outData = DataView.ArrayBuffer(16*8)
    
    local success       = Citizen.InvokeNative(0x532C5FDDB986EE5C, player, index, outData:Buffer()) == 1
    local crimeTypeHash = outData:GetInt32(0*8)
    local bounty        = outData:GetInt32(1*8)
    local unk3          = outData:GetInt32(2*8)
    local unk4          = outData:GetInt32(7*8)
    local unk5          = outData:GetInt32(10*8) == 1

    return success, crimeTypeHash, bounty, unk3, unk4, unk5
end

---Find peds.
---@param coords vector3
---@param radius number
---@param itemset integer
function N_0x0C392DB374655176(...)
    return Citizen.InvokeNative(0x0C392DB374655176, ..., Citizen.ResultAsInteger())
end

---Find peds.
---@param player integer
---@param itemset integer
function N_0x522F74636DF10201(player, itemset)
    return Citizen.InvokeNative(0x522F74636DF10201, player, itemset, Citizen.ResultAsInteger())
end

---Find peds.
---@param player integer
---@param itemset integer
function N_0x9C8A2BF37E966464(player, itemset)
    return Citizen.InvokeNative(0x9C8A2BF37E966464, player, itemset, Citizen.ResultAsInteger())
end

---
---@param player integer
---@return
function N_0xCBFB4951F2E3934C(player)
    local outData = DataView.ArrayBuffer(16*8)
    
    Citizen.InvokeNative(0xCBFB4951F2E3934C, player, outData:Buffer())
    local unk0 = outData:GetInt32(10*8)

    return unk0
end

---
---@param player integer
---@return integer
function N_0x148E7AC8141C9E64(player)
    return Citizen.InvokeNative(0x148E7AC8141C9E64, player, Citizen.ResultAsInteger())
end

---
---@param player integer
---@return integer
function N_0xE083BEDA81709891(player)
    return Citizen.InvokeNative(0xE083BEDA81709891, player, Citizen.ResultAsInteger())
end

---
---@param crimeTypeHash integer
---@param p1 any
---@return integer
function N_0xDAEFDFDB2AEECE37(crimeTypeHash, p1)
    return Citizen.InvokeNative(0xDAEFDFDB2AEECE37, crimeTypeHash, p1, Citizen.ResultAsInteger())
end