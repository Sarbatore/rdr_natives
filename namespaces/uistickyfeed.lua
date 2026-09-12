---
---@param soundSet string|nil
---@param soundName string|nil
---@param firstButtonText string|integer
---@param isFirstButtonHold boolean
---@param secondButtonLabel string|integer
---@param isSecondButtonHold boolean
---@param thirdButtonLabel string|integer
---@param isThirdButtonHold boolean
---@param fourthButtonLabel string|integer
---@param isFourthButtonHold boolean
---@return any
local function UiStickyFeedOptionsBuffer(soundSet, soundName, firstButtonText, isFirstButtonHold, secondButtonLabel, isSecondButtonHold, thirdButtonLabel, isThirdButtonHold, fourthButtonLabel, isFourthButtonHold)
	local paramsStruct = DataView.ArrayBuffer(20*8)
		:SetInt64(0*8, soundSet and LiteralStringLong(soundSet) or 0)
		:SetInt64(1*8, soundName and LiteralStringLong(soundName) or 0)
		:SetInt32(2*8, 4)
		:SetInt32(3*8, secondButtonLabel and joaat(secondButtonLabel) or 0)
		:SetInt32(6*8, isSecondButtonHold and 1 or 0)
		:SetInt32(7*8, firstButtonText and joaat(firstButtonText) or 0)
		:SetInt32(10*8, isFirstButtonHold and 1 or 0)
		:SetInt32(11*8, thirdButtonLabel and joaat(thirdButtonLabel) or 0)
		:SetInt32(14*8, isThirdButtonHold and 1 or 0)
		:SetInt32(15*8, fourthButtonLabel and joaat(fourthButtonLabel) or 0)
		:SetInt32(18*8, isFourthButtonHold and 1 or 0)

	return paramsStruct:Buffer()
end

---
---@param title string
---@param text string
---@param soundSet string|nil
---@param soundName string|nil
---@param firstButtonLabel string|integer
---@param isFirstButtonHold boolean
---@param secondButtonLabel string|integer
---@param isSecondButtonHold boolean
---@param thirdButtonLabel string|integer
---@param isThirdButtonHold boolean
---@param fourthButtonLabel string|integer
---@param isFourthButtonHold boolean
---@return integer
function UiStickyFeedCreateErrorMessage(title, text, soundSet, soundName, firstButtonLabel, isFirstButtonHold, secondButtonLabel, isSecondButtonHold, thirdButtonLabel, isThirdButtonHold, fourthButtonLabel, isFourthButtonHold)
	local optionsBuffer = UiStickyFeedOptionsBuffer(soundSet, soundName, firstButtonLabel, isFirstButtonHold, secondButtonLabel, isSecondButtonHold, thirdButtonLabel, isThirdButtonHold, fourthButtonLabel, isFourthButtonHold)
	local paramsStruct = DataView.ArrayBuffer(8 + 2*16)
		:SetInt32(0*8, 0)
		:SetInt64(1*8, LiteralStringLong(title))
		:SetInt64(2*8, LiteralStringLong(text))
	
	return Citizen.InvokeNative(0x9F2CC2439A04E7BA, optionsBuffer, paramsStruct:Buffer(), true, Citizen.ResultAsInteger())
end

---
---@param text string
---@param soundSet string|nil
---@param soundName string|nil
---@param firstButtonLabel string|integer
---@param isFirstButtonHold boolean
---@param secondButtonLabel string|integer
---@param isSecondButtonHold boolean
---@param thirdButtonLabel string|integer
---@param isThirdButtonHold boolean
---@param fourthButtonLabel string|integer
---@param isFourthButtonHold boolean
---@return integer
function UiStickyFeedCreateDeathFailMessage(text, soundSet, soundName, firstButtonLabel, isFirstButtonHold, secondButtonLabel, isSecondButtonHold, thirdButtonLabel, isThirdButtonHold, fourthButtonLabel, isFourthButtonHold)
	local optionsBuffer = UiStickyFeedOptionsBuffer(soundSet, soundName, firstButtonLabel, isFirstButtonHold, secondButtonLabel, isSecondButtonHold, thirdButtonLabel, isThirdButtonHold, fourthButtonLabel, isFourthButtonHold)
	local paramsStruct = DataView.ArrayBuffer(8+16)
		:SetInt32(0*8, 0)
		:SetInt64(1*8, LiteralStringLong(text))

	return Citizen.InvokeNative(0x815C4065AE6E6071, optionsBuffer, paramsStruct:Buffer(), true, Citizen.ResultAsInteger())
end

---
---@param title string
---@param text string
---@param soundSet string|nil
---@param soundName string|nil
---@param firstButtonLabel string|integer
---@param isFirstButtonHold boolean
---@param secondButtonLabel string|integer
---@param isSecondButtonHold boolean
---@param thirdButtonLabel string|integer
---@param isThirdButtonHold boolean
---@param fourthButtonLabel string|integer
---@param isFourthButtonHold boolean
---@return integer
function UiStickyFeedCreateWarningMessage(title, text, soundSet, soundName, firstButtonLabel, isFirstButtonHold, secondButtonLabel, isSecondButtonHold, thirdButtonLabel, isThirdButtonHold, fourthButtonLabel, isFourthButtonHold)
	local optionsBuffer = UiStickyFeedOptionsBuffer(soundSet, soundName, firstButtonLabel, isFirstButtonHold, secondButtonLabel, isSecondButtonHold, thirdButtonLabel, isThirdButtonHold, fourthButtonLabel, isFourthButtonHold)
	local paramsStruct = DataView.ArrayBuffer(2*8 + 2*16)
		:SetInt32(0*8, 0)
		:SetInt32(1*8, 0)
		:SetInt64(2*8, LiteralStringLong(title))
		:SetInt64(3*8, LiteralStringLong(text))

	return Citizen.InvokeNative(0x339E16B41780FC35, optionsBuffer, paramsStruct:Buffer(), true, Citizen.ResultAsInteger())
end