---Return scenario points in the area.
---@param x number
---@param y number
---@param z number
---@param radius number
---@param size number
---@return boolean, ?table
function GetScenarioPointsInArea(x, y, z, radius, size)
    local DataStruct = DataView.ArrayBuffer(size*8 + 8)
    if (Citizen.InvokeNative(0x345EC3B7EBDE1CB5, x, y, z, radius, DataStruct:Buffer(), size)) then
        local scenarioPoints = {}
        for i=1, size do
            local scenarioPoint = DataStruct:GetInt32(i*8)
            if (DoesScenarioPointExist(scenarioPoint)) then
                table.insert(scenarioPoints, scenarioPoint)
            end
        end
        return true, scenarioPoints
    end

    return false
end
exports("GetScenarioPointsInArea", GetScenarioPointsInArea)