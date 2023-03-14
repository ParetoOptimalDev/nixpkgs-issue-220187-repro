(message "")
(message (concat "correct path: " "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"))

(message "")

(message "simluate what nix does now and demonstrate bug")
(let ((default-directory (concat "/docker:" (getenv "container_id") ":"))
      (tramp-remote-path '(tramp-own-remote-path)))
  (message "")
  (message (concat "tramp-remote-path: " (format "%S" tramp-remote-path)))
  (message (concat "default-directory: " default-directory))
  (message (concat "path is: " (truncate-string-to-width (getenv "PATH") 100)))
  (message ""))



;; (let ((default-directory "/docker:8bd61beae4f7ff829396a548fe1a5067d62f95597a2c18a1fdd5f93c5e8d111a:")) (getenv "PATH"))
