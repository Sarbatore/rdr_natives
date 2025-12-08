function GetBountyOnPlayer(playerId)
    local gamerHandle = GetPlayerGamerHandle(playerId)
    local outData = DataView.ArrayBuffer(10*8)
    Citizen.InvokeNative(0x4EF23E04A0C8FF51, gamerHandle:Buffer(), outData:Buffer())

    return
end