---Return scenario points in the area.
---@param x number
---@param y number
---@param z number
---@param radius number
---@param size integer
---@return boolean, table
function GetScenarioPointsInArea(x, y, z, radius, size)
    local outData = DataView.ArrayBuffer((size+1)*8)
    outData:SetInt32(0*8, size)

    local res = Citizen.InvokeNative(0x345EC3B7EBDE1CB5, x, y, z, radius, outData:Buffer(), size) == 1
    local scenarioPoints = {}
    local i = 1
    while (i <= size and DoesScenarioPointExist(outData:GetInt32(i*8)) == 1) do
        table.insert(scenarioPoints, outData:GetInt32(i*8))
        i = i + 1
    end
    
    return res, scenarioPoints
end

---
---@param ped integer
---@param pickup Pickup
function TaskPickUpWeapon(ped, pickup)
    Citizen.InvokeNative(0x55B0ECFD98596624, ped, pickup)
end

---Loads the carriable config hash
---@param carriableConfigHash integer
function LoadCarriableConfigHash(carriableConfigHash)
    Citizen.InvokeNative(0xFF745B0346E19E2C, carriableConfigHash)
end

---Checks if the carriable config hash has been loaded
---@param carriableConfigHash integer
---@return boolean
function HasCarriableConfigHashLoaded(carriableConfigHash)
    return Citizen.InvokeNative(0xB8F52A3F84A7CC59, carriableConfigHash) == 1
end

---Returns the entity coverpoint with offset
---@param entity integer
---@param xOffset number
---@param yOffset number
---@param zOffset number
---@param heading number
---@param p5 integer
---@param p6 integer
---@param p7 integer
---@param p8 integer
---@return integer
function GetCoverpointFromEntityWithOffset(entity, xOffset, yOffset, zOffset, heading, p5, p6, p7, p8)
    return Citizen.InvokeNative(0x59872EA4CBD11C56, entity, xOffset, yOffset, zOffset, heading, p5, p6, p7, p8, Citizen.ResultAsInteger())
end

---Return whether the scenario is in use or not.
---@param scenarioHash integer
---@return boolean
function IsScenarioInUse(scenarioHash)
    return Citizen.InvokeNative(0x1ACBC313966C21F3, scenarioHash) == 1
end

---Returns true if the specified mount (horse) is currently being led by the player, otherwise false.
---@param horsePed integer
---@return boolean
function IsPedBeingLed(horsePed)
    return Citizen.InvokeNative(0xAC5045AB7F1A34FD, horsePed) == 1
end

---Returns the total number of compartments (drawers, lids, etc.) the specified scenario container entity has.
---@param object integer
---@return integer
function GetScenarioContainerNumCompartments(object)
    return Citizen.InvokeNative(0x640A602946A8C972, object, Citizen.ResultAsInteger())
end

---Returns the number of currently open compartments for the specified scenario container entity.
---@param object integer
---@return integer
function GetScenarioContainerNumOpenCompartments(object)
    return Citizen.InvokeNative(0x849791EBBDBA0362, object, Citizen.ResultAsInteger())
end

---Returns the total number of lootable items currently inside the specified scenario container entity.
---@param object integer
---@return integer
function GetScenarioContainerRemainingLootCount(object)
    return Citizen.InvokeNative(0x01AF8A3729231A43, object, Citizen.ResultAsInteger())
end

---Returns the current progress of the "Break Free" prompt when the specified ped is hogtied or knocked out.
---@param ped integer
---@return number
function GetPedWritheBreakFreeProgress(ped)
    return Citizen.InvokeNative(0x03D741CB4052E26C, ped, Citizen.ResultAsFloat())
end

---Configures how an intimidated/hogtied ped faces the player.
---@param ped integer
---@param useLimits boolean
---@param minAngle number
---@param maxAngle number
function SetIntimitatedFacingAngle(ped, useLimits, minAngle, maxAngle)
    Citizen.InvokeNative(0x0FE797DD9F70DFA6, ped, useLimits, minAngle, maxAngle)
end

---Clears all active tasks assigned to the specified vehicle.
---@param vehicle integer
function ClearVehicleTasks(vehicle)
    Citizen.InvokeNative(0x141BC64C8D7C5529, vehicle)
