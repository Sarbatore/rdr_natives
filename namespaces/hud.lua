---Returns the hash of the currently highlighted item in the weapon wheel. [@aaron1a12]
---@return hash
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
---@param gamerTag number
function RemoveMpGamerTag(gamerTag)
    Citizen.InvokeNative(0x839BFD7D7E49FE09, Citizen.PointerValueIntInitialized(gamerTag));
end

---Returns the state of a specific HUD component.
---@param hudComponent integer
---@return integer
function GetHudState(hudComponent)
    return Citizen.InvokeNative(0x7EC0D68233E391AC, hudComponent, Citizen.ResultAsInteger())
end