----------------------------------------
---									 ---
---			 Toast messages 	  	 ---
---									 ---
----------------------------------------

---
---@param duration integer
---@param soundSet string|nil
---@param soundName string|nil
---@param p3 integer|nil
---@param subCategoryToastAppId string|integer|nil
---@param p5Hash string|integer|nil
---@param textVarString integer|nil
---@param p7 any
---@param p8 any
---@param p9 any
---@param p10 any
---@param p11 any
---@param p12 any
---@return unknown
local function UiFeedPostExtrasBuffer(duration, soundSet, soundName, p3, subCategoryToastAppId, p5Hash, textVarString, p7, p8, p9, p10, p11, p12)
    local paramsStruct = DataView.ArrayBuffer(13*8)
        :SetInt32(0*8, duration)
        :SetInt64(1*8, LiteralStringLong(soundSet))
        :SetInt64(2*8, LiteralStringLong(soundName))
        :SetInt32(3*8, p3)
	    :SetInt32(4*8, joaat(subCategoryToastAppId))
	    :SetInt32(5*8, joaat(p5Hash))
	    :SetInt64(6*8, BigInt(textVarString))
	    :SetInt32(7*8, p7)
	    :SetInt32(8*8, p8)
	    :SetInt32(9*8, p9)
	    :SetInt32(10*8, p10)
	    :SetInt32(11*8, p11)
	    :SetInt32(12*8, p12)

	return paramsStruct:Buffer()
end

---
---@param p0 boolean
---@param titleVarString integer
---@param textVarString integer
---@param p3 integer
---@param textureDict string|integer
---@param textureName string|integer
---@param textureColor string|integer
---@param p7 any
---@param p8 any
---@param p9 any
---@return unknown
local function UiFeedToastBuffer(p0, titleVarString, textVarString, p3, textureDict, textureName, textureColor, p7, p8, p9)
	local paramsStruct = DataView.ArrayBuffer(10*8)
	    :SetInt32(0*8, p0 and 1 or 0)
	    :SetInt64(1*8, BigInt(titleVarString))
	    :SetInt64(2*8, BigInt(textVarString))
	    :SetInt32(3*8, p3 or -1)
        :SetInt32(4*8, joaat(textureDict))
        :SetInt32(5*8, joaat(textureName))
        :SetInt32(6*8, joaat(textureColor))
	    :SetInt32(7*8, p7)
	    :SetInt32(8*8, p8)
	    :SetInt32(9*8, p9)

	return paramsStruct:Buffer()
end

---@param duration integer
---@param titleVarString integer
---@param textVarString integer
---@param textureDict string|integer
---@param textureName string|integer
---@param subCategoryToastAppId string|integer
---@param p6 integer
---@param p7 boolean
---@param extraTextVarString integer
---@return integer
function UiFeedPostSampleToastWithAppLink(duration, titleVarString, textVarString, textureDict, textureName, subCategoryToastAppId, p6, p7, extraTextVarString)
    local extrasBuffer = UiFeedPostExtrasBuffer(duration, "Mission_Complete_Sounds", "Mission_Complete_Enter", 0, subCategoryToastAppId, p6, extraTextVarString)
    local buffer = UiFeedToastBuffer(false, titleVarString, textVarString, 0, textureDict, textureName, 0, 1)

	return Citizen.InvokeNative(0x38838A646FB30AAE, extrasBuffer, buffer, true, true, p7, Citizen.ResultAsInteger())
end

---
---@param duration integer
---@param titleVarString integer
---@param textVarString integer
---@param textureDict string|integer
---@param textureName string|integer
---@param collectableCategory string|integer
---@param p6Hash string|integer
---@param extraTextVarString integer
---@return integer
function UiFeedPostCollectorToast(duration, titleVarString, textVarString, textureDict, textureName, collectableCategory, p6Hash, extraTextVarString)
    local extrasBuffer = UiFeedPostExtrasBuffer(duration, "Mission_Complete_Sounds", "Mission_Complete_Enter", 0, `COLLECTORS`, p6Hash, extraTextVarString)
    local buffer = UiFeedToastBuffer(false, titleVarString, textVarString, 0, textureDict, textureName, 0, 1)

	return Citizen.InvokeNative(0xAFF5BE9BA496CE40, extrasBuffer, buffer, true, true, joaat(collectableCategory), Citizen.ResultAsInteger())
end

function UiFeedPostRankupToast(duration, titleVarString, textVarString, soundSet, soundName, textureDict, textureName)
    local extrasBuffer = UiFeedPostExtrasBuffer(1000, "Mission_Complete_Sounds", "Mission_Complete_Enter", 0, `color_freemode_event`, `toast_fme`, -1)
    local buffer = UiFeedToastBuffer(true, VarString(10, "LITERAL_STRING", "FEED_TOAST_TITLE"), VarString(10, "LITERAL_STRING", "FEED_TOAST_TEXT"), -1, `hud_toasts`, `toast_bank_debt_medal_bronze`, 0, 1)

	return Citizen.InvokeNative(0x3F9FDDBA79117C69, extrasBuffer, buffer, true, true, Citizen.ResultAsInteger())
