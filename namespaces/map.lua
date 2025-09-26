--- Will add a blip icon to the entity lockon prompt. [@outsider]
function SetBlipIconLockonEntityPrompt(entity, blipHash) 
    Citizen.InvokeNative(0x7563CBCA99253D1A, entity, blipHash)
end

--- Will remove the blip icon from the entity lockon prompt. [@outsider]
function ClearExistingBlipFromLockonEntityPrompt(entity, blipId)
    Citizen.InvokeNative(0x44813684F72B563C, entity, blipId)
end

--- Will add a blip icon to the entity lockon prompt, if wrong param will remove the icon if had any. [@outsider]
function SetExistingBlipLockonEntityPrompt(entity, blipId)
    Citizen.InvokeNative(0x97F6F158CC5B5CA2, entity, blipId)
end

---Free up memory from the blip. [@sarbatore]
function ClearBlip(blip)
    Citizen.InvokeNative(0x01B928CA2E198B01, blip)
end

---Return whether a GPS marker is set. [@sarbatore]
---@return boolean
function IsGPSActive()
    return Citizen.InvokeNative(0xF47A1EB2A538A3A3)
end

---Check if the entity lockon prompt contains an icon. [@outsider]
---@param entity Entity
---@param blipId number
---@return boolean
function IsBlipIconOnLockonEntityPrompt(entity, blipId)
    return Citizen.InvokeNative(0x3CB8859F04763C78, entity, blipId)
end

---Remove the icon from the entity lockon prompt. [@outsider]
---@param entity Entity
---@param integer number
function RemoveBlipIconFromEntityLockonPrompt(entity, integer)
    Citizen.InvokeNative(0xBB68D4D3CA3DE402, entity, integer)
end

---Activates a blip icon prompt for a specific entity, allowing it to be displayed without requiring a lock-on. This function enables the blip to appear associated with the given entity, making it visible without the need to focus or target the entity directly. [@kadir]
---@param entity Entity
function SetActiveBlipIconEntityPromptWithoutLockon(entity)
    Citizen.InvokeNative(0x1726963E6049DB53, entity)
end

---Clears the previously set coordinates for the pause map view, removing any specified focal point and radius that were set using `SetPausemapCoordsWithRadius`. This function resets the map view, allowing it to open with the default coordinates and view instead of a specific target area. [@kadir]
function ClearPausemapCoords()
    Citizen.InvokeNative(0x7C9F4CDF402CA82A)
end

---Returns the x and y coordinates of the waypoint. [@kadir]
---@return number, number
function GetWaypointPosition()
    local x, y = Citizen.InvokeNative(0xF08E42BFA46BDFF8, Citizen.PointerValueFloat(), Citizen.PointerValueFloat())
    return x, y
end

---Checks if the GPS route to the waypoint is navigable along a road. If a route exists but there is no valid road path, this function returns false. [@kadir]
---@return boolean
function IsGPSRouteOnRoad()
    return Citizen.InvokeNative(0xF47A1EB2A538A3A3)
end