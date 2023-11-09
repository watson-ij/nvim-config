
local function get_diary ()
  local filename = '/home/iyan/org-roam/daily/' .. os.date('%Y_%m_%d') .. '.org'
  -- ensure file exists
  local f = io.open(filename, 'r')
  if f == nil then
    f = io.open(filename, 'w')
    f:close()
  else
    f:close()
  end
  vim.cmd('e ' .. filename)
end

return {
  {
    "nvim-orgmode/orgmode",
    keys = {
      {"<leader>o", desc="orgmode"},
      {"<leader>ot", get_diary, desc="today's file"},
    },
    event = {"VeryLazy", "BufReadPre", "BufNewFile"},
    config = function ()
      require("orgmode").setup_ts_grammar()
      require("nvim-treesitter.configs").setup({
	highlight = {enable = true, additional_vim_regex_highlights = {"org"}},
	ensure_installed = {"org"}
      })
      require("orgmode").setup({
	org_agenda_files = "~/org-roam/**/*",
	org_default_notes_file = "~/org-roam/notes.org"
      })
    end
  },
  {
    "nvim-neorg/neorg",
    lazy=false,
    keys = {
      {"<leader>n", desc="neorg"},
      {"<leader>nn", "<cmd>Neorg<cr>", desc="Neorg"},
      {"<leader>ni", "<cmd>Neorg index<cr>", desc="Index"},
      {"<leader>nj", "<cmd>Neorg journal toc open<cr>", desc="Journal TOC"},
      {"<leader>nt", "<cmd>Neorg journal today<cr>", desc="Today"},
      {"<leader>ny", "<cmd>Neorg journal yesterday<cr>", desc="Yesterday"},
      {"<leader>ns", "<cmd>Telescope live_grep search_dirs=~/obsidian-vault/<cr>", desc="Search"},
      {"<leader>nx", "<cmd>Neorg export /home/iyan/obsidian-vault markdown /home/iyan/obsidian-vault<cr>", desc="Xport notes to md"},
    },
    opts = {
      load = {
	["core.defaults"] = {},
	["core.concealer"] = {config = {init_open_folds="always"}},
	["core.journal"] = {},
	["core.export"] = {},
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
--      {"<leader>o", desc="obsidian"},
--      {"<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", desc="switch to note"},
--      {"<leader>ot", "<cmd>ObsidianToday<CR>", desc="today's note"},
--      {"<leader>oy", "<cmd>ObsidianYesterday<CR>", desc="yesterday's note"},
--      {"<leader>os", "<cmd>ObsidianSearch<CR>", desc="search notes"},
--      {"<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc="search notes"},
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
