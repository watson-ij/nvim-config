local function get_diary ()
  local filename = '/home/iyan/org-roam/daily/' .. os.date('%Y_%m_%d') .. '.org'
  -- ensure file exists
  local f = io.open(filename, 'r')
  if f == nil then
    f = io.open(filename, 'w')
    f:close()
  else
    f:close()
  end
  vim.cmd('e ' .. filename)
end

return {
  get_diary = get_diary,
}
