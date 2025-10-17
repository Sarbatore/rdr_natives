---Return scenario points in the area.
---@param x float
---@param y float
---@param z float
---@param radius float
---@param size integer
---@return boolean, table
function GetScenarioPointsInArea(x, y, z, radius, size)
    local struct = DataView.ArrayBuffer(size*8 + 8)
    if (Citizen.InvokeNative(0x345EC3B7EBDE1CB5, x, y, z, radius, struct:Buffer(), size) == 1) then
        local scenarioPoints = {}
        for i=1, size do
            local scenarioPoint = struct:GetInt32(i*8)
            if (Citizen.InvokeNative(0x841475AC96E794D1, scenarioPoint) == 1) then -- DOES_SCENARIO_POINT_EXIST
                table.insert(scenarioPoints, scenarioPoint)
            end
        end
        return true, scenarioPoints
    end

    return false
end

---
---@param ped Ped
---@param pickup Pickup
---@return void
function TaskPickUpWeapon(ped, pickup)
    Citizen.InvokeNative(0x55B0ECFD98596624, ped, pickup)
end

---Loads the carriable config hash [@outsider]
---@param carriableConfig Hash
---@return void
function LoadCarriableConfigHash(carriableConfig)
    Citizen.InvokeNative(0xFF745B0346E19E2C, carriableConfig)
end

---Checks if the carriable config hash has been loaded [@outsider]
---@param carriableConfig Hash
---@return boolean
function HasCarriableConfigHashLoaded(carriableConfig)
    return Citizen.InvokeNative(0xB8F52A3F84A7CC59, carriableConfig) == 1
end

---Returns the entity coverpoint with offset [@sarbatore]
---@param entity Entity
---@param xOffset float
---@param yOffset float
---@param zOffset float
---@param heading float
---@param p5 integer
---@param p6 integer
---@param p7 integer
---@param p8 integer
---@return integer
function GetCoverpointFromEntityWithOffset(entity, xOffset, yOffset, zOffset, heading, p5, p6, p7, p8)
    return Citizen.InvokeNative(0x59872EA4CBD11C56, entity, xOffset, yOffset, zOffset, heading, p5, p6, p7, p8, Citizen.ResultAsint())
end

---Return whether the scenario is in use or not.
---@param scenarioHash Hash
---@return boolean
function IsScenarioInUse(scenarioHash)
    return Citizen.InvokeNative(0x1ACBC313966C21F3, scenarioHash) == 1
end

---Returns true if the specified mount (horse) is currently being led by the player, otherwise false.
---@param mount Ped
---@return boolean
function IsPedBeingLed(mount)
    return Citizen.InvokeNative(0xAC5045AB7F1A34FD, mount) == 1
end

---Returns the total number of compartments (drawers, lids, etc.) the specified scenario container entity has.
---@param entity Entity
---@return integer
function GetScenarioContainerNumCompartments(entity)
    return Citizen.InvokeNative(0x640A602946A8C972, entity, Citizen.ResultAsint())
end

---Returns the number of currently open compartments for the specified scenario container entity.
---@param entity Entity
---@return integer
function GetScenarioContainerNumOpenCompartments(entity)
    return Citizen.InvokeNative(0x849791EBBDBA0362, entity, Citizen.ResultAsint())
end

---Returns the total number of lootable items currently inside the specified scenario container entity.
---@param entity Entity
---@return integer
function GetScenarioContainerRemainingLootCount(entity)
    return Citizen.InvokeNative(0x01AF8A3729231A43, entity, Citizen.ResultAsint())
end

---Returns the current progress of the "Break Free" prompt when the specified ped is hogtied or knocked out.
---@param ped Ped
---@return float
function GetPedWritheBreakFreeProgress(ped)
    return Citizen.InvokeNative(0x03D741CB4052E26C, ped, Citizen.ResultAsFloat())
end

---Configures how an intimidated/hogtied ped faces the player.
---@param ped Ped
---@param useLimits boolean
---@param minAngle float
---@param maxAngle float
---@return void
function SetIntimitatedFacingAngle(ped, useLimits, minAngle, maxAngle)
    Citizen.InvokeNative(0x0FE797DD9F70DFA6, ped, useLimits, minAngle, maxAngle)
