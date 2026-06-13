---Return the registered crime data for a player at a specific index.
---@param player integer
---@param index integer
---@return boolean success
---@return integer crimeTypeHash
---@return integer unk1
---@return integer unk2
---@return integer victimPed
---@return integer victimModelHash
---@return integer unk7
---@return boolean unk10
---@return integer unk12
---@return integer unk13
---@return integer unk14
---@return integer unk15
---@return integer unk16
function GetPlayerRegisteredCrime(player, index)
    local outData = DataView.ArrayBuffer(17*8)
    
    local success         = Citizen.InvokeNative(0x532C5FDDB986EE5C, player, index, outData:Buffer()) == 1
    local crimeTypeHash   = outData:GetInt32(0*8)
    local unk1            = outData:GetInt32(1*8)
    local unk2            = outData:GetInt32(2*8)
    local victimPed       = outData:GetInt32(3*8)
    local victimModelHash = outData:GetInt32(4*8)
    local unk7            = outData:GetInt32(7*8)
    local unk10           = outData:GetInt32(10*8) == 1
    local unk12           = outData:GetInt32(12*8)
    local unk13           = outData:GetInt32(13*8)
    local unk14           = outData:GetInt32(14*8)
    local unk15           = outData:GetInt32(15*8)
    local unk16           = outData:GetInt32(16*8)

    return success, crimeTypeHash, unk1, unk2, victimPed, victimModelHash, unk7, unk10, unk12, unk13, unk14, unk15, unk16
end

---Returns true when player is researched by cops, if not, false.
---@return boolean
function IsPlayerResearched()
    return Citizen.InvokeNative(0xF46108C50A22B029) == 1
end

---Force cops to research player for a frame.
function ForcePlayerResearchThisFrame()
    Citizen.InvokeNative(0xC310239ACCCF5579)
end

---Force cops to research player.
function ForcePlayerResearch()
    Citizen.InvokeNative(0x7803436E68C32B26)
end

---Stop player from being researched.
function StopPlayerResearch()
    Citizen.InvokeNative(0x29CD4896ECB66C12)
end

---Return true if the ped is a victim of a crime, false otherwise.
---@param ped integer
---@return boolean
function IsPedVictimOfCrime(ped)
    return Citizen.InvokeNative(0x40851BCC33ACD9AB, ped) == 1
end

function N_0x9C5BD8C562565CE6()
    local outData = DataView.ArrayBuffer(32*8)
    Citizen.InvokeNative(0x9C5BD8C562565CE6, outData:Buffer())
    for i = 0, 31 do
        local unk = outData:GetInt32(i*8)
        if unk ~= 0 then
            print(string.format("Unknown data at index %d: %d", i, unk))
        end
    end
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
function N_0x148E7AC8141C9E64(player) -- = Global_1940199.f_9
    return Citizen.InvokeNative(0x148E7AC8141C9E64, player, Citizen.ResultAsInteger())
end

---
---@param player integer
---@return boolean
function N_0x9945A3E2528A02E8(player) -- = Global_1940199.f_8
    return Citizen.InvokeNative(0x9945A3E2528A02E8, player) == 1
end

---
---@param player integer
---@return boolean
function N_0x9D5C9A5A3321B128(player) -- = Global_1940199.f_20
    return Citizen.InvokeNative(0x9D5C9A5A3321B128, player) == 1
end

---
---@param crimeTypeHash integer
---@param p1 integer
---@return integer
function N_0xDAEFDFDB2AEECE37(crimeTypeHash, p1) -- = Global_1940199.f_15
    return Citizen.InvokeNative(0xDAEFDFDB2AEECE37, crimeTypeHash, p1, Citizen.ResultAsInteger())
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