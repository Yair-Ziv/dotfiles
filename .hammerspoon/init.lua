local baseShortcuts = {"cmd", "alt", "ctrl"}

hs.hotkey.bind(baseShortcuts, "t", function()
    hs.application.launchOrFocus("Ghostty")
end)

hs.hotkey.bind(baseShortcuts, "r", function()
    hs.application.launchOrFocus("Rider")
end)

hs.hotkey.bind(baseShortcuts, "d", function()
    hs.application.launchOrFocus("DataGrip")
end)

hs.hotkey.bind(baseShortcuts, "a", function()
    hs.application.launchOrFocus("Google Chrome")
end)

hs.hotkey.bind(baseShortcuts, "o", function()
    hs.application.launchOrFocus("OpenLens")
end)

hs.hotkey.bind(baseShortcuts, "w", function()
    hs.application.launchOrFocus("WebStorm")
end)

hs.hotkey.bind(baseShortcuts, "m", function()
    hs.application.launchOrFocus("Microsoft Outlook")
end)

hs.hotkey.bind(baseShortcuts, "s", function()
    hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind(baseShortcuts, "c", function()
    hs.application.launchOrFocus("Cursor")
end)

hs.hotkey.bind(baseShortcuts, "f", function()
    hs.application.launchOrFocus("Firefox")
end)

