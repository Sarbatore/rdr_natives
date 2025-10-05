local function UiFeedPostOptionsBuffer(data)
    local struct = DataView.ArrayBuffer(13 * 8)
    struct:SetInt32(0 * 8, data.duration or -2)
	if (data.sound) then
		struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.sound.dict, Citizen.ResultAsLong()))
		struct:SetInt64(2 * 8, VarString(10, "LITERAL_STRING", data.sound.name, Citizen.ResultAsLong()))
	end
    struct:SetInt32(3 * 8, 0)
	
	struct:SetInt32(4 * 8, data.appId) -- `Collectors`
	struct:SetInt32(5 * 8, data.subAppId) -- `Collectors`
	struct:SetInt64(6 * 8, VarString(10, "LITERAL_STRING", data.text or "", Citizen.ResultAsLong()))
	struct:SetInt32(7 * 8, 1)

	struct:SetInt32(8 * 8, 0)
	struct:SetInt32(9 * 8, 0) -- player_menu
	struct:SetInt32(10 * 8, 0) -- container
	struct:SetInt32(11 * 8, 0) -- 1511356879
	struct:SetInt32(12 * 8, 0)

	return struct:Buffer()
end

local function UiFeedToastBuffer(data)
	local struct = DataView.ArrayBuffer(10 * 8)
	struct:SetInt32(0 * 8, 1)
	struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.title, Citizen.ResultAsLong()))
	struct:SetInt64(2 * 8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))
	struct:SetInt32(3 * 8, 0)
	if (data.icon) then
		struct:SetInt32(4 * 8, data.icon.dict)
		struct:SetInt32(5 * 8, data.icon.texture)
		struct:SetInt32(6 * 8, data.icon.color)
	end
	struct:SetInt32(7 * 8, 0)
	struct:SetInt32(8 * 8, 0) -- Color
	struct:SetInt32(9 * 8, 1)

	return struct:Buffer()
end

---
---@return number
function UiFeedPostSampleToastWithAppLink(data)
	return Citizen.InvokeNative(0x38838A646FB30AAE,
        UiFeedPostOptionsBuffer({
            duration = data.duration,
            sound = data.sound,
            text = data.text2,
            appId = data.appId,
            subAppId = data.subAppId
        }),
        UiFeedToastBuffer({
            title = data.title,
            text = data.text1,
            icon = data.icon
        }), true, true, false)
end

---Similar to UiFeedPostSampleToastWithAppLink
---@return number
function UiFeedPostCollectorToast(data)
	return Citizen.InvokeNative(0xAFF5BE9BA496CE40,
        UiFeedPostOptionsBuffer({
            duration = data.duration,
            sound = data.sound,
            text = data.text2,
            appId = data.appId,
            subAppId = data.subAppId
        }),
        UiFeedToastBuffer({
            title = data.title,
            text = data.text1,
            icon = data.icon
        }), true, true, 0)
end

---
---@return number
function UiFeedPostRankupToast(data)
	return Citizen.InvokeNative(0x3F9FDDBA79117C69,
        UiFeedPostOptionsBuffer({
            duration = data.duration,
            sound = data.sound
        }),
        UiFeedToastBuffer({
            title = data.title,
            text = data.text,
            icon = data.icon
        }), 1, 1)
end

---2 texts, ring sound
---@return number
function UiFeedPostInteractiveToast(data)
	return Citizen.InvokeNative(0x18D6869FBFFEC0F8, 
        UiFeedPostOptionsBuffer({
            duration = data.duration,
            sound = data.sound,
            text = data.text2
        }),
        UiFeedToastBuffer({
            title = data.title,
            text = data.text1,
            icon = data.icon
        }), true, true)
end

---2 texts, simple notif sound
---@return number
function UiFeedPostSampleNotification(data)
	return Citizen.InvokeNative(0xC927890AA64E9661, 
        UiFeedPostOptionsBuffer({
            duration = data.duration,
            sound = data.sound,
            text = data.text2
        }),
        UiFeedToastBuffer({
            title = data.title,
            text = data.text1,
            icon = data.icon
        }), true, true)
end

---Same as UiFeedPostSampleNotification 
---@return number
function UiFeedPostSampleToast(data)
    return Citizen.InvokeNative(0x26E87218390E6729,
        UiFeedPostOptionsBuffer({
            duration = data.duration,
            sound = data.sound,
            text = data.text2
        }),
        UiFeedToastBuffer({
            title = data.title,
            text = data.text1,
            icon = data.icon
        }), true, true)
end

local function UiShardFeedBuffer(data)
	local struct = DataView.ArrayBuffer(7 * 8)
    struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.text1, Citizen.ResultAsLong()))
    struct:SetInt64(2 * 8, VarString(10, "LITERAL_STRING", data.text2, Citizen.ResultAsLong()))
	struct:SetInt64(3 * 8, VarString(10, "LITERAL_STRING", data.text3, Citizen.ResultAsLong()))

	return struct:Buffer()
end

