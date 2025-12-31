local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- --- FONT SETTINGS ---
config.font = wezterm.font("Fira Code")
config.font_size = 18.0

-- --- COLOR SCHEME (Auto-detect Light/Dark) ---
local function get_appearance()
  if wezterm.gui then 
    return wezterm.gui.get_appearance() 
  end
  return 'Dark'
end

if get_appearance():find 'Dark' then
  config.color_scheme = 'Gruvbox Dark (Gogh)'
else
  config.color_scheme = 'GruvboxLight'
end

-- --- VISUALS (The "Ghostty" Polish) ---
config.window_background_opacity = 0.92
config.window_padding = {
  left = 12,
  right = 12,
  top = 12,
  bottom = 12,
}

-- Tab Bar
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- --- BEHAVIOR & SELECTION ---
-- Replicates Ghostty's scrollback and selection logic
config.scrollback_lines = 10000
config.selection_word_boundary = " \t\n{}[ ]\"'`"

-- Replicates window-inherit-font-size = false
-- Prevents window from resizing/snapping when changing font scale
config.adjust_window_size_when_changing_font_size = false

return config
