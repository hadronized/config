# A simple plugin to add visual task management ot Markdown files.

declare-option str kak_notes_root_dir
declare-option str kak_notes_dir
declare-option str kak_notes_archives_dir
declare-option str kak_notes_journal_dir
declare-option str kak_notes_capture_file
declare-option str kak_notes_sym_todo 'TODO'
declare-option str kak_notes_sym_wip 'WIP'
declare-option str kak_notes_sym_done 'DONE'
declare-option str kak_notes_sym_wontdo 'WONTDO'

declare-user-mode kak-notes
declare-user-mode kak-notes-tasks
declare-user-mode kak-notes-tasks-list

set-face global kak_notes_todo green
set-face global kak_notes_wip magenta
set-face global kak_notes_done black
set-face global kak_notes_done_text black
set-face global kak_notes_wontdo black
set-face global kak_notes_wontdo_text black+s
set-face global kak_notes_issue cyan+u
set-face global kak_notes_task_list_delimiter black
set-face global kak_notes_task_list_path blue
set-face global kak_notes_task_list_line white
set-face global kak_notes_task_list_col white
set-face global kak_notes_subtask_uncheck green
set-face global kak_notes_subtask_check black
set-face global kak_notes_subtask_text_check black
set-face global kak_notes_tag green

define-command kak-notes-journal-open-daily -docstring 'open daily journal' %{
  nop %sh{
    mkdir -p "$(date +%Y/%b)"
  }

  edit "%opt{kak_notes_journal_dir}/%sh{ date '+%Y/%b/%a %d' }.md"
}

define-command kak-notes-journal-open -docstring 'open journal' %{
  prompt -menu -shell-script-candidates "fd -t file .md $kak_opt_kak_notes_journal_dir" 'open journal:' %{
    edit "%val{text}"
  }
}

define-command kak-notes-open -docstring 'open note' %{
  prompt -menu -shell-script-candidates "fd -t file .md $kak_opt_kak_notes_dir" 'open note:' %{
    edit %sh{
      echo "${kak_text%.md}.md"
    }
  }
}

define-command kak-notes-new-note -shell-script-candidates "fd -t directory . $kak_opt_kak_notes_dir" -params 0..1 -docstring 'new note' %{
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
  prompt -menu -shell-script-candidates "fd -t file .md $kak_opt_kak_notes_dir" archive: %{
    nop %sh{
      mkdir -p "$kak_opt_kak_notes_archives_dir"
      mv "$kak_text" "$kak_opt_kak_notes_archives_dir/"
    }
  }
}

