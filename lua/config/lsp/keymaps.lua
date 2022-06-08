local M = {}

local whichkey = require "which-key"

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

local function keymappings(client, bufnr)
    local opts = { noremap = true, silent = true }

    -- Key mappings
    buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
    keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
    keymap("n", "<A-j>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
    keymap("n", "<A-k>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)

    -- Whichkey
    local keymap_l = {
        l = {
            name = "LSP",
            R = { "<cmd>Telescope lsp_references<CR>", "References" },
            -- f = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
            r = { "<cmd>Lspsaga rename<CR>", "Rename" },
            a = { ":<C-U>Lspsaga range_code_action<CR>", "Code action" },
            s = { "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", "Signature Help" },
            p = { "<cmd>lua require'lspsaga.provider'.preview_definition()<CR>", "Preview difinition" },
            d = { "<cmd>TroubleToggle<CR>", "Diagnostic" },
            h = { "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", "Hover Doc" },

            I = { "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>", "Goto Implementation" },
            t = { "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>", "Goto Type Definition" },
        },
    }
    if client.resolved_capabilities.document_formatting then
        keymap_l.l.F = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format Document" }
    end

    whichkey.register(keymap_l, { buffer = bufnr, prefix = "<leader>" })
end

function M.setup(client, bufnr)
    keymappings(client, bufnr)
end

return M
