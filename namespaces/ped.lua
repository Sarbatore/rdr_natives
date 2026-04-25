---Returns whether a ped has been shot by a player recently.
---@param player integer
---@param ped integer
---@param duration integer
---@return boolean
function HasPedBeenShotByPlayerRecently(player, ped, duration)
    return Citizen.InvokeNative(0x9C81338B2E62CE0A, player, ped, duration) == 1
end

---Apply a damagePack to a ped bone index.
---@param ped integer
---@param boneIndex integer
---@param xOffset number
---@param yOffset number
---@param zOffset number
---@param xRot number
---@param yRot number
---@param zRot number
---@param damagePack string
function ApplyPedDamagePackToBone(ped, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, damagePack)
    Citizen.InvokeNative(0x58D32261AE0F0843, ped, boneIndex, xOffset, yOffset, zOffset, xRot, yRot, zRot, damagePack)
end

---Set ped cold from 0.0 to 1.0.
---@param ped integer
---@param intensity number
---@param p2 number
function ApplyColdToPed(ped, intensity, p2)
    Citizen.InvokeNative(0x1F8215D0E446F593, ped, intensity, p2)
end

---Returns the number of reserved stamina.
---@param ped integer
---@return integer
function GetNumReservedStamina(ped)
    return Citizen.InvokeNative(0xFC3B580C4380B5B7, ped, Citizen.ResultAsInteger())
end

---Return wether a ped has interacted with a player recently.
---@param ped integer
---@param player integer
---@param flag integer
---@param duration integer
---@return boolean
function HasPedInteractedWithPlayerRecently(ped, player, flag, duration)
    return Citizen.InvokeNative(0x947E43F544B6AB34, ped, player, flag, duration) == 1
end

---Returns whether a ped is afloat in water like swimming or in a boat (driving or standing on it).
---@param ped integer
---@return boolean
function IsPedAfloat(ped)
    return Citizen.InvokeNative(0xDC88D06719070C39, ped) == 1
end

---Only works when you use SET_PED_WETNESS_HEIGHT first , if you do 0.0 or it dries naturally
---@param ped integer
---@param amount number
function SetPedWetness(ped, amount)
    Citizen.InvokeNative(0xF9CFF5BB70E8A2CB, ped, amount)
end

---Requests the carrying state of a ped, unk3 is usually 4.
---@param ped integer
---@param carryingType integer 4: CARRYING_FROM_GROUND, 5: CARRYING_FROM_MOUNT, 6: PUTTING_DOWN_GROUND, 7: PUTTING_DOWN_MOUNT
---@param unk3 integer
---@param filter integer 0: ENTITY_ONLY, 1: NOTHING, 2: ENTITY_AND_TAKEN_FROM_ENTITY
---@return integer carryingState 0: INVALID, 1: STARTING, 2: PROGRESSING, 3: FINISHING
---@return integer carriedEntity
---@return integer takenFromEntity
function RequestCarryingStateForPed(ped, carryingType, unk3, filter)
    local outData = DataView.ArrayBuffer(2*8)
    
    local carryingState = Citizen.InvokeNative(0x4642182A298187D0, ped, carryingType, outData:Buffer(), unk3, filter, Citizen.ResultAsInteger())
    local carriedEntity = outData:GetInt32(0*8)
    local takenFromEntity = outData:GetInt32(1*8)

    return carryingState, carriedEntity, takenFromEntity
end

---Return the number of loot items for a ped carcass of given model, damage cleanliness and skinning quality. The first index of the buffer is required, it's the max size of loot (always 15 in R* scripts) outLoot is an array of loot hash, its size is returned by the native (it starts at the index 1)..
---@param modelHash integer
---@param damageCleanliness integer
---@param skinningQuality integer
---@param size integer
---@return table lootsHash
function ComputeLootForPedCarcass(modelHash, damageCleanliness, skinningQuality, size)
    local outData = DataView.ArrayBuffer((size+1)*8)
    outData:SetInt32(0*8, size)
    
    local numLoots  = Citizen.InvokeNative(0xB29C553BA582D09E, outData:Buffer(), modelHash, damageCleanliness, skinningQuality, Citizen.ResultAsInteger())
    local lootsHash = {}
    for i = 1, numLoots do
        table.insert(lootsHash, outData:GetInt32(i*8))
    end

    return lootsHash
end

---Return wheter a ped is heard by a target ped. Usually flag is set to false when the ped is in stealth mode.
---@param targetPed integer
---@param ped integer
---@param flag boolean
---@return boolean
function CanPedHearTargetPed(targetPed, ped, flag)
    return Citizen.InvokeNative(0x0EA9EACBA3B01601, targetPed, ped, flag) == 1
end

---Plays a conditional locomotion animation with an attached prop item.
---@param ped integer
---@param targetEntity integer
---@param propItemId string
---@param conditionalAnimName string
function PlayConditionalAnimWithPropItem(ped, targetEntity, propItemId, conditionalAnimName)
    Citizen.InvokeNative(0xCE7A6C1D5CDE1F9D, ped, targetEntity, propItemId, conditionalAnimName)
