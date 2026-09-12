---
---@param toast string
---@param body string
---@param p2 integer
---@param p3 integer
---@param p4 any
---@param p5 integer range 0-3
---@return boolean
function UilogPostNotification(toast, body, p2, p3, p4, p5)
    local paramsStruct = DataView.ArrayBuffer(8*8)
        :SetInt64(0*8, LiteralStringLong(toast))
        :SetInt64(1*8, LiteralStringLong(body))
        :SetInt32(2*8, p2) -- toast_rpg_level_health, toast_rpg_level_stamina, toast_rpg_level_deadeye
        :SetInt32(3*8, p3) -- TOAST_RPG_LEVEL_<+0>_<+0>
        :SetInt32(4*8, p4)
        :SetInt32(5*8, p5) -- 0, 1, 2, 3
    
    return Citizen.InvokeNative(0x49E58FE6EF40B987, paramsStruct:Buffer()) == 1
end