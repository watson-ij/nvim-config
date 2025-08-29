return {
  "rmagatti/auto-session",
  lazy = false,

  keys = {
    {"<leader>p", ":AutoSession search<CR>", desc="projects"},
  },

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/projects", "~/Downloads", "~/sync", "~/writing", "/" },
    -- log_level = 'debug',
  },
}
