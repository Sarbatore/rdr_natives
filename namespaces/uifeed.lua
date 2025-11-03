local function UiFeedPostExtrasBuffer(duration, soundDict, soundName, p3, subCategoryToastAppId, p5, text, p7, p8, p9, p10, p11, p12)
    local struct = DataView.ArrayBuffer(13*8)
    struct:SetInt32(0*8, duration)
    struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", soundDict, Citizen.ResultAsLong()))
    struct:SetInt64(2*8, VarString(10, "LITERAL_STRING", soundName, Citizen.ResultAsLong()))
    struct:SetInt32(3*8, p3)
	struct:SetInt32(4*8, subCategoryToastAppId)
	struct:SetInt32(5*8, p5)
	struct:SetInt64(6*8, VarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong()))
	struct:SetInt32(7*8, p7)
	struct:SetInt32(8*8, p8)
	struct:SetInt32(9*8, p9)
	struct:SetInt32(10*8, p10)
	struct:SetInt32(11*8, p11)
	struct:SetInt32(12*8, p12)

	return struct:Buffer()
end

local function UiFeedToastBuffer(p0, title, text, p3, textureDict, textureName, textureColor, p7, p8, p9)
	local struct = DataView.ArrayBuffer(10*8)
	struct:SetInt32(0*8, p0)
	struct:SetInt64(1*8, title)
	struct:SetInt64(2*8, text)
	struct:SetInt32(3*8, p3)
    struct:SetInt32(4*8, textureDict)
    struct:SetInt32(5*8, textureName)
    struct:SetInt32(6*8, textureColor)
	struct:SetInt32(7*8, p7)
	struct:SetInt32(8*8, p8)
	struct:SetInt32(9*8, p9)

	return struct:Buffer()
end

--[[

]]

RegisterCommand("notif", function()
    local title = VarString(2, "NATURALIST_CATEGORY_TRADE_IN_TITLE")
    local text = VarString(2, "NATURALIST_CATEGORY_TRADE_IN_DESC")
    local textureDict = `inventory_items_mp`
    local textureName = `clothing_generic_f_chemise`
    local textureColor = `COLOR_BLUE`

    local extraText = VarString(2, "RECIPE_COLLECT_VIEW")
    local duration = 1000
    local soundDict = "Mission_Complete_Sounds"
    local soundName = "Mission_Complete_Enter"
    local subCategoryToastAppId = CompendiumGetSubcategoryToastAppId(`ANIMALS`, `DESERT`)

    --UiFeedPostSampleToastWithAppLink(duration, title, text, textureDict, textureName, subCategoryToastAppId, 0, false, extraText)
    --UiFeedPostCollectorToast(duration, title, text, textureDict, textureName, 773314749, extraText, `collectors_bag_details`)
    --UiFeedPostRankupToast(duration, title, text, textureDict, textureName, textureColor, subCategoryToastAppId, extraText, 0, 0, 0, 0, 0, 0, 0, 0)
    --UiFeedPostInteractiveToast()
    --UiFeedPostSampleNotification()
    --UiFeedPostSampleToast()
end)

---@param duration integer
---@param title long
---@param text long
---@param textureDict Hash
---@param textureName Hash
---@param subCategoryToastAppId integer
---@param p6 integer
---@param p7 boolean
---@param extraText long
---@return integer
function UiFeedPostSampleToastWithAppLink(duration, title, text, textureDict, textureName, subCategoryToastAppId, p6, p7, extraText)
    local extrasBuffer = UiFeedPostExtrasBuffer(duration, "Mission_Complete_Sounds", "Mission_Complete_Enter", 0, subCategoryToastAppId, p6, extraText, 1, 0, 0, 0, 0, 0)
    local buffer = UiFeedToastBuffer(0, title, text, 0, textureDict, textureName, 0, 1, 0, 0)

	return Citizen.InvokeNative(0x38838A646FB30AAE, extrasBuffer, buffer, true, true, p7)
end

---
---@return integer
function UiFeedPostCollectorToast(duration, title, text, textureDict, textureName, collectableCategory, extraText, p7)
    local extrasBuffer = UiFeedPostExtrasBuffer(duration, "Mission_Complete_Sounds", "Mission_Complete_Enter", 0, `COLLECTORS`, p7, extraText, 1, 0, 0, 0, 0, 0)
    local buffer = UiFeedToastBuffer(0, title, text, 0, textureDict, textureName, 0, 1, 0, 0)

	return Citizen.InvokeNative(0xAFF5BE9BA496CE40, extrasBuffer, buffer, true, true, collectableCategory)
end

---
---@return integer
function UiFeedPostRankupToast(duration, title, text, textureDict, textureName, textureColor, subCategoryToastAppId, extraText, p8, p9, p10, p11, p12, p13, p14, p15)
    local p3ExtrasBuffer = 0
    local p5ExtrasBuffer = `collectors_bag_details`
    local p0Buffer = 1
    local p3Buffer = 0

    local extrasBuffer = UiFeedPostExtrasBuffer(duration, soundDict, soundName, p3ExtrasBuffer, subCategoryToastAppId, p5ExtrasBuffer, extraText, 0, 0, 0, 0, 0, 0)
    local buffer = UiFeedToastBuffer(p0Buffer, title, text, p3Buffer, textureDict, textureName, textureColor, 1, 0, 0)

	return Citizen.InvokeNative(0x3F9FDDBA79117C69, extrasBuffer, buffer, 1, 1)
