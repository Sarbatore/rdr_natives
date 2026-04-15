---Return mission train track and junction index
---@param trainVehicle integer
---@return integer trackHash
---@return integer junctionIndex
function ReturnTrainInfoFromHandle(trainVehicle)
    return Citizen.InvokeNative(0x09034479E6E3E269, trainVehicle, Citizen.PointerValueInt(), Citizen.PointerValueInt())
end

---Return wether any wheel of the vehicle is destroyed.
---@param vehicle integer
---@return boolean
function AreAnyVehicleWheelsDestroyed(vehicle)
    return Citizen.InvokeNative(0x18714953CCED17D3, vehicle) == 1
end

---Determines whether the train whistle can be used. True if so, False to make it unusable.
---@param train integer
---@param enable boolean
function SetTrainWhistleEnabled(trainVehicle, enable)
    Citizen.InvokeNative(0x1BFBAFCC6760FF02, trainVehicle, enable)
end

---
---@param train integer
function DeleteMissionTrain(trainVehicle)
    Citizen.InvokeNative(0x0D3630FB07E8B570, Citizen.PointerValueIntInitialized(trainVehicle))
end

---Return the world coordinate of the given train track configuration at the specified index.
---@param trackHash integer
---@param junctionIndex integer
---@return vector3
function GetJunctionCoordsForTrainTrack(trackHash, junctionIndex)
    return Citizen.InvokeNative(0x785639D89F8451AB, trackHash, junctionIndex, Citizen.ResultAsVector())
end

---Return the number of logs on a draft vehicle.
---@param vehicle integer
---@return integer
function GetNumDraftVehicleLogs(vehicle)
    return Citizen.InvokeNative(0x288CBB414C3C2FBB, vehicle, Citizen.ResultAsInteger())
end

---Return the number of straps that hold the logs of a draft vehicle.
---@param vehicle integer
---@return integer
function GetNumDraftVehicleStraps(vehicle)
    return Citizen.InvokeNative(0x1121B07088ED3013, vehicle, Citizen.ResultAsInteger())
end

---Break all the straps of a draft vehicle.
---@param vehicle integer
---@param coords vector3
function BreakVehicleStraps(vehicle, coords)
    Citizen.InvokeNative(0xD1EFA8D68BF5D63D, vehicle, coords)
end

---Return the entity of the draft vehicle log that just fell off.
---@param vehicle integer
---@return integer logObject
function RecoverDraftVehicleFallingLog(vehicle)
    return Citizen.InvokeNative(0x42404D57D621601A, vehicle)
end

---Return the station hash for a track and station index.
---@param trackIndex integer
---@param stationIndex integer
---@return integer stationHash
function GetStationFromTrainStationData(trackIndex, stationIndex)
    return Citizen.InvokeNative(0x9CC94A948EAF5372, trackIndex, stationIndex, Citizen.ResultAsInteger())
end

---Returns the balloon object attached to a hot air balloon vehicle.
---@param vehicle integer
---@return integer balloonObject
function GetBalloonObjectFromVehicle(vehicle)
    return Citizen.InvokeNative(0x0BA4250D20007C2E, vehicle, Citizen.ResultAsInteger())
end

---Collects all passenger peds (excluding the driver) from the specified wagon-type vehicle and adds them as indexed items to the provided itemset.
---@param wagon integer
---@param itemSet integer
---@return integer
function GetAllWagonPassengers(wagon, itemSet)
    return Citizen.InvokeNative(0x0E558D3A49D759D6, wagon, itemSet, Citizen.ResultAsInteger())
end

---
---@param vehicle integer
---@param ped integer
---@return integer
function DetermineVehicleCompartmentState(vehicle, ped)
    return Citizen.InvokeNative(0x877EA24EB1614495, Citizen.PointerValueInt(), vehicle, ped)
end

---
---@param trainVehicle integer
---@param enable integer
function SetTrainCollisionAvoidanceEnabled(trainVehicle, enable)
    Citizen.InvokeNative(0xE6BD7DD3FD474415, trainVehicle, enable)
end

