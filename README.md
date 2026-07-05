# Neovim Configuration

A modern Neovim config for Go, TypeScript (React), Rust, and Lua development.

## Features

- **Plugin manager:** [lazy.nvim](https://github.com/folke/lazy.nvim) — lazy-loaded for fast startup (~105ms)
- **LSP:** 7 language servers via `vim.lsp.enable` + Mason (rust-analyzer, gopls, ts_ls, lua-language-server, jsonls, yamlls, bashls)
- **Completion:** nvim-cmp with snippets (LuaSnip)
- **Formatting:** conform.nvim (prettier, stylua, gofumpt, goimports, black, rustfmt)
- **Linting:** nvim-lint (eslint_d)
- **File explorer:** neo-tree.nvim (tree view) + Telescope file_browser (fuzzy)
- **Fuzzy finder:** Telescope.nvim (files, grep, git, help, keymaps, diagnostics)
- **Debugging:** nvim-dap + DAP UI (delve, codelldb, js-debug-adapter)
- **Testing:** neotest (Go, Rust, Vitest)
- **Git:** vim-fugitive + gitsigns
- **Sessions:** persisted.nvim with Telescope picker
- **Dashboard:** dashboard-nvim (recent files, projects, new file)
- **UI:** which-key, noice.nvim, bufferline.nvim, lualine.nvim, dressing.nvim
- **Colorscheme:** tokyonight-night

## Prerequisites

- Neovim >= 0.12.0
- [ripgrep](https://github.com/BurntSushi/ripgrep) (`brew install ripgrep`)
- [fd](https://github.com/sharkdp/fd) (`brew install fd`)
- Node.js (for LSP servers like ts_ls)
- Go (for gopls, delve)
- Rust (for rust-analyzer)

## Installation

```sh
git clone https://github.com/wael-jaber/my-neovim-config.git ~/.config/nvim
nvim
```

On first launch, lazy.nvim auto-installs and syncs all plugins. Mason installs LSP servers, formatters, and linters in the background.

## Keybindings

See [KEYBINDINGS.md](KEYBINDINGS.md) for the full reference.

Quick start:

| Key | Action |
|---|---|
| `<space>pf` | Find files |
| `<space>pg` | Live grep |
| `<space>pv` | File browser (Telescope) |
| `<space>e` | File explorer (neo-tree) |
| `<space>gs` | Git status |
| `<space>f` | Format buffer |
| `gd` | Go to definition |
| `K` | Hover documentation |

## Plugin Management

| Command | Action |
|---|---|
| `:Lazy` | Open lazy.nvim UI |
| `:Lazy sync` | Install/update all plugins |
| `:Lazy update` | Update all plugins |
| `:Lazy clean` | Remove unused plugins |
| `:Lazy profile` | Show startup time breakdown |
| `:Mason` | Manage LSP/formatter/linter installs |
| `:checkhealth` | Verify setup |

## Project Structure

```
~/.config/nvim/
  init.lua              Entry point — bootstraps lazy.nvim
  lua/
    plugins.lua         Plugin specs (all 55 plugins)
    keymaps.lua         All keybindings in one file
    util.lua            Utility functions (project-local binary resolution)
    sets.lua            Global options
  after/plugin/         Plugin-specific configs (loaded after lazy)
    lsp.lua             Mason, mason-lspconfig, nvim-cmp, diagnostics
    conform.lua         Formatting config
    lint.lua            Linting config
    treesitter.lua      Treesitter parsers & highlighting
    telescope.lua       Telescope extension loading
    neo-tree.lua        (configured inline in plugins.lua)
    which-key.lua       which-key popup groups
    project-view.lua    Open neo-tree on `nvim .`
  KEYBINDINGS.md        Keybinding reference
```
