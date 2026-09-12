---
---@return boolean success
---@return vector3
function N_0xEFC535C9FAF563B3()
    local outStruct = DataView.ArrayBuffer(3*8)
    local success = Citizen.InvokeNative(0xEFC535C9FAF563B3, outStruct:Buffer()) == 1

    return success, vector3(outStruct:GetFloat32(0*8), outStruct:GetFloat32(1*8), outStruct:GetFloat32(2*8))
end

---
---@param x number
---@param y number
---@param z number
---@return integer
function N_0x665B21666351CB37(x, y, z)
    return Citizen.InvokeNative(0x665B21666351CB37, x, y, z, Citizen.ResultAsInteger())
end

---Same as GetClosestVehicleNode
---@param x number
---@param y number
---@param z number
---@param nodeType 1 for ground, 2 for water
---@param p5 number
---@param p6 integer
---@return boolean success
---@return vector3
function N_0xCA27A86CAA4E98ED(x, y, z, nodeType, p5, p6)
    local outStruct = DataView.ArrayBuffer(3*8)
    local success = Citizen.InvokeNative(0xCA27A86CAA4E98ED, x, y, z, outStruct:Buffer(), nodeType, p5, p6) == 1

    return success, vector3(outStruct:GetFloat32(0*8), outStruct:GetFloat32(1*8), outStruct:GetFloat32(2*8))
end