--[[
########################################################################################################################
#                                                                                                                      #
#                                                   client/audio.lua                                                   #
#                                                                                                                      #
########################################################################################################################
]]
RegisterCommand("PlayPedAmbientSpeechNative", function()
    local ped = PlayerPedId()
    local soundRef = "0083_U_M_O_BlWGeneralStoreOwner_01"
    local soundName = "TAKE_YOUR_TIME"
    local speechParams = 291934926
    local speechLine = 0

    local retval = exports.rdr_natives:PlayPedAmbientSpeechNative(ped, soundRef, soundName, speechParams, speechLine)
    if (retval) then
        print("PlayPedAmbientSpeechNative")
    else
        print("Failed to PlayPedAmbientSpeechNative")
    end
end)

RegisterCommand("PlayAmbientSpeechFromPositionNative", function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local soundRef = "0083_U_M_O_BlWGeneralStoreOwner_01"
    local soundName = "TAKE_YOUR_TIME"
    local speechParams = 291934926
    local speechLine = 0

    local retval = exports.rdr_natives:PlayAmbientSpeechFromPositionNative(coords.x, coords.y, coords.z, soundRef, soundName, speechParams, speechLine)
    if (retval) then
        print("PlayAmbientSpeechFromPositionNative")
    else
        print("Failed to PlayAmbientSpeechFromPositionNative")
    end
end)

--[[
########################################################################################################################
#                                                                                                                      #
#                                                   client/inventory.lua                                               #
#                                                                                                                      #
########################################################################################################################
]]
RegisterCommand("InventoryGetInventoryItemInspectionInfo", function()
    local retval, model = exports.rdr_natives:InventoryGetInventoryItemInspectionInfo(-780677328)
    if (retval) then
        print("InventoryGetInventoryItemInspectionInfo", model)
    else
        print("Failed to InventoryGetInventoryItemInspectionInfo")
    end
end)

--[[
########################################################################################################################
#                                                                                                                      #
#                                                 client/itemdatabase.lua                                              #
#                                                                                                                      #
########################################################################################################################
]]
RegisterCommand("ItemdatabaseFilloutItemInfo", function()
    local retval, category, group = exports.rdr_natives:ItemdatabaseFilloutItemInfo(-780677328)
    if (retval) then
        print("ItemdatabaseFilloutItemInfo", category, group)
    else
        print("Failed to ItemdatabaseFilloutItemInfo")
    end
end)

RegisterCommand("ItemdatabaseFilloutItemEffectIds", function()
    local retval, effectIds = exports.rdr_natives:ItemdatabaseFilloutItemEffectIds(`WEAPON_REVOLVER_CATTLEMAN`)
    if (retval) then
        if (#effectIds > 0) then
            print("ItemdatabaseFilloutItemEffectIds")
            for i, effectId in ipairs(effectIds) do
                print(effectId)
            end
        else
            print("No effect ids found")
        end
    else
        print("Failed to ItemdatabaseFilloutItemEffectIds")
    end
end)

RegisterCommand("ItemdatabaseFilloutItemEffectIdInfo", function()
    local retval, effectIds = exports.rdr_natives:ItemdatabaseFilloutItemEffectIds(`WEAPON_REVOLVER_CATTLEMAN`)
    if (not retval) or (#effectIds == 0) then return end

    local retval, id, type, value, time, timeUnits, corePercent, durationcategory = exports.rdr_natives:ItemdatabaseFilloutItemEffectIdInfo(effectIds[1])
    if (retval) then
        print("ItemdatabaseFilloutItemEffectIdInfo", id, type, value, time, timeUnits, corePercent, durationcategory)
    else
        print("Failed to ItemdatabaseFilloutItemEffectIdInfo")
    end
end)

---@todo Implement ItemdatabaseGetHasSlotInfo
RegisterCommand("ItemdatabaseGetHasSlotInfo", function()
    local retval, category = exports.rdr_natives:ItemdatabaseFilloutItemInfo(856287005)
    if (not retval) then print("Failed to ItemdatabaseFilloutItemInfo") return end
    
    local retval, hasSlot = exports.rdr_natives:ItemdatabaseGetHasSlotInfo(category, 0)
    if (retval) then
        print("ItemdatabaseGetHasSlotInfo", hasSlot)
    else
        print("Failed to ItemdatabaseGetHasSlotInfo")
    end
end)

---@todo Implement ItemdatabaseFilloutItem
RegisterCommand("ItemdatabaseFilloutItem", function()
    local retval, a = exports.rdr_natives:ItemdatabaseFilloutItem(-1814149473, `COST_ABILITY_CARD_RANK_COUPON`, 0)
    if (retval) then
        print("ItemdatabaseFilloutItem", a)
    else
        print("Failed to ItemdatabaseFilloutItem")
    end
end)

---@todo Implement ItemdatabaseFilloutAcquireCost
RegisterCommand("ItemdatabaseFilloutAcquireCost", function()
    local retval, unk1, unk2 = exports.rdr_natives:ItemdatabaseFilloutAcquireCost(unk1, unk2)
    if (retval) then
        print("ItemdatabaseFilloutAcquireCost", a, b)
    else
        print("Failed to ItemdatabaseFilloutAcquireCost")
    end
end)

---@todo Implement ItemdatabaseFilloutTagData
RegisterCommand("ItemdatabaseFilloutTagData", function()
    local retval, tagData = exports.rdr_natives:ItemdatabaseFilloutTagData(-780677328)
    if (retval) then
        print("ItemdatabaseFilloutTagData", tagData)
    else
        print("Failed to ItemdatabaseFilloutTagData")
    end
end)

--[[
########################################################################################################################
#                                                                                                                      #
#                                                   client/task.lua                                                   #
#                                                                                                                      #
########################################################################################################################
]]
RegisterCommand("GetScenarioPointsInArea", function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local retval, scenarioPoints = exports.rdr_natives:GetScenarioPointsInArea(playerCoords.x, playerCoords.y, playerCoords.z, 3.0, 10)
    if (retval) then
        for i, scenarioPoint in ipairs(scenarioPoints) do
            print("ScenarioPoint", scenarioPoint)
        end
    else
        print("No scenario points found")
    end
end)

--[[
########################################################################################################################
#                                                                                                                      #
#                                                   client/uievents.lua                                                #
#                                                                                                                      #
########################################################################################################################
]]
RegisterCommand("EventsUiPeekMessage", function()
    local uiapp = `PLAYER_MENU`
    LaunchUiappByHashWithEntry(uiapp, `MP`)

    Citizen.CreateThread(function()
        while IsUiappRunningByHash(uiapp) == 1 do
            Citizen.Wait(0)
            while EventsUiIsPending(uiapp) do
                local retval, eventTypeHash, index, unk, entryId = exports.rdr_natives:EventsUiPeekMessage(uiapp)
                if (retval) then
                    print("EventsUiPeekMessage", eventTypeHash, index, unk, entryId)
                else
                    print("Failed to EventsUiPeekMessage")
                end
                EventsUiPopMessage(uiapp)
            end
        end
    end)

    Wait(5000)

    CloseAllUiapps()
end)