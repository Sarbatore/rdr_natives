
--- [@outsider]
---@param weapon hash
---@return boolean
function IsWeaponCloseRange(weapon)
    return Citizen.InvokeNative(0xEA522F991E120D45, weapon)
end