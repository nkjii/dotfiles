local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

config.automatically_reload_config = true
config.font_size = 14.0
config.use_ime = true
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10
config.window_decorations = "RESIZE"
config.color_scheme = 'Tokyo Night'
config.font = wezterm.font_with_fallback{"Hack Nerd Font", "Firge35Nerd Console"}
config.leader = { key="q", mods="CTRL", timeout_milliseconds=1000 }
config.keys = {
  { key = "v", mods = "LEADER", action = act.SplitHorizontal{ domain = "CurrentPaneDomain" } },
  { key = "s", mods = "LEADER", action = act.SplitVertical{ domain = "CurrentPaneDomain" } },
  { key = "d", mods = "LEADER", action = act.CloseCurrentPane{ confirm = true } },
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "H", mods = "LEADER", action = act.AdjustPaneSize{"Left", 10} },
  { key = "L", mods = "LEADER", action = act.AdjustPaneSize{"Right", 10} },
  { key = "K", mods = "LEADER", action = act.AdjustPaneSize{"Up", 5} },
  { key = "J", mods = "LEADER", action = act.AdjustPaneSize{"Down", 5} },
  { key = "r", mods = "LEADER", action = act.ClearScrollback 'ScrollbackAndViewport' },
}
return config
