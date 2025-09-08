-- =========================
-- App hotkeys (launch/focus)
-- =========================

local mod = {"cmd", "alt", "ctrl"}

local function open(name)
    return function()
        hs.application.launchOrFocus(name)
    end
end

-- Keep order explicit & tidy
local bindings = {
    { "t", "Ghostty" },
    { "r", "Rider" },
    { "d", "DataGrip" },
    { "a", "Google Chrome" },
    { "o", "OpenLens" },
    { "w", "WebStorm" },
    { "m", "Microsoft Outlook" },
    { "s", "Slack" },
    { "c", "Cursor" },
    { "f", "Firefox" },
    { "z", "zoom.us" },
    { "i", "iTerm" },
    { "p", "Postman" },
}

for _, map in ipairs(bindings) do
    local key, app = map[1], map[2]
    hs.hotkey.bind(mod, key, open(app))
end