end

---Particulariry: ring sound
---@return integer
function UiFeedPostInteractiveToast()
    local p3ExtrasBuffer = 0
    local p5ExtrasBuffer = `collectors_bag_details`
    local p0Buffer = 0

    local extrasBuffer = UiFeedPostExtrasBuffer(duration, soundDict, soundName, p3ExtrasBuffer, subCategoryToastAppId, p5ExtrasBuffer, extraText, 0, 0, 0, 0, 0, 0)
    local buffer = UiFeedToastBuffer(p0Buffer, title, text, 0, textureDict, textureName, 0, 1, 0, 0)

	return Citizen.InvokeNative(0x18D6869FBFFEC0F8, extrasBuffer, buffer, true, true)
end

---Particularity: no color
---@return number
function UiFeedPostSampleNotification()
    local p3ExtrasBuffer = 0
    local p5ExtrasBuffer = `collectors_bag_details`
    local p9ExtrasBuffer = `player_menu`
    local p10ExtrasBuffer = 0 -- data container
    local p11ExtrasBuffer = 778915895
    local p12ExtrasBuffer = VarString(10, "FME_PI_MENU_TITLE_POSSE_VERSUS", GetPlayerName(PlayerId()), Citizen.ResultAsLong())
    local p0Buffer = 1
    local p6Buffer = 0 -- not specified
    local p7Buffer = 0 -- not specified
    local p8Buffer = `COLOR_WHITE`
    local p9Buffer = 1

    local extrasBuffer = UiFeedPostExtrasBuffer(duration, soundDict, soundName, p3ExtrasBuffer, subCategoryToastAppId, p5ExtrasBuffer, extraText, 0, 0, p9ExtrasBuffer, p10ExtrasBuffer, p11ExtrasBuffer, p12ExtrasBuffer)
    local buffer = UiFeedToastBuffer(p0Buffer, title, text, 0, textureDict, textureName, p6Buffer, p7Buffer, p8Buffer, p9Buffer)

	return Citizen.InvokeNative(0xC927890AA64E9661, extrasBuffer, buffer, true, true)
end

---
---@return number
function UiFeedPostSampleToast()
    local extrasBuffer = UiFeedPostExtrasBuffer(duration, soundDict, soundName, 0, subCategoryToastAppId, p5ExtrasBuffer, extraText, 1, 0, 0, 0, 0, 0)
    local buffer = UiFeedToastBuffer(0, title, text, 0, textureDict, textureName, 0, 1, 0, 0)

    return Citizen.InvokeNative(0x26E87218390E6729, extrasBuffer, buffer, true, true)
end

local function UiShardFeedBuffer(data)
	local struct = DataView.ArrayBuffer(7*8)
    struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", data.text1, Citizen.ResultAsLong()))
    struct:SetInt64(2*8, VarString(10, "LITERAL_STRING", data.text2, Citizen.ResultAsLong()))
	struct:SetInt64(3*8, VarString(10, "LITERAL_STRING", data.text3, Citizen.ResultAsLong()))

	return struct:Buffer()
end

---
---@return number
function UiFeedPostOneTextShard(data)
    return Citizen.InvokeNative(0x860DDFE97CC94DF0,
        UiFeedPostExtrasBuffer({
            duration = data.duration
        }),
        UiShardFeedBuffer({
            text1 = data.text
        }), true, true)
end

---
---@return number
function UiFeedPostTwoTextShard(data)
    return Citizen.InvokeNative(0xA6F4216AB10EB08E,
        UiFeedPostExtrasBuffer({
            duration = data.duration
        }),
        UiShardFeedBuffer({
            text1 = data.title,
            text2 = data.text
        }), true, true)
end

---
---@return number
function UiFeedPostThreeTextShard(data)
    return Citizen.InvokeNative(0x02BCC0FE9EBA3529,
        UiFeedPostExtrasBuffer({
            duration = data.duration
        }),
        UiShardFeedBuffer({
            text1 = data.title,
            text2 = data.text1,
            text3 = data.text2
        }), true, true)
end

---
---@return number
function UiFeedPostLocationShard(data)
    local optionsBuffer = UiFeedPostExtrasBuffer(data.duration)
    local shardBuffer = UiShardFeedBuffer(data.location, data.text)

    return Citizen.InvokeNative(0xD05590C1AB38F068,
        UiFeedPostExtrasBuffer({
            duration = data.duration
        }),
        UiShardFeedBuffer({
            text1 = data.location,
            text2 = data.text
        }), false, true)
end

--[[

]]