end

---
---@param ped integer
---@param x number
---@param y number
---@param z number
---@param p4 integer
---@param p5 boolean
---@param p6 boolean
function TaskForceAimAtCoord(ped, x, y, z, p4, p5, p6)
    Citizen.InvokeNative(0x41323F4E0C4AE94B, ped, x, y, z, p4, p5, p6)
end

---Reset all scenario points in area.
---@param x number
---@param y number
---@param z number
---@param radius number
function ResetScenarioPointsInArea(x, y, z, radius)
    Citizen.InvokeNative(0x4161648394262FDF, x, y, z, radius)
end

---Set which seat index acts as the "driver seat" for driving tasks.
---@param vehicle integer
---@param seatIndex integer
function SetDrivingSeat(vehicle, seatIndex)
    Citizen.InvokeNative(0x4BA972D0E5AD8122, vehicle, seatIndex)
end

---Return the seat index currently set as the "driving seat" for the specified vehicle.
---@param vehicle integer
---@return integer
function GetDrivingSeat(vehicle)
    return Citizen.InvokeNative(0xE62754D09354F6CF, vehicle, Citizen.ResultAsInteger())
end

---Checks if the ped can/look is directed at the given coord within the specified radius.
---@param ped integer
---@param x number
---@param y number
---@param z number
---@param radius number
---@return boolean
function IsPedLookingAtCoord(ped, x, y, z, radius)
    return Citizen.InvokeNative(0x508F5053E3F6F0C4, ped, x, y, z, radius) == 1
end

---Checks if the vehicle's current drive-to destination matches the given coordinates.
---@param vehicle integer
---@param x number
---@param y number
---@param z number
---@return boolean
function TaskVehicleIsAtDestination(vehicle, x, y, z)
    return Citizen.InvokeNative(0x583AE9AF9CEE0958, vehicle, x, y, z) == 1
end

---Checks if the given ped is currently in combat using a ranged weapon and is ready to shoot (actively attempting to attack).
---@param ped integer
---@return boolean
function GetTaskCombatReadyToShoot(ped)
    return Citizen.InvokeNative(0x5EA655F01D93667A, ped) == 1
end

---Retrieves chained scenario points linked to the given parent scenario.
---@param scenarioHash integer
---@param toggle boolean
---@return table
function GetLinkedScenarioPoints(scenarioHash, toggle)
    local outData = DataView.ArrayBuffer(16*8)
    
    local numScenarioPoints = Citizen.InvokeNative(0xE7BBC4E56B989449, scenarioHash, outData:Buffer(), toggle, Citizen.ResultAsInteger())
    local scenarioPoints = {}
    for i = 0, numScenarioPoints - 1 do
        table.insert(scenarioPoints, outData:GetInt32(i*8))
    end

    return scenarioPoints
end

---Remove/unload a previously loaded carriable config.
---@param carriableConfigHash integer
function RemoveCarriableConfigHash(carriableConfigHash)
    Citizen.InvokeNative(0x6AFDA2264925BD11, carriableConfigHash)
end

---Return a coarse state for the "mount leap" task when a ped jumps from their horse onto another horse, a wagon, or a train.
---@param ped integer
---@return integer
function GetPedMountLeapState(ped)
    return Citizen.InvokeNative(0x9420FB11B8D77948, ped, Citizen.ResultAsInteger())
end

---Return a normalized progress value (≈0.0 → 1.0) for the "mount leap" task as a ped jumps from their horse onto another horse, a wagon, or a train.
---@param ped integer
---@return number
function GetPedMountLeapProgress(ped)
    return Citizen.InvokeNative(0x6BA606AB3A83BC4D, ped, Citizen.ResultAsFloat())
end

---Enables or disables the context/prompt associated with a given carriable config hash.
---@param carriableConfigHash integer
---@param toggle boolean
function SetCarriableConfigPromptEnabled(carriableConfigHash, toggle)
    Citizen.InvokeNative(0x816A3ACD265E2297, carriableConfigHash, toggle)
end

---Attempts to finish/advance a ped’s ongoing scenario transition (between scenario clips/anims).
---@param ped integer
---@param phaseOrDelta number
function FinishScenarioTransition(ped, phaseOrDelta)
    return Citizen.InvokeNative(0x90703A8F75EE4ABD, ped, phaseOrDelta) == 1
