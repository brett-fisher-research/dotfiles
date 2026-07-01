local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- True on Windows machines only. target_triple looks like
-- "x86_64-pc-windows-msvc" on Windows, "...darwin"/"...linux" elsewhere.
local is_windows = wezterm.target_triple:find 'windows' ~= nil

--------------------------------------------------------------------------------
-- Windows-only settings (this file is meant to sync across machines via dotfiles)
--------------------------------------------------------------------------------
if is_windows then
  -- Start in Git Bash instead of PowerShell so unix commands are available.
  -- Full path avoids C:\Windows\System32\bash.exe, which is the WSL launcher.
  config.default_prog = { 'C:\\Program Files\\Git\\bin\\bash.exe', '-i', '-l' }

  -- Make Shift+Enter insert a newline (for Claude Code etc.) instead of
  -- submitting. By default the terminal collapses it into a plain carriage
  -- return; sending ESC+CR forwards the multi-line signal instead.
  config.keys = {
    { key = 'Enter', mods = 'SHIFT', action = wezterm.action.SendString '\x1b\r' },
  }
end

--------------------------------------------------------------------------------
-- Looks (platform-neutral)
--------------------------------------------------------------------------------
config.color_scheme = 'Tokyo Night'
config.window_background_opacity = 1.0

return config
