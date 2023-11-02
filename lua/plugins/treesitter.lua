-- https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/plugins/treesitter.lua
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = {"lua", "python", "c", "cpp"},
		highlight = { enable = true, disable = {}, },
		indent = { enable = true },
	},
	cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
	lazy = true,
	event = { "BufReadPost", "VeryLazy" },
	init = function(plugin)
		-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
		-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
		-- no longer trigger the **nvim-treeitter** module to be loaded in time.
		-- Luckily, the only thins that those plugins need are the custom queries, which we make available
		-- during startup.
		require("lazy.core.loader").add_to_rtp(plugin)
		require("nvim-treesitter.query_predicates")
	end,
	config = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			---@type table<string, boolean>
			local added = {}
			opts.ensure_installed = vim.tbl_filter(function(lang)
				if added[lang] then
					return false
				end
				added[lang] = true
				return true
				end, opts.ensure_installed)
		end
		require("nvim-treesitter.configs").setup(opts)
	end,
}
