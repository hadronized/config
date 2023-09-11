# A simple plugin to add visual task management ot Markdown files.

define-command kak-notes-task-switch-status -params 1 -docstring 'switch task' %{
  execute-keys -draft "gilldi%arg{1}"
}

define-command kak-notes-task-gh-open-issue -docstring 'open GitHub issue' %{
  evaluate-commands -save-regs 'il' %{
    try {
      execute-keys -draft '<a-i>w"iy'
      execute-keys -draft '%sgithub_project: <ret>;<a-W>_"ly'
      nop %sh{
        open "https://github.com/$kak_reg_l/issues/$kak_reg_i"
      }
    }
  }
}

declare-user-mode kak-notes-task

add-highlighter shared/kak-notes-tasks group
add-highlighter shared/kak-notes-tasks/done regex "-\s*()\s*([^\n]*)"\
  1:kak_notes_done 2:kak_notes_done_text
add-highlighter shared/kak-notes-tasks/very-done regex "-\s*()\s*([^\n]*)"\
  1:kak_notes_very_done 2:kak_notes_very_done_text
add-highlighter shared/kak-notes-tasks/todo regex "-\s*()\s*([^\n]*)"\
  1:kak_notes_todo 2:kak_notes_todo_text
add-highlighter shared/kak-notes-tasks/question regex "-\s*()\s*([^\n]*)"\
  1:kak_notes_question 2:kak_notes_question_text
add-highlighter shared/kak-notes-tasks/wontdo regex "-\s*()\s*([^\n]*)"\
  1:kak_notes_wontdo 2:kak_notes_wontdo_text
add-highlighter shared/kak-notes-tasks/issue regex "(#[0-9]+)"\
  1:kak_notes_issue

hook -group kak-notes-task global WinCreate .*\.md %{
  echo -debug CREATED
  set-face window kak_notes_done %opt{kts_green}
  set-face window kak_notes_done_text %opt{kts_green}
  set-face window kak_notes_very_done %opt{kts_blue}
  set-face window kak_notes_very_done_text %opt{kts_blue}
  set-face window kak_notes_todo %opt{kts_mauve}
  set-face window kak_notes_todo_text %opt{kts_mauve}
  set-face window kak_notes_question %opt{kts_peach}
  set-face window kak_notes_question_text %opt{kts_peach}
  set-face window kak_notes_wontdo %opt{kts_red}
  set-face window kak_notes_wontdo_text black+s
  set-face window kak_notes_issue black+u

	add-highlighter window/ ref kak-notes-tasks

  map window kak-notes-task t ":kak-notes-task-switch-status ''<ret>" -docstring 'switch task to todo'
  map window kak-notes-task d ":kak-notes-task-switch-status ''<ret>" -docstring 'switch task to done'
  map window kak-notes-task c ":kak-notes-task-switch-status ''<ret>" -docstring 'switch task to completed'
  map window kak-notes-task q ":kak-notes-task-switch-status ''<ret>" -docstring 'switch task to question'
  map window kak-notes-task n ":kak-notes-task-switch-status ''<ret>" -docstring 'switch task to wontdo'
  map window kak-notes-task i ":kak-notes-task-gh-open-issue<ret>"     -docstring 'open GitHub issue'
}
