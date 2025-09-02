return {
  "goolord/alpha-nvim",
  config = function ()
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'
    dashboard.section.buttons.val = {
      dashboard.button("f", "find file", ":Telescope find_files<CR>"),
      dashboard.button("p", "find project", ":AutoSession search<CR>"),
      dashboard.button("q", "quit", ":q<CR>"),
    }
    alpha.setup(dashboard.config)
  end
}
