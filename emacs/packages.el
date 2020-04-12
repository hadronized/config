;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Themes. ;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'dracula-theme)
(straight-use-package 'spacemacs-theme)
(straight-use-package 'doom-themes)
(straight-use-package 'one-themes)
(load-theme 'one-dark)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil. ;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'evil)
(evil-mode 1)
(setq evil-echo-state nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Magit. ;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'magit)
(straight-use-package 'forge)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Projectile. ;;;;;;;;;;;;;;;;;;
(straight-use-package 'projectile)
(projectile-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hydra. ;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'hydra)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Dashboard. ;;;;;;;;;;;;;;;;;;;
(straight-use-package 'dashboard)
(dashboard-setup-startup-hook)
; Set the title.
(setq dashboard-banner-logo-title "We don’t deserve dogs!")
; Set the banner.
(setq dashboard-startup-banner 'logo)
; Centered content.
(setq dashboard-center-content t)
; Icons.
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
; Show init info.
(setq dashboard-set-init-info t)
; Customize the list.
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; All The Icons. ;;;;;;;;;;;;;;;
(straight-use-package 'all-the-icons)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Neotree. ;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'neotree)

; Neotree theme.
(setq neo-theme (if (display-graphic-p) 'icons))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Avy. ;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'avy)
; Avy keys.
(setq avy-keys '(?e ?t ?i ?s ?p ?d ?u ?r ?y ?g ?a ?n))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight Symbol. ;;;;;;;;;;;;
(straight-use-package 'highlight-symbol)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rainbow Mode. ;;;;;;;;;;;;;;;;
(straight-use-package 'rainbow-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Expand Region. ;;;;;;;;;;;;;;;
(straight-use-package 'expand-region)
; Expand region keybindings.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Highlight Numbers. ;;;;;;;;;;;
(straight-use-package 'highlight-numbers)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

; Disabled because fucking too slow
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;; Highlight Indent Guides. ;;;;;
; (straight-use-package 'highlight-indent-guides)
; (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
; ; Character to display as indentation.
; (setq highlight-indent-guides-method 'character)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Rainbow Delimiters. ;;;;;;;;;;
(straight-use-package 'rainbow-delimiters)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GHub. ;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'ghub)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Async. ;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'async)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Doom Line. ;;;;;;;;;;;;;;;;;;;
(straight-use-package 'doom-modeline)
(doom-modeline-mode 1)

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-height 25)

;; How wide the mode-line bar should be. It's only respected in GUI.
(setq doom-modeline-bar-width 3)

;; The limit of the window width.
;; If `window-width' is smaller than the limit, some information won't be displayed.
(setq doom-modeline-window-width-limit fill-column)

;; How to detect the project root.
;; The default priority of detection is `ffip' > `projectile' > `project'.
;; nil means to use `default-directory'.
;; The project management packages have some issues on detecting project root.
;; e.g. `projectile' doesn't handle symlink folders well, while `project' is unable
;; to hanle sub-projects.
;; You can specify one if you encounter the issue.
(setq doom-modeline-project-detection 'projectile)

;; Determines the style used by `doom-modeline-buffer-file-name'.
;;
;; Given ~/Projects/FOSS/emacs/lisp/comint.el
;;   auto => emacs/lisp/comint.el (in a project) or comint.el
;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
;;   truncate-with-project => emacs/l/comint.el
;;   truncate-except-project => ~/P/F/emacs/l/comint.el
;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
;;   truncate-all => ~/P/F/e/l/comint.el
;;   relative-from-project => emacs/lisp/comint.el
;;   relative-to-project => lisp/comint.el
;;   file-name => comint.el
;;   buffer-name => comint.el<2> (uniquify buffer name)
;;
;; If you are experiencing the laggy issue, especially while editing remote files
;; with tramp, please try `file-name' style.
;; Please refer to https://github.com/bbatsov/projectile/issues/657.
(setq doom-modeline-buffer-file-name-style 'auto)

;; Whether display icons in the mode-line. Respects `all-the-icons-color-icons'.
;; While using the server mode in GUI, should set the value explicitly.
(setq doom-modeline-icon (display-graphic-p))

;; Whether display the icon for `major-mode'. Respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Whether display the colorful icon for `major-mode'.
;; Respects `doom-modeline-major-mode-icon'.
(setq doom-modeline-major-mode-color-icon t)

;; Whether display the icon for the buffer state. It respects `doom-modeline-icon'.
(setq doom-modeline-buffer-state-icon t)

;; Whether display the modification icon for the buffer.
;; Respects `doom-modeline-icon' and `doom-modeline-buffer-state-icon'.
(setq doom-modeline-buffer-modification-icon t)

;; Whether to use unicode as a fallback (instead of ASCII) when not using icons.
(setq doom-modeline-unicode-fallback nil)

;; Whether display the minor modes in the mode-line.
(setq doom-modeline-minor-modes nil)

;; If non-nil, a word count will be added to the selection-info modeline segment.
(setq doom-modeline-enable-word-count t)

;; Major modes in which to display word count continuously.
;; Also applies to any derived modes. Respects `doom-modeline-enable-word-count'.
;; If it brings the sluggish issue, disable `doom-modeline-enable-word-count' or
;; remove the modes from `doom-modeline-continuous-word-count-modes'.
(setq doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode))

;; Whether display the buffer encoding.
(setq doom-modeline-buffer-encoding t)

;; Whether display the indentation information.
(setq doom-modeline-indent-info t)

;; If non-nil, only display one number for checker information if applicable.
(setq doom-modeline-checker-simple-format t)

;; The maximum number displayed for notifications.
(setq doom-modeline-number-limit 99)

;; The maximum displayed length of the branch name of version control.
(setq doom-modeline-vcs-max-length 100)

;; Whether display the perspective name. Non-nil to display in the mode-line.
(setq doom-modeline-persp-name t)

;; If non nil the default perspective name is displayed in the mode-line.
(setq doom-modeline-display-default-persp-name t)

;; Whether display the `lsp' state. Non-nil to display in the mode-line.
(setq doom-modeline-lsp t)

;; Whether display the GitHub notifications. It requires `ghub' package.
(setq doom-modeline-github t)

;; The interval of checking GitHub.
(setq doom-modeline-github-interval (* 30 60))

;; Whether display the modal state icon.
;; Including `evil', `overwrite', `god', `ryo' and `xah-fly-keys', etc.
(setq doom-modeline-modal-icon t)

;; Whether display the mu4e notifications. It requires `mu4e-alert' package.
(setq doom-modeline-mu4e nil)

;; Whether display the gnus notifications.
(setq doom-modeline-gnus t)

;; Wheter gnus should automatically be updated and how often (set to nil to disable)
(setq doom-modeline-gnus-timer 2)

;; Whether display the IRC notifications. It requires `circe' or `erc' package.
(setq doom-modeline-irc nil)

;; Function to stylize the irc buffer names.
(setq doom-modeline-irc-stylize 'identity)

;; Whether display the environment version.
(setq doom-modeline-env-version t)
;; Or for individual languages
(setq doom-modeline-env-enable-python t)
(setq doom-modeline-env-enable-ruby t)
(setq doom-modeline-env-enable-perl t)
(setq doom-modeline-env-enable-go t)
(setq doom-modeline-env-enable-elixir t)
(setq doom-modeline-env-enable-rust t)

;; Change the executables to use for the language version string
(setq doom-modeline-env-python-executable "python") ; or `python-shell-interpreter'
(setq doom-modeline-env-ruby-executable "ruby")
(setq doom-modeline-env-perl-executable "perl")
(setq doom-modeline-env-go-executable "go")
(setq doom-modeline-env-elixir-executable "iex")
(setq doom-modeline-env-rust-executable "rustc")

;; What to dispaly as the version while a new one is being loaded
(setq doom-modeline-env-load-string "...")

;; Hooks that run before/after the modeline version string is updated
(setq doom-modeline-before-update-env-hook nil)
(setq doom-modeline-after-update-env-hook nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flx. ;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'flx)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Ivy. ;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'ivy)
(straight-use-package 'counsel)
(straight-use-package 'counsel-projectile)
(straight-use-package 'all-the-icons-ivy-rich)
(all-the-icons-ivy-rich-mode 1)
(ivy-mode 1)
(ivy-rich-mode 1)
(counsel-mode 1)
(counsel-projectile-mode 1)

(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d)")
(setq ivy-on-del-error-function #'ignore)
(setq enable-recursive-minibuffers t)
(setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Languages support. ;;;;;;;;;;;
(load-file "~/.emacs.d/languages.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; LSP. ;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'flycheck)
(straight-use-package 'lsp-mode)
(straight-use-package 'lsp-ui)
(straight-use-package 'lsp-ivy)
(straight-use-package 'lsp-clangd)
(straight-use-package 'lsp-treemacs)
(require 'lsp-mode)
(add-hook 'prog-mode-hook #'lsp)
(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
(setq lsp-rust-show-hover-context nil
      lsp-lens-auto-enable t
      lsp-eldoc-enable-hover nil
      lsp-signature-auto-activate nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Company. ;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'company)
(straight-use-package 'company-lsp)
(company-mode)
(push 'company-lsp company-backends)
(setq company-capf t)
(setq company-lsp-cache-candidates 'auto
      company-lsp-async t
      company-lsp-enable-snippet t
      company-lsp-enable-recompletion t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Which Key. ;;;;;;;;;;;;;;;;;;;
(straight-use-package 'which-key)
(setq which-key-enable-extended-define-key t)
(setq which-key-idle-delay 0.2)
(which-key-mode 1)
(setq which-key-side-window-location 'bottom)
(setq which-key-prefix-prefix "·")
(setq which-key-show-docstrings t)
(setq which-key-max-description-length 50)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil Nerd Commenter. ;;;;;;;;;
(straight-use-package 'evil-nerd-commenter)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Git Gutter Fringe. ;;;;;;;;;;;
(straight-use-package 'fringe-helper)
(straight-use-package 'git-gutter-fringe)
(global-git-gutter-mode t)
(setq git-gutter:added-sign "│")
(setq git-gutter:modified-sign "│")
(setq git-gutter:deleted-sign "│")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org Mode. ;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'org)
(straight-use-package 'org-fancy-priorities)
(straight-use-package 'org-bullets)

(add-hook 'org-mode-hook (lambda () (org-fancy-priorities-mode 1)))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq
   org-startup-indented t
   org-todo-keywords '((sequence "TODO(t)" "WIP(w)" "FROZEN(f)" "|" "DONE(d)" "CANCELLED(c)"))
   org-priority-faces '((?A :foreground "#ff405F")
                        (?B :foreground "#eb9e34")
                        (?C :foreground "#34eb86")
                        (?D :foreground "#34d8eb"))
   org-todo-keyword-faces
     '(("TODO" :foreground "#666666" :weight normal :underline t)
       ("WIP" :foreground "#fc2d7d" :weight normal :underline t)
       ("FROZEN" :foreground "#2db4fc" :weight normal :underline t)
       ("DONE" :foreground "#2dfcb4" :weight normal :underline t)
       ("CANCELLED" :foreground "#ff8f2e" :weight normal :underline t))

   org-return-follows-link t
   org-directory "~/org/"
   org-agenda-files (list org-directory)
   org-default-notes-file (concat org-directory "/notes.org")
   org-agenda-diary-file (concat org-directory "/diary.org")
   org-agenda-span 'day
   org-agenda-include-diary t
   org-refile-targets '((org-agenda-files :maxlevel . 2))
   org-log-done 'time)

(setq org-fancy-priorities-list '((?A . "↑")
                                  (?B . "↑")
                                  (?C . "↓")
                                  (?D . "↓")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Evil Multi Edit. ;;;;;;;;;;;;;
(straight-use-package 'evil-multiedit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; YAML ;;;;;;;;;;;;;;;;;;;;;;;;;
(straight-use-package 'yaml-mode)