end

---Stops and clears a running conditional locomotion animation previously started by PlayConditionalAnimWithPropItem.
---@param ped integer
---@param propItemId string
function RemovePedPropItemConditionalAnim(ped, propItemId)
    Citizen.InvokeNative(0x3A50753042B6891B, ped, propItemId)
end

---Returns the carried ped for the specified ped.
---@param ped integer
---@param p1 integer
---@param p2 boolean
---@return integer carriedPed
function RefreshCarriedPedForPed(ped, p1, p2)
    return Citizen.InvokeNative(0x6B67320E0D57856A, ped, Citizen.PointerValueInt(), p1, p2)
end

---Return the ped move blend ratio corresponding to the specified speed.
---@param ped integer
---@param speed number
---@return number
function ComputeSpeedForPedMoveBlendRatio(ped, speed)
    return Citizen.InvokeNative(0xCA95924C893A0C91, ped, speed, Citizen.ResultAsFloat())
end

---Return an estimated max speed (m/s) for the ped move blend ratio. Move blend ratio is in a range of 0.0-3.0
---@param ped integer
---@param moveBlendRatio number
---@return number
function ComputePedMoveBlendRatioForMaxSpeed(ped, moveBlendRatio)
    return Citizen.InvokeNative(0x46BF2A810679D6E6, ped, moveBlendRatio, Citizen.ResultAsFloat())
end

---Returns the ped dirt level
---@param ped integer
---@param p1 integer
---@return number
function GetPedDirtLevel(ped, p1)
    return Citizen.InvokeNative(0x0105FEE8F9091255, ped, p1, Citizen.ResultAsFloat())
end

---Returns information about the carried attached entity for the specified carriable slot.
---@param ped integer
---@param carriableSlot integer
---@return boolean success
---@return integer modelHash
---@return integer carryConfigHash
---@return integer entity
function GetCarriedAttachedInfoForSlot(ped, carriableSlot)
    local outData = DataView.ArrayBuffer(4*8)

    local success         = Citizen.InvokeNative(0x608BC6A6AACD5036, outData:Buffer(), ped, carriableSlot, 0) == 1
    local modelHash       = outData:GetInt32(0*8)
    local carryConfigHash = outData:GetInt32(1*8)
    local entity          = outData:GetInt32(3*8)

    return success, modelHash, carryConfigHash, entity
end

---
---@param ped integer
---@param size integer
---@return boolean, table
function GetPedNearbyVehicles(ped, size)
    local outData = DataView.ArrayBuffer(16*8)
    outData:SetInt32(0*8, size or 3)

    local res = Citizen.InvokeNative(0xCFF869CBFA210D82, ped, outData:Buffer()) == 1
    local numVehicles = outData:GetInt32(0*8)
    local vehicles = {}
    if (numVehicles > 0) then
        for i = 1, numVehicles do
            table.insert(vehicles, outData:GetInt32(i*8))
        end
    end

    return res, vehicles
end


---
---@param ped integer
---@param size integer
---@param ignoredPedType integer
---@param p3 integer
---@return boolean, table
function GetPedNearbyPeds(ped, size, ignoredPedType, p3)
    local outData = DataView.ArrayBuffer(16*8)
    outData:SetInt32(0*8, size or 20)

    local res = Citizen.InvokeNative(0x23F8F5FC7E8C4A6B, ped, outData:Buffer(), ignoredPedType, p3) == 1
    local numPeds = outData:GetInt32(0*8)
    local peds = {}
    if (numPeds > 0) then
        for i = 1, numPeds do
            table.insert(peds, outData:GetInt32(i*8))
        end
    end

    return res, peds
end

---Hides the visible reins/lead straps associated with the specified ped. When the ped is a horse, this makes the hanging rein geometry disappear.
---@param ped integer
function HidePedReins(ped)
    Citizen.InvokeNative(0xCAC43D060099EA72, ped)
end

---Checks whether the specified ped has performed a door knocking interaction.
---@param ped integer
---@return boolean
function HasPedKnockedOnDoor(ped)
    return Citizen.InvokeNative(0xFA8C10DCE0706D43, ped) == 1
end

---Sets a predefined variation preset for the ped's appearance.
---@param ped integer
---@param presetIndex integer
function SetPresetForPed(ped, presetIndex)
    Citizen.InvokeNative(0xFFA1594703ED27CA, ped, presetIndex)
end

---Modifies the size/scale of the collision capsule (hitbox) for a specific ped bone.
---@param ped integer
---@param boneId integer
---@param scaleX number
---@param scaleY number
---@param scaleZ number
function SetPedRagdollBoneScale(ped, boneId, scaleX, scaleY, scaleZ)
    Citizen.InvokeNative(0xC17A94CC8FC3C61A, ped, boneId, scaleX, scaleY, scaleZ)
end

