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
    local data = DataView.ArrayBuffer(32*8)
    data:SetFloat32(0*8, x or 0.0)
    data:SetFloat32(1*8, y or 0.0)
    data:SetFloat32(2*8, z or 0.0)
    data:SetFloat32(3*8, lookAtEntity or 0)
    data:SetInt32(4*8, flags or -1)
    data:SetInt32(5*8, p6 and 1 or 0)
    data:SetInt32(6*8, 0) -- 0
    data:SetInt32(7*8, duration or -1)
    data:SetInt32(8*8, 2) -- 0-4
    data:SetInt32(9*8, 1) -- 0-1
    data:SetInt32(10*8, 1) -- 0-1
    data:SetInt32(11*8, 1) -- 0-1
    data:SetInt32(13*8, 1) -- 0-1
    data:SetInt32(14*8, 2) -- 0-2
    data:SetInt32(15*8, 2) -- 0-2
    data:SetInt32(16*8, 3) -- 0-3
    data:SetInt32(17*8, 0) -- 0-4
    data:SetInt32(18*8, 0) -- 0-4
    data:SetInt32(19*8, 3) -- 0-4
    data:SetInt32(20*8, 1) -- 0-3
    data:SetInt32(21*8, 3) -- 0-4
    data:SetInt32(22*8, 3) -- 0-3
    data:SetInt32(23*8, 3) -- 0-3
    data:SetInt32(24*8, 3) -- 0-3
    Citizen.InvokeNative(0x66F9EB44342BB4C5, ped, data:Buffer())
end

---
---@param ped integer
---@param ik integer
---@return boolean
function InverseKinematicsIsActive(ped, ik)
    return Citizen.InvokeNative(0x6098139150DCC745, ped, ik) == 1
end

function N_0x0B9F7A01EC50448D(ped, isRightHand, xOffset, yOffset, zOffset, pointAtEntity, boneIndex, flags)
    local data = DataView.ArrayBuffer(10*8)
    data:SetInt32(0*8, isRightHand and 1 or 0)
    data:SetFloat32(1*8, xOffset or 0.0)
    data:SetFloat32(2*8, yOffset or 0.0)
    data:SetFloat32(3*8, zOffset or 0.0)
    data:SetInt32(4*8, pointAtEntity or 0)
    data:SetInt32(5*8, boneIndex or -1)
    data:SetInt32(6*8, flags or -1) -- 24 flags, (1 << 22): attach
    data:SetInt32(7*8, 2)
    data:SetInt32(8*8, 2)
    Citizen.InvokeNative(0x0B9F7A01EC50448D, ped, data:Buffer())
end