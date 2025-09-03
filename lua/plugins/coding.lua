return {
  {
    "hedyhli/outline.nvim",
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
	{ desc = "Toggle Outline" })

      require("outline").setup {
	-- Your setup opts here (leave empty to use defaults)
      }
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
  },
  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
	-- Configuration here, or leave empty to use defaults
      })
    end
  }
}
