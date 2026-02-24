---
---@param toast string
---@param body string
---@param p2 integer
---@param p3 integer
---@param p4 any
---@param p5 integer range 0-3
---@return boolean
function UilogPostNotification(toast, body, p2, p3, p4, p5)
    local data = DataView.ArrayBuffer(8*8)
    if (toast ~= "") then
        data:SetInt64(0*8, VarString(10, "LITERAL_STRING", toast, Citizen.ResultAsLong()))
    end
    if (body ~= "") then
        data:SetInt64(1*8, VarString(10, "LITERAL_STRING", body, Citizen.ResultAsLong()))
    end
    data:SetInt32(2*8, p2 or 0) -- toast_rpg_level_health, toast_rpg_level_stamina, toast_rpg_level_deadeye
    data:SetInt32(3*8, p3 or 0) -- TOAST_RPG_LEVEL_<+0>_<+0>
    data:SetInt32(4*8, p4 or 1)
    data:SetInt32(5*8, p5 or 0) -- 0, 1, 2, 3
    local res = Citizen.InvokeNative(0x49E58FE6EF40B987, data:Buffer()) == 1

    return res
end