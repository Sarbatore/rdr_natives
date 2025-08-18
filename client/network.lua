---Unregisters the entity from the network.
---@return void
function NetworkUnregisterNetworkedEntity(entity)
    Citizen.InvokeNative(0xE31A04513237DC89, entity)
end

---Sees to just kill the network connection, sets the players coords to 0, 0, 0 when doing GetEntityCoords
---@return void
function NetworkLeaveSession()
    Citizen.InvokeNative(0xFD4272A137703449)
end