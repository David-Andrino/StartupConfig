vim.keymap.set("n", "<leader>q", vim.cmd.Ex)--":Ex<enter>", { silent = true })
vim.keymap.set("i", "jk", "<Esc>")

-- Move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Search with cursor in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>Y", "\"+Y")

-- Delete without copying
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- Format with <leader>j
vim.keymap.set("n", "<leader>j", ":!clang-format -i %<CR><CR>")
