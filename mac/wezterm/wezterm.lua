local wezterm = require 'wezterm'
local background = require 'background'
local config = wezterm.config_builder()
local act = wezterm.action

-- IME
config.use_ime = true

config.initial_cols = 160
config.initial_rows = 100
config.font_size = 12.5
config.cell_width = 1.0
config.line_height = 1.2
config.color_scheme = "Catppuccin Mocha"
config.font = wezterm.font_with_fallback({
  {family="CaskaydiaCove Nerd Font Mono", weight="Regular"},
})
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.97
config.text_background_opacity = 1.00
config.background = background

config.skip_close_confirmation_for_processes_named = {""}
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  return {
    {Text=" " .. tab.active_pane.title .. " "},
  }
end)

config.colors = {
  tab_bar = {
    background = "#1b1f2f",

    active_tab = {
      bg_color = "#444b71",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },

    inactive_tab = {
      bg_color = "#282d3e",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },

    inactive_tab_hover = {
      bg_color = "#1b1f2f",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = true,
      strikethrough = false,
    },

    new_tab = {
      bg_color = "#1b1f2f",
      fg_color = "#c6c8d1",
      italic = false
    },

    new_tab_hover = {
      bg_color = "#444b71",
      fg_color = "#c6c8d1",
      italic = false
    },
  }
}

config.leader = { key="q", mods="CTRL", timeout_milliseconds=1000 }
config.keys = {
    { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
    { key = "q", mods = "LEADER", action = act.CloseCurrentTab{ confirm = true } },
    { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
    { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
    { key = "w", mods = "LEADER", action = act.ShowTabNavigator },

    { key = "v", mods = "LEADER", action = act.SplitHorizontal{ domain = "CurrentPaneDomain" } },
    { key = "s", mods = "LEADER", action = act.SplitVertical{ domain = "CurrentPaneDomain" } },
    { key = "x", mods = "LEADER", action = act.CloseCurrentPane{ confirm = true } },
    { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "H", mods = "LEADER", action = act.AdjustPaneSize{"Left", 10} },
    { key = "L", mods = "LEADER", action = act.AdjustPaneSize{"Right", 10} },
    { key = "K", mods = "LEADER", action = act.AdjustPaneSize{"Up", 5} },
    { key = "J", mods = "LEADER", action = act.AdjustPaneSize{"Down", 5} },

    -- { key = "x", mods = "CTRL|SHIFT", action = act.ActivateCopyMode },
    { key = "v", mods = "CTRL|SHIFT", action = act.PasteFrom("Clipboard") },

    { key = "Enter", mods = "ALT", action = 'DisableDefaultAssignment' },
}

return config