end

---Clears all active tasks assigned to the specified vehicle.
---@param vehicle Vehicle
---@return void
function ClearVehicleTasks(vehicle)
    Citizen.InvokeNative(0x141BC64C8D7C5529, vehicle)
end

---
---@param ped Ped
---@param x float
---@param y float
---@param z float
---@param p4 integer
---@param p5 boolean
---@param p6 boolean
function TaskForceAimAtCoord(ped, x, y, z, p4, p5, p6)
    Citizen.InvokeNative(0x41323F4E0C4AE94B, ped, x, y, z, p4, p5, p6)
end

---Reset all scenario points in area.
---@param x float
---@param y float
---@param z float
---@param radius float
function ResetScenarioPointsInArea(x, y, z, radius)
    Citizen.InvokeNative(0x4161648394262FDF, x, y, z, radius)
end

---Set which seat index acts as the "driver seat" for driving tasks.
---@param vehicle Vehicle
---@param seatIndex integer
function SetDrivingSeat(vehicle, seatIndex)
    Citizen.InvokeNative(0x4BA972D0E5AD8122, vehicle, seatIndex)
end

---Return the seat index currently set as the "driving seat" for the specified vehicle.
---@param vehicle Vehicle
---@return integer
function GetDrivingSeat(vehicle)
    return Citizen.InvokeNative(0xE62754D09354F6CF, vehicle, Citizen.ResultAsInteger())
end

---Checks if the ped can/look is directed at the given coord within the specified radius.
---@param ped Ped
---@param x float
---@param y float
---@param z float
---@param radius float
---@return boolean
function IsPedLookingAtCoord(ped, x, y, z, radius)
    return Citizen.InvokeNative(0x508F5053E3F6F0C4, ped, x, y, z, radius) == 1
end

---Checks if the vehicle's current drive-to destination matches the given coordinates.
---@param vehicle Vehicle
---@param x float
---@param y float
---@param z float
---@return boolean
function TaskVehicleIsAtDestination(vehicle, x, y, z)
    return Citizen.InvokeNative(0x583AE9AF9CEE0958, vehicle, x, y, z) == 1
end

---Checks if the given ped is currently in combat using a ranged weapon and is ready to shoot (actively attempting to attack).
---@param ped Ped
---@return boolean
function GetTaskCombatReadyToShoot(ped)
    return Citizen.InvokeNative(0x5EA655F01D93667A, ped) == 1
end

---Retrieves chained scenario points linked to the given parent scenario.
---@param scenario Hash
---@param buffer DataView.ArrayBuffer
---@param toggle boolean
---@return integer
function GetLinkedScenarioPoints(scenario, buffer, toggle)
    return Citizen.InvokeNative(0xE7BBC4E56B989449, scenario, buffer, toggle, Citizen.ResultAsInteger())
end

---Remove/unload a previously loaded carriable config.
---@param carriableConfig Hash
function RemoveCarriableConfigHash(carriableConfig)
    Citizen.InvokeNative(0x6AFDA2264925BD11, carriableConfig)
end

---Return a coarse state for the "mount leap" task when a ped jumps from their horse onto another horse, a wagon, or a train.
---@param ped Ped
---@return integer
function GetPedMountLeapState(ped)
    return Citizen.InvokeNative(0x9420FB11B8D77948, ped, Citizen.ResultAsInteger())
end

---Return a normalized progress value (≈0.0 → 1.0) for the "mount leap" task as a ped jumps from their horse onto another horse, a wagon, or a train.
---@param ped Ped
---@return float
function GetPedMountLeapProgress(ped)
    return Citizen.InvokeNative(0x6BA606AB3A83BC4D, ped, Citizen.ResultAsFloat())
end

---Enables or disables the context/prompt associated with a given carriable config hash.
---@param carriableConfig Hash
---@param toggle boolean
function SetCarriableConfigPromptEnabled(carriableConfig, toggle)
    Citizen.InvokeNative(0x816A3ACD265E2297, carriableConfig, toggle)
end

