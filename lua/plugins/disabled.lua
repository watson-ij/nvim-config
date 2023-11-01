if vim.fn.hostname() == "ArchDesktop" or vim.fn.hostname == "ArchBeauty" then
  return {}
else
  return {
    { "rcarriga/nvim-notify", enabled = false },
  }
end
