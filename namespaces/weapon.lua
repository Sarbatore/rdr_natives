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
---@param weaponCollection integer
---@param weaponGroup Hash
---@return Hash
function GetWeaponFromDefaultPedWeaponCollection(weaponCollection, weaponGroup)
    return Citizen.InvokeNative(0x9EEFD670F10656D7, weaponCollection, weaponGroup, Citizen.ResultAsInteger())
end

---Returns the number of peds that were restrained with the weapon thrown bolas. [@outsider]
---@param ped Ped
---@return integer
function GetNumPedsRestrainedFromWeaponBolas(ped)
    return Citizen.InvokeNative(0x46D42883E873C1D7, ped, Citizen.ResultAsInteger())
end

---Returns whether the weapon has several ammo types.
---@param weaponHash Hash
---@return boolean
function GetWeaponHasMultipleAmmoTypes(weaponHash)
    return Citizen.InvokeNative(0x58425FCA3D3A2D15, weaponHash) == 1
end

---Return the attachpoint for a weapon hash. [@sarbatore]
---@param weaponHash Hash
---@return integer
function GetDefaultWeaponAttachPoint(weaponHash)
    return Citizen.InvokeNative(0x65DC4AC5B96614CB, weaponHash, Citizen.ResultAsInteger())
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
    return Citizen.InvokeNative(0x07E1C35F0078C3F9, ped, weaponHash) == 1
end

---Checks whether the given ped is currently taking damage from poisonous gas/fog volumes (e.g., toxic moonshine cloud, scripted poison fog). [@outsider]
---@param ped Ped
---@return boolean
function IsPedTakingPoisonGasDamage(ped)
    return Citizen.InvokeNative(0x0DE0944ECCB3DF5D, ped) == 1
end

---Returns true if the given ped is in a valid state to stow or retrieve weapons from their *owned* mount. [@outsider]
---@param ped Ped
---@return boolean
function CanPedAccessMountWeapons(ped)
    return Citizen.InvokeNative(0x23BF601A42F329A0, ped) == 1
end

---Sets the visual trail FX for arrows fired from a Bow by the given ped.
---@param ped Ped
---@param trailHash Hash
function SetArrowTrail(ped, trailHash)
    Citizen.InvokeNative(0x2EBF70E1D8C06683, ped, trailHash)
end

---Returns the effective lock-on or targeting range for the ped’s current weapon.
---@param ped Ped
---@return float
function GetLockonRangeCurrentWeapon(ped)
    return Citizen.InvokeNative(0x3799EFCC3C8CD5E1, ped, Citizen.ResultAsFloat())
end

---Forces the detonation or effect of a throwable ammo type owned or placed by the specified ped. [@outsider]
---@param ped Ped
---@param ammoHash Hash
function ExplodePedAmmoType(ped, ammoHash)
    Citizen.InvokeNative(0x44C8F4908F1B2622, ped, ammoHash)
end

---Returns whether the ped can keeps longarm weapons on the horse when dismounting.
---@param ped Ped
---@param p1 int
---@return boolean
function GetLongarmStoreOnDismountState(ped, p1)
    return Citizen.InvokeNative(0x5A695BD328586B44, ped, p1) == 1
end

---Sets the explosion or impact effect radius of a projectile entity (e.g., thrown dynamite or similar explosives).
---@param projectile Entity
---@param radius float
function SetProjectileEffectRadius(projectile, radius)
    Citizen.InvokeNative(0x74C9080FDD1BB48F, projectile, radius)
end

---Returns whether the ped can keeps longarm weapons on the horse when dismounting.
---@param volume Volume
---@return Entity
function GetProjectileInVolume(volume)
    return Citizen.InvokeNative(0x74C8000FDD1BB222, volume, Citizen.PointerValueInt()) 
end

---Returns the first ignited (lit/fused) explosive projectile entity found within the specified Volume.
---@param volume Volume
---@return Entity
function GetIgnitedProjectileInVolume(volume)
    return Citizen.InvokeNative(0x74C8000FDD1BB111, volume, Citizen.PointerValueInt()) 
end

---Sets the remaining fuse time (in seconds) for an ignited explosive projectile entity, such as a thrown dynamite.
---@param projectile Entity
---@param time float
function SetProjectileFuseTime(projectile, time)
    Citizen.InvokeNative(0x74C9080FDD1BB48E, projectile, time)
end

