return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function ()
      local opts = {
	theme = "doom",
	config = {
	  header = {"", "", "Willkommen", "", ""},
	  center = {
	    {action = "Telescope find_files", desc="Find file", key="f"},
	    {action = "Telescope oldfiles", desc="Recent files", key="r"},
	    {action = "Telescope live_grep", desc="Grep", key="g"},
	    {action = "Telescope find_files dir=~/.config/nvim", desc="Config", key="c"},
	    {action = "Lazy", desc="Lazy", key="l"},
	    {action = "qa", desc="Quit", key="q"},
	  },
	}
      }
      return opts
    end
  }
}
