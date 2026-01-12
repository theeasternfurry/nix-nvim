local fzf = require("fzf-lua")
fzf.setup()

vim.keymap.set('n', '<leader>ff', fzf.files, { desc = "Find File" })
vim.keymap.set('n', '<leader>fg', fzf.live_grep, { desc = "Find Live Grep" })
vim.keymap.set('n', '<leader>fb', fzf.buffers, { desc = "Find Buffer" })
