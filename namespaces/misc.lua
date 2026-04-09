---Disables composite pick promp
---@param composite integer
---@param disable boolean
function DisableCompositePickPromptThisFrame(composite, disable)
    Citizen.InvokeNative(0x082C043C7AFC3747, composite, disable)
end

---Disables composite eat prompt
---@param composite integer
---@param disable boolean
function DisableCompositeEatPromptThisFrame(composite, disable)
    Citizen.InvokeNative(0x40D72189F46D2E15, composite, disable)
end

---If success, return the ground Z, its material hash and flags. In R* scripts p1 is 17, 129 or 3423 (maybe flags).
---@param x number
---@param y number
---@param z number
---@param p1 integer
---@return boolean success
---@return number groundZ
---@return integer materialHash
---@return integer flags
function GetGroundZAndMaterialFor3DCoord(x, y, z, p1)
    local groundZStruct = DataView.ArrayBuffer(1*8)
    local materialStruct = DataView.ArrayBuffer(1*8)
    local flagsStruct = DataView.ArrayBuffer(1*8)
    
    local success      = Citizen.InvokeNative(0xBBE5B63EFFB08E68, x, y, z, p1, groundZStruct:Buffer(), materialStruct:Buffer(), flagsStruct:Buffer()) == 1
    local groundZ      = groundZStruct:GetFloat32(0)
    local materialHash = materialStruct:GetInt32(0)
    local flags        = flagsStruct:GetInt32(0)

    return success, groundZ, materialHash, flags
end

---Fire single bullet.
---@param xStart number
---@param yStart number
---@param zStart number
---@param xEnd number
---@param yEnd number
---@param zEnd number
---@param weaponHash integer
---@param damage number
---@param p8 number
---@param investigator integer
---@param entity2 integer
---@param entity3 integer
---@param p12 boolean
---@param p13 boolean
---@param p14 boolean
---@param p15 boolean
---@param p16 boolean
---@param p18 boolean
---@param p19 boolean
function FireSingleBullet(xStart, yStart, zStart, xEnd, yEnd, zEnd, weaponHash, damage, p8, investigator, entity2, entity3, p12, p13, p14, p15, p16, p18, p19)
    local data = DataView.ArrayBuffer(32*8)
    data:SetFloat32(0*8, xStart)
    data:SetFloat32(1*8, yStart)
    data:SetFloat32(2*8, zStart)
    data:SetFloat32(3*8, xEnd)
    data:SetFloat32(4*8, yEnd)
    data:SetFloat32(5*8, zEnd)
    data:SetInt32(6*8, weaponHash)
    data:SetFloat32(7*8, damage)
    data:SetFloat32(8*8, p8)
    data:SetInt32(9*8, investigator)
    data:SetInt32(10*8, entity2)
    data:SetInt32(11*8, entity3)
    data:SetInt32(12*8, p12 and 1 or 0)
    data:SetInt32(13*8, p13 and 1 or 0)
    data:SetInt32(14*8, p14 and 1 or 0)
    data:SetInt32(15*8, p15 and 1 or 0)
    data:SetInt32(16*8, p16 and 1 or 0)
    data:SetInt32(18*8, p18 and 1 or 0)
    data:SetInt32(19*8, p19 and 1 or 0)

    Citizen.InvokeNative(0xCBC9A21F6A2A679C, data:Buffer())
end

---
---@param dx number
---@param dy number
---@return number
function GetHeadingFromVector2d(dx, dy)
    return Citizen.InvokeNative(0x38D5202FF9271C62, dx, dy, Citizen.ResultAsFloat())
end

