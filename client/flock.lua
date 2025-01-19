---Return whether the ped is in the herd or not
---@param herd Herd
---@param ped Ped
---@return boolean
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

---Return the last ped index?
---@param herd Herd
---@return number
function N_0x34B9C4D86DF2C2F3(herd)
	return Citizen.InvokeNative(0x34B9C4D86DF2C2F3, herd)
end

---@param species hash
---@param x float
---@param y float
---@param z float
function N_0x0816C31480764AB0(species, x, y, z)
	Citizen.InvokeNative(0x0816C31480764AB0, species, x, y, z)
end

---
---@param species hash
function N_0xFB16F08F47B83B4C(species)
	Citizen.InvokeNative(0xFB16F08F47B83B4C, species)
end

---Works with 0x6C57BEA886A20C6B
---@param herd Herd
---@return boolean
function N_0x36486AF7DA93A464(herd)
	return Citizen.InvokeNative(0x36486AF7DA93A464, herd)
end

---Works with 0x36486AF7DA93A464
---@param herd Herd
---@param state boolean
function N_0x6C57BEA886A20C6B(herd, state)
	return Citizen.InvokeNative(0x6C57BEA886A20C6B, herd, state)
end

---
---@param herd Herd
---@param x float
---@param y float
---@param z float
---@param p4 float
---@param p5 float
---@param p6 float
---@return integer
function N_0x09EE00B8F858E0BE(herd, x, y, z, p4, p5, p6)
	return Citizen.InvokeNative(0x09EE00B8F858E0BE, herd, x, y, z, p4, p5, p6)
end

---
---@param herd number
---@param p1 number
---@param x number
---@param y number
---@param z number
---@param p4 float
---@param p5 float
---@param p6 float
function N_0xE36D2CB540597EF7(herd, p1, x, y, z, p4, p5, p6)
	Citizen.InvokeNative(0xE36D2CB540597EF7, herd, p1, x, y, z, p4, p5, p6)
end

---
---@param herd Herd
---@param p1 integer
---@param p2 integer
function N_0x17E3E5C46ECCD308(herd, p1, p2)
	Citizen.InvokeNative(0x17E3E5C46ECCD308, herd, p1, p2)
end

---
---@param herd Herd
---@param p1 integer
---@return boolean
function N_0xD95F04A4E73BE85E(herd, p1)
	return Citizen.InvokeNative(0xD95F04A4E73BE85E, herd, p1)
end

---
---@param herd Herd
---@param p1 integer
function N_0x1520626FFAFFFA8F(herd, p1)
	Citizen.InvokeNative(0x1520626FFAFFFA8F, herd, p1)
end

---
---@param herd Herd
---@return vector3
function N_0x1DA6CB02071055D5(herd)
	return Citizen.InvokeNative(0x1DA6CB02071055D5, herd)
end

---
---@param ped Ped
---@param p1 float
function N_0x2DF3D457D86F8E57(ped, p1)
	Citizen.InvokeNative(0x2DF3D457D86F8E57, ped, p1)
end

---
---@param ped Ped
---@param p1 float
---@param p2 float
function N_0xFDB008B3BCF5992F(ped, p1, p2)
	Citizen.InvokeNative(0xFDB008B3BCF5992F, ped, p1, p2)
end

---
---@param model hash
---@return hash
function N_0x53187E563F938E76(model)
	return Citizen.InvokeNative(0x53187E563F938E76, model)
end

---
---@param p0 float
function N_0x706B434FEFAD6A24(p0)
	Citizen.InvokeNative(0x706B434FEFAD6A24, p0)
end

---
---@param p0 float
function N_0xA881F5C77A560906(p0)
	Citizen.InvokeNative(0xA881F5C77A560906, p0)
end

---p1 is the return of 0xE93415B3307208E5
---@param species hash
---@param p1 integer
function N_0xC3D581A34BC0A1F0(species, p1)
	Citizen.InvokeNative(0xC3D581A34BC0A1F0, species, p1)
end

---p1 is the return of 0xE93415B3307208E5
---@param species hash
---@param p1 integer
---@return boolean
function N_0x19870C40C7EE15BE(species, p1)
	return Citizen.InvokeNative(0x19870C40C7EE15BE, species, p1)
end

---
---@param species hash
---@param x float
---@param y float
---@param z float
---@param p4 float
---@param p5 float
---@param p6 float
function N_0x8049B17BEC937662(species, x, y, z, p4, p5, p6)
	Citizen.InvokeNative(0x8049B17BEC937662, species, x, y, z, p4, p5, p6)
end

---
---@param herd Herd
---@param ped Ped
---@param p2 float
---@param p3 float
function N_0xC72CE37081DAE625(herd, ped, p2, p3)
	Citizen.InvokeNative(0xC72CE37081DAE625, herd, ped, p2, p3)
end

---
---@param herd Herd
---@param p1 integer
---@param p2 integer
---@param p3 float
function N_0xC95611869E14F8AF(herd, p1, p2, p3)
	Citizen.InvokeNative(0xC95611869E14F8AF, herd, p1, p2, p3)
end

---
---@param herd Herd
---@param p1 integer
---@param p2 float
function N_0xCC6B5AAFC87BFC7B(herd, p1, p2)
	Citizen.InvokeNative(0xCC6B5AAFC87BFC7B, herd, p1, p2)
end

---
---@param species hash
---@param ped Ped
---@param p1 float
---@param p2 float
---@param p3 float
---@param p4 float
---@param p5 float
---@param p6 float
---@param p7 integer
---@param herd Herd
---@return number
function N_0xE93415B3307208E5(species, ped, p1, p2, p3, p4, p5, p6, p7)
	return Citizen.InvokeNative(0xE93415B3307208E5, species, ped, p1, p2, p3, p4, p5, p6, p7)
end

---
---@param species hash
---@param x float
---@param y float
---@param z float
---@param p4 float
---@param p5 float
---@param p6 float
---@param p7 float
---@param p8 float
---@param p9 float
---@param p10 float
---@param p11 float
---@param p12 float
---@param p13 float
function N_0xF2CCA7B68CFAB2B9(species, x, y, z, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
	Citizen.InvokeNative(0xF2CCA7B68CFAB2B9, species, x, y, z, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13))
end

---
---@param herd Herd
---@param p1 integer
---@param p2 float
function N_0xFA821997794F48E7(herd, p1, p2)
	Citizen.InvokeNative(0xFA821997794F48E7, herd, p1, p2)
end

---
---@param ped Ped
---@param p1 integer
function N_0xFF1E339CE40EAAAF(ped, p1)
	Citizen.InvokeNative(0xFF1E339CE40EAAAF, ped, p1)
end