---Marks a created weapon object (e.g., a dynamite weapon object) as ignitable so it can be lit and detonate.
---@param weaponObject Entity
function RegisterWeaponObjectForIgnition(weaponObject)
    Citizen.InvokeNative(0x74C90AAACC1DD48F, weaponObject)
end

---Enables/disables reload behavior for vehicle-mounted cannons.
---@param vehicle Vehicle
---@param disableReload boolean
---@param p2 int
function SetVehicleWeaponReloadMode(vehicle, disableReload, p2)
    Citizen.InvokeNative(0x8A779706DA5CA3DD, vehicle, disableReload, p2)
end

---Returns the hash of the weapon that was replaced when a new weapon of the same slot/type is given to a ped.
---@param p0 boolean
---@return Hash
function GetWeaponReplacedHash(p0)
    return Citizen.InvokeNative(0x9F0E1892C7F228A8, p0, Citizen.ResultAsInteger())
end

---Returns the weapon hash stored in the first holster slot of the specified horse or mount.
---@param horse Ped
---@return Hash
function GetWeaponFromHorseHolster(horse)
    return Citizen.InvokeNative(0xAFFD0CCF31F469B8, horse, Citizen.ResultAsInteger())
end

---
---@param ped Ped
---@param weapon Hash
---@param slotId Hash
---@param attachPoint integer
---@param addReason Hash
---@param p4 float
---@param p5 float
---@param forceInHand boolean
---@param forceInHolster boolean
---@param p8 integer
---@return DataView.ArrayBuffer
function GiveWeaponToPedWithOptions(ped, weapon, slotId, attachPoint, addReason, p4, p5, forceInHand, forceInHolster, p8)
    local data = DataView.ArrayBuffer(32*8)
    data:SetInt32(4*8, weapon)
    data:SetInt32(5*8, slotId)
    data:SetInt32(6*8, attachPoint)
    data:SetInt32(7*8, addReason)
    data:SetFloat32(8*8, p4)
    data:SetFloat32(9*8, p5)
    data:SetInt32(11*8, forceInHand and 1 or 0)
    data:SetInt32(12*8, forceInHolster and 1 or 0)
    data:SetInt32(14*8, p8)
    local outData = DataView.ArrayBuffer(32*8)

    Citizen.InvokeNative(0xBE7E42B07FD317AC, ped, data:Buffer(), outData:Buffer())

    return outData
end

---Returns true if the ped has a sniper-type weapon equipped or stored in the specified attach point
---@param ped Ped
---@param attachPoint integer
---@return boolean
function IsPedCarryingWeaponSniperAtAttachPoint(ped, attachPoint)
    return Citizen.InvokeNative(0XD2209866B0CB72EA, ped, attachPoint) == 1
end

---Deletes all visible weapon PROP objects attached to the horse’s holsters. This ONLY removes objects, the weapons remain in inventory and are still accessible.
---@param horse Ped
function DeleteWeaponObjectsOnHorse(horse)
    Citizen.InvokeNative(0XD4C6E24D955FF061, horse)
end

---Visually attaches the specified weapon to the given horse's holster (long-gun rack), even if the player is not near the horse.
---@param horseped Ped
---@param weaponHash Hash
---@param ped Ped
function AttachWeaponToHorseHolster(horsePed, weaponHash, ped)
    Citizen.InvokeNative(0x14FF0C2545527F9B, horsePed, weaponHash, ped)
end

---Disables all special ammo types for the specified weapon on the given ped, forcing the weapon to use only its basic/regular ammunition.
---@param ped Ped
---@param weaponHash Hash
function DisableAllSpecialAmmoForPed(ped, weaponHash)
    Citizen.InvokeNative(0XD63B4BA3A02A99E0, ped, weaponHash)
end

---Enables all special ammo types for the specified weapon on the given ped.
---@param ped Ped
---@param weaponHash Hash
function EnableAllSpecialAmmoForPed(ped, weaponHash)
    Citizen.InvokeNative(0X404514D231DB27A0, ped, weaponHash)
end

---Return true if the ped can switch weapon, false otherwise
---@param ped Ped
---@return boolean
function GetCanSwitchWeapon(ped)
    return Citizen.InvokeNative(0XBC9444F2FF94A9C0, ped) == 1
end

--[[

TO DISCOVER:

]]

---
---@param p0 boolean
function N_0X457B16951AD77C1B(p0)
    Citizen.InvokeNative(0X457B16951AD77C1B, p0)
end

---
---@param ped Ped
---@param weaponGuid BinaryString
---@return integer
function N_0XA2091482ED42EF85(ped, weaponGuid)
    return Citizen.InvokeNative(0XA2091482ED42EF85, ped, weaponGuid, Citizen.ResultAsInteger())
