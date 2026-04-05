---Add explosion with entity as damage causer.
---@param entity integer
---@param p1 boolean
---@param x number
---@param y number
---@param z number
---@param explosionType integer
---@param damageScale number
---@param isAudible boolean
---@param isInvisible boolean
---@param cameraShake number
function AddExplosionWithDamageCauser(entity, p1, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
    Citizen.InvokeNative(0xB7DF150605EEDC9B, entity, p1, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
end

---Add explosion with vfx and entity as damage causer.
---@param entity integer
---@param p1 boolean
---@param x number
---@param y number
---@param z number
---@param explosionType integer
---@param explosionFxHash integer
---@param damageScale number
---@param isAudible boolean
---@param isInvisible boolean
---@param cameraShake number
function AddExplosionWithUserVfxAndDamageCauser(entity, p1, x, y, z, explosionType, explosionFxHash, damageScale, isAudible, isInvisible, cameraShake)
    Citizen.InvokeNative(0x34AE85C7CA4857AA, entity, p1, x, y, z, explosionType, explosionFxHash, damageScale, isAudible, isInvisible, cameraShake)
end

---Returns whether an entity is damaged by fire.
---@param entity integer
---@return boolean
function IsEntityDamagedByFire(entity)
    return Citizen.InvokeNative(0xA4454592DCF7C992, entity) == 1
end

---Returns the closest fire pos in a zone
---@param xPos number
---@param yPos number
---@param zPos number
---@param xRot number
---@param yRot number
---@param zRot number
---@param xScale number
---@param yScale number
---@param zScale number
---@return vector3
function GetClosestFirePosInVolume(xPos, yPos, zPos, xRot, yRot, zRot, xScale, yScale, zScale)
    return Citizen.InvokeNative(0x559FC1D310813031, Citizen.PointerValueVector(), xPos, yPos, zPos, xRot, yRot, zRot, xScale, yScale, zScale)
end