---Returns the ambient speech parameters buffer
---@param speechRef string
---@param speechName string
---@param speechLine ?number
---@param speechParam ?number
---@param pedListener ?number
---@param syncOverNetwork ?bool
---@return Buffer
function GetAmbientSpeechBuffer(speechRef, speechName, speechLine, speechParam, pedListener, syncOverNetwork)
    speechRef = speechRef or 0
    speechLine = speechLine or 0
    speechParam = speechParam or 291934926
    pedListener = pedListener or 0
    syncOverNetwork = syncOverNetwork and 1 or 0
    
    local DataStruct = DataView.ArrayBuffer(7*8)
    DataStruct:SetInt64(0*8, VarString(10, "LITERAL_STRING", speechName, Citizen.ResultAsLong()))
    DataStruct:SetInt64(1*8, VarString(10, "LITERAL_STRING", speechRef, Citizen.ResultAsLong()))
    DataStruct:SetInt32(2*8, speechLine)
    DataStruct:SetInt64(3*8, speechParam)
    DataStruct:SetInt32(4*8, pedListener)
    DataStruct:SetInt32(5*8, syncOverNetwork)
    DataStruct:SetInt32(6*8, 1)

    return DataStruct:Buffer()
end

--- Play an ambient speech from a ped
---@param ped number
---@param speechRef string
---@param speechName string
---@param speechLine ?number
---@param speechParam ?number
---@param pedListener ?number
---@param syncOverNetwork ?bool
function PlayPedAmbientSpeechNative(ped, speechRef, speechName, speechParam, speechLine, pedListener, syncOverNetwork)
    local buffer = exports.rdr_natives:GetAmbientSpeechBuffer(speechRef, speechName, speechLine, speechParam, pedListener, syncOverNetwork)
    return Citizen.InvokeNative(0x8E04FEDD28D42462, ped, buffer) == 1
end

--- Play an ambient speech from a position
---@param soundRef string
---@param soundName string
---@param x number
---@param y number
---@param z number
---@param speechLine ?number
---@param speechParam ?number
---@param pedListener ?number
---@param syncOverNetwork ?bool
---@return boolean
function PlayAmbientSpeechFromPositionNative(soundRef, soundName, x, y, z, speechLine, speechParam, pedListener, syncOverNetwork)
    local buffer = exports.rdr_natives:GetAmbientSpeechBuffer(soundRef, soundName, speechLine, speechParam, pedListener, syncOverNetwork)
    return Citizen.InvokeNative(0xED640017ED337E45, x, y, z, buffer) == 1
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
---@param speechParam hash
---@param speechLine integer 
---@return boolean
function CanPedSaySpeech(ped, soundName, speechParam, speechLine)
    return Citizen.InvokeNative(0x9D6DEC9791A4E501, ped, soundName, speechParam, speechLine)
end