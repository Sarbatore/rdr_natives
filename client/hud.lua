---Returns the hash of the currently highlighted item in the weapon wheel. [@aaron1a12]
---@return hash
function GetWeaponWheelHighlightedWeaponHash()
    return Citizen.InvokeNative(0x9C409BBC492CB5B1)
end