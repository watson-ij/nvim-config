return {
  {
    "nvim-neorg/neorg",
    lazy=false,
    keys = {
      {"<leader>n", desc="neorg"},
      {"<leader>nn", "<cmd>Neorg<cr>"},
    },
    opts = {
      load = {
	["core.defaults"] = {},
	["core.concealer"] = {},
	["core.dirman"] = {
	  config = {
	    workspaces = {
	      notes = "~/obsidian-vault"
	    },
	    default_workspace = "notes",
	  }
	}
      }
    },
    build = {":Neorg sync-parsers"},
    dependencies = {{"nvim-lua/plenary.nvim"}}
  },
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
      {"<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc="search notes"},
    },
    opts = {
      dir = "~/obsidian-vault",
      daily_notes = {
	folder = "daily",
      },
      backlinks = {
	-- The default height of the backlinks pane.
	height = 10,
	-- Whether or not to wrap lines.
	wrap = true,
      },
    }
  }
}
