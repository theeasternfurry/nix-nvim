local ollama_ip = os.getenv("OLLAMA_IP") or "127.0.0.1"
local ollama_url = "http://" .. ollama_ip .. ":11434"

require("avante").setup({
  provider = "ollama",
  providers = {
    ollama = {
      endpoint = ollama_url,
      model = "deepseek-coder-v2:16b",
    },
  },
})
