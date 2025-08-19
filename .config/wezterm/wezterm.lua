-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config.color_scheme = "Solarized Dark Higher Contrast"
config.font = wezterm.font("MesloLGS NF")
config.font_size = 13
config.enable_tab_bar = true
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.85
config.macos_window_background_blur = 10
config.use_fancy_tab_bar = false

-- cursor
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 800
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 1, -- reduce color intensity a bit
  brightness = 0.5, -- make inactive panes darker
}

-- Tab bar colors
config.colors = {
  tab_bar = {
    background = "#002b36", -- base03 from Solarized Dark

    active_tab = {
      bg_color = "#073642", -- base02
      fg_color = "#eee8d5", -- base2
      intensity = "Bold",
    },

    inactive_tab = {
      bg_color = "#002b36", -- base03
      fg_color = "#586e75", -- base01
    },

    inactive_tab_hover = {
      bg_color = "#073642", -- base02
      fg_color = "#93a1a1", -- base1
      italic = true,
    },

    new_tab = {
      bg_color = "#002b36", -- base03
      fg_color = "#586e75", -- base01
    },

    new_tab_hover = {
      bg_color = "#073642",
      fg_color = "#93a1a1",
      italic = true,
    },
  },
}

-- Keybindings
config.keys = {
  {
    key = "d",
    mods = "CMD",
    action = wezterm.action.SplitHorizontal { domain = "CurrentPaneDomain" },
  },
  {
    key = "d",
    mods = "CMD|SHIFT",
    action = wezterm.action.SplitVertical { domain = "CurrentPaneDomain" },
  },
  {
    key = "LeftArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    key = "RightArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  {
    key = "UpArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    key = "DownArrow",
    mods = "CMD",
    action = wezterm.action.ActivatePaneDirection "Down",
  },
  {
    key = "w",
    mods = "CMD",
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
}

-- and finally, return the configuration to wezterm
return config