---
---@return number
function UiFeedPostOneTextShard(data)
    return Citizen.InvokeNative(0x860DDFE97CC94DF0,
        UiFeedPostOptionsBuffer({
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
        UiFeedPostOptionsBuffer({
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
        UiFeedPostOptionsBuffer({
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
    local optionsBuffer = UiFeedPostOptionsBuffer(data.duration)
    local shardBuffer = UiShardFeedBuffer(data.location, data.text)

    return Citizen.InvokeNative(0xD05590C1AB38F068,
        UiFeedPostOptionsBuffer({
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
	local struct = DataView.ArrayBuffer(20 * 8)
	if (sound) then
		struct:SetInt64(0 * 8, VarString(10, "LITERAL_STRING", sound.dict, Citizen.ResultAsLong()))
		struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", sound.name, Citizen.ResultAsLong()))
	end
	struct:SetInt32(2 * 8, 4)
	struct:SetInt32(3 * 8, secondButtonTextHash)
	struct:SetInt32(6 * 8, isSecondButtonHold and 1 or 0)
	struct:SetInt32(7 * 8, firstButtonTextHash)
	struct:SetInt32(10 * 8, isFirstButtonHold and 1 or 0)
	struct:SetInt32(11 * 8, thirdButtonTextHash)
	struct:SetInt32(14 * 8, isThirdButtonHold and 1 or 0)
	struct:SetInt32(15 * 8, fourthButtonTextHash)
	struct:SetInt32(18 * 8, isFourthButtonHold and 1 or 0)

	return struct:Buffer()
end

---
---@return number
function UiStickyFeedCreateErrorMessage(data)
	local optionsBuffer = UiStickyFeedOptionsBuffer(data.sound, `IB_QUIT`, true, `IB_RETRY`, false)

	local struct = DataView.ArrayBuffer(9 * 8)
	struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.title, Citizen.ResultAsLong()))
	struct:SetInt64(2 * 8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

	return Citizen.InvokeNative(0x9F2CC2439A04E7BA, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiStickyFeedCreateDeathFailMessage(data)
	local optionsBuffer = UiStickyFeedOptionsBuffer(data.sound, 166188472, true, -1904156936, true, 2015838421, true, 207908017, true)

	local struct = DataView.ArrayBuffer(9 * 8)
	struct:SetInt64(0 * 8, 0)
	struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

	return Citizen.InvokeNative(0x815C4065AE6E6071, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiStickyFeedCreateWarningMessage(data)
	local optionsBuffer = UiStickyFeedOptionsBuffer(data.sound, `IB_BACK`)

	local struct = DataView.ArrayBuffer(9 * 8)
	struct:SetInt32(0 * 8, 0)
	struct:SetInt32(1 * 8, 0)
	struct:SetInt64(2 * 8, VarString(10, "LITERAL_STRING", data.title, Citizen.ResultAsLong()))
	struct:SetInt64(3 * 8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

	return Citizen.InvokeNative(0x339E16B41780FC35, optionsBuffer, struct:Buffer(), true)
end

--[[

]]

---
---@return number
function UiFeedPostSampleToastRight(data)
	local optionsBuffer = UiFeedPostOptionsBuffer({
        duration = data.duration,
        sound = data.sound
    })

	local struct = DataView.ArrayBuffer(10 * 8)
	struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))
	if (data.quality) then
		struct:SetInt32(6 * 8, math.clamp(data.quality, 0, 3))
	elseif (data.icon) then
		struct:SetInt64(2 * 8, VarString(10, "LITERAL_STRING", data.icon.dict, Citizen.ResultAsLong()))
		struct:SetInt32(3 * 8, data.icon.texture)
	end
	struct:SetInt32(4 * 8, 0)
	struct:SetInt32(5 * 8, data.color)

	return Citizen.InvokeNative(0xB249EBCB30DD88E0, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostReticleMessage(data)
	local optionsBuffer = UiFeedPostOptionsBuffer({
        duration = data.duration,
        sound = data.sound
    })

	local struct = DataView.ArrayBuffer(3 * 8)
	struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))
	struct:SetInt32(2 * 8, data.hideBackground and 1 or 0)

	return Citizen.InvokeNative(0x893128CDB4B81FBB, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostMissionName(data)
	local optionsBuffer = UiFeedPostOptionsBuffer({
        duration = data.duration,
        sound = data.sound
    })

	local struct = DataView.ArrayBuffer(2 * 8)
	struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

	return Citizen.InvokeNative(0x2024F4F333095FB1, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostVoiceChatFeed(data)
	local optionsBuffer = UiFeedPostOptionsBuffer({
        duration = data.duration,
        sound = data.sound
    })
	
	local struct = DataView.ArrayBuffer(3 * 8)
	struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))
	struct:SetInt32(2 * 8, data.color)

	return Citizen.InvokeNative(0xC48152BC6B3E821C, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostFeedTicker(data)
	local optionsBuffer = UiFeedPostOptionsBuffer({
        duration = data.duration,
        sound = data.sound
    })

    local struct = DataView.ArrayBuffer(2 * 8)
    struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

    return Citizen.InvokeNative(0xB2920B9760F0F36B, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostObjective(data)
	local optionsBuffer = UiFeedPostOptionsBuffer(data.duration)

    local struct = DataView.ArrayBuffer(2 * 8)
    struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

    return Citizen.InvokeNative(0xCEDBF17EFCC0E4A4, optionsBuffer, struct:Buffer(), true)
end

---
---@return number
function UiFeedPostHelpText(data)
	local optionsBuffer = UiFeedPostOptionsBuffer({
        duration = data.duration,
        sound = data.sound
    })

    local struct = DataView.ArrayBuffer(2 * 8)
    struct:SetInt64(1 * 8, VarString(10, "LITERAL_STRING", data.text, Citizen.ResultAsLong()))

    return Citizen.InvokeNative(0x049D5C615BD38BAD, optionsBuffer, struct:Buffer(), true)
end