---Returns true if the model hash is a portable pickup its used before creating a portable pick up for example.
---@param model Hash
---@return boolean
function IsModelAPortablePickup(model)
    return Citizen.InvokeNative(0x20135AF9C10D2A3D, model) == 1
end

---@param p0 Any
---@return integer
function N_0X08C5825A2932EA7B(p0)
    return Citizen.InvokeNative(0x08C5825A2932EA7B, p0, Citizen.ResultAsInteger())
end

---@param object Object
---@return integer
function N_0X250EBB11E81A10BE(object)
    return Citizen.InvokeNative(0X250EBB11E81A10BE, object, Citizen.ResultAsInteger())
end

---@param p0 Any
---@return boolean
function N_0X2BF1953C0C21AC88(p0)
    return Citizen.InvokeNative(0X2BF1953C0C21AC88, p0) == 1
end

---@param p0 Any
---@return integer
function N_0X7D4411D6736CD295(p0)
    return Citizen.InvokeNative(0X7D4411D6736CD295, p0, Citizen.PointerValueInt())
end

---@param model Hash
---@return boolean
function N_0X20135AF9C10D2A3D(model)
    return Citizen.InvokeNative(0X20135AF9C10D2A3D, model) == 1
end

---@param player Player
---@return integer
function N_0X3E2616E7EA539480(player)
    return Citizen.InvokeNative(0X3E2616E7EA539480, player, Citizen.ResultAsInteger())
end

---@param object Object
---@param p1 float
function N_0XCBFBD38F2E0A263B(object, p1)
    return Citizen.InvokeNative(0XCBFBD38F2E0A263B, object, p1)
end