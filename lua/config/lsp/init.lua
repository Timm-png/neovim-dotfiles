local M = {}

local servers = {
    bashls = {},
    cssls = {},
    dockerls = {},
    dotls = {},
    html = {},
    jsonls = {},
    prosemd_lsp = {},
    tsserver = {},
    sumneko_lua = {},
    powershell_es = {},
    pyright = {},
    volar = {},
    lemminx = {},
    yamlls = {}
}

local lsp_signature = require "lsp_signature"
lsp_signature.setup {
    bind = true,
    hint_enable = false,
    handler_opts = {
        border = "rounded",
    },
}

local function on_attach(client, bufnr)
    -- Enable completion triggered by <C-X><C-O>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Use LSP as the handler for formatexpr.
    vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    -- Configure key mappings
    require("config.lsp.keymaps").setup(client, bufnr)
end

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local opts = {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
}

function M.setup()
    require("config.lsp.installer").setup(servers, opts)
end

return M