local function UiStickyFeedOptionsBuffer(sound, firstButtonTextHash, isFirstButtonHold, secondButtonTextHash, isSecondButtonHold, thirdButtonTextHash, isThirdButtonHold, fourthButtonTextHash, isFourthButtonHold)
	local struct = DataView.ArrayBuffer(20*8)
	if (sound) then
		struct:SetInt64(0*8, VarString(10, "LITERAL_STRING", sound.dict, Citizen.ResultAsLong()))
		struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", sound.name, Citizen.ResultAsLong()))
	end
	struct:SetInt32(2*8, 4)
	struct:SetInt32(3*8, secondButtonTextHash)
	struct:SetInt32(6*8, isSecondButtonHold and 1 or 0)
	struct:SetInt32(7*8, firstButtonTextHash)
	struct:SetInt32(10*8, isFirstButtonHold and 1 or 0)
	struct:SetInt32(11*8, thirdButtonTextHash)
	struct:SetInt32(14*8, isThirdButtonHold and 1 or 0)
	struct:SetInt32(15*8, fourthButtonTextHash)
	struct:SetInt32(18*8, isFourthButtonHold and 1 or 0)

	return struct:Buffer()
end

---
---@return number
function UiStickyFeedCreateErrorMessage(data)
	local optionsBuffer = UiStickyFeedOptionsBuffer(data.sound, `IB_QUIT`, true, `IB_RETRY`, false)

	local struct = DataView.ArrayBuffer(9*8)
	struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", data.title, Citizen.ResultAsLong()))
	struct:SetInt64(2*8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

	return Citizen.InvokeNative(0x9F2CC2439A04E7BA, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiStickyFeedCreateDeathFailMessage(data)
	local optionsBuffer = UiStickyFeedOptionsBuffer(data.sound, 166188472, true, -1904156936, true, 2015838421, true, 207908017, true)

	local struct = DataView.ArrayBuffer(9*8)
	struct:SetInt64(0*8, 0)
	struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

	return Citizen.InvokeNative(0x815C4065AE6E6071, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiStickyFeedCreateWarningMessage(data)
	local optionsBuffer = UiStickyFeedOptionsBuffer(data.sound, `IB_BACK`)

	local struct = DataView.ArrayBuffer(9*8)
	struct:SetInt32(0*8, 0)
	struct:SetInt32(1*8, 0)
	struct:SetInt64(2*8, VarString(10, "LITERAL_STRING", data.title, Citizen.ResultAsLong()))
	struct:SetInt64(3*8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

	return Citizen.InvokeNative(0x339E16B41780FC35, optionsBuffer, struct:Buffer(), true)
end

--[[

]]

---
---@return number
function UiFeedPostSampleToastRight(data)
	local optionsBuffer = UiFeedPostExtrasBuffer({
        duration = data.duration,
        sound = data.sound
    })

	local struct = DataView.ArrayBuffer(10*8)
	struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))
	if (data.quality) then
		struct:SetInt32(6*8, math.clamp(data.quality, 0, 3))
	elseif (data.icon) then
		struct:SetInt64(2*8, VarString(10, "LITERAL_STRING", data.icon.dict, Citizen.ResultAsLong()))
		struct:SetInt32(3*8, data.icon.texture)
	end
	struct:SetInt32(4*8, 0)
	struct:SetInt32(5*8, data.color)

	return Citizen.InvokeNative(0xB249EBCB30DD88E0, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostReticleMessage(data)
	local optionsBuffer = UiFeedPostExtrasBuffer({
        duration = data.duration,
        sound = data.sound
    })

	local struct = DataView.ArrayBuffer(3*8)
	struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))
	struct:SetInt32(2*8, data.hideBackground and 1 or 0)

	return Citizen.InvokeNative(0x893128CDB4B81FBB, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostMissionName(data)
	local optionsBuffer = UiFeedPostExtrasBuffer({
        duration = data.duration,
        sound = data.sound
    })

	local struct = DataView.ArrayBuffer(2*8)
	struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

	return Citizen.InvokeNative(0x2024F4F333095FB1, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostVoiceChatFeed(data)
	local optionsBuffer = UiFeedPostExtrasBuffer({
        duration = data.duration,
        sound = data.sound
    })
	
	local struct = DataView.ArrayBuffer(3*8)
	struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))
	struct:SetInt32(2*8, data.color)

	return Citizen.InvokeNative(0xC48152BC6B3E821C, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostFeedTicker(data)
	local optionsBuffer = UiFeedPostExtrasBuffer({
        duration = data.duration,
        sound = data.sound
    })

    local struct = DataView.ArrayBuffer(2*8)
    struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

    return Citizen.InvokeNative(0xB2920B9760F0F36B, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostObjective(data)
	local optionsBuffer = UiFeedPostExtrasBuffer(data.duration)

    local struct = DataView.ArrayBuffer(2*8)
    struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

    return Citizen.InvokeNative(0xCEDBF17EFCC0E4A4, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostHelpText(data)
	local optionsBuffer = UiFeedPostExtrasBuffer({
        duration = data.duration,
        sound = data.sound
    })

    local struct = DataView.ArrayBuffer(2*8)
    struct:SetInt64(1*8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

    return Citizen.InvokeNative(0x049D5C615BD38BAD, optionsBuffer, struct:Buffer(), true)
end