local M = {}

function M.setup()
    local gps = require("nvim-gps")

    require "lualine".setup {
        options = {
            globalstatus = true,
            theme = "auto",
            icons_enabled = true,
            component_separators = {
                left = "",
                right = ""
            },
            section_separators = {
                left = "",
                right = ""
            },
            always_divide_middle = true,
        },
        sections = {
            lualine_a = {
                "mode"
            },
            lualine_b = {},
            lualine_c = {
                "filename",
                {
                    gps.get_location,
                    cond = gps.is_available,
                },
            },
            lualine_x = {
                "diagnostics",
            },
            lualine_y = {
                "branch",
                "diff",
            },
            lualine_z = {}
        },
        extensions = {}
    }
end

return M
