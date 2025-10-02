--- [@outsider]
---@param weapon Hash
---@return boolean
function IsWeaponCloseRange(weapon)
    return Citizen.InvokeNative(0xEA522F991E120D45, weapon) == 1
end

---Holster the holded shoulder weapon. Precisions: 0 means with anim while 1 means direct holster [@sarbatore]
---@param ped Ped
---@param disableAnim boolean
function SetPedWeaponOnBack(ped, disableAnim)
    Citizen.InvokeNative(0x4820A6939D7CEF28, ped, disableAnim)
end

---Get the weapon hash from the default ped weapon collection [@outsider]
---@param pedWeaponCollection number
---@param weaponGroupHash Hash
---@return hash
function GetWeaponHashFromPedWeapon(pedWeaponCollection, weaponGroupHash)
    return Citizen.InvokeNative(0x9EEFD670F10656D7, pedWeaponCollection, weaponGroupHash)
end

---Returns the number of peds that were restrained with the weapon thrown bolas. [@outsider]
---@param ped Ped
---@return integer
function GetNumPedsRestrainedFromWeaponBolas(ped)
    return Citizen.InvokeNative(0x46D42883E873C1D7, ped)
end

---Returns whether the weapon has several ammo types.
---@param weaponHash number
---@return boolean
function GetWeaponHasMultipleAmmoTypes(weaponHash)
    return Citizen.InvokeNative(0x58425FCA3D3A2D15, weaponHash) == 1
end

---Return the attachpoint for a weapon hash. [@sarbatore]
---@param weaponHash number
---@return integer
function GetDefaultWeaponAttachPoint(weaponHash)
    return Citizen.InvokeNative(0x65DC4AC5B96614CB, weaponHash)
end

---Return wether the ped has a rifle. [@sarbatore]
---@param ped Ped
---@param p1 number
---@return boolean
function DoesPedHaveRifle(ped, p1)
    return Citizen.InvokeNative(0x95CA12E2C68043E5, ped, p1) == 1
end

---Return wether the ped has a sniper. [@sarbatore]
---@param ped Ped
---@param p1 number
---@return boolean
function DoesPedHaveSniper(ped, p1)
    return Citizen.InvokeNative(0x80BB243789008A82, ped, p1) == 1
end

---Return wether the ped has a repeater. [@sarbatore]
---@param ped Ped
---@param p1 number
---@return boolean
function DoesPedHaveRepeater(ped, p1)
    return Citizen.InvokeNative(0x495A04CAEC263AF8, ped, p1) == 1
end

---Return wether the ped has a shotgun. [@sarbatore]
---@param ped Ped
---@param p1 number
---@return boolean
function DoesPedHaveShotgun(ped, p1)
    return Citizen.InvokeNative(0xABC18A28BAD4B46F, ped, p1) == 1
end

---Return wether the ped has a revolver. [@sarbatore]
---@param ped Ped
---@param p1 number
---@return boolean
function DoesPedHaveRevolver(ped, p1)
    return Citizen.InvokeNative(0x5B235F24472F2C3B, ped, p1) == 1
end

---Return wether the ped has a pistol. [@sarbatore]
---@param ped Ped
---@param p1 number
---@return boolean
function DoesPedHavePistol(ped, p1)
    return Citizen.InvokeNative(0xBFCA7AFABF9D7967, ped, p1) == 1
end

---Return the default ammo type for weapon
---@param weaponHash number
---@return Hash
function GetAmmoTypeForWeapon_2(weaponHash)
    return Citizen.InvokeNative(0xEC97101A8F311282, weaponHash, Citizen.ResultAsInteger())
end

---Return the amount of ammo a weapon have from its guid
---@param ped Ped
---@param guid Buffer
---@return integer
function GetAmmoInPedWeaponFromGuid(ped, guid)
    return Citizen.InvokeNative(0x4823F13A21F51964, ped, guid, Citizen.ResultAsInteger())
end

---Take weapon from horse ped?
---@param horseped Ped
---@param weaponHash hash
---@param ped Ped
function N_0x14FF0C2545527F9B(horsePed, weaponHash, ped)
    Citizen.InvokeNative(0x14FF0C2545527F9B, horsePed, weaponHash, ped)
end

---Return true when holding:
--[[
WEAPON_BOW
WEAPON_KIT_METAL_DETECTOR
WEAPON_MELEE_CLEAVER
WEAPON_MELEE_DAVY_LANTERN
WEAPON_MELEE_HATCHET
WEAPON_MELEE_HATCHET_HUNTER
WEAPON_MELEE_KNIFE_JAWBONE
WEAPON_MELEE_LANTERN
WEAPON_MELEE_TORCH
WEAPON_MOONSHINEJUG_MP
WEAPON_RIFLE_BOLTACTION
WEAPON_SHOTGUN_PUMP
WEAPON_THROWN_BOLAS
WEAPON_THROWN_MOLOTOV]]
---@param ped Ped
---@param weaponHash number
function IsPedHoldingWeapon(ped, weaponHash)
    return Citizen.InvokeNative(0x07E1C35F0078C3F9, ped, weaponHash)
end