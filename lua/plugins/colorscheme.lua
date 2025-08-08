-- Gruvbox colorscheme and theme settings for Neovim
vim.g.gruvbox_italic = 0
vim.g.dark_contrast = 'hard'
vim.g.light_contrast = 'hard'

local function set_theme_from_system()
  local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
  local result = handle:read("*a")
  handle:close()
  
  if result:match("Dark") then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end
  vim.cmd("colorscheme gruvbox")

  vim.cmd [[
    if exists(':LightlineReload')
      :LightlineReload
    endif
  ]]
end

-- Call on startup
set_theme_from_system()
