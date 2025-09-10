return {
  {
    "markdown-table-formatter",
    name = "markdown-table-formatter",
    dir = vim.fn.stdpath("config"),
    ft = { "markdown", "md" },
    config = function()
      require("markdown-table-formatter").setup()
    end,
  },
  
  -- Uncomment to enable render-markdown plugin
  -- {
  --   "MeanderingProgrammer/render-markdown.nvim",
  --   dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  --   ft = { 'markdown', 'quarto' },
  --   opts = {}
  -- },
}
