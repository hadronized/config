return {
  config = function()
    local dap = require'dap'

    vim.fn.sign_define('DapBreakpoint', {text='⬤', texthl='String', linehl='', numhl=''})
    vim.fn.sign_define('DapStopped', {text='➔', texthl='ErrorMsg', linehl='', numhl=''})

    dap.adapters.rust = {
      type = 'executable',
      command = '/usr/bin/lldb-vscode',
      name = 'lldb'
    }

    dap.configurations.rust = {
      {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
      },
    }
  end,
  keybindings = {
    n = {
      {
        key = '<leader>dc',
        lua = "require'dap'.continue()"
      },
      {
        key = '<leader>dn',
        lua = "require'dap'.step_over()"
      },
      {
        key = '<leader>di',
        lua = "require'dap'.step_into()"
      },
      {
        key = '<leader>do',
        lua = "require'dap'.step_out()"
      },
      {
        key = '<leader>db',
        lua = "require'dap'.toggle_breakpoint()"
      },
      {
        key = '<leader>dr',
        lua = "require'dap'.repl.open()"
      },
      {
        key = '<leader>dd',
        lua = "require'dapui'.toggle()"
      },
    }
  }
}
