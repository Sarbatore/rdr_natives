---Returns true if the model hash is a portable pickup its used before creating a portable pick up for example.
---@param model Hash
---@return boolean
function IsModelAPortablePickup(model)
    return Citizen.InvokeNative(0x20135AF9C10D2A3D, model, Citizen.ResultAsInteger()) == 1
end