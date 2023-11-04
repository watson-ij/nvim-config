return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function ()
      local opts = {
	theme = "doom",
	config = {
	  header = {"", "", "Willkommen auf NeoVim", "", ""},
	  center = {
	    {action = "Telescope find_files", desc="Find file", key="f"},
	    {action = "Telescope oldfiles", desc="Recent files", key="r"},
	    {action = "Telescope live_grep", desc="Grep", key="g"},
	    {action = "Telescope find_files dir=~/.config/nvim", desc="Config", key="c"},
	    {action = "Neorg index", desc="Neorg Index", key="i"},
	    {action = "Neorg journal today", desc="Today", key="t"},
	    {action = "Neorg journal yesterday", desc="Yesterday", key="y"},
	    {action = "Lazy", desc="Lazy", key="l"},
	    {action = "qa", desc="Quit", key="q"},
	  },
	}
      }
      return opts
    end
  }
}
