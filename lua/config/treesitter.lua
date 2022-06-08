local M = {}

function M.setup()

    require 'nvim-treesitter.configs'.setup {
        ensure_installed = { "javascript", "lua", "typescript", "bash", "css", "dart", "dockerfile", "dot", "html", "json", "python", "scss", "tsx", "vim", "vue", "yaml" },
        sync_install = false,

        highlight = {
            -- `false` will disable the whole extension
            enable = true,
        },
        rainbow = {
            enable = true,
            extended_mode = true,
            max_file_lines = nil,
        },
        endwise = {
            enable = true,
        },
        matchup = {
            enable = true,
        },
    }
end

return M