end

---
---@param ped Ped
---@param p1 boolean
function N_0X431240A58484D5D0(ped, p1)
    Citizen.InvokeNative(0X431240A58484D5D0, ped, p1)
end

---
---@param ped Ped
---@param p1 boolean
function N_0X45E57FDD531C9477(ped, p1)
    Citizen.InvokeNative(0X45E57FDD531C9477, ped, p1)
end

---
---@param ped Ped
---@param p1 boolean
function N_0XF08D8FEB455F2C8C(ped, p1)
    Citizen.InvokeNative(0XF08D8FEB455F2C8C, ped, p1)
end

---
---@param ped Ped
---@param p1 boolean
function N_0X16D9841A85FA627E(ped, p1)
    Citizen.InvokeNative(0X16D9841A85FA627E, ped, p1)
end

---
---@param weaponHash Hash
---@param p1 integer
---@return integer
function N_0XF2F585411E748B9C(weaponHash, p1)
    return Citizen.InvokeNative(0XF2F585411E748B9C, weaponHash, p1, Citizen.ResultAsInteger())
end

---
---@param p0 integer
function N_0X63B83A526329AFBC(p0)
    Citizen.InvokeNative(0X63B83A526329AFBC, p0)
end

---
---@param p0 Any
function N_0x000FA7A4A8443AF7(p0)
    Citizen.InvokeNative(0x000FA7A4A8443AF7, p0)
end

---
---@param ped Ped
---@param p1 Any
function N_0X641351E9AD103890(ped, p1)
    Citizen.InvokeNative(0X641351E9AD103890, ped, p1)
end

---
---@param ped Ped
---@param p1 integer
---@return boolean
function N_0X486C96A0DCD2BC92(ped, p1)
    return Citizen.InvokeNative(0X486C96A0DCD2BC92, ped, p1) == 1
end

---
---@param ped Ped
---@param p1 float
---@param p2 float
function N_0XA769D753922B031B(ped, p1, p2)
    Citizen.InvokeNative(0XA769D753922B031B, ped, p1, p2)
end

---
---@param ped Ped
---@param weaponHash Hash
function N_0X183CE355115B6E75(ped, weaponHash)
    Citizen.InvokeNative(0X183CE355115B6E75, ped, weaponHash)
end

---
---@param ped Ped
---@param weaponHash Hash
---@param p2 Hash
function N_0XE9B3FEC825668291(ped, weaponHash, p2)
    Citizen.InvokeNative(0XE9B3FEC825668291, ped, weaponHash, p2)
end

---
---@param ped Ped
function N_0XC5899C4CD2E2495D(ped)
    Citizen.InvokeNative(0XC5899C4CD2E2495D, ped)
end

---
---@param vehicle Vehicle
---@param p1 boolean
function N_0X9409C62504A8F9E9(vehicle, p1)
    Citizen.InvokeNative(0X9409C62504A8F9E9, vehicle, p1)
end

---
---@param ped Ped
---@param weaponHash Hash
---@param p2 float
function N_0XD53846B9C931C181(ped, weaponHash, p2)
    Citizen.InvokeNative(0XD53846B9C931C181, ped, weaponHash, p2)
end

---
---@param ped Ped
---@param weaponHash Hash
---@param p2 integer
function N_0XA3716A77DCF17424(ped, weaponHash, p2)
    Citizen.InvokeNative(0XA3716A77DCF17424, ped, weaponHash, p2)
end

---
---@param projectile Entity
---@param p1 integer
function N_0X74C2365FDD1BB48F(projectile, p1)
    Citizen.InvokeNative(0X74C2365FDD1BB48F, projectile, p1)
end

---
---@param p0 integer
function N_0XECBB26529A737EF6(p0)
    Citizen.InvokeNative(0XECBB26529A737EF6, p0)
end

---
---@param ped Ped
---@param weaponHash Hash
---@param p2 Hash
---@return boolean
function N_0X9CCA3131E6B53C68(ped, weaponHash, p2)
    return Citizen.InvokeNative(0X9CCA3131E6B53C68, ped, weaponHash, p2) == 1
end

---
---@param ped Ped
---@param p1 integer
---@param weaponHash Hash
function N_0XB0FB9B196A3D13F0(ped, p1, weaponHash)
    Citizen.InvokeNative(0XB0FB9B196A3D13F0, ped, p1, weaponHash)
end