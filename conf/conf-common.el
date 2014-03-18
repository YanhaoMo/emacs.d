;; enable ido everywhere
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; use ido for bookmark
(global-set-key (kbd "C-x r b")
    (lambda ()
      (interactive)
      (bookmark-jump
       (ido-completing-read "Jump to bookmark: " (bookmark-all-names)))))

;; ibus.el
(add-to-list 'load-path "~/.emacs.d/ibus")
(require 'ibus)
(add-hook 'after-init-hook 'ibus-mode-on)
;; Use C-SPC for Set Mark command
(ibus-define-common-key ?\C-\s nil)
;; Use C-/ for Undo command
(ibus-define-common-key ?\C-/ nil)
;; Use C-` to toggle ibus
(global-set-key (kbd "C-`") 'ibus-toggle)

;; enable recent files mode
(require 'recentf)
(recentf-mode t)

;; get rid of `find-file-read-only' and replace it with something
;; more useful.
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

;; 50 files ought to be enough.
(setq recentf-max-saved-items 50)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; delete selection on insert
(delete-selection-mode +1)

;; cleanup traling white space
(require 'ethan-wspace)
(global-ethan-wspace-mode 1)

;; jump to current directory
(require 'dired-x)
(global-set-key (kbd "C-x Cj") 'dired-jump)

(provide 'conf-common)