---Returns the number of bullets in area (doesn't work for arrows and throwable projectile).
---@param x number
---@param y number
---@param z number
---@param radius number
---@param p4 boolean
---@param p5 boolean
---@return integer
function GetNumberOfBulletsInArea(x, y, z, radius, p4, p5)
    return Citizen.InvokeNative(0xDC416CA762BC4F43, x, y, z, radius, p4, p5, Citizen.ResultAsInteger())
end

---Returns true if the entity have just been impacted by any bullets.
---@param entity integer
---@param p1 boolean
---@param p2 boolean
---@return boolean
function HasBulletImpactedEntity(entity, p1, p2)
    return Citizen.InvokeNative(0x7A76104CC2CC69E8, entity, p1, p2) == 1
end

---Returns the number of bullets that just impacted entity.
---@param entity integer
---@param p1 boolean
---@param p2 boolean
---@return integer
function GetNumberOfBulletsImpactedEntity(entity, p1, p2)
    return Citizen.InvokeNative(0x970339EFA4FDE518, entity, p1, p2, Citizen.ResultAsInteger())
end

---Related to 0xAF3A84C7DE6A1DC5, 0x94FCADCF9F0C368E, 0x0D0AE5081F88CFE1, 0x154340E87D8CC178
---@param p0 integer `reward_ped_small`
---@param p1 integer `PROVISION_JACKS_THIMBLE`
---@param p2 number 4.0
---@param p3 integer
---@param p4 integer 4
---@param p5 integer 0, 1
---@param p6 integer 1
function N_0xAF3A84C7DE6A1DC5(p0, p1, p2, p3, p4, p5, p6)
    local data = DataView.ArrayBuffer(10*8)
    data:SetInt32(0*8, p1)
    data:SetFloat32(1*8, p2)
    data:SetInt32(2*8, p3)
    data:SetInt32(3*8, p4)
    data:SetInt32(4*8, p5)
    data:SetInt32(5*8, p6)
    Citizen.InvokeNative(0xAF3A84C7DE6A1DC5, p0, data:Buffer())
end

---Related to 0xAF3A84C7DE6A1DC5, 0x94FCADCF9F0C368E, 0x0D0AE5081F88CFE1, 0x154340E87D8CC178
---@param p0 integer `reward_ped_small`
function N_0x94FCADCF9F0C368E(p0)
    Citizen.InvokeNative(0x94FCADCF9F0C368E, p0)
end

---Related to 0xAF3A84C7DE6A1DC5, 0x94FCADCF9F0C368E, 0x0D0AE5081F88CFE1, 0x154340E87D8CC178
---@param p0 integer `reward_ped_small`
---@return boolean
function N_0x4B101DBCC9482F2D(p0)
    return Citizen.InvokeNative(0x0D0AE5081F88CFE1, p0) == 1
end

---Related to 0xAF3A84C7DE6A1DC5, 0x94FCADCF9F0C368E, 0x0D0AE5081F88CFE1, 0x154340E87D8CC178
---@param p0 integer `reward_ped_small`
function N_0x154340E87D8CC178(p0)
    Citizen.InvokeNative(0x154340E87D8CC178, p0)
end

function N_0xAD44856A1CD29635(entity1, entity2)
    local outData = DataView.ArrayBuffer(20*8)
    outData:SetInt32(1*8, 10)
    outData:SetInt32(12*8, 10)

    local success = Citizen.InvokeNative(0xAD44856A1CD29635, entity1, entity2, outData:Buffer()) == 1
end

function N_0xBB282CF5D2333FB8(entity1)
    local outData = DataView.ArrayBuffer(20*8)
    outData:SetInt32(1*8, 10)
    outData:SetInt32(12*8, 10)

    local success = Citizen.InvokeNative(0xBB282CF5D2333FB8, entity1, outData:Buffer()) == 1
end

---
---@param p0 integer
function N_0X49F3241C28EBBFBC(p0)
    Citizen.InvokeNative(0X49F3241C28EBBFBC, p0)
end

---
---@param currencyType integer
---@param p1 number
---@param p3 integer
function N_0X183672FE838A661B(currencyType, p1, p3)
    local data = DataView.ArrayBuffer(4*8)
    data:SetInt32(0*8, currencyType)
    data:SetFloat32(1*8, p1)
    data:SetInt32(3*8, p3)
    Citizen.InvokeNative(0x183672FE838A661B, data:Buffer())
end

---
---@param rewardHash integer
function N_0X38C0C9CAE1544500(rewardHash)
    Citizen.InvokeNative(0X38C0C9CAE1544500, rewardHash)
end