;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Dimitri Sabadie"
      user-mail-address "dimitri.sabadie@gmail.com")

;; Various general configuration.
(setq-default tab-width 2)
(setq-default tab-always-indent nil)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 12))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; yasnippet
(setq +lsp-company-backends '(company-capf :with company-yasnippet))

;; org-mode
(setq org-directory "~/org")
(setq org-noter-notes-search-path '("~/org/notes/"))

;; rgb
(add-hook! 'rainbow-mode-hook
  (hl-line-mode (if rainbow-mode -1 +1)))

;; yasnippets
(setq yasnippet-snippets-dir "~/.config/doom/snippets")

;; keybindings dela muerte
;; standard stuff dela muerte
(map! :nv :desc "Redo" "U" #'undo-fu-only-redo)

;; window remapping
(map! :n "w o" #'evil-window-split)

;; avy dela muerte
(map! :leader
      :desc "avy words" "w" #'avy-goto-word-0
      :desc "avy lines" "l" #'avy-goto-line
      :desc "avy char" "é" #'avy-goto-char)

;; altgr configuration
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; ignore override (dela mierda)
(after! (markdown-mode evil-markdown)
  (define-key markdown-mode-map (kbd "<S-tab>") nil)
  (define-key markdown-mode-map (kbd "<S-iso-lefttab>") nil)
  (define-key markdown-mode-map (kbd "<backtab>") nil)
  (define-key evil-markdown-mode-map (kbd "<S-tab>") nil)
  (define-key evil-markdown-mode-map (kbd "<S-iso-lefttab>") nil)
  (define-key evil-markdown-mode-map :nv (kbd "<backtab>") nil))

(map! :after org
      :map evil-org-mode-map
      :n "M-t" #'org-metadown
      :n "M-s" #'org-metaup)

;; markdown-mode
(after! markdown-mode
  (setq markdown-list-indent-width 2))
