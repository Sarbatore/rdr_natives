---Zooms in the third person camera closer to ground level (call every frame) [@aaron1a12]
---@param zoom number
function SetCameraGroundLevelZoom(zoom)
    Citizen.InvokeNative(0x71D71E08A7ED5BD7, zoom)
end

---Forces the third person gameplay camera at closest zoom. [@aaron1a12]
function SetCameraClosestZoom()
    Citizen.InvokeNative(0x718C6ECF5E8CBDD4)
end

--[[
Set cam DOF and focal settings.
struct CamDofParams {
    float dofStrength;   // [0]  blur strength
    float dofNear;       // [1]  near falloff
    float dofFar;        // [2]  far  falloff
    float focalLength;   // [3]  focal length (e.g. advanced camera uses 30..90)
    float minFocal;      // [4]  min allowed focalLength
    float maxFocal;      // [5]  max allowed focalLength
    bool  flagA;         // [6]  lens/DOF enable
    bool  flagB;         // [7]  aux toggle (kept conservative)
    bool  flagC;         // [8]  aux toggle (kept conservative)
    bool  flagD;         // [9]  aux toggle (kept conservative)
};
]]
---@param cam Cam
---@param params Buffer
function SetCamDofParams(cam, params)
    Citizen.InvokeNative(0xE4B7945EF4F1BFB2, cam, params)
end