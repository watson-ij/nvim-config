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
      -- snippets = { preset='luasnip' },
      -- keymap = { preset = "enter", ["<C-y>"] = { "select_and_accept" } },
      keymap = { preset = "super-tab", ["<C-y>"] = { "select_and_accept" } },
      completion = { trigger = { show_in_snippet = false } },
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
