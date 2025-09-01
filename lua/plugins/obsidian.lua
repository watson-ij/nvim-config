return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "saghen/blink.compat",
  },
  ft = "markdown",
  event = "VeryLazy",
  keys = {
    {"<leader>n", group="notes", desc="notes"},
    {"<leader>nn", ":Obsidian quick_switch<CR>", desc="note"},
    {"<leader>ng", ":Obsidian tags<CR>", desc="tags"},
    {"<leader>nt", ":Obsidian today<CR>", desc="today"},
    {"<leader>nm", ":Obsidian tomorrow<CR>", desc="tomorrow"},
    {"<leader>nd", ":Obsidian dailies<CR>", desc="dailies"},
    {"<leader>ny", ":Obsidian yesterday<CR>", desc="yesterday"},
    {"<leader>ns", ":Obsidian search<CR>", desc="search"},
    {"<leader>nc", ":Obsidian new<CR>", desc="create new"},
    {"<leader>nb", ":Obsidian backlinks<CR>", desc="backlinks"},
  },
  opts = {
    workspaces = {
      {
	name = "notes",
	path = "~/sync/notes/",
      }
    },
    daily_notes = {
      folder = "Journal",
      alias_format = "%Y-%m-%d",
    },
    legacy_commands = false,
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = false,
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 0,
    },
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      -- This is equivalent to the default behavior.
      local path = spec.dir / tostring(spec.title)
      if spec.title == nil then
      	path = spec.dir / tostring(spec.id)
      end
      return path:with_suffix ".md"
    end,
    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      return title
    end,
    -- Optional, for templates (see https://github.com/obsidian-nvim/obsidian.nvim/wiki/Using-templates)
    templates = {
      folder = "templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function.
      -- Functions are called with obsidian.TemplateContext objects as their sole parameter.
      -- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#substitutions
      substitutions = {},

      -- A map for configuring unique directories and paths for specific templates
      --- See: https://github.com/obsidian-nvim/obsidian.nvim/wiki/Template#customizations
      customizations = {},
    },
  }
}
