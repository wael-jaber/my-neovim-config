vim.api.nvim_create_autocmd('VimEnter', {
  group = vim.api.nvim_create_augroup('ProjectView', { clear = true }),
  callback = function()
    if vim.fn.argc() == 1 then
      local arg = vim.fn.argv(0)
      if vim.fn.isdirectory(arg) == 1 then
        vim.cmd('Neotree position=left dir=' .. arg)
      end
    end
  end,
  nested = true,
})