end

---Particulariry: ring sound
---@return integer
function UiFeedPostInteractiveToast()
    local p3ExtrasBuffer = 0
    local p5ExtrasBuffer = `collectors_bag_details`
    local p0Buffer = 0

    local extrasBuffer = UiFeedPostExtrasBuffer(duration, soundDict, soundName, p3ExtrasBuffer, subCategoryToastAppId, p5ExtrasBuffer, extraText, 0, 0, 0, 0, 0, 0)
    local buffer = UiFeedToastBuffer(p0Buffer, title, text, 0, textureDict, textureName, 0, 1, 0, 0)

	return Citizen.InvokeNative(0x18D6869FBFFEC0F8, extrasBuffer, buffer, true, true, Citizen.ResultAsInteger())
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

	return Citizen.InvokeNative(0xC927890AA64E9661, extrasBuffer, buffer, true, true, Citizen.ResultAsInteger())
end

---
---@return number
function UiFeedPostSampleToast(title, text, duration, textureDict, textureName, soundSet, soundName)
    local extrasBuffer = UiFeedPostExtrasBuffer(duration, soundSet, soundName, 0, 0, 0, nil, 0, 0, nil, `player_menu`, nil, 778915895)
    local buffer = UiFeedToastBuffer(false, title, text, 0, textureDict, textureName, 0, 1)

    return Citizen.InvokeNative(0x26E87218390E6729, extrasBuffer, buffer, true, true, Citizen.ResultAsInteger())
end

----------------------------------------
---									 ---
---			 Shard messages 	  	 ---
---									 ---
----------------------------------------

---
---@param str1 string
---@param str2 string|nil
---@param str3 string|nil
---@return any
local function UiShardFeedBuffer(str1, str2, str3)
	local paramsStruct = DataView.ArrayBuffer(8 + 3*16)
    	:SetInt64(1*8, LiteralStringLong(str1))
    	:SetInt64(2*8, LiteralStringLong(str2))
		:SetInt64(3*8, LiteralStringLong(str3))

	return paramsStruct:Buffer()
end

---
---@param text string
---@param duration integer
---@param soundSet string
---@param soundName string
---@return integer
function UiFeedPostOneTextShard(text, duration, soundSet, soundName)
    local optionsBuffer = UiFeedPostExtrasBuffer(duration, soundSet, soundName)
    local shardBuffer = UiShardFeedBuffer(text)

    return Citizen.InvokeNative(0x860DDFE97CC94DF0, optionsBuffer, shardBuffer, true, true, Citizen.ResultAsInteger())
end

---
---@param title string
---@param text string
---@param duration integer
---@param soundSet string
---@param soundName string
---@return integer
function UiFeedPostTwoTextShard(title, text, duration, soundSet, soundName)
    local optionsBuffer = UiFeedPostExtrasBuffer(duration, soundSet, soundName)
    local shardBuffer = UiShardFeedBuffer(title, text)

    return Citizen.InvokeNative(0xA6F4216AB10EB08E, optionsBuffer, shardBuffer, true, true, Citizen.ResultAsInteger())
end

---comment
---@param title string
---@param text1 string
---@param text2 string
---@param duration integer
---@param soundSet string
---@param soundName string
---@return integer
function UiFeedPostThreeTextShard(title, text1, text2, duration, soundSet, soundName)
    local optionsBuffer = UiFeedPostExtrasBuffer(duration, soundSet, soundName)
    local shardBuffer = UiShardFeedBuffer(title, text1, text2)

    return Citizen.InvokeNative(0x02BCC0FE9EBA3529, optionsBuffer, shardBuffer, true, true, Citizen.ResultAsInteger())
end

---
---@param location string
---@param text string
---@param duration integer
---@param soundSet string
---@param soundName string
---@return integer
function UiFeedPostLocationShard(location, text, duration, soundSet, soundName)
    local optionsBuffer = UiFeedPostExtrasBuffer(duration, soundSet, soundName)
    local shardBuffer = UiShardFeedBuffer(location, text)

    return Citizen.InvokeNative(0xD05590C1AB38F068, optionsBuffer, shardBuffer, false, true, Citizen.ResultAsInteger())
end

----------------------------------------
---									 ---
---		    Misc messages 	  		 ---
---									 ---
----------------------------------------

---
---@param textVarString integer
---@param quality integer
---@param textureDict string
---@param textureName string|integer
---@param color string|integer
---@param duration integer
---@param soundSet string
---@param soundName string
---@return integer
function UiFeedPostSampleToastRight(textVarString, quality, textureDict, textureName, color, duration, soundSet, soundName)
	local optionsBuffer = UiFeedPostExtrasBuffer(duration, soundSet, soundName)
	local paramsStruct = DataView.ArrayBuffer(6*8 + 2*16)
		:SetInt32(0*8, 0)
		:SetInt64(1*8, BigInt(textVarString))
		:SetInt32(6*8, math.clamp(quality or 0, 0, 3))
		:SetInt64(2*8, LiteralStringLong(textureDict))
		:SetInt32(3*8, joaat(textureName))
		:SetInt32(4*8, 1)
		:SetInt32(5*8, joaat(color))
		:SetInt32(6*8, 0)

	return Citizen.InvokeNative(0xB249EBCB30DD88E0, optionsBuffer, paramsStruct:Buffer(), true, Citizen.ResultAsInteger())
