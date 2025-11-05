---Add explosion with entity as damage causer. [@sarbatore]
---@param entity Entity
---@param p1 boolean
---@param x float
---@param y float
---@param z float
---@param explosionType integer
---@param damageScale float
---@param isAudible boolean
---@param isInvisible boolean
---@param cameraShake float
function AddExplosionWithDamageCauser(entity, p1, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
    Citizen.InvokeNative(0xB7DF150605EEDC9B, entity, p1, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
end

---Add explosion with vfx and entity as damage causer. [@sarbatore]
---@param entity Entity
---@param p1 boolean
---@param x float
---@param y float
---@param z float
---@param explosionType integer
---@param explosionFx Hash
---@param damageScale float
---@param isAudible boolean
---@param isInvisible boolean
---@param cameraShake float
function AddExplosionWithUserVfxAndDamageCauser(entity, p1, x, y, z, explosionType, explosionFx, damageScale, isAudible, isInvisible, cameraShake)
    Citizen.InvokeNative(0x34AE85C7CA4857AA, entity, p1, x, y, z, explosionType, explosionFx, damageScale, isAudible, isInvisible, cameraShake)
end

---Returns whether an entity is damaged by fire. [@sarbatore]
---@param entity Entity
---@return boolean
function IsEntityDamagedByFire(entity)
    return Citizen.InvokeNative(0xA4454592DCF7C992, entity) == 1
end

---Returns the closest fire pos in a zone
---@param xPos float
---@param yPos float
---@param zPos float
---@param xRot float
---@param yRot float
---@param zRot float
---@param xScale float
---@param yScale float
---@param zScale float
---@return vector3
function GetClosestFirePosInVolume(xPos, yPos, zPos, xRot, yRot, zRot, xScale, yScale, zScale)
    return Citizen.InvokeNative(0x559FC1D310813031, Citizen.PointerValueVector(), xPos, yPos, zPos, xRot, yRot, zRot, xScale, yScale, zScale)
end