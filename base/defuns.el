(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0))

(provide 'defuns)