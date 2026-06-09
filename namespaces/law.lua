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

---
---@param ped integer
---@return boolean
function N_0x40851BCC33ACD9AB(ped)
    return Citizen.InvokeNative(0x40851BCC33ACD9AB, ped) == 1
end

---
---@param ped integer
---@param victim integer
---@param crimeHash integer
---@param x number
---@param y number
---@param z number
---@param regionHash integer
---@param bounty integer
function N_0x018F30D762E62DF8(ped, victim, crimeHash, x, y, z, regionHash, bounty)
    local data = DataView.ArrayBuffer(16*8)
    data:SetInt32(0*8, ped)
    data:SetInt32(1*8, victim)
    data:SetInt32(2*8, crimeHash)
    data:SetFloat32(3*8, x)
    data:SetFloat32(4*8, y)
    data:SetFloat32(5*8, z)
    data:SetInt32(6*8, regionHash)
    data:SetInt32(7*8, bounty)
    --data:SetInt32(8*8, 1)
    --data:SetInt32(9*8, 1)
    --data:SetInt32(10*8, 0)
    --data:SetInt32(11*8, 1)
    --data:SetInt32(12*8, 1)
    --data:SetInt32(13*8, 1)
    --data:SetInt32(14*8, 1034599207)
    Citizen.InvokeNative(0x018F30D762E62DF8, victim, data:Buffer())
end