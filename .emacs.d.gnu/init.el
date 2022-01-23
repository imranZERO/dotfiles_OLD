(require 'package)
(add-to-list 'package-archives
            '("melpa" . "https://melpa.org/packages/"))
; (package-refresh-contents)
(package-initialize)

(add-to-list 'load-path "~/.emacs.d/plug")

(setq make-backup-files nil)

(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;; The default is 800 kilobytes.  Measured in bytes.
(setq gc-cons-threshold (* 50 1000 1000))

(defun efs/display-startup-time ()
  (message "Emacs loaded in %s with %d garbage collections."
           (format "%.2f seconds"
                   (float-time
                     (time-subtract after-init-time before-init-time)))
           gcs-done))
(add-hook 'emacs-startup-hook #'efs/display-startup-time)

(custom-set-faces
 '(default ((t (:family "Jetbrains Mono NL")))))

(custom-set-variables
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(global-display-line-numbers-mode nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   '(counsel ivy which-key general evil-tutor evil-collection evil use-package))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
  (set-fringe-mode 10)
  (setq ring-bell-function 'ignore)
  (setq scroll-step            1
    scroll-conservatively  10000)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Fast scrolling
(global-set-key (kbd "M-j") (kbd "5j"))
(global-set-key (kbd "M-k") (kbd "5k"))

;; Increase/Decrease font size
(global-set-key (kbd "<f12>") 'text-scale-increase)  
(global-set-key (kbd "<S-f12>") 'text-scale-decrease)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-always-ensure t)

(use-package evil
  :init      ;; tweak evil's configuration before loading it
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-vsplit-window-right t)
  (setq evil-split-window-below t)
  (setq evil-want-C-u-scroll t)
  (evil-mode))
(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list '(dashboard dired ibuffer))
  (evil-collection-init))
(use-package evil-tutor)

(load-theme 'leuven)
