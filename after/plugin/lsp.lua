local lsp = require("lsp-zero")

lsp.preset("recommended")

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

-- Autocompletion keybindings
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
		['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
		['<C-y>'] = cmp.mapping.confirm({ select = true }),
		['<C-Space>'] = cmp.mapping.complete(),
	}),
})

-- When configuring the `sources` option make sure 
-- to add the source for the LSP completions.

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
	}
})

-- Always include `{name = 'nvim_lsp'}` in your sources.

lsp.setup()
