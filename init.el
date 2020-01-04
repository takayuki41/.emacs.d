;; show line number
(global-display-line-numbers-mode)

;; not create backup file setting
(setq make-backup-files nil)
(setq auto-save-default nil)

;; trancate setting
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows t)

;; Do not display startup message
(setq inhibit-startup-message t)

;; Do not make backup file
(setq make-backup-files nil)

;; Delete auto save file when finished
(setq delete-auto-save-files t)

;; use spaces in tabs
(setq-default tab-width 4 indent-tabs-mode nil)

;; window move key setting
(setq windmove-wrap-around t)
(windmove-default-keybindings)

;; make window transparent
;; Active window / Inactive window (alpha value specifies transparency)
(add-to-list 'default-frame-alist' (alpha. (0.85 0.85)))

;; Remove the menu bar
(menu-bar-mode -1)

;; mouse setting
(setq mouse-wheel-scroll-amount '(1 ((shift) . 5)))

;; Remove toolbar
(tool-bar-mode -1)

;; Rmove scrollbar
(scroll-bar-mode -1)

;; display the number of columns
(column-number-mode t)

;; Stop blinking the cursor
(blink-cursor-mode 0)

;; Highlight cursor line
(global-hl-line-mode t)

;; flash the corresponding parenthesis
(show-paren-mode 1)

;; scroll line by line
(setq scroll-conservatively 1)

;; straight.el setting
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
(straight-use-package 'use-package)

;; evil.el setting
;; (straight-use-package 'evil)
;; (evil-mode 1)

;; color theme setting
(straight-use-package 'madhat2r-theme)
(load-theme 'madhat2r t)

;; bind-key setting
(straight-use-package 'bind-key)

;; character setting
;; add to 
;; need packege [emacs-mozc-bin],[emacs-mozc-bin]
(straight-use-package 'mozc)
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'overlay)
(global-set-key [?\C-\ ] 'toggle-input-method)

;; indent guid setting
(straight-use-package 'indent-guide)
(indent-guide-global-mode)
(set-face-foreground 'indent-guide-face "cyan")
(setq indent-guide-recursive t)

(defmacro with-suppressed-message (&rest body)
  "Suppress new messages temporarily in the echo area and the `*Messages*' buffer while BODY is evaluated."
  (declare (indent 0))
  (let ((message-log-max nil))
    `(with-temp-message (or (current-message) "") ,@body)))

;; recentf setting
(require 'recentf)
(straight-use-package 'recentf-ext)
(when (require 'recentf-ext nil t)
  (setq recentf-max-saved-items 2000)
  (setq recentf-exclude '("~/.emacs.d/.recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))

(setq inhibit-startup-message t)

(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; duplicate-thing setting
(straight-use-package 'duplicate-thing)
(bind-key "M-c" 'duplicate-thing)

;; mode line setting
(straight-use-package 'smart-mode-line)
(defvar sml/no-confirm-load-theme t)
(defvar sml/theme 'dark)
(defvar sml/shorten-directory -1)
(sml/setup)
(straight-use-package 'diminish)
(column-number-mode t)
(line-number-mode t)

;; which-key setting
(straight-use-package 'which-key)
(which-key-mode)

;; multiple-cursors setting
(straight-use-package 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; defun delete line
(defun delete-current-line ()
  (interactive)
  (beginning-of-line)
  (kill-line)
  (kill-line))
(global-set-key (kbd "M-k") 'delete-current-line)

;; window resize change key bind
(global-set-key (kbd "M-=") 'enlarge-window-horizontally)
(global-set-key (kbd "M--") 'shrink-window-horizontally)
(global-set-key (kbd "C-=") 'enlarge-window)
(global-set-key (kbd "C--") 'shrink-window)

;; icons setting
(straight-use-package 'all-the-icons)

;; company setting
(straight-use-package 'company)
(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)

;; company-box setting
(straight-use-package 'company-box)
(use-package company-box
  :hook (company-mode . company-box-mode))

;; git-gitter setting
(straight-use-package 'git-gutter)
(global-git-gutter-mode +1)
(custom-set-variables
 '(git-gutter:update-interval 2))

;; aspell setting
(require 'ispell)
(setq ispell-program-name "aspell")
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))

;; whitespace setting
(require 'whitespace)
(setq whitespace-style '(
    face
    trailing
    tabs
    space-mark
    tab-mark
))

(setq whitespace-display-mappings
      '((tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(global-whitespace-mode 1)

;; tab setting
(straight-use-package 'tabbar)
(tabbar-mode)
(tabbar-mwheel-mode nil)
(setq tabbar-buffer-groups-function nil)
(setq tabbar-use-images nil)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z C-n") 'tabbar-forward-tab)
(global-set-key (kbd "C-z C-p") 'tabbar-backward-tab)

(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))
(setq tabbar-separator '(2.0))

(when window-system
  (set-face-attribute
   'tabbar-default nil
   :family "MeiryoKe_Gothic"
   :background "#34495E"
   :foreground "#EEEEEE"
   :height 0.85
   )
  (set-face-attribute
   'tabbar-unselected nil
   :background "#34495E"
   :foreground "#EEEEEE"
   :box nil
  )
  (set-face-attribute
   'tabbar-modified nil
   :background "#E67E22"
   :foreground "#EEEEEE"
   :box nil
  )
  (set-face-attribute
   'tabbar-selected nil
   :background "#E74C3C"
   :foreground "#EEEEEE"
   :box nil)
  (set-face-attribute
   'tabbar-button nil
   :box nil)
  (set-face-attribute
   'tabbar-separator nil
   :height 2.0)
)
(put 'set-goal-column 'disabled nil)
(defun my-tabbar-buffer-list ()
  (delq nil
        (mapcar #'(lambda (b)
                    (cond
                     ((eq (current-buffer) b) b)
                     ((equal "*scratch*" (buffer-name b)) b)
                     ((buffer-file-name b) b)
                     ((char-equal ?\  (aref (buffer-name b) 0)) nil)
                     ((char-equal ?* (aref (buffer-name b) 0)) nil)
                     ((buffer-live-p b) b)))
                (buffer-list))))
(setq tabbar-buffer-list-function 'my-tabbar-buffer-list)

;; treemacs setting
(straight-use-package 'treemacs)
(use-package treemacs)

;; paren setting
(use-package paren
   :ensure nil
   :hook
   (after-init . show-paren-mode)
   :custom-face
   (show-paren-match ((nil (:background "#44475a" :foreground "#f1fa8c"))))
   :custom
   (show-paren-style 'mixed)
   (show-paren-when-point-inside-paren t)
   (show-paren-when-point-in-periphery t))

;; rainbow-deliters setting
(straight-use-package 'rainbow-delimiters)
(use-package rainbow-delimiters
   :hook
   (prog-mode . rainbow-delimiters-mode))

;; undohist setting
(straight-use-package 'undohist)
(use-package undohist)
(undohist-initialize)
(setq undohist-directory "~/.emacs.d/undohist")

;; undo-tree setting
(straight-use-package 'undo-tree)
(use-package undo-tree)
(global-undo-tree-mode)

;; icons setting
(straight-use-package 'all-the-icons)
(use-package all-the-icons)
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(setq all-the-icons-color-icons t)
(setq all-the-icons-icon-for-buffer t)
(setq all-the-icons-icon-for-dir t)
(setq all-the-icons-icon-for-file t)
(setq all-the-icons-icon-for-mode t)
(setq all-the-icons-icon-for-url t)
(setq all-the-icons-icon-for-weather t)
(setq all-the-icons-scale-factor 0.9)

;; dashboard setting
(straight-use-package 'dashboard)
(use-package dashboard)
(dashboard-setup-startup-hook)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(dashboard-modify-heading-icons '((recents . "file-text")
                                  (bookmarks . "book")))
