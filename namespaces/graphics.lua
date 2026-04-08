---
---@param vegModifier integer
function RemoveVegModifier(vegModifier)
    Citizen.InvokeNative(0x9CF1836C03FB67A2, Citizen.PointerValueIntInitialized(vegModifier), 0)
end

---Applies a 2D fullscreen mask/overlay component to the screen. 
---@param maskName string e.g: "COMPONENT_BINOCULARS_SCOPE01"
function SetMaskOverlay(maskName)
    Citizen.InvokeNative(0x21F00E08CBB5F37B, maskName)
end

---Clears/removes the 2D fullscreen mask component currently applied to the screen.
function ResetMaskOverlay()
    Citizen.InvokeNative(0x5AC6E0FA028369DE)
end

---
---@param effectName string e.g: "ChapterTitle_IntroCh01"
---@param eventType integer e.g: 1, 2
---@param peekOnly boolean
---@return boolean hasEventTriggered
---@return boolean isRegistered
function AnimpostfxHasEventTriggered(effectName, eventType, peekOnly)
    local outData = DataView.ArrayBuffer(1*8)

    local hasEventTriggered = Citizen.InvokeNative(0xFBF161FCFEC8589E, effectName, eventType, peekOnly, outData:Buffer()) == 1
    local isRegistered      = outData:GetInt32(0) == 1

    return hasEventTriggered, isRegistered
end

---
---@param trackedPoint integer
---@return integer Returns -1 when the tracked point is invalid, 
function NumPixelsVisibleAtTrackedPoint(trackedPoint)
    return Citizen.InvokeNative(0xDFE332A5DA6FE7C9, trackedPoint, Citizen.ResultAsInteger())
end

---
---@param effectName string e.g: "ChapterTitle_IntroCh01"
function N_0xA201A3D0AC087C37(effectName) -- Animpostfx*
    Citizen.InvokeNative(0xA201A3D0AC087C37, effectName)
end

---
---@param effectName string e.g: "ChapterTitle_IntroCh01"
function N_0xB958D97A0DFAA0C2(effectName) -- Animpostfx*
    Citizen.InvokeNative(0xB958D97A0DFAA0C2, effectName)
end

---
---@param fromEffectName string e.g: "WheelHUDIn"
---@param toEffectName string e.g: "WheelHUDOut"
---@param p2 integer
---@param p3 integer
function N_0x26DD2FB0A88CC412(fromEffectName, toEffectName, p2, p3) -- Animpostfx*
    Citizen.InvokeNative(0x26DD2FB0A88CC412, fromEffectName, toEffectName, p2, p3)
end

---
function N_0x981C7D863980FA51()
    Citizen.InvokeNative(0x981C7D863980FA51)
end

---
---@param p0 integer
---@param x number
---@param y number
---@param z number
---@param scaleX number
---@param scaleY number
---@param scaleZ number
function N_0x48FE0DB54045B975(p0, x, y, z, scaleX, scaleY, scaleZ)
    Citizen.InvokeNative(0x48FE0DB54045B975, p0, x, y, z, scaleX, scaleY, scaleZ)
end

---
---@param p0 integer
---@param volume integer
---@param radius number
function N_0x735762E8D7573E42(p0, volume, radius)
    Citizen.InvokeNative(0x735762E8D7573E42, p0, volume, radius)
end

---
---@param p0 boolean
---@param p1 boolean
function N_0x9F6D859C80708B26(p0, p1)
    Citizen.InvokeNative(0x9F6D859C80708B26, p0, p1)
end

---
function N_0x1C6306E5BC25C29C() -- Disable*ThisFrame
    Citizen.InvokeNative(0x1C6306E5BC25C29C)
end