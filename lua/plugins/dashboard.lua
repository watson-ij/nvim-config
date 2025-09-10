return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function ()
    local alpha = require'alpha'
    local dashboard = require'alpha.themes.dashboard'
    
    dashboard.section.header.val = {
      [[                                                ]],
      [[  ██╗██╗   ██╗ █████╗ ███╗   ██╗██╗   ██╗██╗███╗   ███╗ ]],
      [[  ██║╚██╗ ██╔╝██╔══██╗████╗  ██║██║   ██║██║████╗ ████║ ]],
      [[  ██║ ╚████╔╝ ███████║██╔██╗ ██║██║   ██║██║██╔████╔██║ ]],
      [[  ██║  ╚██╔╝  ██╔══██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
      [[  ██║   ██║   ██║  ██║██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
      [[  ╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
      [[                                                ]],
    }
    
    dashboard.section.buttons.val = {
      dashboard.button("f", "find file", ":Telescope find_files<CR>"),
      dashboard.button("p", "find project", ":AutoSession search<CR>"),
      dashboard.button("c", "config", ":AutoSession restore /home/iyan/.config/nvim<CR>"),
      dashboard.button("t", "today's note", ":Obsidian today<CR>"),
      dashboard.button("y", "yesterday's note", ":Obsidian yesterday<CR>"),
      dashboard.button("l", "lazy", ":Lazy<CR>"),
      dashboard.button("q", "quit", ":q<CR>"),
    }
    
    -- Add footer with startup stats
    local function footer()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      local version = vim.version()
      return {
        "",
        "⚡ Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch .. " loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
      }
    end
    
    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "Type"
    
    -- Refresh footer after lazy loading completes
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        dashboard.section.footer.val = footer()
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
    
    alpha.setup(dashboard.config)
  end
}
