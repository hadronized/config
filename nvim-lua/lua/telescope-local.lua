local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    prompt_position = "bottom",
    prompt_prefix = "-> ",
    file_sorter = require'telescope.sorters'.get_fzy_sorter,
    mappings = {
      i = {
        ["<c-s>"] = actions.move_selection_previous,
        ["<c-t>"] = actions.move_selection_next,
        ["<tab>"] = actions.add_selection,
        ["<esc>"] = actions.close,
      },
    }
  }
}
require('telescope').load_extension('fzy_native')
