---Add explosion with entity as damage causer. [@sarbatore]
---@param entity number
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
---@param entity number
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