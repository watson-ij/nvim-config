return {
  {
    "nvim-telescope/telescope-file-browser.nvim",
    keys = { {"<leader>fb", ":Telescope file_browser<CR>"} },
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  }
}
