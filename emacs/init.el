; phaazon emacs configuration

; Remove ring bells.
(setq ring-bell-function #'ignore)

; Better startup.
(setq inhibit-startup-screen t)

; Prevent the cursor from blinking like a fucking Christmas tree.
(blink-cursor-mode 0)

; Faster confirmations.
(defalias 'yes-or-no-p 'y-or-n-p)

; Font and locale.
(set-default-font "DejaVu Sans Mono-13")
(prefer-coding-system 'utf-8)
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

; No backup files, sir.
(setq make-backup-files nil)
(setq backup-inhibited t)

; Do not automatically save files.
(setq auto-save-default nil)

; Get rid of temporary files ending in ~.
(setq backup-directory-alist
  `((".*" . ,temporary-file-directory))
)

; Indent / spaces
(setq tab-width 2 indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

; The tab key indents
(setq-default tab-always-indent 'complete)

; Delete trailing whitespaces on save
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; Smooth scrolling.
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1)))
(setq mouse-wheel-progressive-speed nil) ; no acceleration
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1)
(setq fast-but-imprecise-scrolling t)
(setq jit-lock-defer-time 0)

; Show match parenthesis
(show-paren-mode 1)

; Hide ugly GUI stuff
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

; Remove default messages
(defun display-startup-echo-area-message ()
  "If it wasn't for this you'd be GNU/Spammed by now"
  (message "")
)
(setq initial-scratch-message nil)

; Customization file
(setq custom-file
  (concat (file-name-as-directory user-emacs-directory) "custom.el")
)
(load custom-file 'noerror)

; Enable find-file-at-point.
(ffap-bindings)

; Make buffer names unique.
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

; Mark current line.
(global-hl-line-mode 0)

; Display line numbers.
(column-number-mode t)
(line-number-mode t)

; Prettify symbols.
(global-prettify-symbols-mode t)

; Follow symlinks in version control systems.
(setq vc-follow-symlinks t)

; Enable straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

; Package management.
(load-file "~/.emacs.d/packages.el")

; Keybindings.
(load-file "~/.emacs.d/keybindings.el")
