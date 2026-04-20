local mod = {"cmd", "alt", "ctrl"}
local modShift = {"cmd", "alt", "ctrl", "shift"}

local ultrawideName = "S34C65"
local ultraSideSize = 0.23

local function focusedWindow()
    return hs.window.focusedWindow()
end

local function isUltra()
    local win = focusedWindow()
    if not win then return false end

    local name = win:screen():name() or ""
    return name:find(ultrawideName, 1, true) ~= nil
end

local function move(unit)
    local win = focusedWindow()
    if win then
        win:moveToUnit(unit)
    end
end

local function moveScreen(direction)
    local win = focusedWindow()
    if not win then return end

    local screens = hs.screen.allScreens()
    table.sort(screens, function(a, b)
        return a:frame().x < b:frame().x
    end)

    local current = win:screen()
    for i, screen in ipairs(screens) do
        if screen:id() == current:id() then
            local target = screens[i + direction]
            if target then
                win:moveToScreen(target)
            end
            return
        end
    end
end

hs.hotkey.bind(mod, "h", function()
    if isUltra() then
        move({x = 0.00, y = 0.00, w = ultraSideSize, h = 1.00})
    else
        move({x = 0.00, y = 0.00, w = 0.50, h = 1.00})
    end
end)

hs.hotkey.bind(mod, "l", function()
    if isUltra() then
        move({x = 1 - ultraSideSize, y = 0.00, w = ultraSideSize, h = 1.00})
    else
        move({x = 0.50, y = 0.00, w = 0.50, h = 1.00})
    end
end)

hs.hotkey.bind(mod, "k", function()
    move({x = 0.00, y = 0.00, w = 1.00, h = 0.50})
end)

hs.hotkey.bind(mod, "j", function()
    move({x = 0.00, y = 0.50, w = 1.00, h = 0.50})
end)

hs.hotkey.bind(mod, "return", function()
    local win = focusedWindow()
    if not win then return end

    if isUltra() then
        move({
            x = ultraSideSize,
            y = 0.00,
            w = 1 - (2 * ultraSideSize),
            h = 1.00
        })
    else
        win:maximize()
    end
end)

hs.hotkey.bind(mod, "space", function()
    if isUltra() then
        move({x = 0.00, y = 0.00, w = 1.00, h = 1.00})
    else
        move({x = 0.05, y = 0.05, w = 0.90, h = 0.90})
    end
end)

hs.hotkey.bind(modShift, "h", function()
    moveScreen(-1)
end)

hs.hotkey.bind(modShift, "l", function()
    moveScreen(1)
end)
