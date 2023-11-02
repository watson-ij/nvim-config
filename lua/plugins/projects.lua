return {
  {
    "ahmedkhalf/project.nvim",
    opts = {},
    events = {"BufReadPost", "VeryLazy"},
    config = function(_, opts)
      require('project_nvim').setup(opts)
    end,
    keys = {
      {"<leader>p", "<cmd>Telescope projects<CR>", desc="search projects"},
    }
  }
}
