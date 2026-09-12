---
---@param ped integer
---@param vehicle integer
---@param seatIndex eVehicleSeat
---@param timer integer
---@param pedSpeed number
---@param flags integer
function TaskEnterTransport(ped, vehicle, seatIndex, timer, pedSpeed, flags)
    local paramsStruct = DataView.ArrayBuffer(9*8)
        :SetInt32(3*8, ped)
        :SetInt32(4*8, vehicle)
        :SetInt32(5*8, seatIndex)
        :SetInt32(6*8, timer)
        :SetFloat32(7*8, pedSpeed)
        :SetInt32(8*8, flags)
    Citizen.InvokeNative(0xAEE3ADD08829CB6F, paramsStruct:Buffer())
end

---
---@param ped integer
---@param vehicle integer
---@param pedSpeed number
---@param flags integer
function TaskExitTransport(ped, vehicle, pedSpeed, flags)
    local paramsStruct = DataView.ArrayBuffer(7*8)
        :SetInt32(3*8, ped)
        :SetInt32(4*8, vehicle)
        :SetFloat32(5*8, pedSpeed)
        :SetInt32(6*8, flags)
    Citizen.InvokeNative(0xC273A5B8488F7838, paramsStruct:Buffer())
end