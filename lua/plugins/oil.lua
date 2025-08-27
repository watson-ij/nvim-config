return {
  {
    "stevearc/oil.nvim",
    lazy = false,
    opts = {
      default_file_explorer=true,
      columns = {"icon", "permissions", "size", "mtime"},
      keymaps = {
	["q"] = "actions.close",
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons"
    },
    keys = {
      {"-", "<cmd>Oil --float<cr>", desc="Open parent directory"},
    }
  }
}
