local ok, conform = pcall(require, 'conform')
if not ok then return end

conform.setup({
  formatters = {
    prettier = {
      command = function(_, ctx)
        return require('util').find_project_binary(ctx.buf, 'prettier')
      end,
    },
  },
  formatters_by_ft = {
    lua = { 'stylua' },
    rust = { 'rustfmt', lsp_format = 'fallback' },
    go = { 'gofumpt', 'goimports', lsp_format = 'fallback' },
    python = { 'black' },
    -- prettier for all its supported filetypes
    javascript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    json = { 'prettier' },
    jsonc = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
    html = { 'prettier' },
    css = { 'prettier' },
    scss = { 'prettier' },
    less = { 'prettier' },
    graphql = { 'prettier' },
  },
})
