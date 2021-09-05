;;; org.el -*- lexical-binding: t; -*-
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

(after! org
;; set locale to english (timestamps for orgmode always in english)
(setq system-time-locale "C")

;; set start weekday to monday
(setq org-agenda-start-on-weekday 1)

;; start with all headlines minimized
(setq org-startup-indented 1)

;; define todo keywords
(setq org-todo-keywords
      '((sequence "NEXT" "TODO" "WAIT" "|" "DONE" "NODO")))
(setq org-todo-keyword-faces
      '(("TODO" . org-warning) ("WAIT" . "orange")
	("NEXT" . "blue")))

;; keybindings
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)

;; org capture templates
(setq org-capture-templates
      '(("n" "Next" entry (file "~/org/inbox.org")
	 "* NEXT  %?\n:PROPERTIES:\n:CREATED:  %U\n:END:\n%i\n")))
)
