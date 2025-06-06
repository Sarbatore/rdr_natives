---Returns the ambient speech parameters buffer
---@param soundRef string
---@param soundName string
---@param speechLine ?number
---@param speechParams ?number
---@param pedListener ?number
---@param isNetworked ?boolean
---@param p6 ?number
---@return string
function GetAmbientSpeechParamsBuffer(soundRef, soundName, speechLine, speechParams, pedListener, isNetworked, p6)
    soundRef = soundRef or 0
    speechLine = speechLine or 0
    speechParams = speechParams or 291934926
    pedListener = pedListener or 0
    isNetworked = isNetworked and 1 or 0
    p6 = p6 or 1
    
    local DataStruct = DataView.ArrayBuffer(7*8)
    DataStruct:SetInt64(0*8, VarString(10, "LITERAL_STRING", soundName, Citizen.ResultAsLong()))
    DataStruct:SetInt64(1*8, VarString(10, "LITERAL_STRING", soundRef, Citizen.ResultAsLong()))
    DataStruct:SetInt32(2*8, speechLine)
    DataStruct:SetInt64(3*8, speechParams)
    DataStruct:SetInt32(4*8, pedListener)
    DataStruct:SetInt32(5*8, isNetworked)
    DataStruct:SetInt32(6*8, p6)

    return DataStruct:Buffer()
end

--- Play an ambient speech from a ped
---@param ped number
---@param soundRef string
---@param soundName string
---@param speechLine ?number
---@param speechParams ?number
---@param pedListener ?number
---@param isNetworked ?boolean
---@param p6 ?number
---@return boolean
function PlayPedAmbientSpeech(ped, soundRef, soundName, speechLine, speechParams, pedListener, isNetworked, p6)
    local params = exports.rdr_natives:GetAmbientSpeechParamsBuffer(soundRef, soundName, speechLine, speechParams, pedListener, isNetworked, p6)
    return Citizen.InvokeNative(0x8E04FEDD28D42462, ped, params) == 1
end

--- Play an ambient speech from a position
---@param soundRef string
---@param soundName string
---@param x number
---@param y number
---@param z number
---@param speechLine ?number
---@param speechParams ?number
---@param pedListener ?number
---@param isNetworked ?boolean
---@param p6 ?number
---@return boolean
function PlayAmbientSpeechFromPosition(soundRef, soundName, x, y, z, speechLine, speechParams, pedListener, isNetworked, p6)
    local params = exports.rdr_natives:GetAmbientSpeechParamsBuffer(soundRef, soundName, speechLine, speechParams, pedListener, isNetworked, p6)
    return Citizen.InvokeNative(0xED640017ED337E45, x, y, z, params) == 1
end

---Returns the hash of the currently playing ambient speech of a ped [@aaron1a12]
---@param ped number
---@return hash
function GetCurrentAmbientSpeechHash(ped)
    return Citizen.InvokeNative(0x4A98E228A936DBCC, ped)
end

---Returns the hash of the last ambient speech played by a ped [@aaron1a12]
---@param ped number
---@return hash
function GetLastAmbientSpeechHash(ped)
    return Citizen.InvokeNative(0x6BFFB7C276866996, ped)
end

---Returns whether a ped can say a specific speech line [@aaron1a12]
---@param ped number
---@param soundName string
---@param speechParams hash
---@param speechLine integer 
---@return boolean
function CanPedSaySpeech(ped, soundName, speechParams, speechLine)
    return Citizen.InvokeNative(0x9D6DEC9791A4E501, ped, soundName, speechParams, speechLine)
end