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
(define-key space-map "p" 'projectile-command-map)

; Avy
(define-key space-map "a" '("avy"))
(define-key space-map "ac" 'avy-goto-char)
(define-key space-map "aC" 'avy-goto-char-2)
(define-key space-map "al" 'avy-goto-line)
(define-key space-map "aw" 'avy-goto-word-0)
(define-key space-map "aW" 'avy-goto-word-1)

; Expand
(define-key space-map "e" 'er/expand-region)

; Ivy
(define-key space-map "s" 'swiper)
(define-key space-map "b" 'ivy-switch-buffer)
(define-key space-map (kbd "SPC") 'counsel-fzf)
(global-set-key (kbd "C-c C-r") 'ivy-resume)

; Evil Nerd Commenter
(define-key space-map "/" 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map "/" 'evilnc-comment-or-uncomment-lines)

; Neotree
(define-key space-map "n" 'neotree-toggle)
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
(define-key space-map "oa" 'org-agenda)
(define-key space-map "os" 'org-store-link)
(define-key space-map "oc" 'org-capture)
(define-key space-map "of" 'org-capture-finalize)
(define-key space-map "or" 'org-capture-refile)
(evil-define-key 'normal org-mode-map (kbd "C-SPC") 'org-todo)
(evil-define-key 'normal org-mode-map (kbd "C-s") 'org-metaup)
(evil-define-key 'normal org-mode-map (kbd "C-t") 'org-metadown)
(evil-define-key 'normal org-mode-map (kbd "C-c") 'org-metaleft)
(evil-define-key 'normal org-mode-map (kbd "C-r") 'org-metaright)
(evil-define-key 'normal org-mode-map (kbd "C-S-s") 'org-shiftup)
(evil-define-key 'normal org-mode-map (kbd "C-S-t") 'org-shiftdown)
(evil-define-key 'normal org-mode-map (kbd "RET") 'org-return)
(evil-define-key 'normal org-mode-map (kbd "l") 'org-insert-link)
(evil-define-key 'normal org-capture-mode-map (kbd "C-a") 'org-capture-kill)
(evil-define-key 'normal org-capture-mode-map (kbd "C-f") 'org-capture-finalize)
(evil-define-key 'normal org-capture-mode-map (kbd "C-q") 'org-capture-refile)
(evil-define-key 'emacs org-agenda-mode-map "c" 'left-char)
(evil-define-key 'emacs org-agenda-mode-map "r" 'right-char)
(evil-define-key 'emacs org-agenda-mode-map "s" 'previous-line)
(evil-define-key 'emacs org-agenda-mode-map "t" 'next-line)

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
(define-key space-map "L" lsp-command-map)
(define-key space-map "l" '("language server"))
(define-key space-map "d" '("go to definition" . lsp-find-definition))
(define-key space-map "i" '("go to implementation" . lsp-find-implementation))
(define-key space-map "r" '("find references" . lsp-treemacs-references))
(define-key space-map "lf" '("find"))
(define-key space-map "lfd" 'lsp-find-definition)
(define-key space-map "lfi" 'lsp-find-implementation)
(define-key space-map "lfr" 'lsp-find-references)
(define-key space-map "lt" '("toggle"))
(define-key space-map "lth" 'lsp-toggle-symbol-highlight)
(define-key space-map "ltd" 'lsp-ui-doc-mode)
(define-key space-map "ltl" 'lsp-lens-mode)
(define-key space-map "lts" 'lsp-ui-sideline-mode)
(define-key space-map "lh" 'lsp-describe-thing-at-point)
(define-key space-map "la" 'lsp-execute-code-action)
(define-key space-map "ls" 'lsp-treemacs-symbols)
(define-key space-map "ld" 'lsp-ui-doc-glance)
(define-key space-map "lr" 'lsp-rename)
(define-key space-map "ll" '("lsp"))
(define-key space-map "llq" 'lsp-disconnect)
(define-key space-map "llr" 'lsp-restart)
(define-key space-map "llw" 'lsp-restart-workspace)
(define-key space-map "lld" 'lsp-describe-session)
