--- Will add a blip icon to the entity lockon prompt. [@outsider]
function SetBlipIconLockonEntityPrompt(entity, blipHash) 
    Citizen.InvokeNative(0x7563CBCA99253D1A, entity, blipHash)
end

--- Will remove the blip icon from the entity lockon prompt. [@outsider]
function ClearExistingBlipFromLockonEntityPrompt(entity, blipId)
    Citizen.InvokeNative(0x44813684F72B563C, entity, blipId)
end

--- Will add a blip icon to the entity lockon prompt, if wrong param will remove the icon if had any. [@outsider]
function SetExistingBlipLockonEntityPrompt(entity, blipId)
    Citizen.InvokeNative(0x97F6F158CC5B5CA2, entity, blipId)
end

---Free up memory from the blip. [@sarbatore]
function ClearBlip(blip)
    Citizen.InvokeNative(0x01B928CA2E198B01, blip)
end

---Return whether a GPS marker is set. [@sarbatore]
---@return boolean
function IsGPSActive()
    return Citizen.InvokeNative(0xF47A1EB2A538A3A3)
end