-- Codecompanion configuration for Neovim
require("codecompanion").setup({
  strategies = {
    chat = { adapter = "copilot", model = "gpt-4.1-2025-04-14" },
    inline = { adapter = "copilot", model = "gpt-4.1-2025-04-14" },
    agent = { adapter = "copilot", model = "gpt-4.1-2025-04-14" },
  },
  opts = {
    log_level = "DEBUG", -- or "TRACE"
  }
})