---
---@param x number
---@param y number
---@param z number
---@param radius number
---@param modelHash integer
---@return integer vehicle
function GetClosestVehicle(x, y, z, radius, modelHash)
    local itemSet = CreateItemset(true)

    if (not IsItemsetValid(itemSet)) then
        return 0
    end

    local itemSetSize = GetEntitiesNearPoint(x, y, z, radius, itemSet, 2)
    local nearestVehicle = 0
    local nearestDistance = -1.0
    local coords = vector3(x, y, z)

    for i = 0, itemSetSize - 1 do
        local vehicle = GetVehicleFromIndexedItem(GetIndexedItemInItemset(i, itemSet))
        if (modelHash == 0 or GetEntityModel(vehicle) == modelHash) then
            local distance = #(GetEntityCoords(vehicle) - coords)
            if (nearestDistance == -1.0 or distance < nearestDistance) then
                nearestDistance = distance
                nearestVehicle = vehicle
            end
        end
    end
    
    if (IsItemsetValid(itemSet)) then
        DestroyItemset(itemSet)
    end

    return nearestVehicle
end

---Sets a hot air balloon's travel target position.
---@param balloonVehicle integer
---@param x number
---@param y number
---@param z number
---@param autoPower boolean
---@param speed number
function SetBalloonRoute(balloonVehicle, x, y, z, autoPower, speed)
    Citizen.InvokeNative(0x2200AB13CBD10F4E, balloonVehicle, x, y, z, autoPower, speed)
end

---Set oars rowing speed for a boat with oars.
---@param boatVehicle integer
---@param speed integer Enum 1 to 3
function SetOarsRowingSpeed(boatVehicle, speed)
    Citizen.InvokeNative(0x6835AFEA10E186F4, boatVehicle, speed)
end

---Set true to enable train reverse or false to forbid it.
---@param missionTrain integer
---@param enable boolean
function SetTrainReverseEnabled(missionTrain, enable)
    Citizen.InvokeNative(0x06A09A6E0C6D2A84, missionTrain, enable)
end

---
---@param trainCarriage integer
---@param enable boolean
function SetTrainCarriageInteriorCollisionAvoidance(trainCarriage, enable)
    Citizen.InvokeNative(0x762FDC4C19E5A981, trainCarriage, enable)
end

---
---@param trainConfig integer
---@param x number
---@param y number
---@param z number
---@param direction boolean
---@param p5 boolean
---@return boolean
function IsPositionValidForTrain(trainConfig, x, y, z, direction, p5)
    return Citizen.InvokeNative(0xF05DFAF1ADFEF2CD, trainConfig, x, y, z, direction, p5) == 1
end

---Adds a forward buffer to the AI's stopping distance for a specific vehicle.
---@param vehicle integer
---@param bufferDistance number
function SetVehicleStopDistanceBuffer(vehicle, bufferDistance)
    Citizen.InvokeNative(0xA13028E22564A1BD, vehicle, bufferDistance)
end

---Forces a hot air balloon to rotate (yaw) and face a specific 3D world coordinate.
---@param balloonVehicle integer
---@param x number
---@param y number
---@param z number
function SetBalloonFaceCoords(balloonVehicle, x, y, z)
    Citizen.InvokeNative(0xB42C87521D1BDD2F, balloonVehicle, x, y, z)
end

---
---@param balloonVehicle integer
---@param x number
---@param y number
---@param z number
---@param p2 boolean
---@param speedMultiplier number
function SetBalloonGoToCoords(balloonVehicle, x, y, z, p2, speedMultiplier)
    Citizen.InvokeNative(0x2200AB13CBD10F4E, balloonVehicle, x, y, z, p2, speedMultiplier)
end

---A universal trigger that forces open a vehicle's primary cargo access point (e.g., dropping the tailgate, opening a built-in lockbox, or revealing a hidden smuggler compartment).
---@param vehicle integer
function SetCargoCompartmentOpen(vehicle)
    Citizen.InvokeNative(0xF6E3D38869D0F7AD, vehicle)
end

---Checks if a vehicle's collision bounds (or wheels) are currently interacting with dense vegetation/foliage physics materials (e.g., bushes, reeds, thick shrubs).
---@param vehicle integer
---@return boolean
function IsVehicleTouchingVegetation(vehicle)
    return Citizen.InvokeNative(0x51C7694E140FAE43, vehicle) == 1
end

---Instantly pops/destroys any breakable lock objects attached to the vehicle AND automatically swings open the corresponding doors/compartments.
---@param vehicle integer
function BreakLocksOnVehicle(vehicle)
    Citizen.InvokeNative(0x9D12796EF4BF9EA9, vehicle)
end

---
---@param missionTrain integer
---@param p1 integer
function N_0x6703872EC09BC158(missionTrain, p1)
    Citizen.InvokeNative(0x6703872EC09BC158, missionTrain, p1)
end