end

---
---@param textVarString integer
---@param hideBackground boolean
---@param duration integer
---@param soundSet string
---@param soundName string
---@return integer
function UiFeedPostReticleMessage(textVarString, hideBackground, duration, soundSet, soundName)
	local optionsBuffer = UiFeedPostExtrasBuffer(duration, soundSet, soundName)
	local paramsStruct = DataView.ArrayBuffer(2*8 + 16)
		:SetInt32(0*8, 0)
		:SetInt64(1*8, BigInt(textVarString))
		:SetInt32(2*8, hideBackground and 1 or 0)

	return Citizen.InvokeNative(0x893128CDB4B81FBB, optionsBuffer, paramsStruct:Buffer(), true, Citizen.ResultAsInteger())
end

---
---@param textVarString integer
---@param duration integer
---@param soundSet string
---@param soundName string
---@return integer
function UiFeedPostMissionName(textVarString, duration, soundSet, soundName)
	local optionsBuffer = UiFeedPostExtrasBuffer(duration, soundSet, soundName)
	local paramsStruct = DataView.ArrayBuffer(8+16)
		:SetInt32(0*8, 0)
		:SetInt64(1*8, BigInt(textVarString))

	return Citizen.InvokeNative(0x2024F4F333095FB1, optionsBuffer, paramsStruct:Buffer(), true, Citizen.ResultAsInteger())
end

---
---@param textVarString integer
---@param textColor integer
---@param duration integer
---@param soundSet string
---@param soundName string
---@return integer
function UiFeedPostVoiceChatFeed(textVarString, textColor, duration, soundSet, soundName)
	local optionsBuffer = UiFeedPostExtrasBuffer(duration, soundSet, soundName)
	local paramsStruct = DataView.ArrayBuffer(2*8 + 16)
		:SetInt32(0*8, 0)
		:SetInt64(1*8, BigInt(textVarString))
		:SetInt32(2*8, joaat(textColor))

	return Citizen.InvokeNative(0xC48152BC6B3E821C, optionsBuffer, paramsStruct:Buffer(), true, Citizen.ResultAsInteger())
end

---
---@param textVarString integer
---@param duration integer
---@param soundSet string
---@param soundName string
---@return integer feedMessage
function UiFeedPostFeedTicker(textVarString, duration, soundSet, soundName)
	local optionsStruct = UiFeedPostExtrasBuffer(duration, soundSet, soundName)
    local paramsStruct = DataView.ArrayBuffer(8+16)
		:SetInt32(0*8, 0)
    	:SetInt64(1*8, BigInt(textVarString))

    return Citizen.InvokeNative(0xB2920B9760F0F36B, optionsStruct, paramsStruct:Buffer(), true, Citizen.ResultAsInteger())
end

---
---@param textVarString integer
---@param duration integer
---@param soundSet string
---@param soundName string
---@return integer feedMessage
function UiFeedPostObjective(textVarString, duration, soundSet, soundName)
	local optionsStruct = UiFeedPostExtrasBuffer(duration, soundSet, soundName)
    local paramsStruct = DataView.ArrayBuffer(8+16)
		:SetInt32(0*8, 0)
    	:SetInt64(1*8, BigInt(textVarString))

    return Citizen.InvokeNative(0xCEDBF17EFCC0E4A4, optionsStruct, paramsStruct:Buffer(), true, Citizen.ResultAsInteger())
end

---
---@param textVarString integer
---@param duration integer
---@param soundSet string
---@param soundName string
---@return integer feedMessage
function UiFeedPostHelpText(textVarString, duration, soundSet, soundName)
	local optionsStruct = UiFeedPostExtrasBuffer(duration, soundSet, soundName)
    local paramsStruct = DataView.ArrayBuffer(8+16)
		:SetInt32(0*8, 0)
    	:SetInt64(1*8, BigInt(textVarString))

    return Citizen.InvokeNative(0x049D5C615BD38BAD, optionsStruct, paramsStruct:Buffer(), true, Citizen.ResultAsInteger())
end

---
---@param text string
---@param p1 boolean
---@return integer feedMessage
function N_0x4E88A65968A55C78(text, p1)
    local paramsStruct = DataView.ArrayBuffer(8+16)
		:SetInt32(0*8, 0)
    	:SetInt64(1*8, LiteralStringLong(text))

    return Citizen.InvokeNative(0x4E88A65968A55C78, paramsStruct:Buffer(), p1, Citizen.ResultAsInteger())
end