require("codecompanion").setup({
  adapters = {
    http = {
      ollama = function()
        local ollama_ip = os.getenv("OLLAMA_IP") or "127.0.0.1"
        local ollama_url = "http://" .. ollama_ip .. ":11434"

        return require("codecompanion.adapters").extend("ollama", {
          env = {
            url = ollama_url,
          },
          headers = {
            ["Content-Type"] = "application/json",
          },
          parameters = {
            sync = true,
            num_ctx = 16384,
            num_thread = 8,
          },
          schema = {
            model = {
              default = "deepseek-coder-v2:16b",
            },
          },
        })
      end,
    },
  },
  strategies = {
    chat = {
      adapter = "ollama",
      slash_commands = {
        ["file"] = {
          opts = {
            provider = "fzf_lua",
          },
        },
      },
    },
    inline = { adapter = "ollama" },
    agent = { adapter = "ollama" },
  },
})
