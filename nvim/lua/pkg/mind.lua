return {
  -- branch = 'v2',
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    require'mind'.setup {
      persistence = {
        state_path = '~/mind/mind.json',
        data_dir = '~/mind/data',
      },

      ui = {
        width = 40,

        highlight = {
          local_marker = 'Comment',
          data_marker = 'Comment',
          modifier_empty = 'Comment',
          node_root = 'Number',
        }
      },

      keymaps = {
        normal = {
          T = function(args)
            require'mind.ui'.with_cursor(function(line)
              local tree = args.get_tree()
              local node = require'mind.node'.get_node_by_line(tree, line)

              if node.icon == nil or node.icon == ' ' then
                node.icon = ' '
              elseif node.icon == ' ' then
                node.icon = ' '
              end

              args.save_tree()
              require'mind.ui'.rerender(tree, args.opts)
            end)
          end,
        }
      }
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>mc',
        lua = function()
          require'mind'.wrap_smart_project_tree_fn(function(args)
            require'mind.commands'.create_node_index(
              args.get_tree(),
              require'mind.node'.MoveDir.INSIDE_END,
              args.save_tree,
              args.opts
            )
          end)
        end
      },
      {
        key = '<leader>Mc',
        lua = function()
          require'mind'.wrap_main_tree_fn(function(args)
            require'mind.commands'.create_node_index(
              args.get_tree(),
              require'mind.node'.MoveDir.INSIDE_END,
              args.save_tree,
              args.opts
            )
          end)
        end
      },
      {
        key = '<leader>mi',
        lua = function()
          vim.notify('initializing project tree')
          require'mind'.wrap_smart_project_tree_fn(function(args)
            local tree = args.get_tree()
            local mind_node = require'mind.node'

            local _,tasks = mind_node.get_node_by_path(tree, '/Tasks', true)
            tasks.icon = '陼'

            local _, backlog = mind_node.get_node_by_path(tree, '/Tasks/Backlog', true)
            backlog.icon = ' '

            local _, on_going = mind_node.get_node_by_path(tree, '/Tasks/On-going', true)
            on_going.icon = ' '

            local _, done = mind_node.get_node_by_path(tree, '/Tasks/Done', true)
            done.icon = ' '

            local _, cancelled = mind_node.get_node_by_path(tree, '/Tasks/Cancelled', true)
            cancelled.icon = ' '

            local _, notes = mind_node.get_node_by_path(tree, '/Notes', true)
            notes.icon = ' '

            args.save_tree()
          end)
        end
      },
      {
        key = '<leader>ml',
        lua = function()
          require'mind'.wrap_smart_project_tree_fn(function(args)
            require'mind.commands'.copy_node_link_index(args.get_tree(), nil, args.opts)
          end)
        end
      },
      {
        key = '<leader>Ml',
        lua = function()
          require'mind'.wrap_main_tree_fn(function(args)
            require'mind.commands'.copy_node_link_index(args.get_tree(), nil, args.opts)
          end)
        end
      },
      {
        key = '<leader>j',
        lua = function()
          require'mind'.wrap_main_tree_fn(function(args)
            local tree = args.get_tree()
            local path = vim.fn.strftime('/Journal/%Y/%b/%d')
            local _, node = require'mind.node'.get_node_by_path(tree, path, true)

            if node == nil then
              vim.notify('cannot open journal 🙁', vim.log.levels.WARN)
              return
            end

            require'mind.commands'.open_data(tree, node, args.data_dir, args.opts)
            args.save_tree()
          end)
        end
      },
      {
        key = '<leader>Mm',
        cmd = 'MindOpenMain',
      },
      {
        key = '<leader>mm',
        cmd = 'MindOpenSmartProject',
      },
      {
        key = '<leader>ms',
        lua = function()
          require'mind'.wrap_smart_project_tree_fn(function(args)
            require'mind.commands'.open_data_index(args.get_tree(), args.data_dir, args.save_tree, args.opts)
          end)
        end
      },
      {
        key = '<leader>Ms',
        lua = function()
          require'mind'.wrap_main_tree_fn(function(args)
            require'mind.commands'.open_data_index(args.get_tree(), args.data_dir, args.save_tree, args.opts)
          end)
        end
      },
    }
  }
}
