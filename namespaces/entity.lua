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
---@param entity1 integer
---@param entity2 integer
---@return float
function GetEntityCollisionIntensity(entity1, entity2)
    return Citizen.InvokeNative(0xDFC2B226D56D85F6, entity1, entity2, Citizen.ResultAsFloat())
end

---
---@param entity integer
---@param peltAsset integer
---@param albedoHash integer
---@param p3 integer
function SetAnimalPeltTexture(entity, peltAsset, albedoHash, p3)
    Citizen.InvokeNative(0xDD03FC2089AD093C, entity, peltAsset, albedoHash, p3)
end

---Checks whether the specified model can be handled through the vegetation modifier path.
---@param modelHash integer
---@return boolean
function IsCanModelUseVegModifier(modelHash)
    return Citizen.InvokeNative(0xD4636C2EDB0DEA8A, modelHash) == 1
end

---Set entity anim age, only used with torch weapon in R* scripts
---@param entity integer
---@param alpha number
function SetEntityAnimAge(entity, alpha)
    Citizen.InvokeNative(0xC0EDEF16D90661EE, entity, alpha)
end

---Sets the entity's rotation so that it becomes parallel to the direction defined by the line between coords1 and coords2, without moving the entity from its current position.
---@param entity integer
---@param x1 number
---@param y1 number
---@param z1 number
---@param x2 number
---@param y2 number
---@param z2 number
---@param p7 integer
function SetEntityRotationParallelToLine(entity, x1, y1, z1, x2, y2, z2, p7)
    Citizen.InvokeNative(0xD45BB89B53FC0CFD, entity, x1, y1, z1, x2, y2, z2, p7)
end

---Checks whether the entity's interior is currently loaded by the game engine.
---@param entity integer
---@return boolean
function IsTrainInteriorLoaded(entity)
    return Citizen.InvokeNative(0xC2E71D7E0A7B4C89, entity) == 1
end

---Enable interiors for train carriages that the game engine has disabled due to distance-based optimization.
---@param entity integer Entity whose interior state will be changed
---@param toggle boolean true = load interior, false = unload interior
function PreloadEntityInterior(entity, toggle)
    Citizen.InvokeNative(0x6C31B06E91518269, entity, toggle)
end

---Configures automatic pickup behavior for a carriable entity.
---@param entity integer
---@param noPickupAnim boolean
---@param autoPickupRange number
---@param p3 number
---@param p4 number
---@param enablePickupPrompt boolean
function SetAutoPickup(entity, noPickupAnim, autoPickupRange, p3, p4, enablePickupPrompt)
    Citizen.InvokeNative(0xBD94CECFB2D65119, entity, noPickupAnim, autoPickupRange, p3, p4, enablePickupPrompt)
end

---Returns the collision intensity currently registered on the specified entity.
---@param entity integer
---@return number
function GetCollisionIntensity(entity)
    return Citizen.InvokeNative(0x6D58167F62238284, entity, Citizen.ResultAsFloat())
end

---Disables or re-enables the visible fire effect on a burning entity.
---@param entity integer
---@param toggle boolean
function SetEntityDisableFire(entity, toggle)
    Citizen.InvokeNative(0x56E0735D6273B227, entity, toggle)
end

---Enables visibility tracking for the specified entity.
---@param entity integer
function RequestEntityVisibilityTracking(entity)
    Citizen.InvokeNative(0x3F08C6163A4AB1D6, entity)
end

---Controls a forced "lights off" state for entities that have built-in light sources.
---@param entity integer
---@param toggle boolean
function SetEntityLightsOff(entity, toggle)
    Citizen.InvokeNative(0x2D40BCBFE9305DEA, entity, toggle)
end

---
---@param entity integer
---@param toggle boolean
function SetEntityLightsAlwaysEnabled(entity, toggle)
    Citizen.InvokeNative(0xEBDC12861D079ABA, entity, toggle)
end

---Returns the original animal (carcass) entity from which a pelt entity was obtained.
---@param entity integer
---@return integer carcassEntity
function GetCarcassFromPelt(entity)
    return Citizen.InvokeNative(0x2A77EF9BEC8518F4, entity, Citizen.ResultAsInteger())
end

---
---@param entity1 integer
---@param entity2 integer
---@param p2 boolean
---@param p3 boolean
---@return boolean
function N_0x3EC28DA1FFAC9DDD(entity1, entity2, p2, p3)
    return Citizen.InvokeNative(0x3EC28DA1FFAC9DDD, entity1, entity2, p2, p3) == 1
end

---
---@param albedoHash integer
---@return boolean
---@return integer txdHash
---@return integer txdHash2
---@return integer txdHash3
function N_0x5744562E973E33CD(albedoHash)
    local outData = DataView.ArrayBuffer(1*8)
    local outData2 = DataView.ArrayBuffer(1*8)
    local outData3 = DataView.ArrayBuffer(1*8)

    local res = Citizen.InvokeNative(0x5744562E973E33CD, albedoHash, outData:Buffer(), outData2:Buffer(), outData3:Buffer(), 0) == 1
    local txdHash  = outData:GetInt32(0)
    local txdHash2 = outData2:GetInt32(0)
    local txdHash3 = outData3:GetInt32(0)

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

---
---@param entity1 integer
---@param p1 integer
---@param entity2 integer
---@return retval boolean
---@return unk integer
function N_0x0CCEFC6C2C95DA2A(entity1, p1, entity2)
    local outData = DataView.ArrayBuffer(1*8)
    local retval = Citizen.InvokeNative(0x0CCEFC6C2C95DA2A, outData:Buffer(), entity1, p1, entity2, Citizen.ResultAsInteger())
    local unk = outData:GetInt32(0)

    return retval, unk
end