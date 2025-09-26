---Add explosion with entity as damage causer. [@sarbatore]
---@param entity Entity
---@param p1 boolean
---@param x number
---@param y number
---@param z number
---@param explosionType number
---@param damageScale number
---@param isAudible boolean
---@param isInvisible boolean
---@param cameraShake number
function AddExplosionWithDamageCauser(entity, p1, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
    Citizen.InvokeNative(0xB7DF150605EEDC9B, entity, p1, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
end

---Add explosion with vfx and entity as damage causer. [@sarbatore]
---@param entity Entity
---@param p1 boolean
---@param x number
---@param y number
---@param z number
---@param explosionType number
---@param explosionFx number
---@param damageScale number
---@param isAudible boolean
---@param isInvisible boolean
---@param cameraShake number
function AddExplosionWithUserVfxAndDamageCauser(entity, p1, x, y, z, explosionType, explosionFx, damageScale, isAudible, isInvisible, cameraShake)
    Citizen.InvokeNative(0x34AE85C7CA4857AA, entity, p1, x, y, z, explosionType, explosionFx, damageScale, isAudible, isInvisible, cameraShake)
end

---Returns whether an entity is damaged by fire. [@sarbatore]
---@param entity Entity
---@return boolean
function IsEntityDamagedByFire(entity)
    return Citizen.InvokeNative(0xA4454592DCF7C992, entity)
end

---Returns whether a fire exists close to a player at a volume position. [@sarbatore]
---@param playerX number
---@param playerY number
---@param playerZ number
---@param volumePosX number
---@param volumePosY number
---@param volumePosZ number
---@param volumeRotX number
---@param volumeRotY number
---@param volumeRotZ number
---@return boolean
function DoesFireExistCloseToPlayerAtVolumePos(playerX, playerY, playerZ, volumePosX, volumePosY, volumePosZ, volumeRotX, volumeRotY, volumeRotZ)
    return Citizen.InvokeNative(0x559FC1D310813031, playerX, playerY, playerZ, volumePosX, volumePosY, volumePosZ, volumeRotX, volumeRotY, volumeRotZ)
end