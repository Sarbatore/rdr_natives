---
---@param player integer
---@return boolean
function NetworkAmIMutedByPlayer(player)
    return Citizen.InvokeNative(0x0DED260A1958A82E, player) == 1
end

---
---@param player integer
---@return boolean
function NetworkIsPlayerTalking(player)
    return Citizen.InvokeNative(0xEF6F2A35FAAF2ED7, player) == 1
end

---
---@param player integer
---@return boolean
function NetworkPlayerHasHeadset(player)
    return Citizen.InvokeNative(0xAA35FD9ABAB490A3, player) == 1
end