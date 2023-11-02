return {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
	keys = { {"<leader>g", desc="git"}, {"<leader>gg", "<cmd>LazyGit<CR>", desc="lazygit"} }
}
