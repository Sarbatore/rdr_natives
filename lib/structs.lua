function GetPlayerGamerHandle(playerId)
    local gamerHandle = DataView.ArrayBuffer(2*8)
    gamerHandle:SetInt32(0*8, playerId)
    Citizen.InvokeNative(0x388EB2B86C73B6B3, playerId, gamerHandle:Buffer()) -- NETWORK_HANDLE_FROM_PLAYER

    return gamerHandle
end