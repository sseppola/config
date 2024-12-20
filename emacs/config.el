;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your privatehis to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq doom-font (font-spec :family "Fira Code Retina" :size 17))

(defvar sindre/default-dark-theme  'doom-monokai-spectrum)
(defvar sindre/default-light-theme 'doom-bluloco-light)


;; From Teodor
(progn                                  ; Neater Lisp editing
  (setq clojure-toplevel-inside-comment-form 't)
  (add-hook 'clojure-mode-hook 'enable-paredit-mode)
  (add-hook 'cider-repl-mode-hook 'enable-paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode))

;; From Sophie
(use-package! vertico-posframe
  :init
  (setq vertico-posframe-parameters   '((left-fringe  . 12) ;; Fringes
                                        (right-fringe . 12)
                                        (undecorated  . nil))) ;; Rounded frame
  :config
  (vertico-posframe-mode 1)
  (setq vertico-posframe-width  88              ;; Narrow frame
        vertico-posframe-height vertico-count))  ;; Default height

;; When dired is open, press keybinding to show help menu
(use-package! casual-dired
  :after dired
  :bind (:map dired-mode-map ("C-<up>" . casual-dired-tmenu)))

;; Semantic expand region
(use-package! expand-region
  :defer t
  :bind (:map global-map ("M-'" . er/expand-region)))

;; Enable println in CIDER when working with beginner-clojure
(setq cider-repl-use-content-types nil) ;; Disable content-type filtering
(setq cider-repl-stdout-buffer nil)     ;; Redirect *out* to REPL buffer


;; Disable arrow keys in vim insert mode
;; (map! :i
;; [left]  nil
;; [right] nil
;; [up]    nil
;; [down]  nil)


;; accept completion from copilot and fallback to company
;; (use-package! copilot
;;   :hook (prog-mode . copilot-mode)
;;   :bind (:map copilot-completion-map
;;               ("<tab>" . 'copilot-accept-completion)
;;               ("TAB" . 'copilot-accept-completion)
;;               ("C-TAB" . 'copilot-accept-completion-by-word)
;;               ("C-<tab>" . 'copilot-accept-completion-by-word)))

;;(after! doom-ui
;; set your favorite themes
;;  (setq! auto-dark-themes `((,sindre/default-dark-theme) (,sindre/default-light-theme)))
;;  (setq! auto-dark-allow-osascript t)
;;  (auto-dark-mode))
