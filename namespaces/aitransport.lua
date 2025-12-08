---
---@param ped Ped
---@param vehicle Vehicle
---@param seatIndex eVehicleSeat
---@param timer integer
---@param pedSpeed float
---@param flags integer
function TaskEnterTransport(ped, vehicle, seatIndex, timer, pedSpeed, flags)
    local data = DataView.ArrayBuffer(9*8)
    data:SetInt32(3*8, ped)
    data:SetInt32(4*8, vehicle)
    data:SetInt32(5*8, seatIndex)
    data:SetInt32(6*8, timer)
    data:SetFloat32(7*8, pedSpeed)
    data:SetInt32(8*8, flags)
    Citizen.InvokeNative(0xAEE3ADD08829CB6F, data:Buffer())
end

---
---@param ped Ped
---@param vehicle Vehicle
---@param pedSpeed float
---@param flags integer
function TaskExitTransport(ped, vehicle, pedSpeed, flags)
    local data = DataView.ArrayBuffer(7*8)
    data:SetInt32(3*8, ped)
    data:SetInt32(4*8, vehicle)
    data:SetFloat32(5*8, pedSpeed)
    data:SetInt32(6*8, flags)
    Citizen.InvokeNative(0xC273A5B8488F7838, data:Buffer())
end