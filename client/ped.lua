---Returns whether a ped has been shot by a player recently. [@outsider]
---@param player number
---@param ped number
---@param duration number
---@return boolean
function HasPedBeenShotByPlayerRecently(player, ped, duration)
    return Citizen.InvokeNative(0x9C81338B2E62CE0A, player, ped, duration)
end

---Apply a damagePack to a ped bone index. [@sarbatore]
---@param ped number
---@param boneIndex number
---@param x number
---@param y number
---@param z number
---@param xRot number
---@param yRot number
---@param zRot number
---@param damagePack string
function ApplyPedDamagePackToBone(ped, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, damagePack)
    Citizen.InvokeNative(0x58D32261AE0F0843, ped, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, damagePack)
end

---Set ped cold from 0.0 to 1.0. [@sarbatore]
---@param ped number
---@param intensity number
---@param p2 number
function ApplyColdToPed(ped, intensity, p2)
    Citizen.InvokeNative(0x1F8215D0E446F593, ped, intensity, p2)
end

---Returns the number of reserved stamina. [@outsider]
---@param ped number
---@return number
function GetNumReservedStamina(ped)
    return Citizen.InvokeNative(0xFC3B580C4380B5B7, ped)
end

---Return wether a ped has interacted with a player recently. [@sarbatore]
---@param ped number
---@param player number
---@param interactionFlag number
---@param duration number
---@return boolean
function HasPedInteractedWithPlayerRecently(ped, player, interactionFlag, duration)
    return Citizen.InvokeNative(0x947E43F544B6AB34, ped, player, interactionFlag, duration)
end

---Returns whether a ped is afloat in water like swimming or in a boat (driving or standing on it). [@outsider]
---@param ped number
---@return boolean
function IsPedAfloat(ped)
    return Citizen.InvokeNative(0xDC88D06719070C39, ped) -- N_0xdc88d06719070c39
end

---Only works when you use SET_PED_WETNESS_HEIGHT first , if you do 0.0 or it dries naturally
---@param ped number
---@param amount number
function SetPedWetness(ped, amount)
    Citizen.InvokeNative(0xF9CFF5BB70E8A2CB, ped, amount)
end

--[[
########################################################################################################################################
#                                                                                                                                      #
#                                                           UNKOWN NATIVES                                                             #
#                                                                                                                                      #
########################################################################################################################################
]]

---
---@param ped number
---@param hash number
function N_0x1E017404784AA6A3(ped, hash)
    Citizen.InvokeNative(0x1E017404784AA6A3, ped, hash)
end

---
---@param ped number
---@param hash number
function N_0x7C8AA850617651D9(ped, hash)
    Citizen.InvokeNative(0x7C8AA850617651D9, ped, hash)
end

---
---@param componentHash number
---@param hash number
---@param metaPedType number
---@param isMp boolean
function N_0x31B2E7F2E3C58B89(componentHash, hash, metaPedType, isMp)
    return Citizen.InvokeNative(0x31B2E7F2E3C58B89, componentHash, hash, metaPedType, isMp)
end
-- Example usage: N_0x31B2E7F2E3C58B89(`clothing_legendary_east_outfit`, joaat("base"), GetMetaPedType(playerPed), true)

---
---@param ped number
---@param p1 number
---@param duration number
---@return boolean
function N_0xF7327ACC7A89AEF1(ped, p1, duration)
    return Citizen.InvokeNative(0xF7327ACC7A89AEF1, ped, p1, duration)
end

---
---@param ped number
---@param p1 number
---@param duration number
---@return boolean
function N_0x5203038FF8BAE577(ped, p1, duration)
    return Citizen.InvokeNative(0x5203038FF8BAE577, ped, p1, duration)
end

---
---@param ped number
---@param p1 number
---@param duration number
---@return boolean
function N_0xC3995D396F1D97B6(ped, p1, duration)
    return Citizen.InvokeNative(0xC3995D396F1D97B6, ped, p1, duration)
end

---
---@param ped number
---@param p1 number
---@return boolean
function N_0x32417CB860A3BDC4(ped, p1)
    return Citizen.InvokeNative(0x32417CB860A3BDC4, ped, p1)
end

---
---@param ped number
---@param p1 number
---@return boolean
function N_0x7F090958AE95B61B(ped, p1)
    return Citizen.InvokeNative(0x7F090958AE95B61B, ped, p1)
end

---
---@param ped number
---@return number
function N_0x900CA00CE703E1E2(ped)
    return Citizen.InvokeNative(0x900CA00CE703E1E2, ped)
