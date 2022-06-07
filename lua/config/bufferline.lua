local M = {}

function M.setup()
    require("bufferline").setup {
        options = {
            numbers = "none",
            diagnostics = "nvim_lsp",
            separator_style = "slant" or "padded_slant",
            --show_tab_indicators = true,
            show_buffer_close_icons = false,
            show_close_icon = false,

            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
            },
        },
    }
end

return M
