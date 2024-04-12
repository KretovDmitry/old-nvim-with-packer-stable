vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

-- save
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")

-- move selected
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- turn off highlighting
vim.keymap.set("n", "<Esc>", "<cmd> noh <CR>")

-- keep cursor in place when press J
vim.keymap.set("n", "J", "mzJ`z")

-- center screen on Ctrl+u, Ctrl+d moves
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center screen on next
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- giga yankers and pasters
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Del and yank into system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank into system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank curr line into system clipboard" })

-- better indenting
vim.keymap.set('v', '<', '<gv', { desc = "Indent v-block to right" })
vim.keymap.set('v', '>', '>gv', { desc = "Indent v-block to left" })

-- disable Q
vim.keymap.set('n', 'Q', '<nop>')

-- autoformat code
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- pop diagnostic window
vim.keymap.set("n", "<leader>fe", vim.diagnostic.open_float, { desc = "Pop diagnostic window" })

-- move between buffers
vim.keymap.set("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- location and quickfix movements
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-m>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Tmux navigation
vim.keymap.set("n", "<leader><C-h>", "<cmd>TmuxNavigateLeft<CR>")
vim.keymap.set("n", "<leader><C-l>", "<cmd>TmuxNavigateRight<CR>")
vim.keymap.set("n", "<leader><C-j>", "<cmd>TmuxNavigateDown<CR>")
vim.keymap.set("n", "<leader><C-k>", "<cmd>TmuxNavigateUp<CR>")
