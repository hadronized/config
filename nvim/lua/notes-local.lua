local M = {}

local function get_notes_dir(args)
  return args and args.notes_dir or "~/notes"
end
-- Open today’s journal.
--
-- `args` is an object with an optional `notes_dir` string field containing the path to the directory where notes live.
M.open_today_journal = function(args)
  local now = os.date("*t")
  local cmd = string.format("e %s/journal/%d_%d_%d.md", get_notes_dir(args), now.year, now.month, now.day)
  vim.cmd(cmd)
end

-- Open the journal.
M.open_journal = function(args)
  local cmd = string.format("e %s/journal.md", get_notes_dir(args))
  vim.cmd(cmd)
end

-- Open the todo.
M.open_todo = function(args)
  local cmd = string.format("e %s/todo.md", get_notes_dir(args))
  vim.cmd(cmd)
end

return M
