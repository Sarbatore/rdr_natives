--- [@outsider]
---@param weapon hash
---@return boolean
function IsWeaponCloseRange(weapon)
    return Citizen.InvokeNative(0xEA522F991E120D45, weapon)
end

---Holster the holded shoulder weapon. Precisions: 0 means with anim while 1 means direct holster [@sarbatore]
---@param ped number
---@param disableAnim number
function SetPedWeaponOnBack(ped, disableAnim)
    Citizen.InvokeNative(0x4820A6939D7CEF28, ped, disableAnim)
end

---Get the weapon hash from the default ped weapon collection [@outsider]
---@param pedWeaponCollection number
---@param weaponGroupHash number
---@return hash
function GetWeaponHashFromPedWeapon(pedWeaponCollection, weaponGroupHash)
    return Citizen.InvokeNative(0x9EEFD670F10656D7, pedWeaponCollection, weaponGroupHash)
end