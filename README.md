# It has full support only Linux and Windows.
# Tested Only On Windows

## Install [package manager](https://github.com/wbthomason/packer.nvim):

**Windows:**

```sh
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```

**Linux/Mac:**

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

---
## Install [fzf](https://github.com/junegunn/fzf)

**Linux:**
```sh
# Ubuntu/Debian
sudo apt-get install fzf

#Fedora
sudo dnf install fzf

# Arch Linux
sudo pacman -S fzf

# OpenSUSE
sudo zypper install fzf
```

**MacOS:**
```sh
brew install fzf
```

---

## Install gcc and make:

**Linux:**
```sh
# Ubuntu/Debian
sudo apt install build-essential make

# Fedora
sudo dnf install make gcc

# Arch Linux
sudo pacman -Ss gcc make

# OpenSUSE
sudo zypper install gcc make
```

**MacOS:**
```sh
brew install gcc make
```

## Install Config:

**Windows:**

```sh
git clone https://github.com/Timm-png/neovim-dotfiles/ ~\AppData\Local\nvim
```

**Linux:**

```sh
git clone https://github.com/Timm-png/neovim-dotfiles/ ~/.config/nvim
```

---

### Screenshots

![](./screenshots/1.png)
![](./screenshots/2.png)
![](./screenshots/3.png)
![](./screenshots/4.png)

---

#### Other plugins I'm lazy to add

https://github.com/LunarVim/Neovim-from-scratch

https://github.com/williamboman/nvim-lsp-installer

https://github.com/neovim/nvim-lspconfig

https://github.com/onsails/lspkind.nvim

https://github.com/tami5/lspsaga.nvim

https://github.com/hrsh7th/cmp-git

https://github.com/hrsh7th/cmp-nvim-lsp

https://github.com/hrsh7th/nvim-kit

https://github.com/folke/trouble.nvim

https://gitlab.com/yorickpeterse/nvim-window

https://github.com/lukas-reineke/lsp-format.nvim

https://github.com/windwp/nvim-autopairs

https://github.com/nvim-telescope/telescope.nvim

https://github.com/rstacruz/vim-closer

https://github.com/andymass/vim-matchup

https://github.com/lewis6991/gitsigns.nvim

https://github.com/mfussenegger/nvim-dap

https://github.com/rcarriga/nvim-dap-ui