define-command kak-notes-archive-open -docstring 'open archive' %{
  prompt -menu -shell-script-candidates "fd -t file .md $kak_opt_kak_notes_archives_dir" 'open archive:' %{
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
  execute-keys -draft "gilec%arg{1}"
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

define-command kak-notes-tasks-list-by-regex -params 1 -docstring 'list tasks by status' %{
  edit -scratch *kak-notes-tasks-list*
  execute-keys "%%d|rg -n --column %arg{1} %opt{kak_notes_dir} %opt{kak_notes_journal_dir} %opt{kak_notes_capture_file}<ret>|sort<ret>gg"
}

define-command kak-notes-tasks-list-all -docstring 'list all tasks' %{
  kak-notes-tasks-list-by-regex "%opt{kak_notes_sym_todo}\|%opt{kak_notes_sym_wip}\|%opt{kak_notes_sym_done}\|%opt{kak_notes_sym_wontdo}"
}

# Command executed when pressing <ret> in a *kak-notes-tasks-list* buffer.
define-command -hidden kak-notes-tasks-list-open %{
  execute-keys -with-hooks -save-regs 'flc' 'giT:"fyllT:"lyllT:"cy:edit "%reg{f}" %reg{l} %reg{c}<ret>'
}

define-command kak-notes-search -docstring 'search notes' %{
  prompt 'search notes:' %{
    prompt refine: -menu -shell-script-candidates "rg -in --column '%val{text}' $kak_opt_kak_notes_root_dir" %{
      evaluate-commands "edit -existing %sh{
        IFS=':' read -r file line column rest <<< ""$kak_text""
        echo \""$file\"" $line $column
      }"
    }
  }
}

define-command kak-notes-sync -docstring 'synchronize notes' %{
  # First, we always check-in new modifications; then, we check whether we have anything else to send
  info -title 'kak-notes' 'starting synchronizing…'

  nop %sh{
    cd $kak_opt_kak_notes_root_dir
    git fetch --prune origin
    git rebase --autostash origin/master
    git add -A .
    git commit -m "$(date +'Sync update %a %b %d %Y')"
    git push origin
  }

  info -title 'kak-notes' 'done'
}

add-highlighter shared/kak-notes-tasks group
add-highlighter shared/kak-notes-tasks/todo regex "-\s*(%opt{kak_notes_sym_todo})\s*[^\n]*"\
  1:kak_notes_todo
add-highlighter shared/kak-notes-tasks/wip regex "-\s*(%opt{kak_notes_sym_wip})\s*[^\n]*"\
  1:kak_notes_wip
add-highlighter shared/kak-notes-tasks/done regex "-\s*(%opt{kak_notes_sym_done})\s*([^\n]*)"\
  1:kak_notes_done 2:kak_notes_done_text
add-highlighter shared/kak-notes-tasks/wontdo regex "-\s*(%opt{kak_notes_sym_wontdo})\s*([^\n]*)"\
  1:kak_notes_wontdo 2:kak_notes_wontdo_text
add-highlighter shared/kak-notes-tasks/issue regex " (#[0-9]+)"\
  1:kak_notes_issue
add-highlighter shared/kak-notes-tasks/subtask-uncheck regex "-\s* (\[ \])[^\n]*"\
  1:kak_notes_subtask_uncheck
add-highlighter shared/kak-notes-tasks/subtask-check regex "-\s* (\[x\])\s*([^\n]*)"\
  1:kak_notes_subtask_check 2:kak_notes_subtask_text_check
add-highlighter shared/kak-notes-tasks/tag regex " (:[^:]+:)" 0:kak_notes_tag

add-highlighter shared/kak-notes-tasks-list group
add-highlighter shared/kak-notes-tasks-list/path regex "^([^:]+)(:)([^:]+)(:)([^n]+)(:)[^\n]*"\
  1:kak_notes_task_list_path 2:kak_notes_task_list_delimiter \
  3:kak_notes_task_list_line 4:kak_notes_task_list_delimiter \
  5:kak_notes_task_list_col  6:kak_notes_task_list_delimiter

map global kak-notes / ':kak-notes-search<ret>'                     -docstring 'search in notes'
map global kak-notes A ':kak-notes-archive-note<ret>'               -docstring 'archive note'
map global kak-notes C ':kak-notes-capture<ret>'                    -docstring 'capture'
map global kak-notes J ':kak-notes-journal-open-daily<ret>'         -docstring 'open daily'
map global kak-notes N ':kak-notes-new-note '                       -docstring 'new note'
map global kak-notes S ':kak-notes-sync<ret>'                       -docstring 'synchronize notes'
map global kak-notes a ':kak-notes-archive-open<ret>'               -docstring 'open archived note'
map global kak-notes c ':kak-notes-open-capture<ret>'               -docstring 'open capture'
map global kak-notes j ':kak-notes-journal-open<ret>'               -docstring 'open past journal'
map global kak-notes l ':enter-user-mode kak-notes-tasks-list<ret>' -docstring 'tasks list'
map global kak-notes n ':kak-notes-open<ret>'                       -docstring 'open note'
map global kak-notes t ':enter-user-mode kak-notes-tasks<ret>'      -docstring 'tasks'

map global kak-notes-tasks-list a ":kak-notes-tasks-list-all<ret>"                                 -docstring 'list all tasks'
map global kak-notes-tasks-list d ":kak-notes-tasks-list-by-regex %opt{kak_notes_sym_done}<ret>"   -docstring 'list done tasks'
map global kak-notes-tasks-list l ":kak-notes-tasks-list-by-regex '\ :[^:]+:'<ret>"                -docstring 'list tasks by labels'
map global kak-notes-tasks-list n ":kak-notes-tasks-list-by-regex %opt{kak_notes_sym_wontdo}<ret>" -docstring 'list wontdo tasks'
map global kak-notes-tasks-list t ":kak-notes-tasks-list-by-regex %opt{kak_notes_sym_todo}<ret>"   -docstring 'list todo tasks'
map global kak-notes-tasks-list w ":kak-notes-tasks-list-by-regex %opt{kak_notes_sym_wip}<ret>"    -docstring 'list wip tasks'

hook -group kak-notes-tasks global WinCreate \*kak-notes-tasks-list\* %{
  map buffer normal '<ret>' ':kak-notes-tasks-list-open<ret>'
  add-highlighter window/ ref kak-notes-tasks
  add-highlighter window/ ref kak-notes-tasks-list
}

hook -group kak-notes-tasks global WinCreate .*\.md %{
  add-highlighter window/ ref kak-notes-tasks

  map window kak-notes-tasks d ":kak-notes-task-switch-status %opt{kak_notes_sym_done}<ret>"      -docstring 'switch task to done'
  map window kak-notes-tasks i ":kak-notes-task-gh-open-issue<ret>"                               -docstring 'open GitHub issue'
  map window kak-notes-tasks n ":kak-notes-task-switch-status %opt{kak_notes_sym_wontdo}<ret>"    -docstring 'switch task to wontdo'
  map window kak-notes-tasks t ":kak-notes-task-switch-status %opt{kak_notes_sym_todo}<ret>"      -docstring 'switch task to todo'
  map window kak-notes-tasks w ":kak-notes-task-switch-status %opt{kak_notes_sym_wip}<ret>"       -docstring 'switch task to wip'
}
