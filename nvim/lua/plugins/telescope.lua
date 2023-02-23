local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fj', builtin.find_files, {})
vim.keymap.set('n', '<leader>fk', builtin.git_files, {})
vim.keymap.set('n', '<leader>fl', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
