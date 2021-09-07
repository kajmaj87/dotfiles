;;; emacs.el -*- lexical-binding: t; -*-

;; disable asking for confirmation when quitting
(setq confirm-kill-emacs nil)

;; start emacs with maximized window
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; autosave and auto load files when changed outside of the editor
(setq auto-save-visited-mode t)
(global-auto-revert-mode t)
