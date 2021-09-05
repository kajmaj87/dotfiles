;;; org-roam.el -*- lexical-binding: t; -*-

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (concat org-directory "brain"))
  (org-roam-completion-everywhere t)
  (org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . completion-at-point))

  :config
  ;; allow mouse clicks in backlink buffer
  (define-key org-roam-mode-map [mouse-1] #'org-roam-visit-thing)
  (org-roam-setup))
