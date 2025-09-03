return {
  {
    "saghen/blink.cmp",
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- { 'L3MON4D3/LuaSnip', version = 'v2.*' },
      -- add blink.compat to dependencies
      {
	"saghen/blink.compat",
	optional = true, -- make optional so it's only enabled if any extras need it
	opts = {},
	version = "2.*",
      },
    },
    event = "InsertEnter",
    opts_extend = {
      "sources.completion.enabled_providers",
      "sources.compat",
      "sources.default",
    },
    opts = {
      -- Hippie-expand style configuration
      keymap = {
        ['<M-/>'] = { 'show', 'insert_next', 'fallback' },
        ['<M-?>'] = { 'insert_prev' },
        ["<C-y>"] = { "select_and_accept" },
        ['<Tab>'] = { 'snippet_forward', 'select_and_accept', 'fallback' },
        ['<S-Tab>'] = { 'snippet_backward', 'select_prev', 'fallback' },
      },
      completion = { 
        trigger = { 
          show_in_snippet = false,
          show_on_keyword = false,
          show_on_trigger_character = false,
        },
        menu = { enabled = true }, -- Show menu once manually triggered
        list = { 
          selection = { preselect = false }, 
          cycle = { from_top = false } 
        },
      },
      sources = {
	-- adding any nvim-cmp sources here will enable them
	-- with blink.compat
	-- compat = { "obsidian", "obsidian_new", "obsidian_tags" },
	default = { "obsidian", "obsidian_new", "obsidian_tags", "lsp", "path", "snippets", "buffer" },
	-- providers = {
	--   obsidian = {
	--     name = "obsidian",
	--     module = "blink.compat.source",
	--   },
	--   obsidian_tags = {
	--     name = "obsidian_tags",
	--     module = "blink.compat.source",
	--   },
	--   obsidian_new = {
	--     name = "obsidian_new",
	--     module = "blink.compat.source",
	--   }
	-- },
      },
    },
  }
}
