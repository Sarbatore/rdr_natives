---Returns the ambient speech parameters buffer
---@param soundRef string
---@param soundName string
---@param speechParams hash
---@param speechLine integer
---@return string
function GetAmbientSpeechParamsBuffer(soundRef, soundName, speechParams, speechLine)
    local DataStruct = DataView.ArrayBuffer(7*8)
    DataStruct:SetInt64(0*8, VarString(10, "LITERAL_STRING", soundName, Citizen.ResultAsLong()))
    DataStruct:SetInt64(1*8, VarString(10, "LITERAL_STRING", soundRef, Citizen.ResultAsLong()))
    DataStruct:SetInt32(2*8, speechLine)
    DataStruct:SetInt64(3*8, speechParams)
    DataStruct:SetInt32(4*8, 0)
    DataStruct:SetInt32(5*8, 1)
    DataStruct:SetInt32(6*8, 1)

    return DataStruct:Buffer()
end

--- Play an ambient speech from a ped
---@param ped number
---@param soundRef string
---@param soundName string
---@param speechParams hash
---@param speechLine integer
---@return boolean
function PlayPedAmbientSpeech(ped, soundRef, soundName, speechParams, speechLine)
    local params = exports.redm_natives:GetAmbientSpeechParamsBuffer(soundRef, soundName, speechParams, speechLine)
    return Citizen.InvokeNative(0x8E04FEDD28D42462, ped, params)
end

--- Play an ambient speech from a position
---@param x number
---@param y number
---@param z number
---@param soundRef string
---@param soundName string
---@param speechParams hash
---@param speechLine integer
function PlayAmbientSpeechFromPosition(x, y, z, soundRef, soundName, speechParams, speechLine)
    local params = exports.redm_natives:GetAmbientSpeechParamsBuffer(soundRef, soundName, speechParams, speechLine)
    return Citizen.InvokeNative(0xED640017ED337E45, x, y, z, params)
end