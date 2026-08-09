---
---@param statCategoryHash integer
---@param statNameHash integer
---@return boolean isValid
function StatIdIsValid(statCategoryHash, statNameHash)
    local paramsStruct = DataView.ArrayBuffer(2*8)
    paramsStruct:SetInt32(0*8, statCategoryHash)
    paramsStruct:SetInt32(1*8, statNameHash)

    return Citizen.InvokeNative(0xC48FE1971C9743FF, paramsStruct:Buffer()) == 1
end

---
---@param statCategoryHash integer
---@param statNameHash integer
---@return boolean success
---@return boolean value
function StatIdGetBool(statCategoryHash, statNameHash)
    local paramsStruct = DataView.ArrayBuffer(2*8)
    paramsStruct:SetInt32(0*8, statCategoryHash)
    paramsStruct:SetInt32(1*8, statNameHash)
    local outStruct = DataView.ArrayBuffer(1*8)

    local success = Citizen.InvokeNative(0x11B5E6D2AE73F48F, paramsStruct:Buffer(), outStruct:Buffer()) == 1

    return success, outStruct:GetInt32(0) == 1
end

---
---@param statCategoryHash integer
---@param statNameHash integer
---@param value boolean
---@param p3 boolean
---@return boolean success
function StatIdSetBool(statCategoryHash, statNameHash, value, p3)
    local paramsStruct = DataView.ArrayBuffer(2*8)
    paramsStruct:SetInt32(0*8, statCategoryHash)
    paramsStruct:SetInt32(1*8, statNameHash)

    return Citizen.InvokeNative(0x3B5107353267D7A1, paramsStruct:Buffer(), value, p3) == 1
end

---
---@param statCategoryHash integer
---@param statNameHash integer
---@return boolean success
---@return number value
function StatIdGetFloat(statCategoryHash, statNameHash)
    local paramsStruct = DataView.ArrayBuffer(2*8)
    paramsStruct:SetInt32(0*8, statCategoryHash)
    paramsStruct:SetInt32(1*8, statNameHash)
    local outStruct = DataView.ArrayBuffer(1*8)

    local success = Citizen.InvokeNative(0xD7AE6C9C9C6AC54D, paramsStruct:Buffer(), outStruct:Buffer()) == 1

    return success, outStruct:GetFloat32(0)
end

---
---@param statCategoryHash integer
---@param statNameHash integer
---@param value number
---@param p3 boolean
---@return boolean success
function StatIdSetFloat(statCategoryHash, statNameHash, value, p3)
    local paramsStruct = DataView.ArrayBuffer(2*8)
    paramsStruct:SetInt32(0*8, statCategoryHash)
    paramsStruct:SetInt32(1*8, statNameHash)

    return Citizen.InvokeNative(0x481BDF6A10C5EF68, paramsStruct:Buffer(), value, p3) == 1
end

---
---@param statCategoryHash integer
---@param statNameHash integer
---@return boolean success
---@return integer value
function StatIdGetInt(statCategoryHash, statNameHash)
    local paramsStruct = DataView.ArrayBuffer(2*8)
    paramsStruct:SetInt32(0*8, statCategoryHash)
    paramsStruct:SetInt32(1*8, statNameHash)
    local outStruct = DataView.ArrayBuffer(1*8)

    local success = Citizen.InvokeNative(0x767FBC2AC802EF3E, paramsStruct:Buffer(), outStruct:Buffer()) == 1

    return success, outStruct:GetInt32(0)
end

---
---@param statCategoryHash integer
---@param statNameHash integer
---@param value integer
---@param p3 boolean
---@return boolean success
function StatIdSetInt(statCategoryHash, statNameHash, value, p3)
    local paramsStruct = DataView.ArrayBuffer(2*8)
    paramsStruct:SetInt32(0*8, statCategoryHash)
    paramsStruct:SetInt32(1*8, statNameHash)

    return Citizen.InvokeNative(0xA4DDF5DF95E65EEE, paramsStruct:Buffer(), value, p3) == 1
end