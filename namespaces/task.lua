---Return scenario points in the area.
---@param x float
---@param y float
---@param z float
---@param radius float
---@param size integer
---@return boolean, ?table
function GetScenarioPointsInArea(x, y, z, radius, size)
    local DataStruct = DataView.ArrayBuffer(size*8 + 8)
    if (Citizen.InvokeNative(0x345EC3B7EBDE1CB5, x, y, z, radius, DataStruct:Buffer(), size)) then
        local scenarioPoints = {}
        for i=1, size do
            local scenarioPoint = DataStruct:GetInt32(i*8)
            if (Citizen.InvokeNative(0x841475AC96E794D1, scenarioPoint)) then -- DOES_SCENARIO_POINT_EXIST
                table.insert(scenarioPoints, scenarioPoint)
            end
        end
        return true, scenarioPoints
    end

    return false
end

---
---@param ped Ped
---@param pickup Pickup
---@return void
function TaskPickUpWeapon(ped, pickup)
    Citizen.InvokeNative(0x55B0ECFD98596624, ped, pickup)
end

---Loads the carriable config hash [@outsider]
---@param carriableConfig Hash
---@return void
function LoadCarriableConfigHash(carriableConfig)
    Citizen.InvokeNative(0xFF745B0346E19E2C, carriableConfig)
end

---Checks if the carriable config hash has been loaded [@outsider]
---@param carriableConfig Hash
---@return boolean
function HasCarriableConfigHashLoaded(carriableConfig)
    return Citizen.InvokeNative(0xB8F52A3F84A7CC59, carriableConfig)
end

---Returns the entity coverpoint with offset [@sarbatore]
---@param entity Entity
---@param xOffset float
---@param yOffset float
---@param zOffset float
---@param heading float
---@param p5 integer
---@param p6 integer
---@param p7 integer
---@param p8 integer
---@return integer
function GetCoverpointFromEntityWithOffset(entity, xOffset, yOffset, zOffset, heading, p5, p6, p7, p8)
    return Citizen.InvokeNative(0x59872EA4CBD11C56, entity, xOffset, yOffset, zOffset, heading, p5, p6, p7, p8, Citizen.ResultAsint())
end

---Return whether the scenario is in use or not.
---@param scenarioHash Hash
---@return boolean
function IsScenarioInUse(scenarioHash)
    return Citizen.InvokeNative(0x1ACBC313966C21F3, scenarioHash)
end

---Returns true if the specified mount (horse) is currently being led by the player, otherwise false.
---@param mount Ped
---@return boolean
function IsPedBeingLed(mount)
    return Citizen.InvokeNative(0xAC5045AB7F1A34FD, mount) == 1
end

---Returns the total number of compartments (drawers, lids, etc.) the specified scenario container entity has.
---@param entity Entity
---@return integer
function GetScenarioContainerNumCompartments(entity)
    return Citizen.InvokeNative(0x640A602946A8C972, entity, Citizen.ResultAsint())
end

---Returns the number of currently open compartments for the specified scenario container entity.
---@param entity Entity
---@return integer
function GetScenarioContainerNumOpenCompartments(entity)
    return Citizen.InvokeNative(0x849791EBBDBA0362, entity, Citizen.ResultAsint())
end

---Returns the total number of lootable items currently inside the specified scenario container entity.
---@param entity Entity
---@return integer
function GetScenarioContainerRemainingLootCount(entity)
    return Citizen.InvokeNative(0x01AF8A3729231A43, entity, Citizen.ResultAsint())
end

---Returns the current progress of the "Break Free" prompt when the specified ped is hogtied or knocked out.
---@param ped Ped
---@return float
function GetPedBreakFreeProgress(ped)
    return Citizen.InvokeNative(0x03D741CB4052E26C, ped, Citizen.ResultAsFloat())
end

---Configures how an intimidated/hogtied ped faces the player.
---@param ped Ped
---@param useLimits boolean
---@param minAngle float
---@param maxAngle float
---@return void
function SetIntimitatedFacingAngle(ped, useLimits, minAngle, maxAngle)
    Citizen.InvokeNative(0x0FE797DD9F70DFA6, ped, useLimits, minAngle, maxAngle)
end

---Clears all active tasks assigned to the specified vehicle.
---@param vehicle Vehicle
---@return void
function ClearVehicleTasks(vehicle)
    Citizen.InvokeNative(0x141BC64C8D7C5529, vehicle)
end

---
---@param ped Ped
---@param x float
---@param y float
---@param z float
---@param p4 integer
---@param p5 boolean
---@param p6 boolean
function TaskForceAimAtCoord(ped, x, y, z, p4, p5, p6)
    Citizen.InvokeNative(0x41323F4E0C4AE94B, ped, x, y, z, p4, p5, p6)
end

---Reset all scenario points in area.
---@param x float
---@param y float
---@param z float
---@param radius float
function ResetScenarioPointsInArea(x, y, z, radius)
    Citizen.InvokeNative(0x4161648394262FDF, x, y, z, radius)
end

---Set which seat index acts as the "driver seat" for driving tasks.
---@param vehicle Vehicle
---@param seatIndex integer
function SetDrivingSeat(vehicle, seatIndex)
    Citizen.InvokeNative(0x4BA972D0E5AD8122, vehicle, seatIndex)
end

---Return the seat index currently set as the "driving seat" for the specified vehicle.
---@param vehicle Vehicle
---@return integer
function GetDrivingSeat(vehicle)
    return Citizen.InvokeNative(0xE62754D09354F6CF, vehicle, Citizen.ResultAsInteger())
end

---Checks if the ped can/look is directed at the given coord within the specified radius.
---@param ped Ped
---@param x float
---@param y float
---@param z float
---@param radius float
---@return boolean
function IsPedLookingAtCoord(ped, x, y, z, radius)
    return Citizen.InvokeNative(0x508F5053E3F6F0C4, ped, x, y, z, radius, Citizen.ResultAsInteger()) == 1
end

---Checks if the vehicle's current drive-to destination matches the given coordinates.
---@param vehicle Vehicle
---@param x float
---@param y float
---@param z float
---@return boolean
function TaskVehicleIsAtDestination(vehicle, x, y, z)
    return Citizen.InvokeNative(0x583AE9AF9CEE0958, vehicle, x, y, z, Citizen.ResultAsInteger()) == 1
end