local M = {}

function M.setup()
    local whichkey = require("which-key")
    local utils = require("utils")

    local conf = {
        window = {
            border = "single", -- none, single, double, shadow
            position = "bottom", -- bottom, top
        },
        plugins = {
            marks = true, -- shows a list of your marks on ' and `
            registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            spelling = {
                enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
                suggestions = 20, -- how many suggestions should be shown in the list?
            },
            -- the presets plugin, adds help for a bunch of default keybindings in Neovim
            -- No actual key bindings are created
            presets = {
                operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
                motions = true, -- adds help for motions
                text_objects = true, -- help for text objects triggered after entering an operator
                windows = true, -- default bindings on <c-w>
                nav = true, -- misc bindings to work with windows
                z = true, -- bindings for folds, spelling and others prefixed with z
                g = true, -- bindings for prefixed with g
            },
        },
    }

    local opts = {
        mode = "n", -- Normal mode
        prefix = "<leader>",
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = false, -- use `nowait` when creating keymaps
    }

    -- Config dir in differnt os
    if utils.get_os_name() == 'Windows' then
        config_location = { ":e ~/AppData/Local/nvim<cr>", "Edit config" }
    elseif utils.get_os_name() == "Linux" then
        config_location = { ":e ~/.config/nvim/<cr>", "Edit config" }
    end

    local mappings = {
        q = { ":wq<cr>", "Save & Quit" },
        Q = { ":q<cr>", "Quit" },
        w = { ":w<cr>", "Save" },
        c = { ":Sayonara!<cr>", "Close current buffer" },
        E = config_location,
        t = { "<C-t>", "Jumps to back" },
        m = { "<cmd>MarkdownPreviewToggle<cr>", "Toggle markdown preview" },
        W = {
            name = "WinShift",
            w = { "<Cmd>WinShift<CR>", "Start WinShift Mode" },
            h = { "<Cmd>WinShift left<CR>", "Move window to the left" },
            j = { "<Cmd>WinShift dowm<CR>", "Move window to the bommot" },
            k = { "<Cmd>WinShift up<CR>", "Move window down" },
            l = { "<Cmd>WinShift right<CR>", "Move window to the right" }
        },
        f = {
            name = "Telescope",
            f = { "<cmd>lua require('telescope.builtin').find_files()<cr>", "Files" },
            t = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", "Text" },
            s = { "<cmd>lua require('telescope.builtin').treesitter()<cr>", "File sctructure" },
            l = { ":TodoTelescope<cr>", "TODO List" },
            b = { "<cmd>lua require('telescope.builtin').buffers()<cr>", "Buffers" },
            p = { "<cmd>lua require'telescope'.extensions.project.project{}<cr>", "Projects list" },
            e = { "<cmd>Telescope emoji<cr>", "Emoji"}
        },
        n = {
            name = "NvimTree",
            n = { ":NvimTreeToggle<CR>", "Open" },
            f = { ":NvimTreeFocus<CR>:NvimTreeRefresh<CR>", "Focus & Refresh" },
        },
        z = {
            name = "Plugin manager",
            c = { "<cmd>PackerCompile<cr>", "Compile" },
            i = { "<cmd>PackerInstall<cr>", "Install" },
            s = { "<cmd>PackerSync<cr>", "Sync" },
            S = { "<cmd>PackerStatus<cr>", "Status" },
            u = { "<cmd>PackerUpdate<cr>", "Update" },
        },
    }

    whichkey.setup(conf)
    whichkey.register(mappings, opts)
end

return M