end

---
---@param ped number
---@param p1 number
function N_0xC494C76A34266E82(ped, p1)
    Citizen.InvokeNative(0xC494C76A34266E82, ped, p1)
end

---
---@param ped number
---@param p1 bool
function N_0xFEA6126C34DF2532(ped, p1)
    Citizen.InvokeNative(0xFEA6126C34DF2532, ped, p1)
end

---
---@param ped number
---@param p1 bool
function N_0xA2116C1E4ED85C24(ped, p1)
    Citizen.InvokeNative(0xA2116C1E4ED85C24, ped, p1)
end

---
---@param ped number
---@param p1 number
function N_0xD8544F6260F5F01E(ped, p1)
    Citizen.InvokeNative(0xD8544F6260F5F01E, ped, p1)
end

---
---@param ped number
function N_0x758F081DB204DDDE(ped)
    Citizen.InvokeNative(0x758F081DB204DDDE, ped)
end

---Returns retval and entity.
---@param ped number
---@param p1 number
---@param p2 number
---@param p3 number
---@return boolean, number
function N_0x4642182A298187D0(ped, p1, p2, p3)
    return Citizen.InvokeNative(0x4642182A298187D0, ped, p1, p2, p3) -- N_0x4642182a298187d0
end

---Returns retval and number.
---@param modelHash number
---@param p1 number
---@param p2 number
---@return boolean, number
function N_0xB29C553BA582D09E(modelHash, p1, p2)
    return Citizen.InvokeNative(0xB29C553BA582D09E, modelHash, p1, p2) -- N_0xb29c553ba582d09e
end

---
---@param ped number
---@param p1 boolean
function N_0xAAB86462966168CE(ped, p1)
    Citizen.InvokeNative(0xAAB86462966168CE, ped, p1)
end

---Set something weird with dirt.
---@param ped number
---@param p1 number
---@param p2 number
---@param p3 boolean
---@param p4 boolean
function N_0xD049920CD29F6CC8(ped, p1, p2, p3, p4)
    Citizen.InvokeNative(0xD049920CD29F6CC8, ped, p1, p2, p3, p4)
end

---
---@param ped number
---@param p1 boolean
function N_0xBB3E5370EBB6BE28(ped, p1)
    Citizen.InvokeNative(0xBB3E5370EBB6BE28, ped, p1)
end

---
---@param ped number
---@param ped2 number
function N_0xAAC0EE3B4999ABB5(ped, ped2)
    Citizen.InvokeNative(0xAAC0EE3B4999ABB5, ped, ped2)
end

---
---@param ped number
---@param p1 number
function N_0x46BF2A810679D6E6(ped, p1)
    return Citizen.InvokeNative(0x46BF2A810679D6E6, ped, p1)
end

---
---@param ped number
---@param p1 boolean
function N_0xC6136B40FFFB778(ped, p1)
    Citizen.InvokeNative(0xC6136B40FFFB778, ped, p1)
end

---
---@param ped number
---@param p1 boolean
function N_0xA967D6A8ED2D713B(ped, p1)
    Citizen.InvokeNative(0xA967D6A8ED2D713B, ped, p1)
end

---
---@param ped number
---@param p1 boolean
---@param p2 boolean
---@param p3 boolean
function N_0xAF041C10756C30FB(ped, p1, p2, p3)
    Citizen.InvokeNative(0xAF041C10756C30FB, ped, p1, p2, p3)
end

---
---@param ped number
---@param p1 boolean
---@param p2 number
function N_0x49DADFC4CD808B0A(ped, p1, p2)
    Citizen.InvokeNative(0x49DADFC4CD808B0A, ped, p1, p2)
end

---@param ped number
---@param player number
---@param duration number
function N_0xE737D5F14304A2EC(ped, player, duration)
    Citizen.InvokeNative(0xE737D5F14304A2EC, ped, player, duration)
end

---
---@param ped number
---@param hash1 number
---@param hash2 number
---@param p3 number
---@param p4 number
---@param p5 number
---@return boolean
function N_0xCB86D3E3E3708901(ped, hash1, hash2, p3, p4, p5)
    return Citizen.InvokeNative(0xCB86D3E3E3708901, ped, hash1, hash2, p3, p4, p5)
end

-- Example usage: Citizen.InvokeNative(0xCB86D3E3E3708901, `Arthur`, `COMP_ABICNV8`, 1, 1, 0)