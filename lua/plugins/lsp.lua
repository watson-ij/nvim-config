return {
  {
    "neovim/nvim-lspconfig",
    events = {"BufReadPre","VeryLazy"},
    dependencies = {
      { "folke/neoconf.nvim", cmd = "Neoconf", config = false, dependencies = { "nvim-lspconfig" } },
      { "folke/neodev.nvim", opts = {} },
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {

    },
    config = function(_, opts)
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    keys = {{"<leader>cm", "<cmd>Mason<cr>", desc="Mason"}},
    opts = { ensure_installed = "", },
    config = function (_, opts)
      require("mason").setup(opts)
      require("mason-lspconfig").setup({ensure_installed={"lua_ls", }})
      require("mason-lspconfig").setup_handlers {
	function(server_name)
	  require ("lspconfig")[server_name].setup {}
	end
      }
    end
  }
}
