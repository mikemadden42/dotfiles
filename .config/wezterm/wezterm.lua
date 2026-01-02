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
config.front_end = "WebGpu"
config.window_background_opacity = 0.85
if wezterm.target_triple:find("apple") then
  config.macos_window_background_blur = 30
end

config.window_padding = {
  left = 12,
  right = 12,
  top = 12,
  bottom = 12,
}

-- Cursor Styling (Kitty-style snappy blink)
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = 'Constant'
config.cursor_blink_ease_out = 'Constant'

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

-- Custom keyboard shortcuts
config.keys = {
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.ShowDebugOverlay,
  },
}

return config
