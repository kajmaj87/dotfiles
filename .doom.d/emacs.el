;;; emacs.el -*- lexical-binding: t; -*-

;; disable asking for confirmation when quitting
(setq confirm-kill-emacs nil)

;; start emacs with maximized window
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
