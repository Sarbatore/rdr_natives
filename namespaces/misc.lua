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