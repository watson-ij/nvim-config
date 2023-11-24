local wezterm = require "wezterm"
local act = wezterm.action

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end


config.font = wezterm.font ('CaskaydiaCove Nerd Font')
if wezterm.hostname() == 'ArchBeasty' then
  config.font_size = 14
else
  config.font_size = 16
end
config.color_scheme = 'nightfox'

-- if you are *NOT* lazy-loading smart-splits.nvim (recommended)
local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end


local direction_keys = {
  Left = 'n',
  Down = 'e',
  Up = 'i',
  Right = 'o',
  -- reverse lookup
  n = 'Left',
  e = 'Down',
  i = 'Up',
  o = 'Right',
}

local function split_nav(resize_or_move, key)
  return {
    key = key,
    mods = resize_or_move == 'resize' and 'META' or 'CTRL',
    action = wezterm.action_callback(function(win, pane)
      if is_vim(pane) then
        -- pass the keys through to vim/nvim
        win:perform_action({
          SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
        }, pane)
      else
        if resize_or_move == 'resize' then
          win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
        else
          win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
        end
      end
    end),
  }
end

config.keys = {
    -- move between split panes
    split_nav('move', 'n'),
    split_nav('move', 'e'),
    split_nav('move', 'i'),
    split_nav('move', 'o'),
    -- resize panes
    split_nav('resize', 'n'),
    split_nav('resize', 'e'),
    split_nav('resize', 'i'),
    split_nav('resize', 'o'),
    --{ key='N', mods='CTRL', action=act.ActivatePaneDirection 'Left'},
}

return config

