---Returns a speech buffer
---@param speechName string
---@param speechRef string
---@param speechLine integer
---@param speechParamHash integer
---@param pedListener integer
---@param syncOverNetwork boolean
---@param p6 boolean
---@return Buffer
local function GetSpeechBuffer(speechName, speechRef, speechLine, speechParamHash, pedListener, syncOverNetwork, p6)
    local paramsStruct = DataView.ArrayBuffer(7*8)
        :SetInt64(0*8, LiteralStringLong(speechName))
        :SetInt64(1*8, LiteralStringLong(speechRef))
        :SetInt32(2*8, speechLine)
        :SetInt64(3*8, speechParamHash)
        :SetInt32(4*8, pedListener)
        :SetInt32(5*8, syncOverNetwork and 1 or 0)
        :SetInt32(6*8, p6 and 1 or 0)
    return paramsStruct:Buffer()
end

---Play ambient speech for a ped and return true if successful.
---@param ped integer
---@param speechRef string
---@param speechName string
---@param speechLine integer
---@param speechParamHash integer
---@param pedListener integer
---@param syncOverNetwork boolean
---@param p7 boolean
---@return boolean success
function PlayPedAmbientSpeechNative(ped, speechRef, speechName, speechParamHash, speechLine, pedListener, syncOverNetwork, p7)
    local buffer = GetSpeechBuffer(speechName, speechRef, speechLine, speechParamHash, pedListener, syncOverNetwork, p7)
    return Citizen.InvokeNative(0x8E04FEDD28D42462, ped, buffer) == 1
end

---Play ambient speech from a position and return true if successful.
---@param x number
---@param y number
---@param z number
---@param soundRef string
---@param soundName string
---@param speechLine integer
---@param speechParamHash integer
---@param pedListener integer
---@param syncOverNetwork boolean
---@param p9 boolean
---@return boolean success
function PlayAmbientSpeechFromPositionNative(x, y, z, soundRef, soundName,  speechLine, speechParamHash, pedListener, syncOverNetwork, p9)
    local buffer = GetSpeechBuffer(soundName, soundRef, speechLine, speechParamHash, pedListener, syncOverNetwork, p9)
    return Citizen.InvokeNative(0xED640017ED337E45, x, y, z, buffer) == 1
end

---Returns the hash of the currently playing ambient speech of a ped
---@param ped integer
---@return integer speechHash
function GetCurrentAmbientSpeechHash(ped)
    return Citizen.InvokeNative(0x4A98E228A936DBCC, ped, Citizen.ResultAsInteger())
end

---Returns the hash of the last ambient speech played by a ped
---@param ped integer
---@return integer speechHash
function GetLastAmbientSpeechHash(ped)
    return Citizen.InvokeNative(0x6BFFB7C276866996, ped, Citizen.ResultAsInteger())
end

---Returns whether a ped can say a specific speech line
---@param ped integer
---@param soundName string
---@param speechParamHash integer
---@param speechLine integer 
---@return boolean
function CanPedSaySpeech(ped, soundName, speechParamHash, speechLine)
    return Citizen.InvokeNative(0x9D6DEC9791A4E501, ped, soundName, speechParamHash, speechLine) == 1
end

---Creates a new scripted speech instance for a ped and returns its identifier
---@param ped integer
---@param speechRef string
---@param speechName string
---@param speechLine integer
---@param speechParamHash integer
---@param pedListener integer
---@param syncOverNetwork boolean
---@param p7 boolean
---@return integer
function CreateNewScriptedSpeech(ped, speechRef, speechName, speechLine, speechParamHash, pedListener, syncOverNetwork, p7)
    local buffer = GetSpeechBuffer(speechName, speechRef, speechLine, speechParamHash, pedListener, syncOverNetwork, p7)
    return Citizen.InvokeNative(0x72E4D1C4639BC465, ped, buffer, Citizen.ResultAsInteger())
end

---Play the scripted speech.
---@param scriptedSpeech integer
function PlaySoundFromScriptedSpeech(scriptedSpeech)
    Citizen.InvokeNative(0xB18FEC133C7C6C69, scriptedSpeech)
end

---
---@param p0 number
function N_0x7678FE0455ED1145(p0)
    local paramsStruct = DataView.ArrayBuffer(1*8)
        :SetFloat32(0, p0)
    local outStruct1 = DataView.ArrayBuffer(10*8)
    local outStruct2 = DataView.ArrayBuffer(10*8)
    Citizen.InvokeNative(0x7678FE0455ED1145, outStruct1:Buffer(), paramsStruct:Buffer(), outStruct2:Buffer())
end