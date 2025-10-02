---Returns the active transition state of a cover point for about 2 seconds unless its peeking transition state
---@param ped Ped
---@return integer
function GetPedCoverPointTransitionState(ped)
    return Citizen.InvokeNative(0x957D7E750216D74B, ped, Citizen.ResultAsInteger())
end

---Load the weapon for the ped related to cover anims when its needed, -1 seems to be used to clean it from the ped, many times is used before requesting a new one.
---@param ped Ped
---@param weaponHash Hash
function RequestWeaponCoverAnimForPed(ped, weaponHash)
    Citizen.InvokeNative(0x140B3CB1D424A945, ped, weaponHash)
end

---Returns the ped that is using this cover point created by ADD_COVER_POINT and adding the ped using tasks like TASK_PUT_PED_DIRECTLY_(*)
---@param coverPoint integer
---@return Ped
function GetPedFromCoverPoint(coverPoint)
    return Citizen.InvokeNative(0x53E4D0C079CA6855, coverPoint, Citizen.ResultAsInteger())
end

---Activates a cover layer, these seem to be for specifc scenes in SP for example where a table is flipped using "grand_korr_poker_table_flipped" see more in levels\rdr3\coverlayers.rpf
---@param coverLayer char*
function ActivateCoverLayer(coverLayer)
    Citizen.InvokeNative(0x64340DC208D671D5, coverLayer)
end


---Deactivates a cover layer loaded with 0x64340DC208D671D5
---@param coverLayer char*
function DeactivateCoverLayer(coverLayer)
    Citizen.InvokeNative(0x7A1FDCF35EAA140F, coverLayer)
end
