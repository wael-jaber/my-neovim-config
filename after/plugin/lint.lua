local ok, lint = pcall(require, 'lint')
if not ok then return end

local linter = lint.linters.eslint_d
linter.cmd = function()
  return require('util').find_project_binary(vim.api.nvim_get_current_buf(), 'eslint_d')
end

lint.linters_by_ft = {
  javascript = { 'eslint_d' },
  javascriptreact = { 'eslint_d' },
  typescript = { 'eslint_d' },
  typescriptreact = { 'eslint_d' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'InsertLeave' }, {
  callback = function()
    lint.try_lint()
  end,
})
