local wk = require("which-key")

wk.setup({
  preset = 'helix'
})

wk.add({
  { "<leader>f", group = "Find (FZF)" },
})

--wk.add({
--  { "<leader>e", "<cmd>Yazi<cr>", desc = "Yazi File explorer" },
--})
