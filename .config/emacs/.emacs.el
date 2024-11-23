;; System locale to use for formatting time values.
;(setq system-time-locale "en")
;(setenv "LANG" "en")

;; org-mode shortcuts
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; enable org-mode
(require 'org)

;; Styling org-mode: https://zzamboni.org/post/beautifying-org-mode-in-emacs/
(setq org-hide-emphasis-markers t)

;; font bullets
;(use-package org-bullets
;  :config
;  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

;; end styling

(add-hook 'org-mode-hook 'variable-pitch-mode)
(add-hook 'org-mode-hook 'visual-line-mode)

(setq org-directory "<ORG_DIR>/org-mode/org")
(setq org-agenda-files (list "inbox-perso.org" "inbox-work.org" "agenda-perso.org" "agenda-work.org" "birthdays.org"))

(setq org-agenda-custom-commands
      '(("w" tags "+work")
        ("h" tags "+perso")))

;; TODO workflow
(setq org-todo-keywords
  '((sequence "TODO(t)" "IN-PROGRESS(p)" "DONE(d!)")))

;; org-calendar first day of week: monday
(setq calendar-week-start-day 1)

;; French
(setq french-holiday
      '((holiday-fixed 1 1 "Jour de l'an")
        ;(holiday-fixed 1 6 "Épiphanie")
        ;(holiday-fixed 2 2 "Chandeleur")
        (holiday-fixed 2 14 "Saint Valentin")
        (holiday-fixed 5 1 "Fête du travail")
        (holiday-fixed 5 8 "Commémoration de la capitulation de l'Allemagne en 1945")
        (holiday-fixed 6 21 "Fête de la musique")
        (holiday-fixed 7 14 "Fête nationale - Prise de la Bastille")
        (holiday-fixed 8 15 "Assomption (Religieux)")
        (holiday-fixed 11 11 "Armistice de 1918")
        (holiday-fixed 11 1 "Toussaint")
        ;(holiday-fixed 11 2 "Commémoration des fidèles défunts")
        (holiday-fixed 12 25 "Noël")
        ;; fêtes à date variable
        ;(holiday-easter-etc 0 "Pâques")
        (holiday-easter-etc 1 "Lundi de Pâques")
        (holiday-easter-etc 39 "Ascension")
        ;(holiday-easter-etc 49 "Pentecôte")
        (holiday-easter-etc 50 "Lundi de Pentecôte")
        ;(holiday-easter-etc -47 "Mardi gras")
        (holiday-float 6 0 3 "Fête des pères") ;; troisième dimanche de juin
        ;; Fête des mères
        (holiday-sexp
         '(if (equal
               ;; Pentecôte
               (holiday-easter-etc 49)
               ;; Dernier dimanche de mai
               (holiday-float 5 0 -1 nil))
              ;; -> Premier dimanche de juin si coïncidence
              (car (car (holiday-float 6 0 1 nil)))
            ;; -> Dernier dimanche de mai sinon
            (car (car (holiday-float 5 0 -1 nil))))
         "Fête des mères")))

(setq calendar-date-style 'european
      calendar-holidays (append french-holiday)
      calendar-mark-holidays-flag t)

;; default capture config
(setq org-capture-templates
      '(("p" "Perso inbox" entry (file "<ORG_DIR>/org-mode/org/inbox-perso.org")
         "* TODO %?\nEntered on %U\n")
        ("j" "Perso agenda" entry (file+datetree "<ORG_DIR>/org-mode/org/agenda-perso.org")
         "* %^{Title}\nPlanned on: %T\n" :time-prompt t)
        ("w" "Work inbox" entry (file "<ORG_DIR>/org-mode/org/inbox-work.org")
         "* TODO %?\nEntered on %U")
        ("l" "Work agenda" entry (file+datetree "<ORG_DIR>/org-mode/org/agenda-work.org")
         "* %^{Title}\nPlanned on: %T\n" :time-prompt t)))

;;(define-key global-map (kbd "C-c c") 'org-capture)


;; Tags hierarchy
;;  - context
;;      - work
;;          - management
;;          - projects
;;              - orchestra
;;              - up
;;          - squad
;;          - organisation
;;      - perso
;;          - cuisine
;;              - recette
;;          - logistique
                - courses
;;              - comptes
;;              - appartement
;;                  - rangement
;;                  - ménage
;;                  - bricolage
;;              - 
;;          - famille
;;          - santé
;;  
;;  - anniversaires
;;  - tech



(setq org-tag-alist '(
                        ("anniversaires")
                        ("tech")

                        (:startgroup)
                        ("context")
                        (:grouptags)
                        ("work")
                        ("perso")
                        (:endgroup)

                        (:startgroup)
                        ("work")
                        (:grouptags)
                        ("management")
                        ("projects")
                        ("squad")
                        ("organisation")
                        (:endgroup)

                        (:startgrouptag)
                        ("projects")
                        (:grouptags)
                        ("orchestra")
                        ("up")
                        (:endgrouptag)

                        (:startgroup)
                        ("perso")
                        (:grouptags)
                        ("cuisine")
                        ("logistique")
                        ("famille")
                        ("santé")
                        (:endgroup)

                        (:startgroup)
                        ("logistique")
                        (:grouptags)
                        ("courses")
                        ("comptes")
                        ("appartement")
                        (:endgroup)

                        (:startgrouptag)
                        ("appartement")
                        (:grouptags)
                        ("rangement")
                        ("ménage")
                        ("bricolage")
                        (:endgrouptag)
                      ))


;; persist clocking timers through emacs sessions
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


(setq org-clock-idle-time 15)



;; Avoid splitting windows on capture mode
;(add-hook 'org-capture-mode-hook 'delete-other-windows)





;; highlight current line
(global-hl-line-mode t)

;; current line background color
;;(set-face-background hl-line-face "gray25")

;; show where buffer ends in the fringe (left gutter)
(setq-default indicate-empty-lines t)

(defun cd-org-mode-dir ()
    "Change current dir to org-mode dir"
    (interactive)
    (cd <ORG_DIR>/org-mode"))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(use-package org-roam
  :custom
  (org-roam-directory "<ORG_DIR>/org-mode")
  (org-roam-capture-templates
     '(("d" "default" plain
        "%?"
        :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
        :unnarrowed t)
        ("b" "book notes" plain
         "\n* Source\n\nAuthor: %^{Author}\nTitle: ${title}\nYear: %^{Year}\n\n* Summary\n\n%?"
         :target (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
         :unnarrowed t)))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture))
  :config
  (org-roam-setup))

(org-roam-db-autosync-mode)

(add-to-list 'display-buffer-alist
             '("\\*org-roam\\*"
               (display-buffer-in-direction)
               (direction . right)
               (window-width . 0.33)
               (window-height . fit-window-to-buffer)))



;; 
;;(use-package fzf
;;:bind
 ;; Don't forget to set keybinds!
;;:config
;;(setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
;;     fzf/executable "fzf"
;;     fzf/git-grep-args "-i --line-number %s"
     ;; command used for `fzf-grep-*` functions
     ;; example usage for ripgrep:
     ;; fzf/grep-command "rg --no-heading -nH"
;;     fzf/grep-command "grep -nrH"
     ;; If nil, the fzf buffer will appear at the top of the window
;;     fzf/position-bottom t
;;     fzf/window-height 15))
