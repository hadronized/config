require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gi",
      node_incremental = "gs",
      scope_incremental = "gS",
      node_decremental = "gt",
    },
  },
  refactor = {
    highlight_definitions = { enable = true },
    highlight_current_scope = { enable = true },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gnd",
        list_definitions = "gnD",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
  smart_rename = {
    enable = true,
    keymaps = {
      smart_rename = "grr",
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["at"] = "@class.outer",
        ["it"] = "@class.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ak"] = "@call.outer",
        ["ik"] = "@call.inner",
        ["as"] = "@statement.outer",
        ["is"] = "@statement.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
          cpp = "(function_definition) @function",
          c = "(function_definition) @function",
          java = "(method_declaration) @function",
        },
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ["gz"] = "@parameter.inner",
      },
      swap_previous = {
        ["gZ"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      goto_next_start = {
        ["èfr"] = "@function.outer",
        ["ètr"] = "@class.outer",
        ["ècr"] = "@conditional.outer",
        ["èlr"] = "@loop.outer",
        ["èbr"] = "@block.outer",
        ["èkr"] = "@call.outer",
        ["èsr"] = "@statement.outer",
      },
      goto_next_end = {
        ["èfe"] = "@function.outer",
        ["ète"] = "@class.outer",
        ["èce"] = "@conditional.outer",
        ["èle"] = "@loop.outer",
        ["èbe"] = "@block.outer",
        ["èke"] = "@call.outer",
        ["èse"] = "@statement.outer",
      },
      goto_previous_start = {
        ["èfc"] = "@function.outer",
        ["ètc"] = "@class.outer",
        ["ècc"] = "@conditional.outer",
        ["èlc"] = "@loop.outer",
        ["èbc"] = "@block.outer",
        ["èkc"] = "@call.outer",
        ["èsc"] = "@statement.outer",
      },
    },
  }
}
