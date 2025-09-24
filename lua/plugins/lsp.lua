-- LSP and linting configuration for Neovim
-- ALE is loaded for Go and Ruby, but you can use built-in LSP for more features

-- Setup LSP servers
-- go
vim.lsp.config.gopls = {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
      gofumpt = false,
    },
  },
}
-- Lua
vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
}
-- JavaScript/TypeScript
vim.lsp.config.eslint = {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = {
    "astro",
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "html",
    "mdx",
    "vue",
    "markdown",
    "json",
    "jsonc",
  },
  root_markers = {
    "eslint.config.mjs",
    ".eslintrc",
    ".eslintrc.json",
    ".eslintrc.js",
    ".eslintrc.cjs",
    "package.json",
    ".git",
  },
  settings = {
    eslint = {
      enable = true,
      validate = "on",
      packageManager = "npm",
      autoFixOnSave = true,
      codeActionsOnSave = {
        enable = true,
        mode = "all",
      },
      format = { enable = true },
      workingDirectories = { mode = "auto" },
    },
  },
}
-- Ruby
vim.lsp.config.solargraph = {
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  root_markers = { ".git", ".solargraph.yml", "Gemfile" },
}
-- Enable the LSP servers
vim.lsp.enable({
  "gopls",
  "lua_ls",
  "eslint",
  "solargraph",
})

-- Create an autocmd group for Go formatting
vim.api.nvim_create_augroup('GoFormat', { clear = true })
-- Auto format on save using LSP
vim.api.nvim_create_autocmd("BufWritePre", {
  group = 'GoFormat',
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ timeout_ms = 1000 })
  end
})
