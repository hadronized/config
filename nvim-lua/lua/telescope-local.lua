local actions = require('telescope.actions')

require('telescope').setup{
  defaults = {
    prompt_position = "bottom",
    prompt_prefix = "-> ",
    mappings = {
      i = {
        ["<c-s>"] = actions.move_selection_previous,
        ["<c-t>"] = actions.move_selection_next,
        ["<tab>"] = actions.add_selection,
        ["<esc>"] = actions.close,
      },
    }
  },
  extensions = {
    fzf_writer = {
      minimum_grep_characters = 2,
      minimum_files_characters = 2,

      -- Disabled by default.
      -- Will probably slow down some aspects of the sorter, but can make color highlights.
      -- I will work on this more later.
      use_highlighter = true,
    }
  }
}
