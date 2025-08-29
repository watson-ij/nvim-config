return {
  {
    'nvim-telescope/telescope-project.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
    keys = {
      {"<leader>p", ":Telescope project<CR>", desc="project"},
    }
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {
      {"<leader>ff", ":Telescope find_files<CR>", desc="find files"},
      {"<leader>fb", ":Telescope file_browser<CR>", desc="file browser"},
      {"<leader>fg", ":Telescope git_files<CR>", desc="git files"},
      {"<leader>fr", ":Telescope oldfiles<CR>", desc="recent"},
      {"<leader>b", ":Telescope buffers<CR>", desc="buffers"},
      {"<leader>s", ":Telescope live_grep<CR>", desc="grep"},
    },
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  }
}