end

---Requests that the given carriable hat be assigned for equip by the ped.
---@param hatObject integer
---@param ped integer
function RequestCarriableHatEquipToPed(hatObject, ped)
    Citizen.InvokeNative(0x9ADDBB9242179D56, hatObject, ped)
end

---Removes the TaskCarriable association for the given entity.
---@param entity integer
function RemoveTaskCarriable(entity)
    Citizen.InvokeNative(0x9EBD34958AB6F824, entity)
end

---Returns true if the given entity currently has an active "directed task" it's a task with a specific external objective (coordinate, entity, vehicle, or combat target).
---@param entity integer
function HasEntityDirectedTaskActive(entity)
    return Citizen.InvokeNative(0x9FF5F9B24E870748, entity) == 1
end

---Enables or disables the contextual "Pick Up" prompt for a carriable entity.
---@param carriableObject integer
---@param enabled boolean
function SetCarriablePickupPromptEnabled(carriableObject, enabled)
    Citizen.InvokeNative(0xA21AA2F0C2180125, carriableObject, enabled)
end

---Updates the target coordinate of an ongoing SCRIPT_TASK_VEHICLE_SHOOT_AT_COORD for the given ped. This lets you "retarget" the shooting point in real time without restarting the task.
---@param ped integer
---@param x number
---@param y number
---@param z number
function UpdateTaskVehicleShootAtCoord(ped, x, y, z)
    Citizen.InvokeNative(0xAF2EF28CE3084505, ped, x, y, z)
end

---Returns true while the ped has cast the fishing line and is waiting for a fish to bite. Once the ped hooks a fish and enters the struggle/reeled-in phase, this returns false.
---@param ped integer
function DoesPedFishingWaitForBite(ped)
    return Citizen.InvokeNative(0xB520DBDA7FCF573F, ped) == 1
end

---Finds all scenario points of a given type that lie inside a Volume and writes them into an Itemset.
---@param volume integer
---@param itemSet integer
---@param scenarioTypeHash integer
---@param p3 integer
---@param p4 integer
---@param p5 integer
---@param p6 integer
---@return integer
function FindScenarioAllPointsInVolumeOfType(volume, itemSet, scenarioTypeHash, p3, p4, p5, p6)
    return Citizen.InvokeNative(0xB8E213D02F37947D, volume, itemSet, scenarioTypeHash, p3, p4, p5, p6, Citizen.ResultAsInteger())
end

---Sets the AI travel speed for a mount (horse). Affects how fast the horse’s AI will move when being controlled by AI logic (not player input), e.g. during escorts, flee, wander, or scripted tasks.
---@param ped integer
---@param speed number
function PedApplyFollowRoadSpeedOverride(ped, speed)
    Citizen.InvokeNative(0xBAAB791AA72C2821, ped, speed)
end

---Returns a scenario point handle of the given scenario type that is associated with / found near the specified object. Useful for “attached” scenarios (e.g., ransackable lockboxes on a prop).
---@param object integer
---@param xOffset number
---@param yOffset number
---@param zOffset number
---@param scenarioTypeHash integer
---@param radius number
---@return integer
function FindScenarioAtObjectOfType(object, xOffset, yOffset, zOffset, scenarioTypeHash, radius)
    return Citizen.InvokeNative(0xD508FA229F1C4900, object, xOffset, yOffset, zOffset, scenarioTypeHash, radius, Citizen.ResultAsInteger())
end

---Transfers the driving reins/control of a vehicle (e.g., wagon/coach) to another occupant when there is more than one ped inside. If instant is true, the handover happens instantly
---@param vehicle integer
---@param instant boolean
function SwapVehicleReins(vehicle, instant)
    Citizen.InvokeNative(0xE01F55B2896F6B37, vehicle, instant)
end

---Cancels the hogtie state of a ped, releasing them from ropes or restraints.
---@param ped integer
function CancelPedHogtie(ped)
    Citizen.InvokeNative(0xE2CF104ADD49D4BF, ped)
end

---Forces the specified animal/ped to have (or not have) its "sampled" state flag set.
---@param animalPed integer
---@param toggle boolean
function ForceAnimalSampled(animalPed, toggle)
    Citizen.InvokeNative(0xF3C3503276F4A034, animalPed, toggle)
