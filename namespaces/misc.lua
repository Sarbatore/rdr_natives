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

---If success, return the ground Z, its material hash and flags.
---In R* scripts p1 is 17, 129 or 3423 (maybe flags).
---@param x float
---@param y float
---@param z float
---@param p1 integer
---@return boolean, float, Hash, integer
function GetGroundZAndMaterialFor3DCoord(x, y, z, p1)
    local groundZStruct = DataView.ArrayBuffer(1*8)
    local materialStruct = DataView.ArrayBuffer(1*8)
    local flagsStruct = DataView.ArrayBuffer(1*8)
    
    local res = Citizen.InvokeNative(0xBBE5B63EFFB08E68, x, y, z, p1, groundZStruct:Buffer(), materialStruct:Buffer(), flagsStruct:Buffer()) == 1
    local groundZ = groundZStruct:GetFloat32(0)
    local material = materialStruct:GetInt32(0)
    local flags = flagsStruct:GetInt32(0)

    return res, groundZ, material, flags
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
    data:SetFloat32(0*8, xStart or 0.0)
    data:SetFloat32(1*8, yStart or 0.0)
    data:SetFloat32(2*8, zStart or 0.0)
    data:SetFloat32(3*8, xEnd or 0.0)
    data:SetFloat32(4*8, yEnd or 0.0)
    data:SetFloat32(5*8, zEnd or 0.0)
    data:SetInt32(6*8, weaponHash or 0)
    data:SetFloat32(7*8, damage or 0.0)
    data:SetFloat32(8*8, p8 or 0.0)
    data:SetInt32(9*8, investigator or 0)
    data:SetInt32(10*8, entity2 or 0)
    data:SetInt32(11*8, entity3 or 0)
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
---@param p0 integer
function N_0X49F3241C28EBBFBC(p0)
    Citizen.InvokeNative(0X49F3241C28EBBFBC, p0)
end

---
---@param currencyType integer
---@param p1 float
---@param p3 integer
function N_0X183672FE838A661B(currencyType, p1, p3)
    local data = DataView.ArrayBuffer(4*8)
    data:SetInt32(0*8, currencyType)
    data:SetFloat32(1*8, p1)
    data:SetInt32(3*8, p3)
    Citizen.InvokeNative(0x183672FE838A661B, data:Buffer())
end

---
---@param reward Hash
function N_0X38C0C9CAE1544500(reward)
    Citizen.InvokeNative(0X38C0C9CAE1544500, reward)
end