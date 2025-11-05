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
    local res, groundZ, material, flags

    local groundZStruct = DataView.ArrayBuffer(1*8)
    local materialStruct = DataView.ArrayBuffer(1*8)
    local flagsStruct = DataView.ArrayBuffer(1*8)
    
    res = Citizen.InvokeNative(0xBBE5B63EFFB08E68, x, y, z, p1, groundZStruct:Buffer(), materialStruct:Buffer(), flagsStruct:Buffer()) == 1
    groundZ = groundZStruct:GetFloat32(0)
    material = materialStruct:GetInt32(0)
    flags = flagsStruct:GetInt32(0)

    return res, groundZ, material, flags
end