end

---Returns true if the specified ped (animal) has been flagged as sampled.
---@param animalPed integer
---@return boolean
function HasPedAnimalSampled(animalPed)
    return Citizen.InvokeNative(0x7CB99FADDE73CD1B, animalPed) == 1
end

---Orders the ped to point at the given entity (finger/upper-body point), similar to a "task point entity" behavior.
---@param ped integer
---@param targetEntity integer
---@param duration integer
function TaskPointAtEntity(ped, targetEntity, duration)
    Citizen.InvokeNative(0xF40A109B4B79A848, ped, targetEntity, duration)
end

---Swaps the wagon/coach reins control between the ped and their adjacent front-seat partner.
---@param ped integer
function SwapReins(ped)
    Citizen.InvokeNative(0xFC7F71CF49F70B6B, ped)
end

---Forces a ped to attack a target with throwable or projectile weapons (like bows, throwing knives, tomahawks, dynamite) for a specified duration while aiming.
---@param ped integer
---@param targetEntity integer
---@param durationMs integer
---@param p3 boolean
---@param p4 boolean
function TaskForceThrowableAtEntityWhenAiming(ped, targetEntity, durationMs, p3, p4)
    Citizen.InvokeNative(0x2416EC2F31F75266, ped, targetEntity, durationMs, p3, p4)
end

---Returns true if a revivable horse prompt is currently visibled (i.e., visible and interactable) near the player.
---@param p0 boolean
---@return boolean
function IsRevivableHorsePromptVisible(p0)
    return Citizen.InvokeNative(0x756C7B4C43DF0422, p0) == 1
end

---Returns the horse ped currently in a revivable state and within the revive prompt range (if any).
---@return integer ped
function GetRevivableHorse()
    return Citizen.InvokeNative(0x351F74ED6177EBE7, Citizen.ResultAsEntity())
end

---Returns the signed distance along the waypoint recording from its start to the point on the recording that corresponds to the given coordinates.
---@param waypointName string
---@param coords Vector3
---@return number
function CalculateWaypointDistanceFromStart(waypointName, coords)
    return Citizen.InvokeNative(0x3ACC128510142B9D, waypointName, coords, Citizen.ResultAsFloat())
end

---Orders the ped to follow a waypoint recording with control over start/end node indices, optional patrol (back-and-forth) behavior, aiming stance, and total traversal duration.
---@param ped integer
---@param waypointRecording string
---@param startIndex integer
---@param flags integer
---@param endIndex integer
---@param patrol boolean
---@param aimWeapon boolean
---@param durationMs integer
function TaskFollowWaypointRecording(ped, waypointRecording, startIndex, flags, endIndex, patrol, aimWeapon, durationMs)
    Citizen.InvokeNative(0x0759591819534F7B, ped, waypointRecording, startIndex, flags, endIndex, patrol, aimWeapon, durationMs)
end

---Updates the current directed "go to/follow offset" objective of a Ped to a new world position.
---@param ped integer
---@param x number
---@param y number
---@param z number
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param speed number
---@param tolerance number
function UpdateTaskGoToCoordWithOffset(ped, x, y, z, offsetX, offsetY, offsetZ, speed, tolerance)
    Citizen.InvokeNative(0x3FFCD7BBA074CC80, ped, x, y, z, offsetX, offsetY, offsetZ, speed, tolerance)
end

---Adds a new waypoint to the AI driver's active "drive to destination" task.
---@param vehicle integer
---@param x number
---@param y number
---@param z number
function TaskVehicleAddNextDestination(vehicle, x, y, z)
    Citizen.InvokeNative(0x1D125814EBC517EB, vehicle, x, y, z)
end

---Sets a ped’s standing position and/or facing direction while aboard a boat, using a local offset relative to the boat’s coordinate system. Works only on boats.
---@param ped integer
---@param boat integer
---@param offsetX number
---@param offsetY number
---@param offsetZ number
---@param heading number
---@param flags integer
function SetAboardPedBoatOffset(ped, boat, offsetX, offsetY, offsetZ, heading, flags)
    Citizen.InvokeNative(0x517D01BF27B682D1, ped, boat, offsetX, offsetY, offsetZ, heading, flags)