---Queues a specific melee action, grapple move, or execution for the ped's next attack.
---@param ped integer
---@param actionRequestHash integer e.g: AR_GRAPPLE_EXECUTION, etc...
function SetPedMeleeAction(ped, actionRequestHash)
    Citizen.InvokeNative(0xC48AF420371C7407, ped, actionRequestHash)
end

---Sets the RGB color for a specific volumetric VFX/Particle node attached to a ped's outfit or component.
---@param ped integer
---@param vfxNodeHash integer e.g: -929362906
---@param r number Normalized float: 0.0 - 1.0
---@param g number Normalized float: 0.0 - 1.0
---@param b number Normalized float: 0.0 - 1.0
function SetPedLocalVfxColor(ped, vfxNodeHash, r, g, b)
    Citizen.InvokeNative(0xDD9540E7B1C9714F, ped, vfxNodeHash, r, g, b)
end

---Returns the ped seeing range.
---@param ped integer
---@return number
function GetPedSeeingRange(ped)
    return Citizen.InvokeNative(0x2BA9D7BF629F920C, ped, Citizen.ResultAsFloat())
end

---Returns the ped hearing range.
---@param ped integer
---@return number
function GetPedHearingRange(ped)
    return Citizen.InvokeNative(0x900CA00CE703E1E2, ped, Citizen.ResultAsFloat())
end

---Returns the ped race.
---@param ped integer
---@return integer raceHash CAUCASIAN
function GetMetaPedRace(ped)
    return Citizen.InvokeNative(0xB292203008EBBAAC, ped, Citizen.ResultAsInteger())
end

---
---@param perscharHash integer
---@param p1 integer
---@return integer ped
function GetPedIndexFromPerscharHash(perscharHash, p1)
    return Citizen.InvokeNative(0xE76687023D8C8505, perscharHash, p1, Citizen.ResultAsInteger())
end

---
---@param ped integer
---@param eventHash integer
---@return vector3
function GetPositionOfPedRecentEvent(ped, eventHash)
    return Citizen.InvokeNative(0xCB8F4C9343EBE240, ped, eventHash, Citizen.PointerValueVector())
end

---
---@param ped integer
---@param eventHash integer
---@return integer instigatorEntity
function GetPedInstigatorOfRecentEvent(ped, eventHash)
    return Citizen.InvokeNative(0x5E9FAF6C513347B4, ped, eventHash, Citizen.ResultAsInteger())
end

---Find peds.
---@param ped integer
---@param p1 integer
---@param coords vector3
---@param radius number
---@param itemset integer
---@return integer
function N_0x3ACCE14DFA6BA8C2(...)
    return Citizen.InvokeNative(0x3ACCE14DFA6BA8C2, ..., Citizen.ResultAsInteger())
end

---
---@param ped integer
---@param eventHash integer
---@return integer
function N_0x326F7951EF0D7F75(ped, eventHash)
    return Citizen.InvokeNative(0x326F7951EF0D7F75, ped, eventHash, Citizen.ResultAsInteger())
end

---
---@param ped integer
---@return boolean
function N_0x7EE3A8660F38797E(ped)
    return Citizen.InvokeNative(0x7EE3A8660F38797E, ped) == 1
end

---
---@param ped integer
---@return boolean
function N_0x758F081DB204DDDE(ped)
    return Citizen.InvokeNative(0x758F081DB204DDDE, ped) == 1
end

---
---@param ped integer
---@param p1 integer
---@return integer
function N_0xE76687023D8C8505(ped, p1)
    return Citizen.InvokeNative(0xE76687023D8C8505, ped, p1, Citizen.ResultAsInteger())
end

---
---@param ped integer
---@return boolean
function N_0x12EB4E31F092C9B3(ped)
    return Citizen.InvokeNative(0x12EB4E31F092C9B3, ped) == 1
end

---
---@param ped integer
---@return integer
function N_0xA31D350D66FA1855(ped)
    return Citizen.InvokeNative(0xA31D350D66FA1855, ped, Citizen.ResultAsInteger())
end

---
---@param ped integer
---@return number
function N_0x900CA00CE703E1E2(ped)
    return Citizen.InvokeNative(0x900CA00CE703E1E2, ped, Citizen.ResultAsFloat())
end

---
---@param ped integer
---@return number
function N_0x2BA9D7BF629F920C(ped)
    return Citizen.InvokeNative(0x2BA9D7BF629F920C, ped, Citizen.ResultAsFloat())
end

---
---@param ped integer
---@return integer ped
function N_0x4B19F171450E0D4F(ped)
    return Citizen.InvokeNative(0x4B19F171450E0D4F, ped, Citizen.ResultAsInteger())
end

---
---@param ped integer
---@return boolean
function N_0x88A5564B19C15391(ped)
    return Citizen.InvokeNative(0x88A5564B19C15391, ped) == 1
end

---
---@param ped1 integer
---@param ped2 integer
function N_0x34EDDD59364AD74A(ped1, ped2)
    local data = DataView.ArrayBuffer(1*8)
    data:SetInt32(0*8, ped2)
    Citizen.InvokeNative(0x34EDDD59364AD74A, ped1, data:Buffer())
end