vim.g.mapleader = " "

-- File explorer
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Explorer" })
vim.keymap.set("n", "<leader>pv", ":Telescope file_browser<CR>", { desc = "File browser" })

-- LSP
vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })
vim.keymap.set("n", "K", ":lua vim.lsp.buf.hover()<CR>", { desc = "Hover" })
vim.keymap.set("n", "<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>", { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>vd", ":lua vim.diagnostic.open_float()<CR>", { desc = "Line diagnostics" })
vim.keymap.set("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", { desc = "Prev diagnostic" })
vim.keymap.set("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>vca", ":lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
vim.keymap.set("n", "<leader>vrr", ":lua vim.lsp.buf.references()<CR>", { desc = "References" })
vim.keymap.set("n", "<leader>vrn", ":lua vim.lsp.buf.rename()<CR>", { desc = "Rename" })

vim.keymap.set("i", "<C-h>", ":lua vim.lsp.buf.signature_help()<CR>", { desc = "Signature help" })

-- Projects
vim.keymap.set("n", "<leader>pp", ":Telescope projects<CR>", { desc = "Projects" })

-- Telescope
vim.keymap.set("n", "<leader>pf", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<C-p>", ":Telescope git_files<CR>", { desc = "Git files" })
vim.keymap.set("n", "<leader>ps", function()
  require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "Grep string" })
vim.keymap.set("n", "<leader>pg", ":Telescope live_grep<CR>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>ph", ":Telescope help_tags<CR>", { desc = "Help tags" })
vim.keymap.set("n", "<leader>pk", ":Telescope keymaps<CR>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>po", ":Telescope oldfiles<CR>", { desc = "Recent files" })
vim.keymap.set("n", "<leader>pd", ":Telescope diagnostics<CR>", { desc = "Diagnostics" })
-- Format
vim.keymap.set("n", "<Leader>f", ":lua require('conform').format({ lsp_fallback = true })<CR>", { desc = "Format buffer" })

-- Trouble
vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xX", ":Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set("n", "<leader>xl", ":Trouble loclist toggle<CR>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leader>xq", ":Trouble qflist toggle<CR>", { desc = "Quickfix List (Trouble)" })

-- Git
vim.keymap.set("n", "<leader>gs", ":0Git<CR>", { desc = "Git status" })

-- Terminal
vim.keymap.set("n", "<F7>", ":ToggleTerm<CR>", { desc = "Toggle terminal" })

-- Undotree
vim.keymap.set("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Undo tree" })

-- Buffer navigation
vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { desc = "Prev buffer" })

-- Todo comments
vim.keymap.set("n", "]t", ":lua require('todo-comments').jump_next()<CR>", { desc = "Next todo comment" })
vim.keymap.set("n", "[t", ":lua require('todo-comments').jump_prev()<CR>", { desc = "Previous todo comment" })

-- Debugging (DAP)
vim.keymap.set("n", "<leader>db", ":lua require('dap').toggle_breakpoint()<CR>", { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dc", ":lua require('dap').continue()<CR>", { desc = "Continue" })
vim.keymap.set("n", "<leader>do", ":lua require('dap').step_over()<CR>", { desc = "Step over" })
vim.keymap.set("n", "<leader>di", ":lua require('dap').step_into()<CR>", { desc = "Step into" })
vim.keymap.set("n", "<leader>dO", ":lua require('dap').step_out()<CR>", { desc = "Step out" })
vim.keymap.set("n", "<leader>dd", ":lua require('dapui').toggle()<CR>", { desc = "Toggle DAP UI" })
vim.keymap.set("n", "<leader>dt", ":lua require('dap').terminate()<CR>", { desc = "Terminate" })

-- Tests (Neotest)
vim.keymap.set("n", "<leader>tn", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%:p'))<CR>", { desc = "Run file tests" })
vim.keymap.set("n", "<leader>ts", ":lua require('neotest').summary.toggle()<CR>", { desc = "Toggle summary" })
vim.keymap.set("n", "<leader>to", ":lua require('neotest').output_panel.toggle()<CR>", { desc = "Toggle output" })
vim.keymap.set("n", "<leader>ta", ":lua require('neotest').run.run(vim.uv.cwd())<CR>", { desc = "Run all tests" })
