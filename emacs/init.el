(defvar lp-init-el-start-time (current-time) "Time when init.el was started")
(setq lp-user-emacs-directory "~/.emacs.d/")

;; from: http://stackoverflow.com/questions/251908/how-can-i-insert-current-date-and-time-into-a-file-using-emacs
(defvar current-date-time-format "%a %b %d %Y-%m-%dT%H:%M:%S "
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

;; from: http://stackoverflow.com/questions/251908/how-can-i-insert-current-date-and-time-into-a-file-using-emacs
(defvar current-time-format "%a %H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun lp-tangle-config-org ()
  "This function wirte all source blocks from =config.org= into =config.el= that ...

- are not marked as =tangle: no=
- doesn't have the TODO state =DISABLED=
- have a source-code of =emacs-lisp="
  (require 'org)
  (let* ((body-list ())
	 (output-file (concat lp-user-emacs-directory "config.el"))
	 (org-babel-default-header-args (org-babel-merge-params org-babel-default-header-args
								(list (cons :tangle output-file)))))
    (message "—————• Re-generating %s …" output-file)
    (save-restriction
      (save-excursion
	(org-babel-map-src-blocks (concat lp-user-emacs-directory "config.org")
	  (let* (
		 (org_block_info (org-babel-get-src-block-info 'light))
		 (tfile (cdr (assq :tangle (nth 2 org_block_info))))
		 (match_for_TODO_keyword)
		 )
	    (save-excursion
	      (catch 'exit
		(org-back-to-heading t)
		(when (looking-at org-outline-regexp)
		  (goto-char (1- (match-end 0))))
		(when (looking-at (concat " +" org-todo-regexp "\\( +\\|[ \t]*$\\)"))
		  (setq match_for_TODO_keyword (match-string 1)))))
	    (unless (or (string= "no" tfile)
			(string= "DISABLED" match_for_TODO_keyword)
			(not (string= "emacs-lisp" lang)))
	      (add-to-list 'body-list (concat "\n\n;;#####################################################################################\\n"
					      "(message \"config • " (org-get-heading) " …\")\n\n")
			   )
	      (add-to-list 'body-list body)
	      ))))
      (with-temp-file output-file
	(insert ";; ============================================================\n")
        (insert ";; Don't edit this file, edit config.org' instead ...\n")  
        (insert ";; Auto-generated at " (format-time-string current-date-time-format (current-time)) " on host " system-name "\n")
	(insert ";; ============================================================\n\n")
	(insert (apply 'concat (reverse body-list))))
      (message "—————• Wrote %s" output-file))))

;; following lines are executed only when lp-tangle-config-org-hook-func()
;; was not invoked when saving config.org which is the normal case:
(let ((orgfile (concat lp-user-emacs-directory "config.org"))
      (elfile (concat lp-user-emacs-directory "config.el"))
      (gc-cons-threshold most-positive-fixnum))
  (when (or (not (file-exists-p elfile))
            (file-newer-than-file-p orgfile elfile))
    (lp-tangle-config-org)
    )
  (load-file elfile))

;; when config.org is saved, re-generate config.el:
(defun lp-tangle-config-org-hook-func ()
  (when (string= "config.org" (buffer-name))
	(let ((orgfile (concat lp-user-emacs-directory "config.org"))
		  (elfile (concat lp-user-emacs-directory "config.el")))
	  (lp-tangle-config-org))))
(add-hook 'after-save-hook 'lp-tangle-config-org-hook-func)

(message "→★ loading init.el in %.2fs" (float-time (time-subtract (current-time) lp-init-el-start-time)))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   '("/home/lpostula/org/tickler.org" "/home/lpostula/org/misc.org" "/home/lpostula/org/projects.org" "/home/lpostula/org/notes.org" "/home/lpostula/org/contacts.org" "/home/lpostula/org/agenda/calendar.org" "/home/lpostula/org/agenda/work.org" "/home/lpostula/org/agenda/routine.org" "/home/lpostula/org/agenda/review.org" "/home/lpostula/org/agenda/people.org" "/home/lpostula/org/agenda/organizer.org")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(vertico-current ((t (:background "#1d1f21")))))
