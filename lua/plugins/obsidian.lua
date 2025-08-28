return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown",
  event = "VeryLazy",
  keys = {
    {"<leader>n", group="notes", desc="notes"},
    {"<leader>nn", ":Obsidian quick_switch<CR>", desc="note"},
    {"<leader>nt", ":Obsidian today<CR>", desc="today"},
    {"<leader>nm", ":Obsidian today<CR>", desc="today"},
    {"<leader>ny", ":Obsidian yesterday<CR>", desc="yesterday"},
    {"<leader>ns", ":Obsidian search<CR>", desc="search"},
  },
  opts = {
    workspaces = {
      {
	name = "notes",
	path = "~/sync/obsidian/iyanblichus/",
      }
    },
    legacy_commands = false,
  }
}
