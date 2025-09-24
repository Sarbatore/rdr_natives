---Return whether the ped is in the herd or not
---@param herd Herd
---@param ped Ped
---@return bool
function IsPedInHerd(herd, ped)
	return Citizen.InvokeNative(0x9E13ACC38BA8F9C3, herd, ped)
end

---Remove a ped from a herd.
---@param herd Herd
---@param ped Ped
function RemoveHerdPed(herd, ped)
	Citizen.InvokeNative(0x408D1149C5E39C1E, herd, ped)
end

---Clear a herd.
---@param herd Herd
function ClearHerd(herd)
	Citizen.InvokeNative(0x67A43EA3F6FE0076, herd)
end

---Delete and invalidate a herd.
---@param herd Herd
function DeleteHerd(herd)
	Citizen.InvokeNative(0xE0961AED72642B80, herd)
end