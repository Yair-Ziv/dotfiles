local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 17

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.color_scheme = 'kanagawabones'

config.window_padding = {
    left = 5,
    right = 5,
    top = 5,
    bottom = 5
}

config.harfbuzz_features = {"calt=0", "clig=0", "liga=0"}
return config
