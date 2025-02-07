# My Neovim Configuration

This repository contains my personal Neovim configuration using [Packer](https://github.com/wbthomason/packer.nvim) as a plugin manager.

## 📦 Installation
Follow these steps to set up Neovim with this configuration on a new machine.

### 1️⃣ Install Neovim
Ensure Neovim is installed. On macOS, install it using Homebrew:
```sh
brew install neovim
```

### 2️⃣ Install Packer (Plugin Manager)
Since this config uses Packer, install it by running:
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim \
  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### 3️⃣ Clone This Repository
Copy this Neovim configuration to the correct directory:
```sh
git clone https://github.com/wael-jaber/my-neovim-config.git ~/.config/nvim
```

### 4️⃣ Install Plugins
Launch Neovim and install the required plugins:
```sh
nvim
```
Inside Neovim, run:
```vim
:PackerSync
```

### 5️⃣ Install Dependencies
Some plugins require additional dependencies:

#### 📌 Install Node.js (for LSP & Treesitter support)
```sh
brew install node
```

#### 📌 Install Python support
```sh
brew install python
pip3 install --user pynvim
```

#### 📌 Install Ripgrep (for Telescope fuzzy finder)
```sh
brew install ripgrep
```

### 6️⃣ Check Health
To verify everything is correctly set up, run inside Neovim:
```vim
:checkhealth
```

---

## 🔧 Usage
- Open Neovim: `nvim`
- Open file explorer: `<leader>e`
- Toggle terminal: `<leader>t`
- Find files: `<leader>ff`
- Search text: `<leader>fg`
- View key mappings: `<leader>km`

Modify `~/.config/nvim/init.lua` to customize the configuration.

---

## 🛠️ Troubleshooting
If something doesn't work, check for errors with:
```vim
:messages
```
Or run Neovim with verbose logging:
```sh
nvim --log
```

---

## 🚀 Updating Plugins
To update all plugins, run:
```vim
:PackerUpdate
```

To clean up unused plugins:
```vim
:PackerClean
```

---

## 📜 License
This configuration is personal, but feel free to use and modify it as needed!


