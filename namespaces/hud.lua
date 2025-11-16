---Returns the hash of the currently highlighted item in the weapon wheel. [@aaron1a12]
---@return Hash
function GetWeaponWheelHighlightedWeaponHash()
    return Citizen.InvokeNative(0x9C409BBC492CB5B1, Citizen.ResultAsInteger())
end

---Returns true if the mash prompt have just been pressed [@Sarbatore]
---@param prompt Prompt
---@return boolean
function UiPromptHasMashModeJustPressed(prompt)
    return Citizen.InvokeNative(0xB0E8599243B3F568, prompt) == 1
end

---
---@param gamerTag integer
function RemoveMpGamerTag(gamerTag)
    Citizen.InvokeNative(0x839BFD7D7E49FE09, Citizen.PointerValueIntInitialized(gamerTag))
end

---Returns the state of a specific HUD component.
---@param hudComponent integer
---@return integer
function GetHudState(hudComponent)
    return Citizen.InvokeNative(0x7EC0D68233E391AC, hudComponent, Citizen.ResultAsInteger())
end

---
---@param p0 integer
---@param weaponHash Hash
---@param p2 Hash
function N_0X8A59D44189AF2BC5(p0, weaponHash, p2)
    local data = DataView.ArrayBuffer(2*8)
    data:SetInt32(0*8, p0)
    data:SetInt32(1*8, weaponHash)
    Citizen.InvokeNative(0x8A59D44189AF2BC5, data:Buffer(), p2)
end

---
---@param checkpoint integer
---@param p1 integer
---@param x float
---@param y float
---@param z float
function N_0XCC3B787E73E64160(checkpoint, p1, x, y, z)
    Citizen.InvokeNative(0XCC3B787E73E64160, checkpoint, p1, x, y, z)
end