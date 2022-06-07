local M = {}

function M.setup()
    -- Indicate first time installation
    local packer_bootstrap = false
    local os = require("utils").get_os_name()

    -- packer.nvim configuration
    local conf = {
        display = {
            open_fn = function()
                return require("packer.util").float { border = "rounded" }
            end,
        },
    }

    -- Check if packer.nvim is installed
    -- Run PackerCompile if there are changes in this file
    local function packer_init()
        local fn = vim.fn
        local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
        if fn.empty(fn.glob(install_path)) > 0 then
            packer_bootstrap = fn.system {
                "git",
                "clone",
                "--depth",
                "1",
                "https://github.com/wbthomason/packer.nvim",
                install_path,
            }
            vim.cmd [[packadd packer.nvim]]
        end
        vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    end

    -- Plugins
    local function plugins(use)
        -- Packer can manage itself
        use 'wbthomason/packer.nvim'

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("config.treesitter").setup()
            end,
            requires = {
                "p00f/nvim-ts-rainbow",
            }
        }

        -- Completion
        use {
            "hrsh7th/nvim-cmp",
            config = function()
                require("config.cmp").setup()
            end,
            wants = { "LuaSnip" },
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lua",
                "ray-x/cmp-treesitter",
                "hrsh7th/cmp-cmdline",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    config = function()
                        require("config.luasnip").setup()
                    end,
                },
                "rafamadriz/friendly-snippets",
            },
            disable = false,
        }

        -- Auto pairs
        use {
            "windwp/nvim-autopairs",
            wants = "nvim-treesitter",
            module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
            config = function()
                require("config.autopairs").setup()
            end,
        }

        -- Auto tag
        use {
            "windwp/nvim-ts-autotag",
            wants = "nvim-treesitter",
            config = function()
                require("nvim-ts-autotag").setup { enable = true }
            end,
        }

        -- End wise
        use {
            "RRethy/nvim-treesitter-endwise",
            wants = "nvim-treesitter",
        }

        -- LSP
        use {
            "neovim/nvim-lspconfig",
            wants = { "cmp-nvim-lsp", "nvim-lsp-installer", "lsp_signature.nvim" },
            config = function()
                require("config.lsp").setup()
            end,
            requires = {
                "williamboman/nvim-lsp-installer",
                "ray-x/lsp_signature.nvim",
            },
        }

        -- LuaLine
        use {
            "nvim-lualine/lualine.nvim",
            config = function()
                require("config.lualine").setup()
            end,
            requires = { "nvim-web-devicons" },
        }
        use {
            "SmiteshP/nvim-gps",
            config = function()
                require("config.nvim-gps").setup()
            end,
        }

        -- Themes
        use {
            "catppuccin/nvim",
            as = "catppuccin",
            config = function()
                require("config.colortheme").setup()
            end,
        }

        -- Buffer line
        use {
            "akinsho/nvim-bufferline.lua",
            wants = "nvim-web-devicons",
            config = function()
                require("config.bufferline").setup()
            end,
        }

        -- WhichKey
        use {
            "folke/which-key.nvim",
            config = function()
                require("config.whichkey").setup()
            end,
        }

        if os ~= "Windows" then
            -- fzf-lua
            use {
                "ibhagwan/fzf-lua",
                wants = "nvim-web-devicons",
                requires = { "junegunn/fzf", run = "./install --all" },
            }
        end

        -- Telescope
        use {
            "nvim-telescope/telescope.nvim",
            config = function()
                require("config.telescope").setup()
            end,
            module = "telescope",
            keys = { "<leader>f", "<leader>p" },
            wants = {
                "plenary.nvim",
                "popup.nvim",
                "telescope-project.nvim",
                "project.nvim",
            }, requires = {
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim",
                "nvim-telescope/telescope-project.nvim",
                {
                    "ahmedkhalf/project.nvim",
                    config = function()
                        require("project_nvim").setup {}
                    end,
                },
            },
        }

        -- Dashboard
        use {
            "glepnir/dashboard-nvim",
            config = function()
                require("config.dashboard").setup()
            end,
        }
        use {
            "kyazdani42/nvim-web-devicons",
            module = "nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup { default = true }
            end,
        }

        -- Better Comment
        use {
            "numToStr/Comment.nvim",
            keys = { "gc", "gcc", "gbc" },
            config = function()
                require("Comment").setup {}
            end,
        }

        -- Easy hopping
        use {
            "phaazon/hop.nvim",
            config = function()
                require("hop").setup {}
            end,
        }

        -- Markdown
        use {
            "iamcco/markdown-preview.nvim",
            run = function()
                vim.fn["mkdp#util#install"]()
            end,
            ft = "markdown",
        }

        -- Nvim-Tree
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons",
            },
            config = function()
                require("config.nvimtree").setup()
            end,
        }

        -- Other
        use "powerman/vim-plugin-ruscmd"
        use "norcalli/nvim-colorizer.lua"
        use "jghauser/mkdir.nvim"
        use "folke/todo-comments.nvim"
        use "sindrets/winshift.nvim"
        use "mhinz/vim-sayonara"
        use "tpope/vim-surround"
        use "nvim-lua/plenary.nvim"

        if packer_bootstrap then
            print "Restart Neovim required after installation!"
            require("packer").sync()
        end
    end

    packer_init()

    local packer = require "packer"
    packer.init(conf)
    packer.startup(plugins)
end

return M
