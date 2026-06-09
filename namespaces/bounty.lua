function BountyGetBountyOnPlayer(playerId)
    local gamerHandle
    if (GetCurrentResourceName() == "rdr_natives") then
        gamerHandle = NetworkHandleFromPlayer(playerId)
    else
        gamerHandle = exports.rdr_natives:NetworkHandleFromPlayer(playerId)
    end

    local outData = DataView.ArrayBuffer(10*8)
    Citizen.InvokeNative(0x4EF23E04A0C8FF51, gamerHandle:Buffer(), outData:Buffer())

    return
end

---
---@param p0 any
---@param p1 any
---@return boolean success
---@return table
function BountyRequestBeginLegendaryMission(p0, p1)
    local guid = DataView.ArrayBuffer(32*8)
    local success = Citizen.InvokeNative(0x86EC5F83867C4B70, guid:Buffer(), p0, p1) == 1

    return success, guid
end

---
---@return boolean success
---@return table
function N_0x86EC5F83867C4B70()
    local outGuid = DataView.ArrayBuffer(32*8)
    local success = Citizen.InvokeNative(0x86EC5F83867C4B70, outGuid:Buffer()) == 1

    return success, outGuid
end

---
---@param p0 integer
---@return integer
function N_0xD6A67E2FF373D0E3(p0)
    return Citizen.InvokeNative(0xD6A67E2FF373D0E3, p0, Citizen.ResultAsInteger())
end

---
---@return integer
function N_0xF8BCC5ECA33AC9C1()
    return Citizen.InvokeNative(0xF8BCC5ECA33AC9C1, Citizen.ResultAsInteger())
end