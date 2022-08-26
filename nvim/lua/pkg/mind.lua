return {
  branch = 'v2',
  config = function()
    require'mind'.setup {
      persistence = {
        state_path = '~/mind/mind.json',
        data_dir = '~/mind/data',
      },

      ui = {
        width = 40,
      },
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>mc',
        lua = function()
          require'mind'.wrap_project_tree_fn(function(args)
            require'mind.commands'.create_node_index(
              args.tree,
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
              args.tree,
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
          vim.notify('initializing local tree')
          require'mind'.wrap_project_tree_fn(function(args)
            local mind_node = require'mind.node'

            local _,tasks = mind_node.get_node_by_path(args.tree, '/Tasks', true)
            tasks.icon = '陼'

            local _, backlog = mind_node.get_node_by_path(args.tree, '/Tasks/Backlog', true)
            backlog.icon = ' '

            local _, on_going = mind_node.get_node_by_path(args.tree, '/Tasks/On-going', true)
            on_going.icon = ' '

            local _, done = mind_node.get_node_by_path(args.tree, '/Tasks/Done', true)
            done.icon = ' '

            local _, cancelled = mind_node.get_node_by_path(args.tree, '/Tasks/Cancelled', true)
            cancelled.icon = ' '

            local _, notes = mind_node.get_node_by_path(args.tree, '/Notes', true)
            notes.icon = ' '

            args.save_tree()
          end)
        end
      },
      {
        key = '<leader>j',
        lua = function()
          require'mind'.wrap_main_tree_fn(function(args)
            local path = vim.fn.strftime('/Journal/%Y/%b/%d')
            local _, node = require'mind.node'.get_node_by_path(args.tree, path, true)

            if node == nil then
              vim.notify('cannot open journal 🙁', vim.log.levels.WARN)
              return
            end

            require'mind.commands'.open_data(args.tree, node, args.data_dir, args.opts)
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
        cmd = 'MindOpenProject',
      },
      {
        key = '<leader>ms',
        lua = function()
          require'mind'.wrap_project_tree_fn(function(args)
            require'mind.commands'.open_data_index(args.tree, args.data_dir, args.save_tree, args.opts)
          end)
        end
      },
      {
        key = '<leader>Ms',
        lua = function()
          require'mind'.wrap_main_tree_fn(function(args)
            require'mind.commands'.open_data_index(args.tree, args.data_dir, args.save_tree, args.opts)
          end)
        end
      },
    }
  }
}
