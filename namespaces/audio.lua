---Returns a speech buffer
---@param speechName string
---@param speechRef string
---@param speechLine integer
---@param speechParam Hash
---@param listener Ped
---@param syncOverNetwork boolean
---@param p6 boolean
---@return Buffer
local function GetSpeechBuffer(speechName, speechRef, speechLine, speechParam, listener, syncOverNetwork, p6)
    local struct = DataView.ArrayBuffer(7*8)
    struct:SetInt64(0*8, VarString(10, "LITERAL_STRING", speechName, Citizen.ResultAsLong()))
    struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", speechRef, Citizen.ResultAsLong()))
    struct:SetInt32(2*8, speechLine)
    struct:SetInt64(3*8, speechParam)
    struct:SetInt32(4*8, listener)
    struct:SetInt32(5*8, syncOverNetwork and 1 or 0)
    struct:SetInt32(6*8, p6 and 1 or 0)

    return struct:Buffer()
end

--[[

]]

---Play ambient speech for a ped and return true if successful.
---@param ped Ped
---@param speechRef string
---@param speechName string
---@param speechLine integer
---@param speechParam Hash
---@param pedListener Ped
---@param syncOverNetwork boolean
---@param p7 boolean
---@return boolean
function PlayPedAmbientSpeechNative(ped, speechRef, speechName, speechParam, speechLine, pedListener, syncOverNetwork, p7)
    local buffer = GetSpeechBuffer(speechName, speechRef, speechLine, speechParam, pedListener, syncOverNetwork, p7)
    return Citizen.InvokeNative(0x8E04FEDD28D42462, ped, buffer) == 1
end

---Play ambient speech from a position and return true if successful.
---@param x float
---@param y float
---@param z float
---@param soundRef string
---@param soundName string
---@param speechLine integer
---@param speechParam Hash
---@param pedListener Ped
---@param syncOverNetwork, boolean
---@param p9 boolean
---@return boolean
function PlayAmbientSpeechFromPositionNative(x, y, z, soundRef, soundName,  speechLine, speechParam, pedListener, syncOverNetwork, p9)
    local buffer = GetSpeechBuffer(soundName, soundRef, speechLine, speechParam, pedListener, syncOverNetwork, p9)
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

---Creates a new scripted speech instance for a ped and returns its identifier
---@param ped Ped
---@param speechRef string
---@param speechName string
---@param speechLine integer
---@param speechParam Hash
---@param pedListener Ped
---@param syncOverNetwork boolean
---@param p7 boolean
---@return integer
function CreateNewScriptedSpeech(ped, speechRef, speechName, speechLine, speechParam, pedListener, syncOverNetwork, p7)
    local buffer = GetSpeechBuffer(speechName, speechRef, speechLine, speechParam, pedListener, syncOverNetwork, p7)
    return Citizen.InvokeNative(0x72E4D1C4639BC465, ped, buffer, Citizen.ResultAsInteger())
end

---Play the scripted speech.
---@param scriptedSpeech integer
function PlaySoundFromScriptedSpeech(scriptedSpeech)
    Citizen.InvokeNative(0xB18FEC133C7C6C69, scriptedSpeech)
end

---
---@param p0 float
---@return integer
function N_0X7678FE0455ED1145(p0)
    local outData = DataView.ArrayBuffer(10*8)
    local outData2 = DataView.ArrayBuffer(10*8)
    Citizen.InvokeNative(0X7678FE0455ED1145, outData:Buffer(), p0, outData2:Buffer())

    local unk = outData2:GetInt32(0*8)

    return unk
end