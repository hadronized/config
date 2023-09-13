# A simple plugin to add visual task management ot Markdown files.

declare-option str kak_notes_dir
declare-option str kak_notes_archives_dir
declare-option str kak_notes_journal_dir
declare-option str kak_notes_capture_file

declare-user-mode kak-notes-task
declare-user-mode notes

define-command kak-notes-journal-open-daily -docstring 'open daily journal' %{
  nop %sh{
    mkdir -p "$(date +%Y/%b)"
  }

  edit "%opt{kak_notes_journal_dir}/%sh{ date '+%Y/%b/%a %d' }.md"
}

define-command kak-notes-journal-open -docstring 'open journal' %{
  prompt -menu -shell-script-candidates "fd -t file .md %opt{kak_notes_journal_dir}" 'open journal:' %{
    edit "%val{text}"
  }
}

define-command kak-notes-open -docstring 'open note' %{
  prompt -menu -shell-script-candidates "fd -t file .md %opt{kak_notes_dir}" 'open note:' %{
    edit %sh{
      echo "${kak_text%.md}.md"
    }
  }
}

define-command kak-notes-new-note -docstring 'new note' -shell-script-candidates "fd -t directory . %opt{kak_notes_dir}" -params 0..1 %{
  prompt note: %{
    edit %sh{
      if [ -z "$1" ]; then
        echo "$kak_opt_kak_notes_dir/${kak_text%.md}.md"
      else
        echo "$1/${kak_text%.md}.md"
      fi
    }
  }
}

define-command kak-notes-archive-note -docstring 'archive note' %{
  prompt -menu -shell-script-candidates "fd -t file .md %opt{kak_notes_dir}" archive: %{
    nop %sh{
      mkdir -p "$kak_opt_kak_notes_archives_dir"
      mv "$kak_text" "$kak_opt_kak_notes_archives_dir/"
    }
  }
}

define-command kak-notes-archive-open -docstring 'open archive' %{
  prompt -menu -shell-script-candidates "fd -t file .md %opt{kak_notes_archives_dir}" 'open archive:' %{
    edit %sh{
      echo "${kak_text%.md}.md"
    }
  }
}

define-command kak-notes-capture -docstring 'capture' %{
  prompt capture: %{
    nop %sh{
      echo "> $(date '+%a %b %Y, %H:%M:%S')\n$kak_text\n" >> "$kak_opt_kak_notes_capture_file"
    }
  }
}

define-command kak-notes-open-capture -docstring 'open capture' %{
  edit %opt{kak_notes_capture_file}
}

define-command kak-notes-task-switch-status -params 1 -docstring 'switch task' %{
  execute-keys -draft "gilldi%arg{1}"
}

define-command kak-notes-task-gh-open-issue -docstring 'open GitHub issue' %{
  evaluate-commands -save-regs 'il' %{
    try %{
      execute-keys -draft '<a-i>w"iy'
      execute-keys -draft '%sgithub_project: <ret>;<a-W>_"ly'
      nop %sh{
        open "https://github.com/$kak_reg_l/issues/$kak_reg_i"
      }
    }
  }
}

add-highlighter shared/kak-notes-tasks group
add-highlighter shared/kak-notes-tasks/done regex "-\s*()\s*[^\n]*"\
  1:kak_notes_done
add-highlighter shared/kak-notes-tasks/very-done regex "-\s*()\s*[^\n]*"\
  1:kak_notes_very_done
add-highlighter shared/kak-notes-tasks/todo regex "-\s*()\s*[^\n]*"\
  1:kak_notes_todo
add-highlighter shared/kak-notes-tasks/question regex "-\s*()\s*[^\n]*"\
  1:kak_notes_question
add-highlighter shared/kak-notes-tasks/wontdo regex "-\s*()\s*([^\n]*)"\
  1:kak_notes_wontdo 2:kak_notes_wontdo_text
add-highlighter shared/kak-notes-tasks/issue regex "(#[0-9]+)"\
  1:kak_notes_issue

map global notes a ':kak-notes-archive-open<ret>' -docstring 'open archived note'
map global notes A ':kak-notes-archive-note<ret>' -docstring 'archive note'
map global notes c ':kak-notes-open-capture<ret>' -docstring 'open capture'
map global notes C ':kak-notes-capture<ret>' -docstring 'capture'
map global notes j ':kak-notes-journal-open<ret>' -docstring 'open past journal'
map global notes J ':kak-notes-journal-open-daily<ret>' -docstring 'open daily'
map global notes n ':kak-notes-open<ret>' -docstring 'open note'
map global notes N ':kak-notes-new-note ' -docstring 'new note'

hook -group kak-notes-task global WinCreate .*\.md %{
  set-face global kak_notes_done %opt{kts_green}
  set-face global kak_notes_very_done %opt{kts_blue}
  set-face global kak_notes_todo %opt{kts_mauve}
  set-face global kak_notes_question %opt{kts_peach}
  set-face global kak_notes_wontdo %opt{kts_red}
  set-face global kak_notes_wontdo_text black+s
  set-face global kak_notes_issue black+u

	add-highlighter window/ ref kak-notes-tasks

  map window kak-notes-task t ":kak-notes-task-switch-status ''<ret>" -docstring 'switch task to todo'
  map window kak-notes-task d ":kak-notes-task-switch-status ''<ret>" -docstring 'switch task to done'
  map window kak-notes-task c ":kak-notes-task-switch-status ''<ret>" -docstring 'switch task to completed'
  map window kak-notes-task q ":kak-notes-task-switch-status ''<ret>" -docstring 'switch task to question'
  map window kak-notes-task n ":kak-notes-task-switch-status ''<ret>" -docstring 'switch task to wontdo'
  map window kak-notes-task i ":kak-notes-task-gh-open-issue<ret>"     -docstring 'open GitHub issue'
}
