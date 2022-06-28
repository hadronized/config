return {
  config = function()
    local dap = require'dap'

    vim.fn.sign_define('DapBreakpoint', {text='⬤', texthl='RedSign', linehl='', numhl=''})
    vim.fn.sign_define('DapStopped', {text='➔', texthl='PurpleSign', linehl='', numhl=''})

    dap.adapters.rust = {
      type = 'executable',
      attach = {
        pidProperty = "pid",
        pidSelect = "ask"
      },
      command = 'lldb-vscode',
      env = {
        LLDB_LAUNCH_FLAG_LAUNCH_IN_TTY = "YES"
      },
      name = "lldb"
    }

    dap.configurations.rust = {
      {
        type = 'rust';
        request = 'launch';
        name = "Debug";
        program = function()
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
      },
    }
  end
}
