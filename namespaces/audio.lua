---Returns the ambient speech parameters buffer
---@param speechRef string
---@param speechName string
---@param speechLine ?integer
---@param speechParam ?Hash
---@param pedListener ?Ped
---@param syncOverNetwork ?boolean
---@return Buffer
local function GetAmbientSpeechBuffer(speechRef, speechName, speechLine, speechParam, pedListener, syncOverNetwork)
    speechRef = speechRef or 0
    speechLine = speechLine or 0
    speechParam = speechParam or 291934926
    pedListener = pedListener or 0
    syncOverNetwork = syncOverNetwork and 1 or 0
    
    local struct = DataView.ArrayBuffer(7*8)
    struct:SetInt64(0*8, VarString(10, "LITERAL_STRING", speechName, Citizen.ResultAsLong()))
    struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", speechRef, Citizen.ResultAsLong()))
    struct:SetInt32(2*8, speechLine)
    struct:SetInt64(3*8, speechParam)
    struct:SetInt32(4*8, pedListener)
    struct:SetInt32(5*8, syncOverNetwork)
    struct:SetInt32(6*8, 1)

    return struct:Buffer()
end

--- Play an ambient speech from a ped
---@param ped Ped
---@param speechRef string
---@param speechName string
---@param speechLine ?integer
---@param speechParam ?Hash
---@param pedListener ?Ped
---@param syncOverNetwork ?boolean
function PlayPedAmbientSpeechNative(ped, speechRef, speechName, speechParam, speechLine, pedListener, syncOverNetwork)
    local buffer = exports.rdr_natives:GetAmbientSpeechBuffer(speechRef, speechName, speechLine, speechParam, pedListener, syncOverNetwork)
    return Citizen.InvokeNative(0x8E04FEDD28D42462, ped, buffer) == 1
end

--- Play an ambient speech from a position
---@param soundRef string
---@param soundName string
---@param x float
---@param y float
---@param z float
---@param speechLine ?integer
---@param speechParam ?Hash
---@param pedListener ?Ped
---@param syncOverNetwork ?boolean
---@return boolean
function PlayAmbientSpeechFromPositionNative(soundRef, soundName, x, y, z, speechLine, speechParam, pedListener, syncOverNetwork)
    local buffer = exports.rdr_natives:GetAmbientSpeechBuffer(soundRef, soundName, speechLine, speechParam, pedListener, syncOverNetwork)
    return Citizen.InvokeNative(0xED640017ED337E45, x, y, z, buffer) == 1
end

---Returns the hash of the currently playing ambient speech of a ped [@aaron1a12]
---@param ped Ped
---@return Hash
function GetCurrentAmbientSpeechHash(ped)
    return Citizen.InvokeNative(0x4A98E228A936DBCC, ped, Citizen.ResultAsInteger())
end

---Returns the hash of the last ambient speech played by a ped [@aaron1a12]
---@param ped Ped
---@return Hash
function GetLastAmbientSpeechHash(ped)
    return Citizen.InvokeNative(0x6BFFB7C276866996, ped, Citizen.ResultAsInteger())
end

---Returns whether a ped can say a specific speech line [@aaron1a12]
---@param ped Ped
---@param soundName string
---@param speechParam Hash
---@param speechLine integer 
---@return boolean
function CanPedSaySpeech(ped, soundName, speechParam, speechLine)
    return Citizen.InvokeNative(0x9D6DEC9791A4E501, ped, soundName, speechParam, speechLine) == 1
end