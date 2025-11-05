---Relocates an existing prop set to specified coordinates and adjusts its heading (rotation) without affecting the prop set's internal layout or structure. The propSet parameter identifies the prop set to move. The parameters (coordsX, coordsY, coordsZ) set the new central position of the prop set, while heading specifies its rotation around the Z-axis (in degrees). When onGroundProperly is true, the prop set automatically aligns accurately with the terrain.
---@param propSet number
---@param x float
---@param y float
---@param z float
---@param onGroundProperly boolean
---@param heading float
function ModifyPropSetCoordsAndHeading(propSet, x, y, z, onGroundProperly, heading)
    Citizen.InvokeNative(0xC4B67EF3FD65622D, propSet, x, y, z, onGroundProperly, heading)
end