end

---Returns whether the “Hold to Reel [Fishing]” gameplay setting is currently enabled.
---@return boolean
function GetHoldToReelSettingEnabled()
    return Citizen.InvokeNative(0x5952DFA38FA529FE) == 1
end

---Smoothly transitions an active scenario actor (ped) into a specific conditional /clipset defined in the scenario’s conditional-anim graph,  breaking or restarting the scenario. Returns true if the transition was successfully triggered, or false if it failed.
---@param ped integer
---@param scenarioPoint ScenarioPoint
---@param clipsetDict string
---@param clipsetName string
---@param fromConditionalAnim string
---@param flags integer
---@return boolean
function TransitionScenarioToConditionalAnim(ped, scenarioPoint, clipsetDict, clipsetName, fromConditionalAnim, flags)
    return Citizen.InvokeNative(0x79197F7D2BB5E73A, ped, scenarioPoint, clipsetDict, clipsetName, fromConditionalAnim, flags) == 1
end

local function GetTaskMoveNetworkParamsStruct(params)
    assert(type(params) == "table", "Expected params to be a table of key-value pairs for move network initialization parameters.")

    local paramsStruct = DataView.ArrayBuffer(64*8)
    if (params[0]) then
        paramsStruct:SetInt32(0*8, params[0])
    end
    paramsStruct:SetInt32(1*8, `DEFAULT`)
    if (params[2]) then
        paramsStruct:SetInt32(2*8, params[2])
    end
    if (params[3]) then
        paramsStruct:SetInt32(3*8, params[3])
    end
    if (params[4]) then
        paramsStruct:SetInt64(4*8, VarString(10, "LITERAL_STRING", params[4], Citizen.ResultAsLong()))
    end
    if (params[5]) then
        paramsStruct:SetFloat32(5*8, params[5])
    end
    if (params[6]) then
        paramsStruct:SetInt32(6*8, params[6])
    end
    if (params[9]) then
        paramsStruct:SetInt32(9*8, params[9])
    end
    if (params[30]) then
        paramsStruct:SetInt64(30*8, VarString(10, "LITERAL_STRING", params[30], Citizen.ResultAsLong()))
    end
    if (params[32]) then
        paramsStruct:SetInt64(32*8, VarString(10, "LITERAL_STRING", params[32], Citizen.ResultAsLong()))
    end
    if (params[33]) then
        paramsStruct:SetInt64(33*8, VarString(10, "LITERAL_STRING", params[33], Citizen.ResultAsLong()))
    end

    return paramsStruct
end

---
---@param entity1 integer
---@param moveNetworkDefName string
---@param params table
---@param entity2 integer
---@param boneIndex integer
---@param xPos number
---@param yPos number
---@param zPos number
---@param xRot number
---@param yRot number
---@param zRot number
---@param p12 integer
---@param multiplier number
---@param p14 integer
---@param flags integer
---@param p16 integer
---@param p17 integer
function TaskMoveNetworkAdvancedByNameWithInitParamsAttached(entity1, moveNetworkDefName, params, entity2, boneIndex, xPos, yPos, zPos, xRot, yRot, zRot, p12, multiplier, p14, flags, p16, p17, p18)
    local paramsStruct = GetTaskMoveNetworkParamsStruct(params)
    Citizen.InvokeNative(0x7B6A04F98BBAFB2C, entity1, moveNetworkDefName, paramsStruct:Buffer(), entity2, boneIndex, xPos, yPos, zPos, xRot, yRot, zRot, p12, multiplier, p14, flags, p16, p17, p18)
end

---
---@param entity integer
---@param moveNetworkDefName string
---@param params table
---@param xPos number
---@param yPos number
---@param zPos number
---@param xRot number
---@param yRot number
---@param zRot number
---@param p12 integer
---@param multiplier number
---@param p14 integer
---@param p15 integer
---@param flags integer
---@param p17 integer
function TaskMoveNetworkAdvancedByNameWithInitParams(entity, moveNetworkDefName, params, xPos, yPos, zPos, xRot, yRot, zRot, p12, multiplier, p14, p15, flags, p17)
    local paramsStruct = GetTaskMoveNetworkParamsStruct(params)
    Citizen.InvokeNative(0x7B6A04F98BBAFB2C, entity, moveNetworkDefName, paramsStruct:Buffer(), xPos, yPos, zPos, xRot, yRot, zRot, p12, multiplier, p14, p15, flags, p17)
