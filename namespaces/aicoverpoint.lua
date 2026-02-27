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

---
---@param ped integer
---@param p1 integer range 0-3
---@param x number
---@param y number
---@param z number
function TaskExitCover(ped, p1, x, y, z)
    local data = DataView.ArrayBuffer(8*8)
    data:SetInt32(0*8, ped or 0)
    data:SetInt32(1*8, p1 or 0)
    data:SetFloat32(2*8, x or 0.0)
    data:SetFloat32(3*8, y or 0.0)
    data:SetFloat32(4*8, z or 0.0)
    Citizen.InvokeNative(0x2BC4A6D92D140112, data:Buffer())
end

---
---@param ped integer
---@param coverPoint integer
---@param x number
---@param y number
---@param z number
function TaskEnterCover(ped, coverPoint, x, y, z)
    local data = DataView.ArrayBuffer(24*8)
    data:SetInt32(0*8, ped or 0)
    data:SetInt32(3*8, coverPoint or 0)
    data:SetInt32(4*8, 0) -- 0, 1, 2
    data:SetInt32(5*8, -1) -- flags or duration
    data:SetInt32(6*8, 0) -- 0 or 1
    data:SetInt32(7*8, 0) -- 0 or 1
    data:SetInt32(8*8, 0)
    data:SetFloat32(9*8, 0.5)
    data:SetFloat32(10*8, 2.0)
    data:SetFloat32(11*8, 0.0)
    data:SetFloat32(12*8, 0.0)
    data:SetFloat32(13*8, 0.0)
    data:SetFloat32(14*8, x or 0.0) -- x
    data:SetFloat32(15*8, y or 0.0) -- y
    data:SetFloat32(16*8, z or 0.0) -- z
    data:SetInt32(17*8, 0)
    data:SetInt32(18*8, 0) -- 0 or 1
    data:SetInt32(20*8, 0)
    Citizen.InvokeNative(0x4972A022AE6DAFA1, data:Buffer())
end