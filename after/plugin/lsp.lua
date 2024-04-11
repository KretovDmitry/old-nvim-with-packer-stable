local lsp = require("lsp-zero")

lsp.preset("recommended")

-- error labels in the left column (SignColumn)
vim.diagnostic.config({ signs = true })

-- LSP initialization for various PL
local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
require("lsp-format").setup {}

local function config(_config)
    return vim.tbl_deep_extend('force', {
        capabilities = require('cmp_nvim_lsp').
        default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }, _config or {})
end

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- standard LSP hotkeys 
    -- https://github.com/neovim/nvim-lspconfig
    map('n', 'gD', vim.lsp.buf.declaration, bufopts)
    map('n', 'gd', vim.lsp.buf.definition, bufopts)
    map('n', 'K', vim.lsp.buf.hover, bufopts)
    map('n', 'gi', vim.lsp.buf.implementation, bufopts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    map('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    map('n', 'gr', vim.lsp.buf.references, bufopts)
    map('n', '<leader>f', vim.lsp.buf.formatting, bufopts)
end

-- initialization of the gopls LSP for Go
-- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-install
lspconfig.gopls.setup(config({
    on_attach = require("lsp-format").on_attach,
    cmd = { 'gopls', 'serve' },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
                shadow = true,
            },
            completeUnimported = true,
            usePlaceholders = true,
            staticcheck = true,
        }
    }
}))

-- to learn how to use mason.nvim with lsp-zero
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'gopls',
        'eslint',
    },
    handlers = {
        lsp.default_setup,
    },
})

lsp.setup()