---
---@param missionTrain integer
---@param enable boolean
function N_0x6DE072AC8A95FFC1(missionTrain, enable)
    Citizen.InvokeNative(0x6DE072AC8A95FFC1, missionTrain, enable)
end

---
---@param missionTrain integer
---@param enable boolean
function N_0xDC69F6913CCA0B99(missionTrain, enable)
    Citizen.InvokeNative(0xDC69F6913CCA0B99, missionTrain, enable)
end

---
---@param missionTrain integer
---@param enable boolean
function N_0x7840576C50A13DBA(missionTrain, enable)
    Citizen.InvokeNative(0x7840576C50A13DBA, missionTrain, enable)
end

---
---@param missionTrain integer
---@param enable boolean
function N_0x1A861F899EBBE17C(missionTrain, enable)
    Citizen.InvokeNative(0x1A861F899EBBE17C, missionTrain, enable)
end

---
---@param missionTrain integer
---@param enable boolean
function N_0xAE7E66A61E7C17A5(missionTrain, enable)
    Citizen.InvokeNative(0xAE7E66A61E7C17A5, missionTrain, enable)
end

---
---@param missionTrain integer
---@param enable boolean
function N_0xEF28A614B4B264B8(missionTrain, enable)
    Citizen.InvokeNative(0xEF28A614B4B264B8, missionTrain, enable)
end

---
---@param missionTrain integer
---@param enable boolean
function N_0xA72B1BF3857B94D7(missionTrain, enable)
    Citizen.InvokeNative(0xA72B1BF3857B94D7, missionTrain, enable)
end

---
---@param missionTrain integer
---@param p1 number
function N_0x160C1B5AB48AB87C(missionTrain, p1)
    Citizen.InvokeNative(0x160C1B5AB48AB87C, missionTrain, p1)
end

---
---@param trainCarriage integer
---@param alpha number
function N_0xD0116DF21E6C7B36(trainCarriage, alpha)
    Citizen.InvokeNative(0xD0116DF21E6C7B36, trainCarriage, alpha)
end

---Used after 0xD0116DF21E6C7B36
---@param missionTrain integer
function N_0x0F7F603BDE08C4D3(missionTrain)
    Citizen.InvokeNative(0x0F7F603BDE08C4D3, missionTrain)
end

---
---@param missionTrain integer
---@param enable boolean
function N_0xDD100CE1EBBF37E3(missionTrain, enable)
    Citizen.InvokeNative(0xDD100CE1EBBF37E3, missionTrain, enable)
end

---
---@param trainConfig integer
---@param x number
---@param y number
---@param z number
---@param direction boolean
---@param p5 boolean
---@return integer trackIndex
function N_0x331CBD247FC5DAA8(trainConfig, x, y, z, direction, p5)
    return Citizen.InvokeNative(0x331CBD247FC5DAA8, trainConfig, x, y, z, direction, p5, Citizen.ResultAsInteger())
end

---
---@param trackIndex integer
---@param p1 integer
function N_0x34BCF6209B9668A7(trackIndex, p1)
    Citizen.InvokeNative(0x34BCF6209B9668A7, trackIndex, p1)
end

---
---@param trackIndex integer
function N_0x0D5FDF0D36FA10CD(trackIndex)
    Citizen.InvokeNative(0x0D5FDF0D36FA10CD, trackIndex)
end

---
---@param trackIndex integer
function N_0x718EB706B6E998A0(trackIndex)
    Citizen.InvokeNative(0x718EB706B6E998A0, trackIndex)
end

---
---@param trackIndex integer
---@param p1 number
function N_0xD0AABE5B9F8FA589(trackIndex, p1)
    Citizen.InvokeNative(0xD0AABE5B9F8FA589, trackIndex, p1)
end

---
---@param trackIndex integer
---@param p1 number
function N_0x41365DB586CD9E8E(trackIndex, p1)
    Citizen.InvokeNative(0x41365DB586CD9E8E, trackIndex, p1)
end

---
---@param trackIndex integer
---@param p1 integer
function N_0x427C919E9809E370(trackIndex, p1)
    Citizen.InvokeNative(0x427C919E9809E370, trackIndex, p1)
end

---
---@param trackIndex integer
---@param p1 integer
function N_0x6B34BE961F639E21(trackIndex, p1)
    Citizen.InvokeNative(0x6B34BE961F639E21, trackIndex, p1)
end

