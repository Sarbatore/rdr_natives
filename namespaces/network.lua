---Unregisters the entity from the network.
---@param entity Entity
function NetworkUnregisterNetworkedEntity(entity)
    Citizen.InvokeNative(0xE31A04513237DC89, entity)
end

---Sees to just kill the network connection, sets the players coords to 0, 0, 0 when doing GetEntityCoords
function NetworkSessionRequestTerminate()
    Citizen.InvokeNative(0xFD4272A137703449)
end

---Return a structure of gamer handle for player
---@param player integer
---@return table
function NetworkHandleFromPlayer(player)
    local gamerHandle = DataView.ArrayBuffer(2*8)
    gamerHandle:SetInt32(0*8, player)
    Citizen.InvokeNative(0x388EB2B86C73B6B3, player, gamerHandle:Buffer())

    return gamerHandle
end