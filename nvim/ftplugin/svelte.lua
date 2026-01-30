if vim.fn.executable('svelteserver') ~= 1 then
  return
end

local root_files = {
  'svelte.config.js',
  'package.json',
  'jsconfig.json',
  'tsconfig.json',
  '.git',
}

local root_path = vim.fs.find(root_files, { upward = true })[1]
local root_dir = root_path and vim.fs.dirname(root_path) or vim.fn.getcwd()

vim.lsp.start({
  name = 'svelte_ls',
  cmd = { 'svelteserver', '--stdio' },
  root_dir = root_dir,
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    svelte = {
      plugin = {
        svelte = { enable = true },
        css = { enable = true },
        html = { enable = true },
        typescript = { enable = true },
      },
    },
  },
})

