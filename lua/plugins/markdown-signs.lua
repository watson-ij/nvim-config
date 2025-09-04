return {
  name = "markdown-code-block-signs",
  dir = vim.fn.stdpath("config"), -- use local config dir, no repo
  ft = { "markdown", "md" },
  config = function()
    -- Define custom sign
    vim.fn.sign_define("CodeBlock", {
      text = "▐",
      texthl = "DiagnosticInfo",
      numhl = "DiagnosticInfo"
    })

    -- Function to update code block signs
    local function update_code_block_signs()
      local bufnr = vim.api.nvim_get_current_buf()
      
      -- Clear existing signs
      vim.fn.sign_unplace("code_blocks", { buffer = bufnr })
      
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      local in_code_block = false
      
      for i, line in ipairs(lines) do
        -- Check for code block delimiters (``` or ~~~)
        if line:match("^%s*```") or line:match("^%s*~~~") then
          in_code_block = not in_code_block
        end
        
        -- Place sign for all lines in code blocks
        if in_code_block then
          vim.fn.sign_place(0, "code_blocks", "CodeBlock", bufnr, { lnum = i })
        end
      end
    end

    -- Set up autocommands for markdown files
    vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI" }, {
      pattern = { "*.md", "*.markdown" },
      callback = update_code_block_signs,
      group = vim.api.nvim_create_augroup("MarkdownCodeBlockSigns", { clear = true })
    })
  end
}