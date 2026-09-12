---
---@param ped integer
---@param x number
---@param y number
---@param z number
---@param lookAtEntity integer
---@param flags integer
---@param p6 boolean
---@param duration integer
function InverseKinematicsRequestLookAt(ped, x, y, z, lookAtEntity, flags, p6, duration)
    local paramsStruct = DataView.ArrayBuffer(32*8)
        :SetFloat32(0*8, x)
        :SetFloat32(1*8, y)
        :SetFloat32(2*8, z)
        :SetFloat32(3*8, lookAtEntity)
        :SetInt32(4*8, flags)
        :SetInt32(5*8, p6 and 1 or 0)
        :SetInt32(6*8, 0) -- 0
        :SetInt32(7*8, duration)
        :SetInt32(8*8, 2) -- 0-4
        :SetInt32(9*8, 1) -- 0-1
        :SetInt32(10*8, 1) -- 0-1
        :SetInt32(11*8, 1) -- 0-1
        :SetInt32(13*8, 1) -- 0-1
        :SetInt32(14*8, 2) -- 0-2
        :SetInt32(15*8, 2) -- 0-2
        :SetInt32(16*8, 3) -- 0-3
        :SetInt32(17*8, 0) -- 0-4
        :SetInt32(18*8, 0) -- 0-4
        :SetInt32(19*8, 3) -- 0-4
        :SetInt32(20*8, 1) -- 0-3
        :SetInt32(21*8, 3) -- 0-4
        :SetInt32(22*8, 3) -- 0-3
        :SetInt32(23*8, 3) -- 0-3
        :SetInt32(24*8, 3) -- 0-3
    Citizen.InvokeNative(0x66F9EB44342BB4C5, ped, paramsStruct:Buffer())
end

---
---@param ped integer
---@param ik integer
---@return boolean
function InverseKinematicsIsActive(ped, ik)
    return Citizen.InvokeNative(0x6098139150DCC745, ped, ik) == 1
end

---Make the ped point at with his arm, must be called each frames.
---@param ped integer
---@param isRightHand boolean
---@param xOffset number
---@param yOffset number
---@param zOffset number
---@param pointAtEntity integer
---@param pointAtBoneIndex integer
---@param flags integer
function InverseKinematicsPointAt(ped, isRightHand, xOffset, yOffset, zOffset, pointAtEntity, pointAtBoneIndex, flags)
    local paramsStruct = DataView.ArrayBuffer(10*8)
        :SetInt32(0*8, isRightHand and 1 or 0)
        :SetFloat32(1*8, xOffset)
        :SetFloat32(2*8, yOffset)
        :SetFloat32(3*8, zOffset)
        :SetInt32(4*8, pointAtEntity)
        :SetInt32(5*8, pointAtBoneIndex)
        :SetInt32(6*8, flags) -- 24 flags, (1 << 22): attach
        :SetInt32(7*8, 2)
        :SetInt32(8*8, 2)
    Citizen.InvokeNative(0x0B9F7A01EC50448D, ped, paramsStruct:Buffer())
end