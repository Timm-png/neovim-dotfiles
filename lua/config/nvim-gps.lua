local M = {}

function M.setup()
    require("nvim-gps").setup({
        icons = {
            ["method-name"] = ' ', -- Methods (functions inside class-like objects)
        },
        separator = '  ',
    })
end

return M