---Attempts to finish/advance a ped’s ongoing scenario transition (between scenario clips/anims).
---@param ped Ped
---@param p1 float
function FinishScenarioTransition()
    return Citizen.InvokeNative(0x90703A8F75EE4ABD, ped, p1) == 1
end

---Requests that the given carriable hat be assigned for equip by the ped.
---@param hat Entity
---@param ped Ped
function RequestCarriableHatEquipToPed(hat, ped)
    Citizen.InvokeNative(0x9ADDBB9242179D56, hat, ped)
end

---Removes the TaskCarriable association for the given entity.
---@param carriable Entity
function RemoveTaskCarriable(carriable)
    Citizen.InvokeNative(0x9EBD34958AB6F824, carriable)
end

---Returns true if the given entity currently has an active "directed task" it's a task with a specific external objective (coordinate, entity, vehicle, or combat target).
---@param entity Entity
function HasEntityDirectedTaskActive(entity)
    return Citizen.InvokeNative(0x9FF5F9B24E870748, entity) == 1
end

---Enables or disables the contextual "Pick Up" prompt for a carriable entity.
---@param carriable Object
---@param enabled bool
function SetCarriablePickupPromptEnabled(carriable, enabled)
    Citizen.InvokeNative(0xA21AA2F0C2180125, carriable, enabled)
end

---Updates the target coordinate of an ongoing SCRIPT_TASK_VEHICLE_SHOOT_AT_COORD for the given ped. This lets you "retarget" the shooting point in real time without restarting the task.
---@param ped Ped
---@param x float
---@param y float
---@param z float
function UpdateTaskVehicleShootAtCoord(ped, x, y, z)
    Citizen.InvokeNative(0xAF2EF28CE3084505, ped, x, y, z)
end

---Returns true while the ped has cast the fishing line and is waiting for a fish to bite. Once the ped hooks a fish and enters the struggle/reeled-in phase, this returns false.
---@param ped Ped
function DoesPedFishingWaitForBite(ped)
    return Citizen.InvokeNative(0xB520DBDA7FCF573F, ped) == 1
end

---Finds all scenario points of a given type that lie inside a Volume and writes them into an Itemset.
---@param volume Volume
---@param itemset Itemset
---@param scenarioType Hash
---@param p3 integer
---@param p4 integer
---@param p5 integer
---@param p6 integer
---@return integer
function FindScenarioAllPointsInVolumeOfType(volume, itemset, scenarioType, p3, p4, p5, p6)
    return Citizen.InvokeNative(0xB8E213D02F37947D, volume, itemset, scenarioType, p3, p4, p5, p6, Citizen.ResultAsInteger())
end

---Sets the AI travel speed for a mount (horse). Affects how fast the horse’s AI will move when being controlled by AI logic (not player input), e.g. during escorts, flee, wander, or scripted tasks.
---@param ped Ped
---@param speed float
function PedApplyFollowRoadSpeedOverride(ped, speed)
    Citizen.InvokeNative(0xBAAB791AA72C2821, ped, speed)
end

---Returns a scenario point handle of the given scenario type that is associated with / found near the specified object. Useful for “attached” scenarios (e.g., ransackable lockboxes on a prop).
---@param object Object
---@param xOffset float
---@param yOffset float
---@param zOffset float
---@param scenarioType Hash
---@param radius float
---@return integer
function FindScenarioAtObjectOfType(object, xOffset, yOffset, zOffset, scenarioType, radius)
    return Citizen.InvokeNative(0xD508FA229F1C4900, object, xOffset, yOffset, zOffset, scenarioType, radius, Citizen.ResultAsInteger())
end

---Transfers the driving reins/control of a vehicle (e.g., wagon/coach) to another occupant when there is more than one ped inside. If `instant` is true, the handover happens instantly;
---@param vehicle Vehicle
---@param instant boolean
function SwapVehicleReins(vehicle, instant)
    Citizen.InvokeNative(0xE01F55B2896F6B37, vehicle, instant)
end

---Cancels the hogtie state of a ped, releasing them from ropes or restraints.
---@param ped Ped
function CancelPedHogtie(ped)
    Citizen.InvokeNative(0xE2CF104ADD49D4BF, ped)
end

