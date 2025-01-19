---
---@param train Vehicle
---@return number
function GetTrainTrackInfos(train)
    return N_0x09034479e6e3e269(train)
end

---Return wether any wheel of the vehicle is destroyed.
---@param vehicle Vehicle
---@return boolean
function AreAnyVehicleWheelsDestroyed(vehicle)
    return Citizen.InvokeNative(0x18714953CCED17D3, vehicle)
end