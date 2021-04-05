local M = {}

-- Open today’s journal.
--
-- `args` is an object with an optional `notes_dir` string field containing the path to the directory where notes live.
M.open_today_journal = function(args)
  local notes_dir = args and args.notes_dir or "~/notes"
  local now = os.date("*t")
  local cmd = string.format("e %s/journal/%d_%d_%d.md", notes_dir, now.year, now.month, now.day)
  vim.cmd(cmd)
end

-- Open the journal.
M.open_journal = function(args)
  local notes_dir = args and args.notes_dir or "~/notes"
  local cmd = string.format("e %s/journal.md", notes_dir)
  vim.cmd(cmd)
end

return M
