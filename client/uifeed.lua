---
---@param soundRef string
---@param soundName string
---@return number
function N_0x18D6869FBFFEC0F8(soundRef, soundName)
    local DataStruct = DataView.ArrayBuffer(7*8)
    DataStruct:SetInt32(0*8, -2) -- iParam7
    DataStruct:SetInt64(1*8, VarString(10, "LITERAL_STRING", "HUD_Toast_Soundset", Citizen.ResultAsLong())) -- sParam8
    DataStruct:SetInt64(2*8, VarString(10, "LITERAL_STRING", "robbery_tip_wipe_on", Citizen.ResultAsLong())) -- sParam9
    DataStruct:SetInt32(3*8, 0) -- iParam11

    local SubDataStruct = DataView.ArrayBuffer(3*8)
    SubDataStruct:SetInt32(0*8, `player_menu`) -- iParam4
    SubDataStruct:SetInt32(1*8, `sp_notifications`) -- iParam6
    SubDataStruct:SetInt64(2*8, VarString(10, "LITERAL_STRING", "INPUT_FEED_INTERACT_GENERIC", Citizen.ResultAsLong())) -- sParam5
    
    local subBuffer = SubDataStruct:Buffer()
    local subBufferLen = SubDataStruct:ByteLength()

    for i=1, subBufferLen do
        local byteValue = subBuffer:byte(i)
        DataStruct:SetUint8((4*8) + (i-1), byteValue)
    end

    local DataStruct2 = DataView.ArrayBuffer(8*8)
    DataStruct2:SetInt32(0*8, 0) -- iParam10
    DataStruct2:SetInt64(1*8, VarString(10, "LITTERAL_STRING", "ROB_TOAST_BODY", Citizen.ResultAsLong())) -- sParam0
    DataStruct2:SetInt64(2*8, VarString(10, "LITTERAL_STRING", "ROB_TOAST_BODY", Citizen.ResultAsLong())) -- sParam1
    DataStruct2:SetInt32(3*8, 0)
    DataStruct2:SetInt32(4*8, `elements_stamps_icons`) -- hParam2
    DataStruct2:SetInt32(5*8, `stamp_cash`) -- hParam3
    DataStruct:SetInt32(7*8, 1)

    return Citizen.InvokeNative(0x18D6869FBFFEC0F8, DataStruct:Buffer(), DataStruct2:Buffer(), true, true)
end

---Return a feedmessage id
---@param p0 string
---@param p1 boolean
---@return number
function N_0x4E88A65968A55C78(p0, p1)
    local DataStruct = DataView.ArrayBuffer(2*8)
    DataStruct:SetInt64(1*8, VarString(10, "LITERAL_STRING", p0, Citizen.ResultAsLong()))

    return Citizen.InvokeNative(0x4E88A65968A55C78, DataStruct:Buffer(), p1, Citizen.PointerValueInt())
end

---
---@param duration number
---@param soundRef string
---@param soundName string
---@param p3 number
---@param p4 string
---@param p5 string
---@param p6 string
---@param p7 number
---@param p8 number
---@param collectableCategory number
---@return number
function N_0xAFF5BE9BA496CE40(duration, soundRef, soundName, p3, p4, p5, p6, p7, p8, collectableCategory)
    local DataStruct = DataView.ArrayBuffer(7*8)
    DataStruct:SetInt32(0*8, duration)
    DataStruct:SetInt64(1*8, VarString(10, "LITERAL_STRING", soundRef, Citizen.ResultAsLong()))
    DataStruct:SetInt64(2*8, VarString(10, "LITERAL_STRING", soundName, Citizen.ResultAsLong()))
    DataStruct:SetInt32(3*8, 0)

    local SubDataStruct = DataView.ArrayBuffer(3*8)
    SubDataStruct:SetInt32(0*8, `Collectors`)
    SubDataStruct:SetInt32(1*8, p3)
    SubDataStruct:SetInt64(2*8, VarString(2, p4, Citizen.ResultAsLong()))

    local subBuffer = SubDataStruct:Buffer()
    local subBufferLen = SubDataStruct:ByteLength()

    for i=1, subBufferLen do
        local byteValue = subBuffer:byte(i)
        DataStruct:SetUint8((4*8) + (i-1), byteValue)
    end

    local DataStruct2 = DataView.ArrayBuffer(8*8)
    DataStruct2:SetInt32(0*8, 0)
    DataStruct2:SetInt64(1*8, VarString(10, "LITTERAL_STRING", p5, Citizen.ResultAsLong()))
    DataStruct2:SetInt64(2*8, VarString(2, p6, 2, 1, Citizen.ResultAsLong()))
    DataStruct2:SetInt32(3*8, 0)
    DataStruct2:SetInt32(4*8, p7)
    DataStruct2:SetInt32(5*8, p8)
    DataStruct:SetInt32(7*8, 1)

    return Citizen.InvokeNative(0xAFF5BE9BA496CE40, DataStruct:Buffer(), DataStruct2:Buffer(), true, true, collectableCategory)
end