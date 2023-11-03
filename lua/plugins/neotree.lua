return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information      
    },
    keys = {
      {"<leader>d", "<cmd>Neotree position=current<CR>", desc='neotree(ntwr)'},
      {
	"<leader>fe",
	function ()
	  require("neo-tree.command").execute({toggle = true, })--dir = require('project_nvim.project').get_project_root()[1]})
	end,
	desc = "neotree (root)"
      },
      {
	"<leader>fw",
	function ()
	  require("neo-tree.command").execute({toggle = true, })
	end,
	desc = "neotree (cwd)"
      },
      { "<leader>e", "<leader>fe", desc="neotree (root)", remap=true},
    },
    opts = {
      sources = {"filesystem", "buffers", "git_status", "document_symbols"},
    },
  }
}
