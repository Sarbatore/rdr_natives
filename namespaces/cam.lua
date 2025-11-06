---Zooms in the third person camera closer to ground level (call every frame) [@aaron1a12]
---@param zoom number
function SetCameraGroundLevelZoom(zoom)
    Citizen.InvokeNative(0x71D71E08A7ED5BD7, zoom)
end

---Forces the third person gameplay camera at closest zoom. [@aaron1a12]
function SetCameraClosestZoom()
    Citizen.InvokeNative(0x718C6ECF5E8CBDD4)
end

---Sets the depth of field and focal parameters for a camera.
---@param cam Cam
---@param dofStrength float
---@param dofNear float
---@param dofFar float
---@param focalLength float
---@param minFocal float
---@param maxFocal float
---@param enableDof boolean
---@param p8 boolean
---@param p9 boolean
---@param p10 boolean
function SetCamDofAndFocalParams(cam, dofStrength, dofNear, dofFar, focalLength, minFocal, maxFocal, enableDof, p8, p9, p10)
    local struct = DataView.ArrayBuffer(10*8)
    struct:SetFloat32(0*8, dofStrength)
    struct:SetFloat32(1*8, dofNear)
    struct:SetFloat32(2*8, dofFar)
    struct:SetFloat32(3*8, focalLength)
    struct:SetFloat32(4*8, minFocal)
    struct:SetFloat32(5*8, maxFocal)
    struct:SetInt32(6*8, BoolToNumber(enableDof))
    struct:SetInt32(7*8, BoolToNumber(p8))
    struct:SetInt32(8*8, BoolToNumber(p9))
    struct:SetInt32(9*8, BoolToNumber(p10))

    Citizen.InvokeNative(0xE4B7945EF4F1BFB2, cam, struct:Buffer())
end