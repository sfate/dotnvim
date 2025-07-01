-- Telescope configuration for Neovim
require('telescope').setup{
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = { prompt_position = 'top' },
    sorting_strategy = 'ascending',
    winblend = 0,
  },
}
