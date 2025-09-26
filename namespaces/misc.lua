---Disables composite pick promp
---@param composite integer
---@param disable boolean
function DisableCompositePickPromptThisFrame(composite, disable)
    Citizen.InvokeNative(0x082C043C7AFC3747, composite, disable)
end

---Disables composite eat prompt
---@param composite integer
---@param disable boolean
function DisableCompositeEatPromptThisFrame(composite, disable)
    Citizen.InvokeNative(0x40D72189F46D2E15, composite, disable)
end