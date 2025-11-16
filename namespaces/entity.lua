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

---Enables or disables automatic passenger population on a specific train wagon (carriage).
---@param trainWagon Vehicle
---@param toggle boolean
function ForceTrainWagonPopulation(trainWagon, toggle)
    Citizen.InvokeNative(0x119A5714578F4E05, trainWagon, toggle)
end

---
---@param hash Hash
---@return boolean, Hash, Hash, Hash
function N_0x5744562E973E33CD(hash)
    local outData = DataView.ArrayBuffer(1*8)
    local outData2 = DataView.ArrayBuffer(1*8)
    local outData3 = DataView.ArrayBuffer(1*8)

    local res = Citizen.InvokeNative(0x5744562E973E33CD, hash, outData:Buffer(), outData2:Buffer(), outData2:Buffer()) == 1
    local txdHash  = outData:GetInt32(0*8)
    local txdHash2 = outData2:GetInt32(0*8)
    local txdHash3 = outData3:GetInt32(0*8)

    return res, txdHash, txdHash2, txdHash3
end

---
---@param object Object
---@param p1 integer
---@param ped Ped
---@param p3 integer
---@param p4 integer
---@return boolean
function N_0X383F64263F946E45(object, p1, ped, p3, p4)
    local res
    local outData = DataView.ArrayBuffer(10*8)

    res = Citizen.InvokeNative(0X383F64263F946E45, outData:Buffer(), object, p1, ped, p3, p4) == 1

    return res
end