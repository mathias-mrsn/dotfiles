local wezterm = require("wezterm")

return {
  -- Font
  font = wezterm.font("JetBrainsMono Nerd Font"),
  font_size = 18.0,

  -- Colors
  color_scheme = 'Gruvbox dark, hard (base16)',

  -- Window
  window_decorations = 'RESIZE',
  use_fancy_tab_bar = false,
  show_new_tab_button_in_tab_bar = false,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  tab_max_width = 26,
  window_padding = {
    left = '10px',
    right = '10px',
    top = '10px',
    bottom = 0,
  },
  initial_rows = 120,
  initial_cols = 350,
  enable_scroll_bar = false,

  -- Opacity and blur
  window_background_opacity = 0.7,
  macos_window_background_blur = 25,

  -- Cursor
  cursor_blink_rate = 500,
  default_cursor_style = 'BlinkingBlock',
  cursor_blink_ease_in = 'Constant',
  cursor_blink_ease_out = 'Constant',

  keys = {
    {
      key = 'f',
      mods = 'CMD',
      action = wezterm.action.ToggleFullScreen,
    },
  }
}
