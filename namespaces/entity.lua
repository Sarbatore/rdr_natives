---Attach an entity to coordinates physically [@sarbatore]
---@param entity Entity
---@param x float
---@param y float
---@param z float
---@param xOffset float
---@param yOffset float
---@param zOffset float
---@param p7 number
---@param p8 boolean
---@param p9 number
---@param p10 number
---@param p11 number
---@param p12 number
---@param p13 number
---@param p14 number
function AttachEntityToCoordsPhysically(entity, x, y, z, xOffset, yOffset, zOffset, p7, p8, p9, p10, p11, p12, p13, p14)
    Citizen.InvokeNative(0x445D7D8EA66E373E, entity, x, y, z, xOffset, yOffset, zOffset, p7, p8, p9, p10, p11, p12, p13, p14)
end

---Return the entity which is looting the ped [@sarbatore]
---@param ped Ped
---@return integer
function GetEntityLootingPed(ped)
    return Citizen.InvokeNative(0xEF2D9ED7CE684F08, ped, Citizen.ResultAsInteger())
end

---Get the offset from the entity for the selected bone index [@sarbatore]
---@param entity Entity
---@param boneIndex integer
---@return vector
function GetOffsetFromEntityBone(entity, boneIndex)
    return Citizen.InvokeNative(0x5E214112806591EA, entity, boneIndex, Citizen.ResultAsVector())
end

---
---@param hash Hash
---@return boolean, Hash, Hash, Hash
function N_0x5744562E973E33CD(hash)
    local res, txdHash, txdHash2, txdHash3
    local outData = DataView.ArrayBuffer(1*8)
    local outData2 = DataView.ArrayBuffer(1*8)
    local outData3 = DataView.ArrayBuffer(1*8)

    res = Citizen.InvokeNative(0x5744562E973E33CD, hash, outData:Buffer(), outData2:Buffer(), outData2:Buffer()) == 1
    txdHash  = outData:GetInt32(0*8)
    txdHash2 = outData2:GetInt32(0*8)
    txdHash3 = outData3:GetInt32(0*8)

    return res, txdHash, txdHash2, txdHash3
end