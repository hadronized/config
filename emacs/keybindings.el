; Moving around.
(define-key evil-normal-state-map "c" 'left-char)
(define-key evil-normal-state-map "r" 'right-char)
(define-key evil-normal-state-map "s" 'previous-line)
(define-key evil-normal-state-map "t" 'next-line)
(define-key evil-normal-state-map "é" 'evil-forward-word-begin)

; Visual mode.
(define-key evil-visual-state-map "c" 'left-char)
(define-key evil-visual-state-map "r" 'right-char)
(define-key evil-visual-state-map "s" 'previous-line)
(define-key evil-visual-state-map "t" 'next-line)

; Window handling.
(define-key evil-normal-state-map "w" 'evil-window-map)
(define-key evil-window-map "c" 'evil-window-left)
(define-key evil-window-map "r" 'evil-window-right)
(define-key evil-window-map "s" 'evil-window-up)
(define-key evil-window-map "t" 'evil-window-down)
(define-key evil-window-map "o" 'evil-window-split)

; Replace.
(define-key evil-normal-state-map "h" 'evil-replace)
(define-key evil-normal-state-map "H" 'evil-replace-state)
(define-key evil-visual-state-map "h" 'evil-replace)
(define-key evil-visual-state-map "H" 'evil-replace-state)

; Redo
(define-key evil-normal-state-map "U" 'redo)

; Delete last word.
(global-set-key (kbd "C-w") 'evil-delete-backward-word)

; Smarter return (it will handle comments section and indentation automatically).
(define-key evil-insert-state-map (kbd "RET") 'indent-new-comment-line)

; Space map bindings.
(define-prefix-command 'space-map)
(define-key evil-normal-state-map (kbd "SPC") 'space-map)
(define-key evil-insert-state-map (kbd "C-SPC") 'space-map)
(define-key evil-visual-state-map (kbd "C-SPC") 'space-map)

; Magit
(define-key space-map "g" '("magit" . magit-status))
(evil-define-key 'emacs magit-status-mode-map (kbd "C-s") 'previous-line)
(evil-define-key 'emacs magit-status-mode-map (kbd "C-t") 'forward-line)
(evil-define-key 'emacs magit-status-mode-map (kbd "C-c") 'left-word)
(evil-define-key 'emacs magit-status-mode-map (kbd "C-r") 'right-word)
(evil-define-key 'emacs magit-revision-mode-map (kbd "C-s") 'previous-line)
(evil-define-key 'emacs magit-revision-mode-map (kbd "C-t") 'forward-line)
(evil-define-key 'emacs magit-revision-mode-map (kbd "C-c") 'left-word)
(evil-define-key 'emacs magit-revision-mode-map (kbd "C-r") 'right-word)
(evil-define-key 'emacs magit-log-mode-map (kbd "C-s") 'previous-line)
(evil-define-key 'emacs magit-log-mode-map (kbd "C-t") 'forward-line)
(evil-define-key 'emacs magit-log-mode-map (kbd "C-c") 'left-word)
(evil-define-key 'emacs magit-log-mode-map (kbd "C-r") 'right-word)
(evil-define-key 'emacs git-rebase-mode-map (kbd "C-s") 'previous-line)
(evil-define-key 'emacs git-rebase-mode-map (kbd "C-t") 'forward-line)
(evil-define-key 'emacs git-rebase-mode-map (kbd "C-S-s") 'git-rebase-move-line-up)
(evil-define-key 'emacs git-rebase-mode-map (kbd "C-S-t") 'git-rebase-move-line-down)

; Projectile
(define-key space-map "p" '("projectile" . projectile-command-map))

; Avy
(define-key space-map "a" '("avy"))
(define-key space-map "ac" '("go to char" . avy-goto-char))
(define-key space-map "c" '("go to char" . avy-goto-char))
(define-key space-map "aC" '("go to pair" . avy-goto-char-2))
(define-key space-map "al" '("go to line" . avy-goto-line))
(define-key space-map "aw" '("go to word" . avy-goto-word-0))
(define-key space-map "w" '("go to word" . avy-goto-word-0))
(define-key space-map "aW" '("go to word char" . avy-goto-word-1))

; Expand
(define-key space-map "e" '("expand" . er/expand-region))

; Ivy
(define-key space-map "s" 'swiper)
(define-key space-map "b" '("find buffer" . ivy-switch-buffer))
(define-key space-map "f" '("find file" . counsel-fzf))
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(define-key ivy-mode-map (kbd "C-s") 'ivy-previous-line)
(define-key ivy-mode-map (kbd "C-t") 'ivy-next-line)

; Evil Nerd Commenter
(define-key space-map "/" '("(un)comment" . evilnc-comment-or-uncomment-lines))
(define-key evil-visual-state-map "/" '("(un)comment" . evilnc-comment-or-uncomment-lines))

; Neotree
(define-key space-map "n" '("neotree" . neotree-toggle))
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'space-map)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "r") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "u") 'neotree-select-up-node)

; Markdown.
(define-key space-map "m" '("markdown"))
(define-key space-map "ml" 'markdown-insert-link)
(define-key space-map "mi" 'markdown-insert-image)
(define-key space-map "mti" 'markdown-toggle-inline-images)

; Org.
(define-key space-map "o" '("org"))
(defun open-notes () "Open the main Org Mode note file." (interactive)
                     (find-file org-default-notes-file))

(define-key space-map "on" '("open notes" . open-notes))
(define-key space-map "oa" 'org-agenda)
(define-key space-map "oc" 'org-capture)
(define-key space-map "ol" 'org-agenda-list)
(define-key space-map "os" 'org-store-link)
(define-key space-map "or" 'org-refile)
(define-key space-map "oR" 'org-capture-refile)
(define-key space-map "ok" 'org-capture-kill)
(define-key space-map "of" 'org-capture-finalize)
(define-key space-map "oz" 'org-capture-goto-last-stored)
(define-key space-map "ot" 'org-set-tags-command)
(define-key space-map "od" 'org-time-stamp)
(evil-define-key '(normal insert) org-mode-map (kbd "C-SPC") 'space-map)
(evil-define-key '(normal insert) org-mode-map (kbd "C-d") 'org-todo)
(evil-define-key '(normal insert) org-mode-map (kbd "C-s") 'org-metaup)
(evil-define-key '(normal insert) org-mode-map (kbd "C-t") 'org-metadown)
(evil-define-key '(normal insert) org-mode-map (kbd "C-c") 'org-metaleft)
(evil-define-key '(normal insert) org-mode-map (kbd "C-r") 'org-metaright)
(evil-define-key '(normal insert) org-mode-map (kbd "C-S-s") 'org-shiftup)
(evil-define-key '(normal insert) org-mode-map (kbd "C-S-t") 'org-shiftdown)
(evil-define-key 'normal org-mode-map (kbd "RET") 'org-return)
(evil-define-key '(normal insert) org-mode-map (kbd "C-l") 'org-insert-link)
(evil-define-key 'normal org-mode-map "f" 'org-schedule)
(evil-define-key 'normal org-mode-map "F" 'org-deadline)
(evil-define-key 'normal org-mode-map "q" 'org-agenda-quit)
(evil-define-key 'emacs org-mode-map (kbd "C-b") 'org-insert-structure-template)
(evil-define-key '(normal insert) org-capture-mode-map (kbd "C-SPC") 'space-map)
(evil-define-key '(normal insert) org-capture-mode-map (kbd "C-d") 'org-todo)
(evil-define-key '(normal insert) org-capture-mode-map (kbd "C-s") 'org-metaup)
(evil-define-key '(normal insert) org-capture-mode-map (kbd "C-t") 'org-metadown)
(evil-define-key '(normal insert) org-capture-mode-map (kbd "C-c") 'org-metaleft)
(evil-define-key '(normal insert) org-capture-mode-map (kbd "C-r") 'org-metaright)
(evil-define-key '(normal insert) org-capture-mode-map (kbd "C-S-s") 'org-shiftup)
(evil-define-key '(normal insert) org-capture-mode-map (kbd "C-S-t") 'org-shiftdown)
(evil-define-key '(normal insert) org-capture-mode-map (kbd "C-l") 'org-insert-link)
(evil-define-key 'emacs org-agenda-mode-map "c" 'left-char)
(evil-define-key 'emacs org-agenda-mode-map "r" 'right-char)
(evil-define-key 'emacs org-agenda-mode-map "s" 'previous-line)
(evil-define-key 'emacs org-agenda-mode-map "t" 'next-line)
(evil-define-key 'emacs org-agenda-mode-map (kbd "C-l") 'org-insert-link)

; Dashboard.
(evil-define-key 'normal dashboard-mode-map (kbd "RET") 'dashboard-return)

; Evil Multi Edit.
(require 'evil-multiedit)
(define-key space-map "z" '("multi edit"))
(define-key space-map "zp" 'evil-multiedit-match-symbol-and-prev)
(define-key space-map "zn" 'evil-multiedit-match-symbol-and-next)
(define-key space-map "zz" 'evil-multiedit-match-all)
(define-key evil-multiedit-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)
(define-key evil-motion-state-map (kbd "RET") 'evil-multiedit-toggle-or-restrict-region)
(define-key evil-multiedit-state-map (kbd "C-p") 'evil-multiedit-prev)
(define-key evil-multiedit-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-insert-state-map (kbd "C-p") 'evil-multiedit-prev)
(define-key evil-multiedit-insert-state-map (kbd "C-n") 'evil-multiedit-next)
(define-key evil-multiedit-state-map "p" 'evil-multiedit-match-symbol-and-prev)
(define-key evil-multiedit-state-map "n" 'evil-multiedit-match-symbol-and-next)
(define-key evil-multiedit-state-map "a" 'evil-multiedit-match-all)

; LSP.
(define-key space-map "l" '("language server"))
(define-key space-map "d" '("go to definition" . lsp-find-definition))
(define-key space-map "i" '("go to implementation" . lsp-find-implementation))
(define-key space-map "r" '("find references" . lsp-treemacs-references))
(define-key space-map "lc" '("clippy" . rust-run-clippy))
(define-key space-map "lf" '("find"))
(define-key space-map "lfd" 'lsp-find-definition)
(define-key space-map "lfi" 'lsp-find-implementation)
(define-key space-map "lfr" 'lsp-find-references)
(define-key space-map "lm" '("toggle"))
(define-key space-map "lmh" 'lsp-toggle-symbol-highlight)
(define-key space-map "lmd" 'lsp-ui-doc-mode)
(define-key space-map "lml" 'lsp-lens-mode)
(define-key space-map "lts" 'lsp-ui-sideline-mode)
(define-key space-map "lh" 'lsp-describe-thing-at-point)
(define-key space-map "la" 'lsp-execute-code-action)
(define-key space-map "ls" 'lsp-ivy-workspace-symbol)
(define-key space-map "lS" 'lsp-ivy-global-workspace-symbol)
(define-key space-map "lt" 'lsp-treemacs-symbols)
(define-key space-map "ld" 'lsp-ui-doc-glance)
(define-key space-map "lr" 'lsp-rename)
(define-key space-map "ll" '("lsp"))
(define-key space-map "le" '("errors" . lsp-treemacs-errors-list))
(define-key space-map "llq" 'lsp-disconnect)
(define-key space-map "llr" 'lsp-restart)
(define-key space-map "llw" 'lsp-restart-workspace)
(define-key space-map "lld" 'lsp-describe-session)

; Company.
(define-key company-active-map (kbd "C-s") 'company-select-previous)
(define-key company-active-map (kbd "C-t") 'company-select-next)
(define-key evil-insert-state-map (kbd "C-n") 'company-complete)
