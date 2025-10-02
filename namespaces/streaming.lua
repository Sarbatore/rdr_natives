---Requests a scenario type just like _REQUEST_SCENARIO_TYPE but for a specifc ped p2 is a flag unknown
---@param ped Ped
---@param scenarioType string
---@param flag number
---@param conditionalScenario string
---@return number
function RequestScenarioTypeForPed(ped, scenarioType, flag, conditionalScenario)
    return Citizen.InvokeNative(0xB223249B7798EEED, ped, scenarioType, flag, conditionalScenario, Citizen.ResultAsInteger())
end

---Removes the requested scenario type for ped using the id returned by _REQUEST_SCENARIO_TYPE_FOR_PED
---@param scenarioTypeId number
---@return void
function RemoveScenarioTypeForPed(scenarioTypeId)
    Citizen.InvokeNative(0x66BC28E50E85270E, scenarioTypeId)
end

---Returns 1 if the scenario type for ped is loaded using the id returned by _REQUEST_SCENARIO_TYPE_FOR_PED or false
---@param scenarioTypeId number
---@return boolean
function HasScenarioTypeForPedLoaded(scenarioTypeId)
    return Citizen.InvokeNative(0xA0AE7653E8181725, scenarioTypeId) == 1
end

---Requests a clip set to be loaded
---@param clipSet string
function RequestClipSet_2(clipSet)
    Citizen.InvokeNative(0x03DDBF2D73799F9E, clipSet)
end

---Returns true if the requested clip set is loaded
---@param clipSet string
---@return boolean
function HasClipSetLoaded_2(clipSet)
    return Citizen.InvokeNative(0x85B8F04555AB49B8, clipSet) == 1
end

---Removes the requested clip set
---@param clipSet string
function RemoveClipSet_2(clipSet)
    Citizen.InvokeNative(0x9F348DE670423460, clipSet)
end