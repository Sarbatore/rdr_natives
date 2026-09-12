---Zooms in the third person camera closer to ground level (call every frame)
---@param zoom number
function SetCameraGroundLevelZoom(zoom)
    Citizen.InvokeNative(0x71D71E08A7ED5BD7, zoom)
end

---Forces the third person gameplay camera at closest zoom.
function SetCameraClosestZoom()
    Citizen.InvokeNative(0x718C6ECF5E8CBDD4)
end

---Sets the depth of field and focal parameters for a camera.
---@param cam integer
---@param dofStrength number
---@param dofNear number
---@param dofFar number
---@param focalLength number
---@param minFocal number
---@param maxFocal number
---@param enableDof boolean
---@param p8 boolean
---@param p9 boolean
---@param p10 boolean
function SetCamDofAndFocalParams(cam, dofStrength, dofNear, dofFar, focalLength, minFocal, maxFocal, enableDof, p8, p9, p10)
    local paramsStruct = DataView.ArrayBuffer(10*8)
        :SetFloat32(0*8, dofStrength)
        :SetFloat32(1*8, dofNear)
        :SetFloat32(2*8, dofFar)
        :SetFloat32(3*8, focalLength)
        :SetFloat32(4*8, minFocal)
        :SetFloat32(5*8, maxFocal)
        :SetInt32(6*8, enableDof and 1 or 0)
        :SetInt32(7*8, p8 and 1 or 0)
        :SetInt32(8*8, p9 and 1 or 0)
        :SetInt32(9*8, p10 and 1 or 0)

    Citizen.InvokeNative(0xE4B7945EF4F1BFB2, cam, paramsStruct:Buffer())
end

---Plays a predefined camera shake effect by string name.
---@param shakeName string DRUNK_SHAKE, REINFORCED_LASSO_STRUGGLE_SHAKE, HAND_SHAKE
---@param intensity number
function ShakeGameplayCamWithName(shakeName, intensity)
    Citizen.InvokeNative(0xC3E9E5D4F413B773, shakeName, intensity)
end