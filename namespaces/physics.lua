---
---@param rope integer
---@param lenght number
function RopeForceLenght(rope, lenght)
    Citizen.InvokeNative(0x1FC92BDBA1106BD2, rope, lenght)
end