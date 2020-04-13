;; high bar
(scroll-bar-mode -2)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; yes and no
(defalias 'yes-or-no-p 'y-or-n-p)

;; remember your place
(save-place-mode 1)

;; cursor
(blink-cursor-mode -1)

;; startup screen
(setq inhibit-startup-screen t)

(use-package simple
  :ensure nil
  :hook ((after-init . (lambda ()
                        (line-number-mode)
                        (column-number-mode)
                        (size-indication-mode)))
         ((prog-mode markdown-mode conf-mode org-mode) . enable-trailing-whitespace))
  :init
  (setq ;; kill-whole-line t               ; Kill line including '\n'
        line-move-visual nil
        track-eol t                     ; Keep cursor at end of lines. Require line-move-visual is nil.
        set-mark-command-repeat-pop t)  ; Repeating C-SPC after popping mark pops it again

  ;; Visualize TAB, (HARD) SPACE, NEWLINE
  (setq-default show-trailing-whitespace nil) ; Don't show trailing whitespace by default
  (defun enable-trailing-whitespace ()
    "Show trailing spaces and delete on saving."
    (setq show-trailing-whitespace t)
    (add-hook 'before-save-hook #'delete-trailing-whitespace nil t)))


;; Mouse & Smooth Scroll
;; Scroll one line at a time (less "jumpy" than defaults)
(when (display-graphic-p)
  (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
        mouse-wheel-progressive-speed nil))
(setq scroll-step 1
      scroll-margin 10
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; smart mode-line
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;; text area ui
(global-hl-line-mode +1)
(line-number-mode +1)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(size-indication-mode t)

;;; font
(set-frame-font "JetBrainsMono 14" nil t)

(provide 'looks-and-feels)
