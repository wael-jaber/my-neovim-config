-- Mason (installer for LSP servers, formatters, linters)
require('mason').setup({
  ensure_installed = {
    'prettier',
    'stylua',
    'eslint_d',
    'gofumpt',
    'goimports',
    'black',
  },
})

-- Auto-install LSP servers via mason-lspconfig
require('mason-lspconfig').setup({
  ensure_installed = {
    'rust_analyzer',
    'gopls',
    'ts_ls',
    'lua_language_server',
    'jsonls',
    'yamlls',
    'bashls',
  },
  handlers = {
    function(server_name)
      vim.lsp.enable(server_name)
    end,
  },
})

-- Default capabilities for all LSP servers (nvim-cmp integration)
vim.lsp.config('*', {
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          snippetSupport = true,
          resolveSupport = {
            properties = { 'documentation', 'detail', 'additionalTextEdits' },
          },
        },
      },
    },
  },
})

-- nvim-cmp setup
local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = {
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
}
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  mapping = cmp_mappings,
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  }, {
    { name = 'buffer' },
    { name = 'path' },
  }),
})

-- Diagnostic signs
vim.diagnostic.config({
  virtual_text = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = 'E',
      [vim.diagnostic.severity.WARN] = 'W',
      [vim.diagnostic.severity.HINT] = 'H',
      [vim.diagnostic.severity.INFO] = 'I',
    },
  },
})

