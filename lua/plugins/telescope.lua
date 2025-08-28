return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = {
      {"<leader>fb", ":Telescope file_browser<CR>", desc="file browser"},
      {"<leader>fg", ":Telescope git_files<CR>", desc="git files"},
    },
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  }
}
