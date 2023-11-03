return {
  {
    "epwalsh/obsidian.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    event = {
      vim.fn.expand "BufReadPre ~/obisidian-vault/**.md",
      vim.fn.expand "BufNewFile ~/obsidian-vault/**.md",
    },
    keys = {
      {"<leader>o", desc="obsidian"},
      {"<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", desc="switch to note"},
      {"<leader>ot", "<cmd>ObsidianToday<CR>", desc="today's note"},
      {"<leader>oy", "<cmd>ObsidianYesterday<CR>", desc="yesterday's note"},
      {"<leader>os", "<cmd>ObsidianSearch<CR>", desc="search notes"},
    },
    opts = {
      dir = "~/obsidian-vault"
    }
  }
}
