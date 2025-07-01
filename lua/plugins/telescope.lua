-- Telescope configuration for Neovim
require('telescope').setup{
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = { prompt_position = 'top' },
    sorting_strategy = 'ascending',
    winblend = 0,
    mappings = {
      i = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
      n = {
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  },
}
