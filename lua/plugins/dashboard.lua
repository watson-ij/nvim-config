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
	    {action = "qa", desc="Quit", key="q"},
	  },
	}
      }
      return opts
    end
  }
}
