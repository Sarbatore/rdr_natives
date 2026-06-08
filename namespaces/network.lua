---Unregisters the entity from the network.
---@param entity integer
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

---
---@param x number
---@param y number
---@param z number
---@param heading number
---@param p4 integer
---@param vehicle integer
---@param p6 integer
---@param p7 boolean
function NetworkResurrectLocalPlayer2(x, y, z, heading, p4, vehicle, p6, p7)
    local data = DataView.ArrayBuffer(8*8)
    data:SetFloat32(0*8, x)
    data:SetFloat32(1*8, y)
    data:SetFloat32(2*8, z)
    data:SetFloat32(3*8, heading)
    data:SetInt32(4*8, p4)
    data:SetInt32(5*8, vehicle)
    data:SetInt32(6*8, p6)
    data:SetInt32(7*8, p7 and 1 or 0)

    Citizen.InvokeNative(0x4154B7D8C75E5DCF, data:Buffer())
end