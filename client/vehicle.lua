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

---Determines whether the train whistle can be used. True if so, False to make it unusable.
---@param train number
---@param enable bool
function SetTrainWhistleEnabled(train, enable)
    Citizen.InvokeNative(0x1BFBAFCC6760FF02, train, enable)
end