---
---@param trackIndex integer
---@param p1 number
function N_0x615B3B8E73634509(trackIndex, p1)
    Citizen.InvokeNative(0x615B3B8E73634509, trackIndex, p1)
end

---
---@param trackIndex integer
---@param p1 number
function N_0x15206E88FF7617DF(trackIndex, p1)
    Citizen.InvokeNative(0x15206E88FF7617DF, trackIndex, p1)
end

---
---@param trackIndex integer
---@param p1 number
function N_0xA7966807953A18EE(trackIndex, p1)
    Citizen.InvokeNative(0xA7966807953A18EE, trackIndex, p1)
end

---
---@param trackIndex integer
---@param p1 integer
function N_0x38E7DD70A242D5CB(trackIndex, p1)
    Citizen.InvokeNative(0x38E7DD70A242D5CB, trackIndex, p1)
end

---
---@param missionTrain integer
---@return integer trainStationId
function N_0x1180A2974D251B7B(missionTrain)
    return Citizen.InvokeNative(0x1180A2974D251B7B, missionTrain, Citizen.ResultAsInteger())
end

---
---@param missionTrain integer
---@return integer count
function N_0xDE8C5B9F65017FA1(missionTrain)
    return Citizen.InvokeNative(0xDE8C5B9F65017FA1, missionTrain, Citizen.ResultAsInteger())
end

---
---@param x number
---@param y number
---@param z number
---@return integer trackIndex
function N_0x6C87F49BFA181DB5(x, y, z)
    return Citizen.InvokeNative(0x6C87F49BFA181DB5, x, y, z, Citizen.ResultAsInteger())
end

---
---@param missionTrain integer
---@param enable integer
function N_0x2BB2B5BCF0DF8008(missionTrain, enable)
    Citizen.InvokeNative(0x2BB2B5BCF0DF8008, missionTrain, enable)
end

---
---@param trackIndex integer
---@param p1 integer
function N_0x63509DDF102E08E8(trackIndex, p1)
    Citizen.InvokeNative(0x63509DDF102E08E8, trackIndex, p1)
end

---Return track infos
---@param trackIndex integer
---@return integer trackHash
---@return integer numJunctions
function N_0xCAFF2C9747103C02(trackIndex)
    return Citizen.InvokeNative(0xCAFF2C9747103C02, trackIndex, Citizen.PointerValueInt(), Citizen.PointerValueInt())
end

---
---@param trackHash integer
---@return boolean
function N_0x0516FAE561276EFC(trackHash)
    return Citizen.InvokeNative(0x0516FAE561276EFC, trackHash) == 1
end

---
---@param trackHash integer
---@return boolean
function N_0x37D238BE69F7378A(trackHash)
    return Citizen.InvokeNative(0x37D238BE69F7378A, trackHash) == 1
end

---
---@param trackIndex integer
---@return boolean
function N_0xB4241AD8F5AEE9ED(trackIndex)
    return Citizen.InvokeNative(0xB4241AD8F5AEE9ED, trackIndex) == 1
end

---
---@param trackIndex integer
---@return boolean
function N_0x0FDDEE66E3465726(trackIndex)
    return Citizen.InvokeNative(0x0FDDEE66E3465726, trackIndex) == 1
end

---
---@param trackIndex integer
---@param p1 boolean
function N_0xF8F7DA13CFBD4532(trackIndex, p1)
    Citizen.InvokeNative(0xF8F7DA13CFBD4532, trackIndex, p1)
end

---
---@param trackHash integer
---@param junctionIndex integer
---@param p2 boolean
function N_0x3ABFA128F5BF5A70(trackHash, junctionIndex, p2)
    Citizen.InvokeNative(0x3ABFA128F5BF5A70, trackHash, junctionIndex, p2)
end

---Linked to 0x0FDDEE66E3465726
---@param trackIndex integer
function N_0xE682002DB1F30669(trackIndex)
    Citizen.InvokeNative(0xE682002DB1F30669, trackIndex)
end

---
---@param trackIndex integer
function N_0xA230A5DDE12ED374(trackIndex)
    Citizen.InvokeNative(0xA230A5DDE12ED374, trackIndex)
end

---
---@param hash integer
---@param x number
---@param y number
---@param z number
---@return boolean
function N_0xD9BF3ED8EFB67EA3(hash, x, y, z)
    local outData = DataView.ArrayBuffer(32*8)
    local retval = Citizen.InvokeNative(0xD9BF3ED8EFB67EA3, hash, x, y, z, outData:Buffer()) == 1

    return retval
end