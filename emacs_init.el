;;get fullpath in case of relative paths used
(defun get-fullpath (@file-relative-path)
  (concat (file-name-directory (or load-file-name buffer-file-name)) @file-relative-path)
  )

;;load the basic emacs settings with no package requirements
(load (get-fullpath "emacs_settings"))

;;load specific filesfor emacs initialization
(load (get-fullpath "package_dependency"))
(load (get-fullpath "cpp_mode"))
(load (get-fullpath "haskell_mode"))
(load (get-fullpath "python_mode"))
(load (get-fullpath "tex_mode"))
(load (get-fullpath "key_maps"))
(load (get-fullpath "keychord"))

