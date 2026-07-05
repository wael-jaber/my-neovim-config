local ok, wk = pcall(require, 'which-key')
if not ok then return end

wk.setup({})

vim.api.nvim_create_autocmd('BufReadPost', {
  group = vim.api.nvim_create_augroup('WhichKeyPre', {}),
  callback = function()
    wk.add({
      { '<leader>v', group = 'LSP' },
      { '<leader>vd', desc = 'Diagnostics' },
      { '<leader>vws', desc = 'Workspace symbols' },
      { '<leader>vca', desc = 'Code action' },
      { '<leader>vrr', desc = 'References' },
      { '<leader>vrn', desc = 'Rename' },

      { '<leader>f', group = 'Format' },

      { '<leader>p', group = 'Telescope' },
      { '<leader>pv', desc = 'File browser' },
      { '<leader>pf', desc = 'Find files' },
      { '<leader>ps', desc = 'Grep string' },
      { '<leader>pg', desc = 'Live grep' },
      { '<leader>ph', desc = 'Help tags' },
      { '<leader>pk', desc = 'Keymaps' },
      { '<leader>po', desc = 'Recent files' },
      { '<leader>pd', desc = 'Diagnostics' },
      { '<leader>pb', desc = 'File browser' },

      { '<leader>x', group = 'Trouble' },
      { '<leader>xx', desc = 'Toggle diagnostics' },
      { '<leader>xX', desc = 'Buffer diagnostics' },
      { '<leader>xl', desc = 'Location list' },
      { '<leader>xq', desc = 'Quickfix list' },
    })
  end,
})
