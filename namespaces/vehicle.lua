---
---@param train Vehicle
---@return number
function GetTrainTrackInfos(trainVehicle)
    return N_0x09034479e6e3e269(trainVehicle)
end

---Return wether any wheel of the vehicle is destroyed.
---@param vehicle Vehicle
---@return boolean
function AreAnyVehicleWheelsDestroyed(vehicle)
    return Citizen.InvokeNative(0x18714953CCED17D3, vehicle)
end

---Determines whether the train whistle can be used. True if so, False to make it unusable.
---@param train Vehicle
---@param enable boolean
function SetTrainWhistleEnabled(trainVehicle, enable)
    Citizen.InvokeNative(0x1BFBAFCC6760FF02, trainVehicle, enable)
end

---
---@param train Vehicle
function DeleteMissionTrain(trainVehicle)
    Citizen.InvokeNative(0x0D3630FB07E8B570, Citizen.PointerValueIntInitialized(trainVehicle))
end