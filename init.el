;; Most of the stuff is copied from: http://github.com/topfunky/emacs-starter-kit
;; I just wanted to have less packages and stuff loaded

;; Add ~/.emacs.d to the load path
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
;; add the base directory to the load path
(setq base-files-dir (concat dotfiles-dir "base"))
(add-to-list 'load-path base-files-dir)
;; Vendor directory, I use that to store plugins and other libraries
(add-to-list 'load-path (concat dotfiles-dir "vendor"))

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; ELPA package manager
(require 'package)
(package-initialize)

;; Load custom stuff
(require 'defuns)
(require 'misc-settings)
(require 'mode-hooks)
(require 'ruby-mode-ext)
(require 'key-bindings)

;; Colortheme
(require 'color-theme)
(color-theme-initialize)
(load (concat dotfiles-dir "colorthemes/colortheme-topfunky.el"))
(color-theme-topfunky)

;; Yasnipped
(add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippet"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "vendor/yasnippet/snippets"))
(yas/load-directory (concat dotfiles-dir "snippets"))
;; make yas play nicely with ruby-el mode
(defun yas/advise-indent-function (function-symbol)
  (eval `(defadvice ,function-symbol (around yas/try-expand-first activate)
           ,(format
             "Try to expand a snippet before point, then call `%s' as usual"
             function-symbol)
           (let ((yas/fallback-behavior nil))
             (unless (and (interactive-p)
                          (yas/expand))
               ad-do-it)))))

(yas/advise-indent-function 'ruby-indent-line)



;; Textmate.el - http://github.com/defunkt/textmate.el
(require 'textmate)

;; Cucumber
(add-to-list 'load-path (concat dotfiles-dir "/vendor/cucumber"))
(require 'feature-mode)
(setq feature-default-language "en")
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(yas/load-directory (concat dotfiles-dir "/vendor/cucumber/snippets"))

;; haml
(require 'haml-mode)
;; YAML
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Peepopen!
(require 'peepopen)
(textmate-mode t)
(peepopen-bind-keys)
;; For Emacs on Mac OS X http://emacsformacosx.com/ and Aquamacs.
;; Opens files in the existing frame instead of making new ones.
(setq ns-pop-up-frames nil)

;; Ack-grep
(autoload 'ack-same "full-ack" nil t)
(autoload 'ack "full-ack" nil t)
(autoload 'ack-find-same-file "full-ack" nil t)
(autoload 'ack-find-file "full-ack" nil t)
