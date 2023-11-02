return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false,
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = vim.fn.executable("make") == 1,
      }
    },
    -- https://github.com/nvim-telescope/telescope.nvim
    keys = {
      {"<leader>f", desc="files, etc."},
      {"<leader>ff", "<cmd>Telescope find_files<cr>", desc="Find files"},
      {"<leader>fb", "<cmd>Telescope buffers<cr>", desc="Buffers"},
      {"<leader>fg", "<cmd>Telescope live_grep<cr>", desc="Grep"},
      {"<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent"},
      {"<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help"},
      {"<leader>fp", "<cmd>Telescope git_files<cr>", desc = "Files in git"},
    },
    opts = {
      extensions = {
	fzf = {
	  fuzzy = true,
	}
      }
    },
    config = function (_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('fzf')
    end
  }
}
