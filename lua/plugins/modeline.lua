return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
	disabled_filetypes = {
	  statusline = { "dashboard", "NvimTree" },
	  winbar = { "help", "startify" },
	},
	sections = {
	  lualine_y = "progress",
	}
      }
    }
  end
}
