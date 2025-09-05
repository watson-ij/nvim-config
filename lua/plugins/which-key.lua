return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    
    -- Register persistent group descriptions
    wk.add({
      { "<leader>a", group = "AI/Claude" },
      { "<leader>n", group = "Notes" },
      { "<leader>f", group = "Files" },
    })
    
    -- Create smart placeholder for claudecode to prevent fallback to 'a' (append mode)
    vim.keymap.set('n', '<leader>a', function()
      -- Check if already loaded by seeing if the real keymap exists
      if vim.fn.maparg('<leader>ac', 'n') ~= '' then
        -- Already loaded, just show which-key
        wk.show({ keys = "<leader>a" })
        return
      end
      
      -- Not loaded yet, force load and wait
      require("lazy").load({ plugins = { "claudecode.nvim" } })
      
      -- Poll for loading completion
      local tries = 0
      local function check_loaded()
        tries = tries + 1
        if vim.fn.maparg('<leader>ac', 'n') ~= '' or tries > 100 then
          wk.show({ keys = "<leader>a" })
        else
          vim.defer_fn(check_loaded, 10)
        end
      end
      check_loaded()
    end, { desc = "AI/Claude Code" })
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
    {"<leader>l", ":Lazy<CR>", {desc="lazy"} }
  },
}
