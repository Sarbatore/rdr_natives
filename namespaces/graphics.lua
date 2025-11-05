---
---@param vegModifier integer
function RemoveVegModifier(vegModifier)
    Citizen.InvokeNative(0x9CF1836C03FB67A2, Citizen.PointerValueIntInitialized(vegModifier), 0)
end