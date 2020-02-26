;;preload username and password for specific server
(setq sql-postgres-login-params
      '((user :default "postgres")
        (database :default "postgres")
        (server :default "localhost")
        (port :default 5432)))

;; fix line truncation
(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))

;;preload multiple servers
(setq sql-connection-alist
      '((server1 (sql-product 'postgres)
                  (sql-port 5432)
                  (sql-server "localhost")
                  (sql-user "user")
                  (sql-password "password")
                  (sql-database "db1"))
        (server2 (sql-product 'postgres)
                  (sql-port 5432)
                  (sql-server "localhost")
                  (sql-user "user")
                  (sql-password "password")
                  (sql-database "db2"))))
(defun my-sql-server1 ()
  (interactive)
  (my-sql-connect 'postgres 'server1))

(defun my-sql-server2 ()
  (interactive)
  (my-sql-connect 'postgres 'server2))

(defun my-sql-connect (product connection)
  ;; remember to set the sql-product, otherwise, it will fail for the first time
  ;; you call the function
  (setq sql-product product)
  (sql-connect connection))


;; to encrypt passwords for cloud backup
;; sudo port install gnupg (for Mac use Macports)
;; create file my-password.el.gpg
;; make sure file above is in emacs load path
;; link passwords with alist server names
(setq my-sql-password
      '((server1 "password1")
        (server2 "password2")))
(provide 'my-password)
;; change alist by removing passwords since they are linked
;; when connecting to a server is run, emacs will ask for
;; password to gpg file just once
(defun my-sql-connect (product connection)
  ;; load the password
  (require my-password "my-password.el.gpg")

  ;; update the password to the sql-connection-alist
  (let ((connection-info (assoc connection sql-connection-alist))
        (sql-password (car (last (assoc connection my-sql-password)))))
    (delete sql-password connection-info)
    (nconc connection-info `((sql-password ,sql-password)))
    (setq sql-connection-alist (assq-delete-all connection sql-connection-alist))
    (add-to-list 'sql-connection-alist connection-info))

  ;; connect to database
  (setq sql-product product)
  (if current-prefix-arg
      (sql-connect connection connection)
    (sql-connect connection)))

;; setup helm for help in completing server connecting calls
;; now bind my-sql-connect-server to a key to launch
;; this function and then type the server name give in
;; the server list to launch an sql interactive buffer
(defvar my-sql-servers-list
  '(("Server 1" my-sql-server1)
    ("Server 2" my-sql-server2))
  "Alist of server name and the function to connect")

(defun my-sql-connect-server (func)
  "Connect to the input server using my-sql-servers-list"
  (interactive
   (helm-comp-read "Select server: " my-sql-servers-list))
  (funcall func))
