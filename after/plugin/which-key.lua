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

      { '<leader>e', desc = 'Explorer' },

      { '<leader>g', group = 'Git' },
      { '<leader>gs', desc = 'Status' },
      { '<leader>gb', desc = 'Blame' },

      { '<leader>p', group = 'Telescope' },
      { '<leader>pv', desc = 'File browser' },
      { '<leader>pp', desc = 'Projects' },
      { '<leader>ps', desc = 'Sessions' },
      { '<leader>pf', desc = 'Find files' },
      { '<leader>ps', desc = 'Grep string' },
      { '<leader>pg', desc = 'Live grep' },
      { '<leader>ph', desc = 'Help tags' },
      { '<leader>pk', desc = 'Keymaps' },
      { '<leader>po', desc = 'Recent files' },
      { '<leader>pd', desc = 'Diagnostics' },

      { '<leader>x', group = 'Trouble' },
      { '<leader>xx', desc = 'Toggle diagnostics' },
      { '<leader>xX', desc = 'Buffer diagnostics' },
      { '<leader>xl', desc = 'Location list' },
      { '<leader>xq', desc = 'Quickfix list' },

      { '<leader>d', group = 'Debug' },
      { '<leader>db', desc = 'Toggle breakpoint' },
      { '<leader>dc', desc = 'Continue' },
      { '<leader>do', desc = 'Step over' },
      { '<leader>di', desc = 'Step into' },
      { '<leader>dO', desc = 'Step out' },
      { '<leader>dd', desc = 'Toggle DAP UI' },
      { '<leader>dt', desc = 'Terminate' },

      { '<leader>t', group = 'Test' },
      { '<leader>tn', desc = 'Run nearest test' },
      { '<leader>tf', desc = 'Run file tests' },
      { '<leader>ts', desc = 'Toggle summary' },
      { '<leader>to', desc = 'Toggle output' },
      { '<leader>ta', desc = 'Run all tests' },
    })
  end,
})
