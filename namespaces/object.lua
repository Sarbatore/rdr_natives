---Returns true if the model hash is a portable pickup its used before creating a portable pick up for example.
---@param modelHash integer
---@return boolean
function IsModelAPortablePickup(modelHash)
    return Citizen.InvokeNative(0x20135AF9C10D2A3D, modelHash) == 1
end

---Returns the number of breakable fragments (indexed sections) defined for the specified object.
---@param object integer
---@return integer
function GetObjectFragmentCount(object)
    return Citizen.InvokeNative(0x58DE624FA7FB0E7F, object, Citizen.ResultAsInteger())
end

---Damages or breaks a specific predefined fragment/section of an object using the provided fragment index.
---@param object integer
---@param index integer
function DamageObjectFragmentByIndex(object, index)
    Citizen.InvokeNative(0xAAACF33CBF9B990A, object, index)
end

---
---@param object integer
---@param teamId integer
---@return boolean
function IsPickupPickableForTeam(object, teamId)
    return Citizen.InvokeNative(0x9F52AD67D1A91BAD, object, teamId) == 1
end

---Checks whether a specific door-related action/state flag is active for the given door object.
---Observed behavior:
---- flag 32: returns true when the door is being kicked (kick action event)
---- flag 23: returns true if the door has been previously opened by kicking (post-kick state)
---- flag 8:  returns true when attempting to open the door while it is locked
---@param doorObject integer
---@param flag integer
---@return boolean
function CheckDoorActionFlag(doorObject, flag)
    return Citizen.InvokeNative(0x0943113E02322164, doorObject, flag) == 1
end

---Returns the player who forced the specified door open using physical interaction.
---@param doorHash integer
---@return integer playerId
function GetForcedOpenPlayer(doorHash)
    return Citizen.InvokeNative(0xEBA314768FB35D58, doorHash, Citizen.ResultAsInteger())
end

---Changes the interaction behavior for a locked door.
---@param doorHash integer
---@param toggle boolean
function SetDoorKnockingWhenLocked(doorHash, toggle)
    Citizen.InvokeNative(0xA93F925F1942E434, doorHash, toggle)
end

---Checks whether the specified door has the "knocking when locked" interaction enabled.
---@param doorHash integer
---@return boolean
function GetDoorKnockingWhenLocked(doorHash)
    return Citizen.InvokeNative(0x4D8611DFE1126478, doorHash) == 1
end

---Clears the stored player ID for a door that was force-opened via physical interaction.
---@param doorHash integer
function DoorSystemClearForcedOpenPlayer(doorHash)
    Citizen.InvokeNative(0x5230BF34EB0EC645, doorHash)
end

---Checks whether a specific door action/state flag is active for the given door hash.
---@param doorHash integer
---@param flag integer
---@return boolean
function DoorSystemCheckActionFlag(doorHash, flag)
    return Citizen.InvokeNative(0x6E2AA80BB0C03728, doorHash, flag) == 1
end

---Applies an impulse to a door, causing it to swing open with animation.
---@param doorHash integer
---@param dirX number
---@param dirY number
---@param dirZ number
---@param reverseDirection boolean
function DoorSystemSwingOpen(doorHash, dirX, dirY, dirZ, reverseDirection)
    Citizen.InvokeNative(0xB3B1546D23DF8DE1, doorHash, dirX, dirY, dirZ, reverseDirection)
end

---Enables or disables the light emission of a lantern object. This native does NOT affect lanterns while they are being held by a ped.
---@param object integer
---@param toggle boolean
function SetObjectLanternLightDisabled(object, toggle)
    Citizen.InvokeNative(0x7FCD49388BC9B775, object, toggle)
end

---Enables or disables the "Kick" interaction prompt for a specific door.
---@param doorHash integer
---@param toggle boolean
function SetDoorKickPromptEnabled(doorHash, toggle)
    Citizen.InvokeNative(0xC07B91B996C1DE89, doorHash, toggle)
end

---Sets whether the specified object can be marked while Dead Eye is active.
---@param object integer
---@param toggle boolean
function SetObjectMarkableInDeadEye(object, toggle)
    Citizen.InvokeNative(0xE157A8A336C7F04A, object, toggle)
end

---
---@param object integer
---@param gxtEntryHash integer
function SetObjectPromptNameFromGxtEntry(object, gxtEntryHash)
    Citizen.InvokeNative(0xD503D6F0986D58BC, object, gxtEntryHash)
end

---@param p0 Any
---@return integer
function N_0x08C5825A2932EA7B(p0)
    return Citizen.InvokeNative(0x08C5825A2932EA7B, p0, Citizen.ResultAsInteger())
end

---@param object integer
---@return integer
function N_0x250EBB11E81A10BE(object)
    return Citizen.InvokeNative(0x250EBB11E81A10BE, object, Citizen.ResultAsInteger())
end

---@param p0 Any
---@return boolean
function N_0x2BF1953C0C21AC88(p0)
    return Citizen.InvokeNative(0x2BF1953C0C21AC88, p0) == 1
end

---@param p0 Any
---@return integer
function N_0x7D4411D6736CD295(p0)
    return Citizen.InvokeNative(0x7D4411D6736CD295, p0, Citizen.PointerValueInt())
end

---@param player integer
---@return integer
function N_0x3E2616E7EA539480(player)
    return Citizen.InvokeNative(0x3E2616E7EA539480, player, Citizen.ResultAsInteger())
end

---@param object integer
---@param p1 number
function N_0xCBFBD38F2E0A263B(object, p1)
    return Citizen.InvokeNative(0xCBFBD38F2E0A263B, object, p1)
end