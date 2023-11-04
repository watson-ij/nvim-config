return {
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
    },
    opts = function ()
      vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
      local cmp = require("cmp")
      local defaults = require("cmp.config.default")()
      return {
	completion = { completeopt = "menu,menuone,noinsert", },
	mapping = {
	  ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	  ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	  ["<C-f>"] = cmp.mapping.scroll_docs(4),
	  ["<C-b>"] = cmp.mapping.scroll_docs(-4),
	  ["<C-e>"] = cmp.mapping.abort(),
	  ["<C-space>"] = cmp.mapping.complete(),
	  ["<CR>"] = cmp.mapping.confirm(),
	},
	snippet = {
	  expand = function (args)
	    require("luasnip").lsp_expand(args.body)
	  end
	},
	sources = cmp.config.sources({
	  {name = "nvim_lsp"},
	  {name = "luasnip"},
	  {name = "path"}
	}, {
	  {name="buffer"},
	})
      }
    end,
    config = function(_, opts)
      for _, source in ipairs(opts.sources) do
        source.group_index = source.group_index or 1
      end
      require("cmp").setup(opts)
    end,
  }
}
