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
    sumneko_lua = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                    -- Setup your lua path
                    path = vim.split(package.path, ";"),
                },
            },
        },
    },
    powershell_es = {},
    pyright = {},
    volar = {},
    lemminx = {},
    yamlls = {}
}

--local lsp_signature = require "lsp_signature"
--lsp_signature.setup {
--    bind = true,
--    hint_enable = false,
--    handler_opts = {
--        border = "rounded",
--    },
--}

local function on_attach(client, bufnr)
    -- Enable completion triggered by <C-X><C-O>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Use LSP as the handler for formatexpr.
    vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

    -- Configure key mappings
    require("config.lsp.keymaps").setup(client, bufnr)

    if client.name == "tsserver" then
        require("config.lsp.ts-utils").setup(client)
    end
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

    -- LSP handlers configuration
    local lsp = {
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
        },
        diagnostic = {
            -- virtual_text = true,
            virtual_text = { spacing = 4, prefix = "●" },
            underline = true,
            update_in_insert = false,
            severity_sort = true,
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
            },
        },
    }
    -- Diagnostic signs
    local diagnostic_signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(diagnostic_signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    end

    -- Diagnostic configuration
    vim.diagnostic.config(lsp.diagnostic)

    -- Hover configuration
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp.float)
end

return M
