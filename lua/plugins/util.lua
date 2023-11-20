return {
  -- measure startuptime
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    lazy = false,
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },

  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    opts = {
    },
    keys = {
      { "<C-n>", function () require('smart-splits').move_cursor_left() end },
      { "<C-e>", function () require('smart-splits').move_cursor_down() end },
      { "<C-i>", function () require('smart-splits').move_cursor_up() end },
      { "<C-o>", function () require('smart-splits').move_cursor_right() end },
      { "<A-n>", function () require('smart-splits').resize_left() end },
      { "<A-e>", function () require('smart-splits').resize_down() end },
      { "<A-i>", function () require('smart-splits').resize_up() end },
      { "<A-o>", function () require('smart-splits').resize_right() end },
      { "<C-A-n>", function () require('smart-splits').swap_buf_left() end },
      { "<C-A-e>", function () require('smart-splits').swap_buf_down() end },
      { "<C-A-i>", function () require('smart-splits').swap_buf_up() end },
      { "<C-A-o>", function () require('smart-splits').swap_buf_right() end },
    }
  },

  -- Session management. This saves your session in the background,
  -- keeping track of open buffers, window arrangement, and more.
  -- You can restore sessions when returning through the dashboard.
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = { options = vim.opt.sessionoptions:get() },
    -- stylua: ignore
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },
}
