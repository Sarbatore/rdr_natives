RegisterCommand("ErrorMessage", function()
    local feedMessage = UiStickyFeedCreateErrorMessage(
        "Error",
        "Ho ho ho this is an error message",
        "",
        "",
        `IB_QUIT`,
        true,
        `IB_RETRY`,
        false
    )
    repeat Wait(0) until UiStickyFeedGetMessageState(feedMessage) == 4
    UiStickyFeedClearMessage(feedMessage)
end, false)

RegisterCommand("DeathFailMessage", function()
    local feedMessage = UiStickyFeedCreateDeathFailMessage(
        "Fail",
        "",
        "",
        `IB_QUIT`,
        true,
        `IB_RETRY`,
        false
    )
    repeat Wait(0) until UiStickyFeedGetMessageState(feedMessage) == 4
    UiStickyFeedClearMessage(feedMessage)
end, false)

RegisterCommand("WarningMessage", function()
    local feedMessage = UiStickyFeedCreateWarningMessage(
        "Warning",
        "Ho ho ho this is a warning message",
        "",
        "",
        `IB_QUIT`,
        true,
        `IB_RETRY`,
        false
    )
    repeat Wait(0) until UiStickyFeedGetMessageState(feedMessage) == 4
    UiStickyFeedClearMessage(feedMessage)
end, false)