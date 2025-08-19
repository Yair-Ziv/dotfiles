local baseShortcuts = {"cmd", "alt", "ctrl"}

local function open(name)
    return function()
        hs.application.launchOrFocus(name)
    end
end

hs.hotkey.bind(baseShortcuts, "t", open("Ghostty"))

hs.hotkey.bind(baseShortcuts, "r", open("Rider"))

hs.hotkey.bind(baseShortcuts, "d", open("DataGrip"))

hs.hotkey.bind(baseShortcuts, "a", open("Google Chrome"))

hs.hotkey.bind(baseShortcuts, "o", open("OpenLens"))

hs.hotkey.bind(baseShortcuts, "w", open("WebStorm"))

hs.hotkey.bind(baseShortcuts, "m", open("Microsoft Outlook"))

hs.hotkey.bind(baseShortcuts, "s", open("Slack"))

hs.hotkey.bind(baseShortcuts, "c", open("Cursor"))

hs.hotkey.bind(baseShortcuts, "f", open("Firefox"))

hs.hotkey.bind(baseShortcuts, "z", open("zoom.us"))