end

---
---@param entity integer
---@param moveNetworkDefName string
---@param params table
---@param multiplier number
---@param p4 boolean
---@param animDict string
---@param flags integer
function TaskMoveNetworkByNameWithInitParams(entity, moveNetworkDefName, params, multiplier, p4, animDict, flags)
    local paramsStruct = GetTaskMoveNetworkParamsStruct(params)
    Citizen.InvokeNative(0x139805C2A67C4795, entity, moveNetworkDefName, paramsStruct:Buffer(), multiplier, p4, animDict, flags)
end

--TASK::TASK_MOVE_NETWORK_BY_NAME_WITH_INIT_PARAMS(panParam0->f_78, "Script_MUD5_Safecrack_Safe", &(panParam0->f_34), 0, false, 0, 0)

---Returns the minimum (baseline) whistle/call distance for the given horse bonding level. This value represents the lower bound used when computing whether a horse is considered "near" or "far" relative to the player, and is interpolated against the next level's max.
---@param bondingLevel integer
---@return number
function GetWhistleRangeMinForBondingLevel(bondingLevel)
    return Citizen.InvokeNative(0xEB67D4E056C85A81, bondingLevel, Citizen.ResultAsFloat())
end

---Returns the maximum (target) whistle/call distance associated with the next horse bonding level. Used together with the current level's minimum to derive an effective whistle range based on the horse's bonding progress toward the next rank.
---@param bondingLevel integer
---@return number
function GetWhistleRangeMaxForBondingLevel(bondingLevel)
    return Citizen.InvokeNative(0x78D8C1D4EB80C588, bondingLevel, Citizen.ResultAsFloat())
end

---
---@param ped integer
---@param targetEntity integer
---@param x number
---@param y number
---@param z number
---@param duration integer
---@param firingPattern integer
function TaskShootWithWeapon(ped, targetEntity, x, y, z, duration, firingPattern)
    local data = DataView.ArrayBuffer(16*8)
    data:SetInt32(0*8, targetEntity)
    data:SetFloat32(1*8, x)
    data:SetFloat32(2*8, y)
    data:SetFloat32(3*8, z)
    data:SetInt32(4*8, duration)
    data:SetInt32(5*8, firingPattern)
    Citizen.InvokeNative(0x08AA95E8298AE772, ped, data:Buffer())
end

---
---@param x number
---@param y number
---@param z number
---@param p3 number
---@param p4 integer
---@param p5 integer
---@return integer
function N_0X152664AA3188B193(x, y, z, p3, p4, p5)
    return Citizen.InvokeNative(0X152664AA3188B193, x, y, z, p3, p4, p5, Citizen.ResultAsInteger())
end

---p0 is the handle returned by N_0x152664AA3188B193
---@param p0 integer
---@return boolean
function N_0X22CD2C33ED4467A1(p0)
    return Citizen.InvokeNative(0X22CD2C33ED4467A1, p0) == 1
end

---p0 is the handle returned by N_0x152664AA3188B193
---@param p0 integer
---@return vector3
function N_0x91CB5E431F579BA1(p0)
    return Citizen.InvokeNative(0X91CB5E431F579BA1, p0, Citizen.ResultAsVector())
end

---p0 is the handle returned by N_0x152664AA3188B193
---@param p0 integer
---@return integer
function N_0X370F57C47F68EBCA(p0)
    return Citizen.InvokeNative(0X370F57C47F68EBCA, p0, Citizen.ResultAsInteger())
end

---p0 is the handle returned by N_0x152664AA3188B193
---@param p0 integer
---@return integer, integer
function N_0XEFD875C2791EBEFD(p0, p1, p2)
    local outData = DataView.ArrayBuffer(32*8)
    outData:SetInt32(0*8, 1)
    
    local num = Citizen.InvokeNative(0XEFD875C2791EBEFD, p0, outData:Buffer(), p1, p2, Citizen.ResultAsInteger())
    local handle = outData:GetInt32(0*8)

    return num, handle
end