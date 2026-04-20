local mod = {"cmd", "alt", "ctrl"}

local function open(appName)
    return function()
        hs.application.launchOrFocus(appName)
    end
end

local appBindings = {
    { "t", "Ghostty" },
    { "r", "Rider" },
    { "d", "DataGrip" },
    { "a", "Google Chrome" },
    { "o", "OpenLens" },
    { "w", "WebStorm" },
    { "m", "Microsoft Outlook" },
    { "s", "Slack" },
    { "c", "Visual Studio Code" },
    { "f", "Firefox" },
    { "z", "zoom.us" },
    { "i", "iTerm" },
    { "p", "Postman" },
    { "x", "Redis Insight" },
    { "n", "Windows App" },
    { "e", "Sublime Text" },
}

for _, binding in ipairs(appBindings) do
    local key, appName = binding[1], binding[2]
    hs.hotkey.bind(mod, key, open(appName))
end
