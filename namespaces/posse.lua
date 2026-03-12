function N_0xC08AFF658B2E51DA()
    return Citizen.InvokeNative(0xC08AFF658B2E51DA, Citizen.PointerValueInt())
end

function N_0xC084FF658B2E61DA(playerId)
    local gamerHandle
    if (GetCurrentResourceName() == "rdr_natives") then
        gamerHandle = NetworkHandleFromPlayer(playerId)
    else
        gamerHandle = exports.rdr_natives:NetworkHandleFromPlayer(playerId)
    end
    return Citizen.InvokeNative(0xC084FF658B2E61DA, gamerHandle:Buffer(), Citizen.ResultAsInteger())
end

function N_0xC084FF658B2E81DA(playerId, index)
    local outData = DataView.ArrayBuffer(32*8)
    local gamerHandle
    if (GetCurrentResourceName() == "rdr_natives") then
        gamerHandle = NetworkHandleFromPlayer(playerId)
    else
        gamerHandle = exports.rdr_natives:NetworkHandleFromPlayer(playerId)
    end

    local retval = Citizen.InvokeNative(0xC084FF658B2E81DA, gamerHandle:Buffer(), index, outData:Buffer()) == 1

    return retval
end

function N_0xC07CFF658B2E51D(eventData, index)
    local retval = Citizen.InvokeNative(0xC07CFF658B2E51D, eventData, index) == 1
    return retval
end

function N_0xC06CFF658B2E51DA(eventData, index, index2)
    local retval = Citizen.InvokeNative(0xC06CFF658B2E51DA, eventData, index, index2) == 1
    return retval
end

---
---@param playerId integer
---@return boolean
function N_0xC087FF658B2E51DA(playerId)
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(22*8, 10)

    local gamerHandle
    if (GetCurrentResourceName() == "rdr_natives") then
        gamerHandle = NetworkHandleFromPlayer(playerId)
    else
        gamerHandle = exports.rdr_natives:NetworkHandleFromPlayer(playerId)
    end

    local retval = Citizen.InvokeNative(0xC087FF658B2E51DA, gamerHandle:Buffer(), outData:Buffer()) == 1
    
    return retval
end

---
---@param playerId integer
---@return boolean
function N_0xC09CFF658B2E51DA(playerId)
    local data = DataView.ArrayBuffer(32*8)
    data:SetInt32(10*8, 0)
    data:SetInt32(22*8, 10)
    local outData = DataView.ArrayBuffer(1*8)
    outData:SetInt32(0*8, 0)

    local gamerHandle
    if (GetCurrentResourceName() == "rdr_natives") then
        gamerHandle = NetworkHandleFromPlayer(playerId)
    else
        gamerHandle = exports.rdr_natives:NetworkHandleFromPlayer(playerId)
    end

    local retval = Citizen.InvokeNative(0xC09CFF658B2E51DA, gamerHandle:Buffer(), data:Buffer(), outData:Buffer()) == 1
    
    return retval
end

function N_0xC08BFF658B2E51DA(p0)
    Citizen.InvokeNative(0xC08BFF658B2E51DA, p0)
end

function N_0xC584FF658B2E55DA(p0)
    Citizen.InvokeNative(0xC584FF658B2E55DA, p0)
end