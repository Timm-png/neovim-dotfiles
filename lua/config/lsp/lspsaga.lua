local M = {}

function M.setup()
    local lspsaga = require 'lspsaga'
    lspsaga.setup {
        finder_action_keys = {
            open = "<CR>",
        },
    }
end

return M
