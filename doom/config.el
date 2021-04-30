;; The best theme — ever.
(setq doom-theme 'doom-one)

;; Default fill-column to 120 and add the keybinding to toggle it on and off.
(setq-default fill-column 120)
(map! :leader
      :desc "Auto fill"
      :n "t a" 'auto-fill-mode)

;; Use , as local leader.
(setq doom-localleader-key ",")

;; Font setting.
(setq doom-font (font-spec :family "JetBrains Mono" :size 16 :weight 'light)
      doom-variable-pitch-font (font-spec :family "DejaVu Serif" :size 17)
      ivy-posframe-font (font-spec :family "JetBrains Mono" :size 19))

;; Set all-the-icons factor to 1.0 to prevent weird issues with the modeline.
(setq all-the-icons-scale-factor 1.0)

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

;; Undo / redo.
(map! :n "U" 'undo-tree-redo)

(map! :nvom "à" 'evil-snipe-t)
(map! :nvom "À" 'evil-snipe-T)

;; Fix for macOS and its stupid support for alt-gr.
(when (string-equal system-type "darwin")
  (progn
    (setq mac-option-key-is-meta nil)
    (setq mac-command-key-is-meta t)
    (setq mac-command-modifier 'meta)
    (setq mac-option-modifier nil)))

(setq evil-shift-width 2)

(add-hook! 'before-save-hook 'delete-trailing-whitespace)

(map! :n "w o" #'evil-window-split)

(setq auto-save-default nil)

(add-hook! 'rustic-mode-hook (auto-fill-mode 1))

(map! :leader
      :prefix "b"
      :desc "Rename buffer"
      :n "R" #'rename-buffer)

(map! :nvom "è" 'evil-avy-goto-word-0)

(after! avy
  (setq avy-keys '(?e ?t ?o ?v ?x ?q ?p ?d ?y ?g ?f ?b ?l ?z ?h ?c ?k ?i ?s ?u ?r ?a ?n)
        avy-background t))

(setq avy-orders-alist
      '((avy-goto-char . avy-order-closest)
        (avy-goto-word-0 . avy-order-closest)))

(setq flycheck-check-syntax-automatically '(save idle-change))

(add-hook 'after-init-hook 'global-company-mode)

(after! sh-script
  (set-company-backend! 'shmode
    '(company-shell :with company-yasnippet)))

;; ;; OVERRIDES
;; (map! :mode emacs :map company-active-map
;;       "<RET>" nil
;;       "<return>" nil)

;; (map! :mode emacs :map general-company-active-map-backup-map
;;       "<RET>" nil
;;       "<return>" nil)

;; ;; KEYBINDINGS
;; (map! :map company-mode-map
;;       :i "C-y" 'company-complete-selection)

(use-package company-box
  :hook (company-mode . company-box-mode))

(setq org-directory "~/org")
(setq org-agenda-files '("~/org"))

;; (setq org-modules '(ol-bibtex habits))

(map! :map org-mode-map
      :n "C" 'org-shiftleft
      :n "R" 'org-shiftright
      :n "T" 'org-shiftdown
      :n "S" 'org-shiftup
      :n "M-c" 'org-metaleft
      :n "M-r" 'org-metaright
      :n "M-s" 'org-metaup
      :n "M-t" 'org-metadown
      :n "M-S-c" 'org-do-promote
      :n "M-S-r" 'org-do-demote)

(setq org-link-abbrev-alist
      '(("google"    . "http://www.google.com/search?q=%s")
        ("gmap" . "https://maps.google.com/maps?q=%s")
        ("gimages" . "https://google.com/images?q=%s")
        ("doom-repo" . "https://github.com/hlissner/doom-emacs/%s")
        ("wolfram" . "https://wolframalpha.com/input/?i=%s")
        ("wikipedia" . "https://en.wikipedia.org/wiki/%s")
        ("duckduckgo" . "https://duckduckgo.com/?q=%s")
        ("youtube" . "https://youtube.com/watch?v=%s")
        ("github" . "https://github.com/%s")
        ("wr" . "https://www.wordreference.com/enfr/%s")))

;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "WIP(w!/!)" "FROZEN(z!/!)" "LATER(l!/!)" "|" "DONE(d!/!)")
;;         (sequence "BUG(b)" "|" "FIXED(f!/!)")
;;         (sequence "FEATURE(r)" "|" "IMPLEMENTED(i!/!)")
;;         (sequence "|" "CANCELLED(c@)")))

;; (setq org-todo-keyword-faces
;;       '(("TODO" . "blue") ("WIP" . (:foreground "green" :weight bold)) ("FROZEN" . "blue") ("DONE" . "grey")
;;         ("BUG" . (:foreground "red" :weight bold)) ("FIXED" (:foreground "blue" :weight bold))
;;         ("FEATURE" . "purple") ("IMPLEMENTED" . (:foreground "blue" :weight bold))
;;         ("CANCELLED" . "grey")))

(setq org-log-done 'time)

(setq org-log-into-drawer t)

(setq org-fancy-priorities-list '("❗" "⬆" "⬇"))

(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setq org-tag-alist '(("spare" . ?s) ("work" . ?w) ("learn" . ?l)))

(after! git-gutter-fringe
  (if (fboundp 'fringe-mode) (fringe-mode '4))
  (define-fringe-bitmap 'git-gutter-fr:deleted [255 255 255]
    nil nil 'bottom))

(setq haskell-process-type 'cabal-new-repl)

(setq rustic-indent-offset 2)

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(setq projectile-project-search-path "~/dev")

(setq-default treemacs-show-cursor t)

(map! :leader
      :prefix "c"
      :desc "Symbol outline"
      :n "o" #'lsp-treemacs-symbols)

(map! :leader
      :prefix "c"
      :desc "List errors"
      :n "x" #'lsp-treemacs-errors-list)

(setq epa-file-encrypt-to '(9BFDD250BBECA905))

(add-hook! 'rustic-mode-hook (modify-syntax-entry ?_ "w"))

;; Format-on-save whitelist.
(setq +format-on-save-enabled-modes '(rust-mode java-mode python-mode vue-mode js-mode))