---Forces the specified animal/ped to have (or not have) its "sampled" state flag set.
---@param animal Ped
---@param toggle boolean
function ForceAnimalSampled(animal, toggle)
    Citizen.InvokeNative(0xF3C3503276F4A034, animal, toggle)
end

---Returns true if the specified ped (animal) has been flagged as sampled.
---@param animal Ped
---@return boolean
function HasPedAnimalSampled(animal)
    return Citizen.InvokeNative(0x7CB99FADDE73CD1B, animal) == 1
end

---Orders the ped to point at the given entity (finger/upper-body point), similar to a "task point entity" behavior.
---@param ped Ped
---@param targetEntity Entity
---@param duration integer
function TaskPointAtEntity(ped, targetEntity, duration)
    Citizen.InvokeNative(0xF40A109B4B79A848, ped, targetEntity, duration)
end

---Swaps the wagon/coach reins control between the ped and their adjacent front-seat partner.
---@param ped Ped
function SwapReins(ped)
    Citizen.InvokeNative(0xFC7F71CF49F70B6B, ped)
end

---Forces a ped to attack a target with **throwable or projectile weapons** (like bows, throwing knives, tomahawks, dynamite) for a specified duration while aiming.
---@param ped Ped
---@param target Entity
---@param durationMs integer
---@param p3 boolean
---@param p4 boolean
function TaskForceThrowableAtEntityWhenAiming(ped, target, durationMs, p3, p4)
    Citizen.InvokeNative(0x2416EC2F31F75266, ped, target, durationMs, p3, p4)
end

---Returns `true` if a **revivable horse prompt** is currently **visibled** (i.e., visible and interactable) near the player.
---@param p0 boolean
---@return boolean
function IsRevivableHorsePromptVisible(p0)
    return Citizen.InvokeNative(0x756C7B4C43DF0422, p0) == 1
end

---Returns the horse ped currently in a revivable state and within the revive prompt range (if any).
---@return Ped
function GetRevivableHorse()
    return Citizen.InvokeNative(0x351F74ED6177EBE7, Citizen.ResultAsEntity())
end

---Returns the signed distance along the waypoint recording from its start to the point on the recording that corresponds to the given coordinates.
---@param waypointName string
---@param coords Vector3
---@return float
function CalculateWaypointDistanceFromStart(waypointName, coords)
    return Citizen.InvokeNative(0x3ACC128510142B9D, waypointName, coords, Citizen.ResultAsFloat())
end

---Orders the ped to follow a waypoint recording with control over start/end node indices, optional patrol (back-and-forth) behavior, aiming stance, and total traversal duration.
---@param ped Ped
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
---@param ped Ped
---@param x float
---@param y float
---@param z float
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param speed float
---@param tolerance float
function UpdateTaskGoToCoordWithOffset(ped, x, y, z, offsetX, offsetY, offsetZ, speed, tolerance)
    Citizen.InvokeNative(0x3FFCD7BBA074CC80, ped, x, y, z, offsetX, offsetY, offsetZ, speed, tolerance)
end

---Adds a new waypoint to the AI driver's active "drive to destination" task.
---@param vehicle Vehicle
---@param x float
---@param y float
---@param z float
function TaskVehicleAddNextDestination(vehicle, x, y, z)
    Citizen.InvokeNative(0x1D125814EBC517EB, vehicle, x, y, z)
end

---Sets a ped’s standing position and/or facing direction while aboard a boat, using a local offset relative to the boat’s coordinate system. Works only on boats.
---@param ped Ped
---@param boat Vehicle
---@param offsetX float
---@param offsetY float
---@param offsetZ float
---@param heading float
---@param flags integer
function SetAboardPedBoatOffset(ped, boat, offsetX, offsetY, offsetZ, heading, flags)
    Citizen.InvokeNative(0x517D01BF27B682D1, ped, boat, offsetX, offsetY, offsetZ, heading, flags)
end

---Returns whether the “Hold to Reel [Fishing]” gameplay setting is currently enabled.
---@return boolean
function GetHoldToReelSettingEnabled()
    return Citizen.InvokeNative(0x5952DFA38FA529FE) == 1
end