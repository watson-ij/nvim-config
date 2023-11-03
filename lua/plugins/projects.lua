return {
  {
    "ahmedkhalf/project.nvim",
    opts = {
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".SCRAM" }
    },
    events = {"BufReadPost", "VeryLazy"},
    config = function(_, opts)
      require('project_nvim').setup(opts)
    end,
    keys = {
      {"<leader>p", "<cmd>Telescope projects<CR>", desc="search projects"},
    }
  }
}
