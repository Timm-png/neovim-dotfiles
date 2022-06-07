local M = {}

function M.setup()
    local catppuccin = require("catppuccin")

    catppuccin.setup {
        styles = {
            comments = "NONE",
            conditionals = "NONE",
            loops = "NONE",
            functions = "NONE",
            keywords = "NONE",
            strings = "NONE",
            variables = "NONE",
            numbers = "NONE",
            booleans = "NONE",
            properties = "NONE",
            types = "NONE",
            operators = "NONE",
        },
        integrations = {
            treesitter = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = "NONE",
                    hints = "NONE",
                    warnings = "NONE",
                    information = "NONE",
                },
                underlines = {
                    errors = "underline",
                    hints = "underline",
                    warnings = "underline",
                    information = "underline",
                },
            },
            lsp_trouble = false,
            cmp = true,
            lsp_saga = false,
            gitgutter = false,
            gitsigns = true,
            telescope = true,
            nvimtree = {
                enabled = true,
                show_root = true,
                transparent_panel = false,
            },
            neotree = {
                enabled = false,
                show_root = false,
                transparent_panel = false,
            },
            which_key = true,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
            },
            dashboard = true,
            neogit = true,
            barbar = false,
            bufferline = true,
            markdown = true,
            lightspeed = false,
            ts_rainbow = true,
            hop = false,
            notify = true,
            telekasten = true,
            symbols_outline = true,
        }
    }

    vim.cmd [[colorscheme catppuccin]]
end

return M
