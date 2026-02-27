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