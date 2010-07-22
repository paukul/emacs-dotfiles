;; most of that here is a wtf and I'm to lazy to RTFM, so, since it seems important, I just keep it
(setq visible-bell t
      font-lock-maximum-decoration t
      inhibit-startup-message t
      transient-mark-mode t
      color-theme-is-global t
      delete-by-moving-to-trash t
      shift-select-mode nil
      truncate-partial-width-windows nil
      uniquify-buffer-name-style 'forward
      whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-line-column 100
      ediff-window-setup-function 'ediff-setup-windows-plain
      oddmuse-directory (concat dotfiles-dir "oddmuse")
      save-place-file (concat dotfiles-dir "places"))

;; Which browser to use
(setq browse-url-browser-function 'browse-default-macosx-browser)
;; Transparently open compressed files
(auto-compression-mode t)
;; Enable syntax highlighting for older Emacsen that have it off
(global-font-lock-mode t)
;; Hide the menubar
(menu-bar-mode -1)
;; Save a list of recent files visited.
(recentf-mode 1)
;; ido-mode is like magic pixie dust!
(when (> emacs-major-version 21)
  (ido-mode t)
  (setq ido-enable-prefix nil
        ido-enable-flex-matching t
        ido-create-new-buffer 'always
        ido-use-filename-at-point t
        ido-max-prospects 10))

(set-default 'indicate-empty-lines t)
;; Don't clutter up directories with files~
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat dotfiles-dir "backups")))))

(provide 'misc-settings)