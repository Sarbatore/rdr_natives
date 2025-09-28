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

---Return the world coordinate of the given train track configuration at the specified index.
---@param trackConfig Hash
---@param index integer
---@param p2 integer
---@return vector3
function GetTrainTrackCoordAtJunctionIndex(trackConfig, index, p2)
    return Citizen.InvokeNative(0x785639D89F8451AB, trackConfig, index, p2, Citizen.ResultAsVector())
end

---Return the number of logs on a draft vehicle.
---@param vehicle Vehicle
---@return integer
function GetNumDraftVehicleLogs(vehicle)
    return Citizen.InvokeNative(0x288CBB414C3C2FBB, vehicle, Citizen.ResultAsInteger())
end

---Return the number of straps that hold the logs of a draft vehicle.
---@param vehicle Vehicle
---@return integer
function GetNumDraftVehicleStraps(vehicle)
    return Citizen.InvokeNative(0x1121B07088ED3013, vehicle, Citizen.ResultAsInteger())
end

---Break all the straps of a draft vehicle.
---@param vehicle Vehicle
---@param coords vector3
function BreakVehicleStraps(vehicle, coords)
    Citizen.InvokeNative(0xD1EFA8D68BF5D63D, vehicle, coords)
end

---Return the entity of the draft vehicle log that just fell off.
---@param vehicle Vehicle
---@return Entity
function GetDraftVehicleFallingLog(vehicle)
    return Citizen.InvokeNative(0x42404D57D621601A, vehicle)
end