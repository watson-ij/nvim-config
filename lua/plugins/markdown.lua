-- Function to format markdown tables
local function format_markdown_table()
  local cursor_line = vim.fn.line('.')
  local current_line_content = vim.fn.getline(cursor_line)
  
  -- Check if we're in a table row
  if not current_line_content:match('^%s*|') then
    print("Cursor is not in a markdown table")
    return
  end
  
  -- Find start of table by searching backwards
  local start_line = cursor_line
  while start_line > 1 do
    local line_content = vim.fn.getline(start_line - 1)
    if not line_content:match('^%s*|') then
      break
    end
    start_line = start_line - 1
  end
  
  -- Find end of table by searching forwards
  local end_line = cursor_line
  while end_line < vim.fn.line('$') do
    local line_content = vim.fn.getline(end_line + 1)
    if not line_content:match('^%s*|') then
      break
    end
    end_line = end_line + 1
  end
  
  -- Get all table lines
  local lines = {}
  for i = start_line, end_line do
    table.insert(lines, vim.fn.getline(i))
  end
  
  -- Parse table data
  local rows = {}
  local max_cols = 0
  
  for _, line in ipairs(lines) do
    local row = {}
    local trimmed = line:gsub('^%s*|%s*', ''):gsub('%s*|%s*$', '')
    
    if trimmed:match('^[-:| ]+$') then
      -- This is a separator line, preserve alignment info
      for col in trimmed:gmatch('[^|]+') do
        local cell = col:gsub('^%s*', ''):gsub('%s*$', '')
        table.insert(row, cell)
      end
      table.insert(rows, { type = 'separator', data = row })
    else
      -- Regular data row
      for col in trimmed:gmatch('[^|]+') do
        local cell = col:gsub('^%s*', ''):gsub('%s*$', '')
        table.insert(row, cell)
      end
      table.insert(rows, { type = 'data', data = row })
    end
    
    max_cols = math.max(max_cols, #row)
  end
  
  -- Calculate column widths
  local col_widths = {}
  for i = 1, max_cols do
    col_widths[i] = 0
  end
  
  for _, row in ipairs(rows) do
    if row.type == 'data' then
      for i, cell in ipairs(row.data) do
        col_widths[i] = math.max(col_widths[i], vim.fn.strwidth(cell))
      end
    end
  end
  
  -- Format the table
  local formatted_lines = {}
  
  for _, row in ipairs(rows) do
    local formatted_row = {}
    
    if row.type == 'separator' then
      -- Handle separator row with alignment
      for i = 1, max_cols do
        local separator = row.data[i] or '---'
        local width = col_widths[i]
        
        if separator:match('^:.*:$') then
          -- Center aligned
          local dashes = string.rep('-', width)
          table.insert(formatted_row, ':' .. dashes:sub(2, -2) .. ':')
        elseif separator:match(':$') then
          -- Right aligned
          local dashes = string.rep('-', width - 1)
          table.insert(formatted_row, dashes .. ':')
        else
          -- Left aligned (default)
          local dashes = string.rep('-', width)
          table.insert(formatted_row, dashes)
        end
      end
    else
      -- Handle data row
      for i = 1, max_cols do
        local cell = row.data[i] or ''
        local width = col_widths[i]
        local padded = cell .. string.rep(' ', width - vim.fn.strwidth(cell))
        table.insert(formatted_row, padded)
      end
    end
    
    table.insert(formatted_lines, '| ' .. table.concat(formatted_row, ' | ') .. ' |')
  end
  
  -- Replace the original table with formatted table
  vim.fn.setline(start_line, formatted_lines)
  if #formatted_lines < (end_line - start_line + 1) then
    vim.cmd(string.format('%d,%dd', start_line + #formatted_lines, end_line))
  end
end

-- Create the command
vim.api.nvim_create_user_command('FormatTable', format_markdown_table, {
  desc = 'Format markdown table with proper column alignment'
})

-- Set up keybinding for markdown files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'md' },
  callback = function()
    vim.keymap.set('n', '<localleader>f', format_markdown_table, {
      buffer = true,
      desc = 'Format markdown table'
    })
  end,
})

return {
  -- "MeanderingProgrammer/render-markdown.nvim",
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  -- ft = { 'markdown', 'quarto' },
  -- opts = {}
}
